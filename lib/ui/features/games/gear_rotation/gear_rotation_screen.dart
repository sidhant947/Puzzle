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

class GearRotationScreen extends ConsumerStatefulWidget {
  const GearRotationScreen({super.key});

  @override
  ConsumerState<GearRotationScreen> createState() => _GearRotationScreenState();
}

class _GearRotationScreenState extends ConsumerState<GearRotationScreen>
    with SingleTickerProviderStateMixin {
  final Random _random = Random();
  late AnimationController _rotationController;

  // Game state
  late int _gearsCount; // 3 to 5 gears
  late List<double> _radii;
  late bool _firstGearClockwise;
  late bool _correctAnswer; // true = CW, false = CCW

  bool? _userAnswer; // true = CW, false = CCW, null = unanswered
  bool _isAnswered = false;
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _gearsCount = _random.nextInt(3) + 3; // 3, 4, or 5 gears
    _firstGearClockwise = _random.nextBool();

    // Alternate directions
    // Gear 0: _firstGearClockwise
    // Gear 1: !_firstGearClockwise
    // Gear 2: _firstGearClockwise
    // ...
    // Gear N-1: direction depends on index parity
    bool finalDirection = _firstGearClockwise;
    for (int i = 1; i < _gearsCount; i++) {
      finalDirection = !finalDirection;
    }
    _correctAnswer = finalDirection;

    // Generate random radii for gears
    _radii = List.generate(_gearsCount, (i) => 30.0 + _random.nextInt(20));

    _userAnswer = null;
    _isAnswered = false;
  }

  void _onAnswer(bool isClockwise) {
    if (_isAnswered || _isGameOver) return;

    setState(() {
      _isAnswered = true;
      _userAnswer = isClockwise;

      if (isClockwise == _correctAnswer) {
        _score++;
        HapticFeedbackUtil.success();
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (!mounted) return;
          if (_score >= _targetScore) {
            setState(() {
              _isGameOver = true;
            });
            _onGameComplete();
          } else {
            setState(() {
              _generatePuzzle();
            });
          }
        });
      } else {
        HapticFeedbackUtil.error();
        _score = max(0, _score - 1);
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (!mounted) return;
          setState(() {
            _generatePuzzle();
          });
        });
      }
    });
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('gear_rotation');
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
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'gear_rotation'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'gear_rotation'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Column(
        children: [
          // Header status card
          Container(
            margin: const EdgeInsets.all(DesignSystem.spaceMD),
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(
                color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'START GEAR IS:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _firstGearClockwise ? 'CLOCKWISE (CW)' : 'COUNTER-CLOCKWISE (CCW)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _firstGearClockwise ? DesignSystem.gameBlue : DesignSystem.gamePurple,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '$_score / $_targetScore',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: DesignSystem.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          // Graphics Area
          Expanded(
            child: AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                return CustomPaint(
                  size: Size.infinite,
                  painter: _GearChainPainter(
                    gearsCount: _gearsCount,
                    radii: _radii,
                    firstGearClockwise: _firstGearClockwise,
                    rotationAngle: _rotationController.value * 2 * pi,
                    isAnswered: _isAnswered,
                    correctAnswer: _correctAnswer,
                    userAnswer: _userAnswer,
                    isDark: isDark,
                  ),
                );
              },
            ),
          ),
          // Control Buttons
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDirectionButton(true, 'CLOCKWISE', isDark),
                _buildDirectionButton(false, 'COUNTER-CLOCKWISE', isDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionButton(bool directionValue, String label, bool isDark) {
    Color btnColor = directionValue ? DesignSystem.gameBlue : DesignSystem.gamePurple;
    bool isSelected = _userAnswer == directionValue;
    bool showCorrect = _isAnswered && _correctAnswer == directionValue;
    bool showWrong = _isAnswered && isSelected && _correctAnswer != directionValue;

    Color? backgroundColor;
    if (showCorrect) backgroundColor = DesignSystem.gameGreen;
    if (showWrong) backgroundColor = DesignSystem.error;

    return SizedBox(
      width: 150,
      height: 56,
      child: ElevatedButton(
        onPressed: _isAnswered ? null : () => _onAnswer(directionValue),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? (isDark ? DesignSystem.darkSurface : Colors.white),
          side: BorderSide(
            color: backgroundColor ?? (isSelected ? btnColor : (isDark ? DesignSystem.darkOutline : DesignSystem.outline)),
            width: 2.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: backgroundColor != null
                ? Colors.white
                : (isDark ? Colors.white : Colors.black87),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _GearChainPainter extends CustomPainter {
  final int gearsCount;
  final List<double> radii;
  final bool firstGearClockwise;
  final double rotationAngle;
  final bool isAnswered;
  final bool correctAnswer;
  final bool? userAnswer;
  final bool isDark;

  _GearChainPainter({
    required this.gearsCount,
    required this.radii,
    required this.firstGearClockwise,
    required this.rotationAngle,
    required this.isAnswered,
    required this.correctAnswer,
    required this.userAnswer,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Determine gear positions along horizontal axis in center of screen
    double spacing = 12.0;
    double rawWidth = 0.0;
    for (int i = 0; i < gearsCount; i++) {
      rawWidth += radii[i] * 2;
      if (i < gearsCount - 1) rawWidth += spacing;
    }

    // Calculate scale factor to fit gears in screen width and height responsively
    double allowedWidth = size.width * 0.9;
    double maxRadius = radii.reduce((a, b) => a > b ? a : b);
    double allowedHeight = size.height * 0.8;

    double scale = 1.0;
    if (rawWidth > allowedWidth) {
      scale = allowedWidth / rawWidth;
    }
    if (maxRadius * 2 * scale > allowedHeight) {
      scale = allowedHeight / (maxRadius * 2);
    }

    double scaledSpacing = spacing * scale;
    List<double> scaledRadii = radii.map((r) => r * scale).toList();

    double totalWidth = 0.0;
    for (int i = 0; i < gearsCount; i++) {
      totalWidth += scaledRadii[i] * 2;
      if (i < gearsCount - 1) totalWidth += scaledSpacing;
    }

    double startX = (size.width - totalWidth) / 2.0;
    double centerY = size.height / 2.0;

    double currentX = startX;
    List<Offset> centers = [];
    for (int i = 0; i < gearsCount; i++) {
      double r = scaledRadii[i];
      centers.add(Offset(currentX + r, centerY));
      currentX += r * 2 + scaledSpacing;
    }

    // Draw connected line (axle/chain line behind gears)
    final linePaint = Paint()
      ..color = isDark ? Colors.white10 : Colors.black12
      ..strokeWidth = 6.0 * scale
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(centers.first, centers.last, linePaint);

    // Draw gears
    for (int i = 0; i < gearsCount; i++) {
      double r = scaledRadii[i];
      Offset center = centers[i];

      // Determine rotation speed and direction
      double speedRatio = scaledRadii[0] / r;
      bool direction = (i % 2 == 0) ? firstGearClockwise : !firstGearClockwise;
      double gearAngle = rotationAngle * speedRatio * (direction ? 1.0 : -1.0);

      // If not answered, only gear 0 spins
      if (!isAnswered && i > 0) {
        gearAngle = 0.0;
      }

      // Gear coloring
      Color gearColor;
      if (i == 0) {
        gearColor = DesignSystem.gameBlue;
      } else if (i == gearsCount - 1) {
        if (isAnswered) {
          if (userAnswer == correctAnswer) {
            gearColor = DesignSystem.gameGreen;
          } else {
            gearColor = DesignSystem.error;
          }
        } else {
          gearColor = DesignSystem.gameOrange;
        }
      } else {
        gearColor = isDark ? Colors.white60 : Colors.black54;
      }

      _drawGear(canvas, center, r, gearAngle, gearColor, scale);

      // Draw index number or question mark on last gear
      if (i == gearsCount - 1 && !isAnswered) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: '?',
            style: TextStyle(
              fontSize: 22 * scale,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        textPainter.paint(
          canvas,
          center - Offset(textPainter.width / 2.0, textPainter.height / 2.0),
        );
      }
    }
  }

  void _drawGear(Canvas canvas, Offset center, double r, double angle, Color color, double scale) {
    final gearPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw center core
    canvas.drawCircle(center, r - (6 * scale), gearPaint);

    // Draw axle hole
    final holePaint = Paint()
      ..color = isDark ? DesignSystem.darkBackground : DesignSystem.background
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 6 * scale, holePaint);

    // Draw gear teeth (teeth are simple triangles/rectangles around the edge)
    final toothPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    int teethCount = (r / (4 * scale)).floor() * 2;
    for (int i = 0; i < teethCount; i++) {
      double currentAngle = angle + (2 * pi / teethCount) * i;
      double outerR = r + (4 * scale);
      double innerR = r - (2 * scale);

      double x1 = center.dx + innerR * cos(currentAngle - 0.1);
      double y1 = center.dy + innerR * sin(currentAngle - 0.1);
      double x2 = center.dx + outerR * cos(currentAngle);
      double y2 = center.dy + outerR * sin(currentAngle);
      double x3 = center.dx + innerR * cos(currentAngle + 0.1);
      double y3 = center.dy + innerR * sin(currentAngle + 0.1);

      Path toothPath = Path()
        ..moveTo(x1, y1)
        ..lineTo(x2, y2)
        ..lineTo(x3, y3)
        ..close();

      canvas.drawPath(toothPath, toothPaint);
    }
  }

  @override
  bool shouldRepaint(_GearChainPainter oldDelegate) {
    return oldDelegate.rotationAngle != rotationAngle ||
        oldDelegate.isAnswered != isAnswered ||
        oldDelegate.userAnswer != userAnswer ||
        oldDelegate.gearsCount != gearsCount;
  }
}
