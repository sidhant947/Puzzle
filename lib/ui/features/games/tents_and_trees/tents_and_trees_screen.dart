import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tents_and_trees_engine.dart';
import 'tents_and_trees_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class TentsAndTreesScreen extends ConsumerWidget {
  const TentsAndTreesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(tentsAndTreesNotifierProvider);

    ref.listen(tentsAndTreesNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.tentsAndTreesTitle.toUpperCase(),
      subtitle: l10n.tentsAndTreesSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(tentsAndTreesNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 0.65,
                ),
                child: Center(
                  child: _buildBoard(context, ref, state),
                ),
              ),
              const Spacer(),
              const SizedBox(height: DesignSystem.spaceMD),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, TentsAndTreesState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth * 0.95;
        final clueSize = boardSize * 0.12;
        final gridDisplaySize = boardSize - clueSize;
        final cellSize = gridDisplaySize / state.level.size;

        return SizedBox(
          width: boardSize,
          height: boardSize,
          child: Stack(
            children: [
              // Column Clues
              Positioned(
                top: 0,
                left: clueSize,
                child: Row(
                  children: List.generate(state.level.size, (i) {
                    final isFull = _isColFull(state, i);
                    return SizedBox(
                      width: cellSize,
                      height: clueSize,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: FittedBox(
                            child: Text(
                              '${state.level.colClues[i]}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: isFull ? DesignSystem.success : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // Row Clues
              Positioned(
                top: clueSize,
                left: 0,
                child: Column(
                  children: List.generate(state.level.size, (i) {
                    final isFull = _isRowFull(state, i);
                    return SizedBox(
                      width: clueSize,
                      height: cellSize,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: FittedBox(
                            child: Text(
                              '${state.level.rowClues[i]}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: isFull ? DesignSystem.success : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // The Grid
              Positioned(
                top: clueSize,
                left: clueSize,
                child: SizedBox(
                  width: gridDisplaySize,
                  height: gridDisplaySize,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(4),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.level.size,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: state.level.size * state.level.size,
                    itemBuilder: (context, index) {
                      final r = index ~/ state.level.size;
                      final c = index % state.level.size;
                      final cell = state.grid[r][c];
                      return TangibleContainer(
                        depth: cell == CellType.empty ? 1 : 0,
                        radius: DesignSystem.radiusXS,
                        color: cell == CellType.grass 
                            ? DesignSystem.success.withValues(alpha: 0.1) 
                            : Theme.of(context).colorScheme.surface,
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          ref.read(tentsAndTreesNotifierProvider.notifier).toggleCell(r, c);
                        },
                        child: _buildCellContent(cell),
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
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: FittedBox(child: Icon(Icons.park_rounded, color: DesignSystem.success, size: 28)),
          ),
        );
      case CellType.tent:
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: FittedBox(child: Icon(Icons.holiday_village_rounded, color: DesignSystem.accentOrange, size: 28)),
          ),
        );
      case CellType.grass:
        return Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * 0.2,
                height: constraints.maxWidth * 0.2,
                decoration: const BoxDecoration(color: DesignSystem.success, shape: BoxShape.circle),
              );
            },
          ),
        );
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
    final l10n = AppLocalizations.of(context)!;
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
        title: 'WELL DONE',
        message: 'You have successfully placed all the tents.',
      ),
    );
  }
}

