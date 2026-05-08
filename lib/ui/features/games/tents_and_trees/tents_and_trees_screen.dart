import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tents_and_trees_engine.dart';
import 'tents_and_trees_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';

class TentsAndTreesScreen extends ConsumerWidget {
  const TentsAndTreesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tentsAndTreesNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(tentsAndTreesNotifierProvider, (previous, next) {
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
          'TENTS & TREES',
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
              ref.read(tentsAndTreesNotifierProvider.notifier).newGame();
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
            'CAMPING LOGIC',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          Text(
            'Place tents next to trees. Numbers indicate how many tents are in each row/column. Tents cannot touch each other.',
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

  Widget _buildBoard(BuildContext context, WidgetRef ref, TentsAndTreesState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.95;
        final clueSize = boardSize * 0.15;
        final gridDisplaySize = boardSize - clueSize;
        final cellSize = gridDisplaySize / state.level.size;

        return SizedBox(
          width: boardSize,
          height: boardSize,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: clueSize,
                child: Row(
                  children: List.generate(state.level.size, (i) {
                    return SizedBox(
                      width: cellSize,
                      height: clueSize,
                      child: Center(
                        child: Text(
                          '${state.level.colClues[i]}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _isColFull(state, i) ? Colors.green : null,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: clueSize,
                left: 0,
                child: Column(
                  children: List.generate(state.level.size, (i) {
                    return SizedBox(
                      width: clueSize,
                      height: cellSize,
                      child: Center(
                        child: Text(
                          '${state.level.rowClues[i]}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _isRowFull(state, i) ? Colors.green : null,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: clueSize,
                left: clueSize,
                child: Container(
                  width: gridDisplaySize,
                  height: gridDisplaySize,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.level.size,
                    ),
                    itemCount: state.level.size * state.level.size,
                    itemBuilder: (context, index) {
                      final r = index ~/ state.level.size;
                      final c = index % state.level.size;
                      final cell = state.grid[r][c];
                      return GestureDetector(
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          ref.read(tentsAndTreesNotifierProvider.notifier).toggleCell(r, c);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300, width: 0.5),
                            color: cell == CellType.grass ? Colors.green.withValues(alpha: 0.1) : Colors.transparent,
                          ),
                          child: _buildCellContent(cell),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCellContent(CellType cell) {
    switch (cell) {
      case CellType.tree:
        return const Center(child: Icon(Icons.park_rounded, color: Colors.green, size: 24));
      case CellType.tent:
        return const Center(child: Icon(Icons.holiday_village_rounded, color: Colors.brown, size: 24));
      case CellType.grass:
        return Center(child: Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)));
      case CellType.empty:
        return const SizedBox.shrink();
    }
  }

  bool _isRowFull(TentsAndTreesState state, int r) {
    int count = 0;
    for (int c = 0; c < state.level.size; c++) {
      if (state.grid[r][c] == CellType.tent) count++;
    }
    return count == state.level.rowClues[r];
  }

  bool _isColFull(TentsAndTreesState state, int c) {
    int count = 0;
    for (int r = 0; r < state.level.size; r++) {
      if (state.grid[r][c] == CellType.tent) count++;
    }
    return count == state.level.colClues[c];
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('tents_and_trees');
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
          ref.read(tentsAndTreesNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
        title: 'CONGRATS',
        message: 'You correctly placed all the tents.',
      ),
    );
  }
}
