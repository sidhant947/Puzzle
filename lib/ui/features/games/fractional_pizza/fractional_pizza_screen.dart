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

class FractionalPizzaScreen extends ConsumerStatefulWidget {
  const FractionalPizzaScreen({super.key});

  @override
  ConsumerState<FractionalPizzaScreen> createState() => _FractionalPizzaScreenState();
}

class _FractionalPizzaScreenState extends ConsumerState<FractionalPizzaScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late int _totalSlices;
  late int _requiredSlices;
  late int _targetNum;
  late int _targetDen;
  final Set<int> _selectedSlices = {};

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      var t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  void _generatePuzzle() {
    _selectedSlices.clear();
    
    // Choose N = 6, 8, or 12
    const options = [6, 8, 12];
    _totalSlices = options[_random.nextInt(options.length)];

    // Choose target slices count from 1 to totalSlices - 1
    _requiredSlices = 1 + _random.nextInt(_totalSlices - 1);

    // Simplify the fraction _requiredSlices / _totalSlices
    final divisor = _gcd(_requiredSlices, _totalSlices);
    _targetNum = _requiredSlices ~/ divisor;
    _targetDen = _totalSlices ~/ divisor;
  }

  void _onPizzaTapped(Offset localOffset, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final dx = localOffset.dx - center.dx;
    final dy = localOffset.dy - center.dy;
    
    // Calculate angle in radians
    double angle = atan2(dy, dx);
    if (angle < 0) {
      angle += 2 * pi;
    }

    final sliceAngle = 2 * pi / _totalSlices;
    final tappedSlice = (angle / sliceAngle).floor() % _totalSlices;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_selectedSlices.contains(tappedSlice)) {
        _selectedSlices.remove(tappedSlice);
      } else {
        _selectedSlices.add(tappedSlice);
      }
    });
  }

  void _onSubmit() {
    if (_isGameOver) return;

    if (_selectedSlices.length == _requiredSlices) {
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
          content: Text(AppLocalizations.of(context)!.snackbarIncorrectSlices(_selectedSlices.length, '$_targetNum/$_targetDen')),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('fractional_pizza');
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'fractional_pizza'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'fractional_pizza'),
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
                  color: DesignSystem.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                ),
                child: Text(
                  '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: DesignSystem.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              // Target Fraction Card
              Container(
                padding: const EdgeInsets.all(16),
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
                    const Text(
                      'TARGET PORTION',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$_targetNum',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: DesignSystem.gameOrange,
                              ),
                            ),
                            Container(
                              height: 3,
                              width: 40,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                            Text(
                              '$_targetDen',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: DesignSystem.gameOrange,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'of a $_totalSlices-slice pizza',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Interactive Pizza CustomPaint
              LayoutBuilder(
                builder: (context, constraints) {
                  final size = min(constraints.maxWidth * 0.75, 260.0);
                  return GestureDetector(
                    onTapUp: (details) => _onPizzaTapped(details.localPosition, Size(size, size)),
                    child: SizedBox(
                      width: size,
                      height: size,
                      child: CustomPaint(
                        painter: PizzaPainter(
                          totalSlices: _totalSlices,
                          selectedSlices: _selectedSlices,
                          isDark: isDark,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Selected: ${_selectedSlices.length} / $_totalSlices slices',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              // Submit button
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.btnSubmit,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
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

class PizzaPainter extends CustomPainter {
  final int totalSlices;
  final Set<int> selectedSlices;
  final bool isDark;

  PizzaPainter({
    required this.totalSlices,
    required this.selectedSlices,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 10;

    final basePaint = Paint()
      ..color = isDark ? Colors.grey[850]! : Colors.grey[200]!
      ..style = PaintingStyle.fill;

    final selectedPaint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = isDark ? Colors.white24 : Colors.black26
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Draw slices
    final sliceAngle = 2 * pi / totalSlices;
    for (int i = 0; i < totalSlices; i++) {
      final startAngle = i * sliceAngle;
      
      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sliceAngle,
          false,
        )
        ..close();

      canvas.drawPath(path, selectedSlices.contains(i) ? selectedPaint : basePaint);
      canvas.drawPath(path, borderPaint);
    }

    // Draw outer circle crust
    final crustPaint = Paint()
      ..color = Colors.amber[700]!
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, crustPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
