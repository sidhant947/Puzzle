import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'd2_attention_engine.dart';
import 'd2_attention_provider.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class D2AttentionScreen extends ConsumerWidget {
  const D2AttentionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(d2AttentionNotifierProvider);
    final notifier = ref.read(d2AttentionNotifierProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    ref.listen(d2AttentionNotifierProvider, (previous, next) {
      if (next.isCompleted && !(previous?.isCompleted ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'VICTORY',
            message: 'Incredible selective scanning! Final score: ${next.score}.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'd2 Attention',
      subtitle: 'Tap ONLY letter "d" that has EXACTLY 2 dashes',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.reset();
      },
      onHowToPlay: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('HOW TO PLAY'),
            content: const Text(
              'You will see rows of letters "d" and "p" with small dashes above and/or below them.\n\n'
              'Select ONLY the letters "d" that have EXACTLY two dashes in total (e.g. 1 above and 1 below, or 2 above, or 2 below).\n\n'
              'Ignore all "p"s and any "d"s with 1, 3, or 4 dashes. Tap SUBMIT when you have finished scanning the board.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('GOT IT'),
              ),
            ],
          ),
        );
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxHeight < 550;
          return Column(
            children: [
              // Stats header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TangibleContainer(
                      depth: 2.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      radius: DesignSystem.radiusSM,
                      child: Text(
                        'BOARD: ${state.currentBoardIndex}/${state.totalBoards}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    TangibleContainer(
                      depth: 2.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      radius: DesignSystem.radiusSM,
                      child: Text(
                        'SCORE: ${state.score}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: DesignSystem.primary),
                      ),
                    ),
                  ],
                ),
              ),

              // Scanning Board Grid
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(DesignSystem.spaceLG),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: TangibleContainer(
                        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                        shadowColor: isDark ? Colors.black : DesignSystem.outline,
                        depth: 4.0,
                        radius: DesignSystem.radiusLG,
                        padding: const EdgeInsets.all(DesignSystem.spaceMD),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: D2AttentionEngine.gridSize,
                            crossAxisSpacing: DesignSystem.spaceSM,
                            mainAxisSpacing: DesignSystem.spaceSM,
                          ),
                          itemCount: state.board.length,
                          itemBuilder: (context, index) {
                            final item = state.board[index];
                            final isSelected = state.selectedIds.contains(item.id);
                            return _buildD2Tile(item, isSelected, isDark, context, notifier);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom action submission
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
                child: TangibleButton(
                  onTap: () {
                    HapticFeedbackUtil.mediumImpact();
                    notifier.submitBoard();
                  },
                  color: DesignSystem.primary,
                  shadowColor: DesignSystem.primaryShadow,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      state.currentBoardIndex == state.totalBoards
                          ? 'SUBMIT & FINISH'
                          : 'SUBMIT BOARD',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),

              if (!isSmall) const SizedBox(height: DesignSystem.spaceSM),
            ],
          );
        },
      ),
    );
  }

  Widget _buildD2Tile(
    D2Item item,
    bool isSelected,
    bool isDark,
    BuildContext context,
    D2AttentionNotifier notifier,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedColor = isSelected
        ? DesignSystem.primary
        : (isDark ? const Color(0xFF262626) : const Color(0xFFF8FAFC));
    final resolvedShadow = isSelected ? DesignSystem.primaryShadow : colorScheme.outlineVariant;
    final textColor = isSelected ? Colors.white : colorScheme.onSurface;
    final dashColor = isSelected ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.7);

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        notifier.toggleItemSelection(item.id);
      },
      child: TangibleContainer(
        depth: isSelected ? 0.0 : 3.0,
        color: resolvedColor,
        shadowColor: resolvedShadow,
        radius: DesignSystem.radiusMD,
        padding: EdgeInsets.zero,
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Dashes above
                  SizedBox(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        item.dashesAbove,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                            width: 3,
                            height: 8,
                            decoration: BoxDecoration(
                              color: dashColor,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // The D2 letter stimulus
                  Text(
                    item.letter,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Courier',
                      height: 1.0,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Dashes below
                  SizedBox(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        item.dashesBelow,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                            width: 3,
                            height: 8,
                            decoration: BoxDecoration(
                              color: dashColor,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
