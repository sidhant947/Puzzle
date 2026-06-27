import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class VektorVectorScreen extends ConsumerStatefulWidget {
  const VektorVectorScreen({super.key});

  @override
  ConsumerState<VektorVectorScreen> createState() => _VektorVectorScreenState();
}

class _VektorVectorScreenState extends ConsumerState<VektorVectorScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  // Vector vectors & coefficients
  late Point<int> _u;
  late Point<int> _v;
  late int _targetA;
  late int _targetB;
  late Point<int> _targetPoint;

  // User input coefficients
  int _scaleA = 1;
  int _scaleB = 1;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate u and v that are not collinear
    while (true) {
      _u = Point(
        _random.nextBool() ? _random.nextInt(3) + 1 : -(_random.nextInt(3) + 1),
        _random.nextBool() ? _random.nextInt(3) + 1 : -(_random.nextInt(3) + 1),
      );
      _v = Point(
        _random.nextBool() ? _random.nextInt(3) + 1 : -(_random.nextInt(3) + 1),
        _random.nextBool() ? _random.nextInt(3) + 1 : -(_random.nextInt(3) + 1),
      );

      // Check for non-collinearity
      if (_u.x * _v.y - _u.y * _v.x != 0) {
        break;
      }
    }

    // Pick target coefficients in [-3, 3] (neither should be 0 for challenge)
    _targetA = 0;
    _targetB = 0;
    while (_targetA == 0 && _targetB == 0) {
      _targetA = _random.nextInt(7) - 3;
      _targetB = _random.nextInt(7) - 3;
    }

    _targetPoint = Point(
      _targetA * _u.x + _targetB * _v.x,
      _targetA * _u.y + _targetB * _v.y,
    );

    // Initial user coefficients
    _scaleA = 0;
    _scaleB = 0;
  }

  void _checkSolution() {
    final currentPoint = Point(
      _scaleA * _u.x + _scaleB * _v.x,
      _scaleA * _u.y + _scaleB * _v.y,
    );

    if (currentPoint == _targetPoint) {
      HapticFeedbackUtil.success();
      setState(() {
        _score++;
        if (_score >= _targetScore) {
          _onGameComplete();
        } else {
          _generatePuzzle();
        }
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('vektor_vector');
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
            _generatePuzzle();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'vektor_vector'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'vektor_vector'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
            _score = 0;
            _generatePuzzle();
            });
          },
        ),
      ],
      body: Column(
        children: [
          // Info and Target board
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'u = (${_u.x}, ${_u.y})   v = (${_v.x}, ${_v.y})',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Target: (${_targetPoint.x}, ${_targetPoint.y})',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: DesignSystem.gameOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Vector grid visualizer
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
              decoration: BoxDecoration(
                color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                border: Border.all(
                  color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                  width: 2,
                ),
              ),
              child: ClipRect(
                child: CustomPaint(
                  size: Size.infinite,
                  painter: VectorGridPainter(
                    u: _u,
                    v: _v,
                    scaleA: _scaleA,
                    scaleB: _scaleB,
                    target: _targetPoint,
                    isDark: isDark,
                  ),
                ),
              ),
            ),
          ),
          // Sliders at bottom
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Scale Vector u: $_scaleA',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Result: ($_scaleA * u) = (${_scaleA * _u.x}, ${_scaleA * _u.y})',
                      style: TextStyle(color: Colors.blue[400], fontSize: 12),
                    ),
                  ],
                ),
                Slider(
                  value: _scaleA.toDouble(),
                  min: -3,
                  max: 3,
                  divisions: 6,
                  label: '$_scaleA',
                  activeColor: DesignSystem.gameBlue,
                  onChanged: (val) {
                    HapticFeedbackUtil.lightImpact();
                    setState(() {
                      _scaleA = val.round();
                    });
                    _checkSolution();
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Scale Vector v: $_scaleB',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Result: ($_scaleB * v) = (${_scaleB * _v.x}, ${_scaleB * _v.y})',
                      style: TextStyle(color: Colors.purple[400], fontSize: 12),
                    ),
                  ],
                ),
                Slider(
                  value: _scaleB.toDouble(),
                  min: -3,
                  max: 3,
                  divisions: 6,
                  label: '$_scaleB',
                  activeColor: DesignSystem.gamePurple,
                  onChanged: (val) {
                    HapticFeedbackUtil.lightImpact();
                    setState(() {
                      _scaleB = val.round();
                    });
                    _checkSolution();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VectorGridPainter extends CustomPainter {
  final Point<int> u;
  final Point<int> v;
  final int scaleA;
  final int scaleB;
  final Point<int> target;
  final bool isDark;

  VectorGridPainter({
    required this.u,
    required this.v,
    required this.scaleA,
    required this.scaleB,
    required this.target,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    // Grid extends to about [-10, 10] in both directions
    const gridLimit = 10;
    final stepX = size.width / (gridLimit * 2);
    final stepY = size.height / (gridLimit * 2);
    final step = min(stepX, stepY); // keep coordinate system square

    // Draw grid lines
    final gridPaint = Paint()
      ..color = isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.1)
      ..strokeWidth = 1.0;

    for (int i = -gridLimit; i <= gridLimit; i++) {
      // vertical lines
      canvas.drawLine(
        Offset(center.dx + i * step, 0),
        Offset(center.dx + i * step, size.height),
        gridPaint,
      );
      // horizontal lines
      canvas.drawLine(
        Offset(0, center.dy + i * step),
        Offset(size.width, center.dy + i * step),
        gridPaint,
      );
    }

    // Draw Axis lines
    final axisPaint = Paint()
      ..color = isDark ? Colors.white30 : Colors.black.withValues(alpha: 0.3)
      ..strokeWidth = 2.0;
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), axisPaint);
    canvas.drawLine(Offset(center.dx, 0), Offset(center.dx, size.height), axisPaint);

    // Target point coordinates in canvas coordinates
    // Y-axis is inverted in canvas coordinates
    final targetOffset = Offset(
      center.dx + target.x * step,
      center.dy - target.y * step,
    );

    // Draw target dot
    final targetPaint = Paint()
      ..color = DesignSystem.gameOrange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(targetOffset, 10, targetPaint);
    // Draw target ring
    final targetRingPaint = Paint()
      ..color = DesignSystem.gameOrange.withValues(alpha: 0.3)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(targetOffset, 16, targetRingPaint);

    // Draw Vector 1 (u) scaled: head-to-tail path
    final uEndOffset = Offset(
      center.dx + (scaleA * u.x) * step,
      center.dy - (scaleA * u.y) * step,
    );

    final uPaint = Paint()
      ..color = DesignSystem.gameBlue
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    if (scaleA != 0) {
      canvas.drawLine(center, uEndOffset, uPaint);
      _drawArrowhead(canvas, center, uEndOffset, DesignSystem.gameBlue);
    }

    // Draw Vector 2 (v) scaled starting from uEndOffset
    final finalOffset = Offset(
      uEndOffset.dx + (scaleB * v.x) * step,
      uEndOffset.dy - (scaleB * v.y) * step,
    );

    final vPaint = Paint()
      ..color = DesignSystem.gamePurple
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    if (scaleB != 0) {
      canvas.drawLine(uEndOffset, finalOffset, vPaint);
      _drawArrowhead(canvas, uEndOffset, finalOffset, DesignSystem.gamePurple);
    }

    // Draw final point indicator
    final resultPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = DesignSystem.primary
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(finalOffset, 6, resultPaint);
    canvas.drawCircle(finalOffset, 6, borderPaint);
  }

  void _drawArrowhead(Canvas canvas, Offset from, Offset to, Color color) {
    final dX = to.dx - from.dx;
    final dY = to.dy - from.dy;
    final angle = atan2(dY, dX);
    const arrowLength = 12.0;
    const arrowAngle = pi / 6;

    final path = Path()
      ..moveTo(to.dx, to.dy)
      ..lineTo(to.dx - arrowLength * cos(angle - arrowAngle), to.dy - arrowLength * sin(angle - arrowAngle))
      ..lineTo(to.dx - arrowLength * cos(angle + arrowAngle), to.dy - arrowLength * sin(angle + arrowAngle))
      ..close();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
