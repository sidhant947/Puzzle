import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class GraphCoordinatePlotScreen extends ConsumerStatefulWidget {
  const GraphCoordinatePlotScreen({super.key});

  @override
  ConsumerState<GraphCoordinatePlotScreen> createState() => _GraphCoordinatePlotScreenState();
}

class _GraphCoordinatePlotScreenState extends ConsumerState<GraphCoordinatePlotScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late int _m;
  late int _c;
  late int _targetX;
  late int _targetY;
  late String _equationText;

  Point<int>? _selectedPoint;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _selectedPoint = null;

    // Keep generating until we find an equation and x-value that results in a y-value within [-4, 4]
    while (true) {
      _m = _random.nextBool() ? (_random.nextInt(3) + 1) : -(_random.nextInt(3) + 1); // -3 to 3, non-zero
      _c = _random.nextInt(5) - 2; // -2 to 2
      _targetX = _random.nextInt(9) - 4; // -4 to 4

      _targetY = _m * _targetX + _c;

      if (_targetY >= -4 && _targetY <= 4) {
        break;
      }
    }

    // Format equation string
    String mStr = _m == 1 ? '' : (_m == -1 ? '-' : '$_m');
    String cStr = _c > 0 ? ' + $_c' : (_c < 0 ? ' - ${_c.abs()}' : '');
    _equationText = 'y = ${mStr}x$cStr';
  }

  void _onSubmit() {
    if (_isGameOver || _selectedPoint == null) return;

    if (_selectedPoint!.x == _targetX && _selectedPoint!.y == _targetY) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect! The correct point was ($_targetX, $_targetY).'),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent,
        ),
      );
      setState(() {
        _generatePuzzle();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('graph_coordinate_plot');
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: AppLocalizations.of(context)!.wellDone.toUpperCase(),
        message: AppLocalizations.of(context)!.completed,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() {
            _score = 0;
            _isGameOver = false;
            _generatePuzzle();
          });
        },
      ),
    );
  }

  void _onGraphTapped(Offset localOffset, Size size) {
    final step = size.width / 10;
    final double gridX = (localOffset.dx - size.width / 2) / step;
    final double gridY = -(localOffset.dy - size.height / 2) / step;

    final rx = gridX.round().clamp(-4, 4);
    final ry = gridY.round().clamp(-4, 4);

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedPoint = Point(rx, ry);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'GRAPH PLOTTER',
      subtitle: 'Plot the coordinates on the Cartesian plane satisfying the equation.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: DesignSystem.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                ),
                child: Text(
                  'Score: $_score / $_targetScore',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: DesignSystem.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              // Equation & Target Prompt Card
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      _equationText,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: DesignSystem.gameOrange,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Plot the point where  x = $_targetX',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // The Coordinate Graph
              LayoutBuilder(
                builder: (context, constraints) {
                  final size = min(constraints.maxWidth * 0.85, 270.0);
                  return GestureDetector(
                    onTapUp: (details) => _onGraphTapped(details.localPosition, Size(size, size)),
                    child: Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                        border: Border.all(
                          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                          width: 2,
                        ),
                      ),
                      child: CustomPaint(
                        painter: GraphPainter(
                          selectedPoint: _selectedPoint,
                          isDark: isDark,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Current point label
              Text(
                _selectedPoint != null
                    ? 'Selected Point: (${_selectedPoint!.x}, ${_selectedPoint!.y})'
                    : 'Tap the graph to plot a point',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              // Submit button
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: _selectedPoint != null ? _onSubmit : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: const Text(
                    'SUBMIT POINT',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final Point<int>? selectedPoint;
  final bool isDark;

  GraphPainter({required this.selectedPoint, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final axisPaint = Paint()
      ..color = isDark ? Colors.white30 : Colors.black.withValues(alpha: 0.3)
      ..strokeWidth = 2.0;

    final gridPaint = Paint()
      ..color = isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.1)
      ..strokeWidth = 1.0;

    final step = size.width / 10;

    // Draw grid lines
    for (int i = -4; i <= 4; i++) {
      // vertical
      canvas.drawLine(
        Offset(center.dx + i * step, 0),
        Offset(center.dx + i * step, size.height),
        gridPaint,
      );
      // horizontal
      canvas.drawLine(
        Offset(0, center.dy - i * step),
        Offset(size.width, center.dy - i * step),
        gridPaint,
      );
    }

    // Draw main axes
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), axisPaint);
    canvas.drawLine(Offset(center.dx, 0), Offset(center.dx, size.height), axisPaint);

    // Labels/ticks painter helper
    void drawText(String text, Offset pos) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: 10, color: isDark ? Colors.white30 : Colors.black.withValues(alpha: 0.3)),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(canvas, Offset(pos.dx - textPainter.width / 2, pos.dy - textPainter.height / 2));
    }

    // Draw tick labels for X and Y axes
    for (int i = -4; i <= 4; i++) {
      if (i == 0) continue;
      // X labels
      drawText('$i', Offset(center.dx + i * step, center.dy + 12));
      // Y labels
      drawText('$i', Offset(center.dx - 12, center.dy - i * step));
    }

    // Draw selected point
    if (selectedPoint != null) {
      final pointOffset = Offset(
        center.dx + selectedPoint!.x * step,
        center.dy - selectedPoint!.y * step,
      );
      
      // Draw outer pulse ring
      final ringPaint = Paint()
        ..color = DesignSystem.primary.withOpacity(0.3)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(pointOffset, 14, ringPaint);

      // Draw inner solid dot
      final pointPaint = Paint()
        ..color = DesignSystem.primary
        ..style = PaintingStyle.fill;
      canvas.drawCircle(pointOffset, 7, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) => true;
}
