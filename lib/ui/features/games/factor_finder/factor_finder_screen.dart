import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'factor_finder_provider.dart';

class FactorFinderScreen extends ConsumerStatefulWidget {
  const FactorFinderScreen({super.key});

  @override
  ConsumerState<FactorFinderScreen> createState() => _FactorFinderScreenState();
}

class _FactorFinderScreenState extends ConsumerState<FactorFinderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(factorFinderNotifierProvider.notifier).initGame();
    });
  }

  void _handleNumberTap(int index, bool isCorrect) {
    if (isCorrect) {
      HapticFeedbackUtil.success();
    } else {
      HapticFeedbackUtil.error();
    }
    ref.read(factorFinderNotifierProvider.notifier).tapNumber(index);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(factorFinderNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(factorFinderNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'TIME\'S UP!',
            message: 'You scored ${next.score} points by finding all factors!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(factorFinderNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: 'FACTOR FINDER',
        subtitle: 'Tap all factors of the target number',
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final level = state.currentLevel!;

    return GameScaffold(
      title: 'FACTOR FINDER',
      subtitle: 'Tap all numbers that divide the target without remainder',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(factorFinderNotifierProvider.notifier).reset();
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxHeight < 550;
          final remainingFactorsCount = level.factorIndices.length -
              level.factorIndices.intersection(state.selectedIndices).length;

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

                // Target displays
                TangibleContainer(
                  depth: 6.0,
                  color: colorScheme.surface,
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'FIND ALL FACTORS OF',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorScheme.onSurface.withValues(alpha: 0.5),
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: DesignSystem.spaceXS),
                        Text(
                          '${level.targetNumber}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: isSmallScreen ? 36 : 48,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: DesignSystem.spaceXS),
                        Text(
                          'Factors Left to Find: $remainingFactorsCount',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: DesignSystem.accentAmber,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: isSmallScreen ? DesignSystem.spaceMD : DesignSystem.spaceXL),

                // Numbers Grid
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 400),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: DesignSystem.spaceMD,
                          mainAxisSpacing: DesignSystem.spaceMD,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: level.gridNumbers.length,
                        itemBuilder: (context, index) {
                          final num = level.gridNumbers[index];
                          final isAlreadySelected = state.selectedIndices.contains(index);
                          final isWrongTap = state.wrongTapIndex == index;
                          final isCorrectFactor = level.factorIndices.contains(index);

                          Color buttonColor;
                          Color shadowColor;
                          double depth;
                          TextStyle textStyle;

                          if (isAlreadySelected) {
                            buttonColor = DesignSystem.accentEmerald;
                            shadowColor = DesignSystem.accentEmerald.withValues(alpha: 0.7);
                            depth = 0.0;
                            textStyle = const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            );
                          } else if (isWrongTap) {
                            buttonColor = colorScheme.error;
                            shadowColor = colorScheme.error.withValues(alpha: 0.7);
                            depth = 2.0;
                            textStyle = const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            );
                          } else {
                            buttonColor = colorScheme.surface;
                            shadowColor = colorScheme.outline;
                            depth = 5.0;
                            textStyle = TextStyle(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            );
                          }

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            transform: isWrongTap
                                ? (Matrix4.identity()..translate(2.0, 0.0)) // simple wiggle
                                : Matrix4.identity(),
                            child: TangibleButton(
                              depth: depth,
                              color: buttonColor,
                              shadowColor: shadowColor,
                              radius: DesignSystem.radiusSM,
                              padding: EdgeInsets.zero,
                              onTap: isAlreadySelected
                                  ? null
                                  : () => _handleNumberTap(index, isCorrectFactor),
                              child: Center(
                                child: Text(
                                  '$num',
                                  style: textStyle,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceMD),
              ],
            ),
          );
        },
      ),
    );
  }
}
