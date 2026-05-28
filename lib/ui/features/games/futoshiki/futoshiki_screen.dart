import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'futoshiki_provider.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class FutoshikiScreen extends ConsumerWidget {
  const FutoshikiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(futoshikiNotifierProvider);
    final notifier = ref.read(futoshikiNotifierProvider.notifier);

    ref.listen(futoshikiNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'PUZZLE SOLVED',
            message: 'Incredible! You solved the Futoshiki Latin Square.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.newGame();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'Futoshiki',
      subtitle: 'Fill 1-4 in each row and col. Respect all inequality (< and >) symbols.',
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boardWidth = constraints.maxWidth * 0.85;
          final boardSize = boardWidth > 320.0 ? 320.0 : boardWidth;

          return Column(
            children: [
              const Spacer(),
              Center(
                child: TangibleContainer(
                  color: Theme.of(context).colorScheme.surface,
                  shadowColor: Theme.of(context).colorScheme.outline,
                  depth: 4.0,
                  radius: DesignSystem.radiusLG,
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  child: SizedBox(
                    width: boardSize,
                    height: boardSize,
                    child: _buildBoard(context, state, notifier),
                  ),
                ),
              ),
              const Spacer(),
              // Bottom keyboard input
              _buildInputKeyboard(context, state, notifier),
              const Spacer(),
              ],
              );
              },
              ),    );
  }

  Widget _buildBoard(BuildContext context, FutoshikiState state, FutoshikiNotifier notifier) {
    final size = state.level.size;
    final List<Widget> children = [];

    for (int r = 0; r < size; r++) {
      // 1. Build a cell row
      final List<Widget> rowCells = [];
      for (int c = 0; c < size; c++) {
        rowCells.add(Expanded(flex: 2, child: _buildCell(context, r, c, state, notifier)));
        if (c < size - 1) {
          rowCells.add(Expanded(flex: 1, child: _buildHInt(context, r, c, state)));
        }
      }
      children.add(Expanded(flex: 2, child: Row(children: rowCells)));

      // 2. Build a vertical inequality row (if not the last row)
      if (r < size - 1) {
        final List<Widget> vIneqs = [];
        for (int c = 0; c < size; c++) {
          vIneqs.add(Expanded(flex: 2, child: _buildVInt(context, r, c, state)));
          if (c < size - 1) {
            vIneqs.add(const Expanded(flex: 1, child: SizedBox.shrink()));
          }
        }
        children.add(Expanded(flex: 1, child: Row(children: vIneqs)));
      }
    }

    return Column(children: children);
  }

  Widget _buildCell(
    BuildContext context,
    int r,
    int c,
    FutoshikiState state,
    FutoshikiNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final value = state.currentGrid[r][c];
    final isClue = state.level.clues[r][c] != null;
    final isSelected = state.selectedRow == r && state.selectedCol == c;

    Color cellColor = colorScheme.surface;
    Color? shadowColor = colorScheme.outline;
    double depth = 2.0;

    if (isClue) {
      cellColor = colorScheme.outline.withValues(alpha: 0.15);
      shadowColor = colorScheme.outline;
      depth = 0.0;
    } else if (isSelected) {
      cellColor = DesignSystem.primary;
      shadowColor = DesignSystem.primary.withValues(alpha: 0.5);
      depth = 2.0;
    }

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        notifier.selectCell(r, c);
      },
      child: TangibleContainer(
        color: cellColor,
        shadowColor: shadowColor,
        depth: depth,
        radius: DesignSystem.radiusSM,
        padding: EdgeInsets.zero,
        child: Center(
          child: FittedBox(
            child: Text(
              value != null ? '$value' : '',
              style: TextStyle(
                fontSize: 22,
                fontWeight: isClue ? FontWeight.w900 : FontWeight.w700,
                color: isSelected ? Colors.white : (isClue ? colorScheme.onSurface : colorScheme.onSurface.withValues(alpha: 0.8)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHInt(BuildContext context, int r, int c, FutoshikiState state) {
    final ineq = state.level.hInequalities[r][c];
    if (ineq == null) return const SizedBox.shrink();

    return Center(
      child: Text(
        ineq,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  Widget _buildVInt(BuildContext context, int r, int c, FutoshikiState state) {
    final ineq = state.level.vInequalities[r][c];
    if (ineq == null) return const SizedBox.shrink();

    IconData icon;
    if (ineq == '^') {
      icon = Icons.expand_less_rounded;
    } else {
      icon = Icons.expand_more_rounded;
    }

    return Center(
      child: Icon(
        icon,
        size: 20,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
      ),
    );
  }

  Widget _buildInputKeyboard(BuildContext context, FutoshikiState state, FutoshikiNotifier notifier) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 1; i <= 4; i++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TangibleButton(
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    notifier.setCellValue(i);
                  },
                  color: colorScheme.surface,
                  shadowColor: colorScheme.outline,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  radius: DesignSystem.radiusSM,
                  child: Center(
                    child: Text(
                      '$i',
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TangibleButton(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  notifier.setCellValue(null);
                },
                color: colorScheme.surface,
                shadowColor: colorScheme.outline,
                padding: const EdgeInsets.symmetric(vertical: 12),
                radius: DesignSystem.radiusSM,
                child: Center(
                  child: Icon(
                    Icons.backspace_outlined,
                    color: DesignSystem.error,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
