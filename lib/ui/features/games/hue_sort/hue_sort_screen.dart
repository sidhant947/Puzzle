import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hue_sort_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class HueSortScreen extends ConsumerWidget {
  const HueSortScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hueSortNotifierProvider);

    ref.listen(hueSortNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'HUE SORT',
      subtitle: 'Swap tiles to create a smooth transition between corner colors. Dots indicate fixed tiles.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(hueSortNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded, size: 20, color: DesignSystem.ink),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              Center(
                child: _buildGrid(context, ref, state, constraints.maxHeight * 0.55),
              ),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, HueSortState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double gridSize = min(constraints.maxWidth, constraints.maxHeight);

            return TangibleContainer(
              color: DesignSystem.ink,
              shadowColor: DesignSystem.inkSlate,
              depth: 4.0,
              radius: DesignSystem.radiusMD,
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: gridSize,
                height: gridSize,
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 6),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.level.size,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                    ),
                    itemCount: state.level.size * state.level.size,
                    itemBuilder: (context, index) {
                      final isFixed = state.level.fixedIndices.contains(index);
                      final isSelected = state.selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          ref.read(hueSortNotifierProvider.notifier).selectTile(index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: state.currentColors[index],
                            borderRadius: BorderRadius.circular(isSelected ? DesignSystem.radiusSM : 1),
                            border: isSelected 
                                ? Border.all(color: Colors.white, width: 3) 
                                : null,
                          ),
                          child: isFixed
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                    child: Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withValues(alpha: 0.2),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('hue_sort');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'PERFECT GRADIENT!',
        message: 'You perfectly sorted the color spectrum!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(hueSortNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
