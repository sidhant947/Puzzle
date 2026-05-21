import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'target_10_engine.dart';
import 'target_10_provider.dart';

class Target10Screen extends ConsumerStatefulWidget {
  const Target10Screen({super.key});

  @override
  ConsumerState<Target10Screen> createState() => _Target10ScreenState();
}

class _Target10ScreenState extends ConsumerState<Target10Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(target10NotifierProvider.notifier).initGame();
    });
  }

  void _handleTileTap(int index, int num, int currentSum) {
    final notifier = ref.read(target10NotifierProvider.notifier);
    final targetState = ref.read(target10NotifierProvider);
    final isSelected = targetState.selectedIndices.contains(index);

    if (isSelected) {
      HapticFeedbackUtil.lightImpact();
      notifier.tapTile(index);
      return;
    }

    final newSum = currentSum + num;
    if (newSum == 10) {
      HapticFeedbackUtil.success();
    } else if (newSum > 10) {
      HapticFeedbackUtil.error();
    } else {
      HapticFeedbackUtil.lightImpact();
    }

    notifier.tapTile(index);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(target10NotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(target10NotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'TIME\'S UP!',
            message: 'You scored ${next.score} points matching numbers to 10!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(target10NotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.grid.isEmpty) {
      return GameScaffold(
        title: 'TARGET 10',
        subtitle: 'Sprint grid-clearing',
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Compute current sum of selection
    int currentSelectionSum = 0;
    for (int idx in state.selectedIndices) {
      currentSelectionSum += state.grid[idx];
    }

    return GameScaffold(
      title: 'TARGET 10',
      subtitle: 'Select tiles that add up to exactly 10 to clear them.',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(target10NotifierProvider.notifier).reset();
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

                // Current Sum Indicator Card
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
                          'SELECTION SUM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorScheme.onSurface.withValues(alpha: 0.5),
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: DesignSystem.spaceXS),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$currentSelectionSum',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: isSmallScreen ? 36 : 48,
                                color: currentSelectionSum > 10
                                    ? colorScheme.error
                                    : currentSelectionSum == 10
                                        ? DesignSystem.accentEmerald
                                        : colorScheme.primary,
                              ),
                            ),
                            Text(
                              ' / 10',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: colorScheme.onSurface.withValues(alpha: 0.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: isSmallScreen ? DesignSystem.spaceMD : DesignSystem.spaceXL),

                // 5x5 grid of Tiles
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: DesignSystem.spaceSM,
                            mainAxisSpacing: DesignSystem.spaceSM,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: state.grid.length,
                          itemBuilder: (context, index) {
                            final num = state.grid[index];
                            final isSelected = state.selectedIndices.contains(index);

                            Color buttonColor;
                            Color shadowColor;
                            double depth;
                            TextStyle textStyle;

                            if (isSelected) {
                              buttonColor = colorScheme.primary.withValues(alpha: 0.15);
                              shadowColor = colorScheme.primary;
                              depth = 1.0;
                              textStyle = TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                              );
                            } else {
                              buttonColor = colorScheme.surface;
                              shadowColor = colorScheme.outline;
                              depth = 5.0;
                              textStyle = TextStyle(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                              );
                            }

                            return TangibleButton(
                              depth: depth,
                              color: buttonColor,
                              shadowColor: shadowColor,
                              radius: DesignSystem.radiusSM,
                              padding: EdgeInsets.zero,
                              onTap: () => _handleTileTap(index, num, currentSelectionSum),
                              child: Center(
                                child: Text(
                                  '$num',
                                  style: textStyle,
                                ),
                              ),
                            );
                          },
                        ),
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
