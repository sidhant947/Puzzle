import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'binary_puzzle_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';

class BinaryPuzzleScreen extends ConsumerWidget {
  const BinaryPuzzleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(binaryPuzzleNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(binaryPuzzleNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'BINARY PUZZLE',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              ref.read(binaryPuzzleNotifierProvider.notifier).newGame();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            _buildInstructions(theme),
            const Spacer(),
            Center(
              child: _buildBoard(context, ref, state),
            ),
            const Spacer(),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructions(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Column(
        children: [
          Text(
            'LOGIC GRID',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          Text(
            'Fill with 0 and 1. Max two of the same digit adjacent. Each row and column must have an equal number of 0s and 1s.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, BinaryPuzzleState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.9;

        return Container(
          width: boardSize,
          height: boardSize,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
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
                      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                      width: 0.5,
                    ),
                    color: isFixed 
                      ? Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5) 
                      : Colors.transparent,
                  ),
                  child: Center(
                    child: cell == null
                        ? const SizedBox.shrink()
                        : Text(
                            '$cell',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: isFixed 
                                ? Theme.of(context).colorScheme.primary 
                                : DesignSystem.gameBlue,
                              fontWeight: isFixed ? FontWeight.w900 : FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('binary_puzzle');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(binaryPuzzleNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
        message: 'You solved the binary puzzle!',
      ),
    );
  }
}
