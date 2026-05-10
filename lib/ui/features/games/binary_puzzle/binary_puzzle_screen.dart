import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'binary_puzzle_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class BinaryPuzzleScreen extends ConsumerWidget {
  const BinaryPuzzleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(binaryPuzzleNotifierProvider);

    ref.listen(binaryPuzzleNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'BINARY PUZZLE',
      subtitle: 'Fill with 0 and 1. Max two of the same digit adjacent. Equal 0s and 1s in each row and column.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(binaryPuzzleNotifierProvider.notifier).newGame();
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
              _buildBoard(context, ref, state, constraints.maxHeight * 0.6),
              const Spacer(),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, BinaryPuzzleState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final boardSize = min(constraints.maxWidth, constraints.maxHeight);

            return TangibleContainer(
              color: DesignSystem.ink,
              shadowColor: DesignSystem.inkSlate,
              depth: 4.0, // Reduced from 6.0
              radius: DesignSystem.radiusMD,
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: boardSize,
                height: boardSize,
                decoration: BoxDecoration(
                  color: DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: state.board.size,
                      ),
                      itemCount: state.board.size * state.board.size,
                      itemBuilder: (context, index) {
                        final r = index ~/ state.board.size;
                        final c = index % state.board.size;
                        final cell = state.currentGrid[r][c];
                        final isFixed = state.fixedCells[r][c];

                        return GestureDetector(
                          onTap: () {
                            if (!isFixed) {
                              HapticFeedbackUtil.lightImpact();
                              ref.read(binaryPuzzleNotifierProvider.notifier).toggleCell(r, c);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: DesignSystem.outline.withValues(alpha: 0.3),
                                width: 0.5,
                              ),
                              color: isFixed 
                                ? DesignSystem.background 
                                : DesignSystem.surface,
                            ),
                            child: Center(
                              child: cell == null
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FittedBox(
                                        child: Text(
                                          '$cell',
                                          style: TextStyle(
                                            fontSize: 24, // Reduced from 32
                                            color: isFixed 
                                              ? DesignSystem.primary 
                                              : DesignSystem.ink,
                                            fontWeight: isFixed ? FontWeight.w900 : FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('binary_puzzle');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'WELL DONE',
        message: 'You solved the binary puzzle with perfect logic!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(binaryPuzzleNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

