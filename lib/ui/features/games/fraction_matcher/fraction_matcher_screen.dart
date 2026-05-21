import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'fraction_matcher_engine.dart';
import 'fraction_matcher_provider.dart';

class FractionMatcherScreen extends ConsumerStatefulWidget {
  const FractionMatcherScreen({super.key});

  @override
  ConsumerState<FractionMatcherScreen> createState() => _FractionMatcherScreenState();
}

class _FractionMatcherScreenState extends ConsumerState<FractionMatcherScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(fractionMatcherNotifierProvider.notifier).initGame();
    });
  }

  void _handleOptionTap(int index, bool isCorrect) {
    if (isCorrect) {
      HapticFeedbackUtil.success();
    } else {
      HapticFeedbackUtil.error();
    }
    ref.read(fractionMatcherNotifierProvider.notifier).selectOption(index);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fractionMatcherNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(fractionMatcherNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'TIME\'S UP!',
            message: 'You scored ${next.score} points matching representations!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(fractionMatcherNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: 'FRACTION MATCHER',
        subtitle: 'Rapid representation matching',
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final level = state.currentLevel!;

    return GameScaffold(
      title: 'FRACTION MATCHER',
      subtitle: 'Match the representation to the target fraction.',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(fractionMatcherNotifierProvider.notifier).reset();
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxHeight < 550;

          return Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                // Top status bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TangibleContainer(
                        depth: 4.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: DesignSystem.spaceSM,
                          horizontal: DesignSystem.spaceMD,
                        ),
                        color: colorScheme.surface,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.stars_rounded, color: DesignSystem.accentAmber, size: 20),
                            const SizedBox(width: DesignSystem.spaceXS),
                            Text(
                              'SCORE: ${state.score}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceMD),
                    Expanded(
                      child: TangibleContainer(
                        depth: 4.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: DesignSystem.spaceSM,
                          horizontal: DesignSystem.spaceMD,
                        ),
                        color: state.timeLeft <= 5
                            ? colorScheme.error.withValues(alpha: 0.1)
                            : colorScheme.surface,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              color: state.timeLeft <= 5 ? colorScheme.error : colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: DesignSystem.spaceXS),
                            Text(
                              '${state.timeLeft}s',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: state.timeLeft <= 5 ? colorScheme.error : null,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? DesignSystem.spaceMD : DesignSystem.spaceLG),

                // Target Fraction Display
                TangibleContainer(
                  depth: 6.0,
                  color: colorScheme.surface,
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'TARGET FRACTION',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorScheme.onSurface.withValues(alpha: 0.5),
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: DesignSystem.spaceSM),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${level.targetNumerator}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: isSmallScreen ? 32 : 44,
                                height: 1.1,
                                color: colorScheme.primary,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              width: isSmallScreen ? 40 : 50,
                              height: 4,
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface.withValues(alpha: 0.8),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Text(
                              '${level.targetDenominator}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: isSmallScreen ? 32 : 44,
                                height: 1.1,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: isSmallScreen ? DesignSystem.spaceMD : DesignSystem.spaceXL),

                // Options Grid (2x2)
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 400),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: DesignSystem.spaceMD,
                          mainAxisSpacing: DesignSystem.spaceMD,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: level.options.length,
                        itemBuilder: (context, index) {
                          final opt = level.options[index];
                          final isCorrect = index == level.correctOptionIndex;

                          Widget optionContent;
                          if (opt.type == OptionType.visual) {
                            optionContent = Center(
                              child: SizedBox(
                                width: isSmallScreen ? 60 : 75,
                                height: isSmallScreen ? 60 : 75,
                                child: CustomPaint(
                                  painter: PieChartPainter(
                                    slices: opt.visualSlices,
                                    filled: opt.visualFilled,
                                    filledColor: DesignSystem.accentEmerald,
                                    strokeColor: colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            optionContent = Center(
                              child: Text(
                                opt.text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 28,
                                ),
                              ),
                            );
                          }

                          return TangibleButton(
                            depth: 6.0,
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            radius: DesignSystem.radiusMD,
                            padding: const EdgeInsets.all(DesignSystem.spaceSM),
                            onTap: () => _handleOptionTap(index, isCorrect),
                            child: optionContent,
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Momentary Success/Error visual feedback
                if (state.lastAnswerCorrect != null)
                  Padding(
                    padding: const EdgeInsets.only(top: DesignSystem.spaceSM),
                    child: Text(
                      state.lastAnswerCorrect! ? 'CORRECT!' : 'WRONG!',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: state.lastAnswerCorrect!
                            ? DesignSystem.accentEmerald
                            : colorScheme.error,
                        letterSpacing: 1.0,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 24),
                const SizedBox(height: DesignSystem.spaceMD),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final int slices;
  final int filled;
  final Color filledColor;
  final Color strokeColor;

  PieChartPainter({
    required this.slices,
    required this.filled,
    required this.filledColor,
    required this.strokeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw background circle
    final bgPaint = Paint()
      ..color = strokeColor.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, bgPaint);

    final paint = Paint()
      ..color = filledColor
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = strokeColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final sweepAngle = (2 * math.pi) / slices;

    // Draw filled slices
    for (int i = 0; i < filled; i++) {
      final startAngle = -math.pi / 2 + (i * sweepAngle);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
    }

    // Draw slice separator lines
    for (int i = 0; i < slices; i++) {
      final angle = -math.pi / 2 + (i * sweepAngle);
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      canvas.drawLine(center, Offset(x, y), strokePaint);
    }

    // Draw outer circle outline
    canvas.drawCircle(center, radius, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
