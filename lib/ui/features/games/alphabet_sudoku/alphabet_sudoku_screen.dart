import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'alphabet_sudoku_provider.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class AlphabetSudokuScreen extends ConsumerWidget {
  const AlphabetSudokuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(alphabetSudokuNotifierProvider);
    final notifier = ref.read(alphabetSudokuNotifierProvider.notifier);

    ref.listen<AsyncValue<AlphabetSudokuState>>(alphabetSudokuNotifierProvider, (previous, next) {
      if (next.hasValue && next.value!.isSolved && !(previous?.value?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'SUDOKU SOLVED!',
            message: 'Brilliant! You mastered the letters.',
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
      title: 'Alphabet Sudoku',
      subtitle: 'Fill the grid so every row, column, and box contains letters A-D.',
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.newGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: stateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (state) => LayoutBuilder(
          builder: (context, constraints) {
            final boardWidth = constraints.maxWidth * 0.9;
            final boardSize = boardWidth > 400.0 ? 400.0 : boardWidth;

            return Column(
              children: [
                const Spacer(),
                Center(
                  child: Container(
                    width: boardSize,
                    height: boardSize,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                    child: _SudokuGrid(
                      state: state,
                      notifier: notifier,
                      boardSize: boardSize - 8,
                    ),
                  ),
                ),
                const Spacer(),
                _AlphabetInput(
                  size: state.size,
                  onSelect: (val) {
                    HapticFeedbackUtil.lightImpact();
                    notifier.setNumber(val);
                  },
                  getLetter: notifier.getLetter,
                ),
                const SizedBox(height: DesignSystem.spaceXL),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SudokuGrid extends StatelessWidget {
  final AlphabetSudokuState state;
  final AlphabetSudokuNotifier notifier;
  final double boardSize;

  const _SudokuGrid({
    required this.state,
    required this.notifier,
    required this.boardSize,
  });

  @override
  Widget build(BuildContext context) {
    final cellSize = boardSize / state.size;
    final boxSize = state.size == 4 ? 2 : 3;

    return Stack(
      children: [
        for (int r = 0; r < state.size; r++)
          for (int c = 0; c < state.size; c++)
            Positioned(
              left: c * cellSize,
              top: r * cellSize,
              width: cellSize,
              height: cellSize,
              child: GestureDetector(
                onTap: () => notifier.selectCell(r, c),
                child: Container(
                  decoration: BoxDecoration(
                    color: _getCellColor(context, r, c),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      notifier.getLetter(state.currentBoard[r][c]),
                      style: TextStyle(
                        fontSize: cellSize * 0.5,
                        fontWeight: state.initialBoard[r][c] != 0
                            ? FontWeight.w900
                            : FontWeight.w500,
                        color: state.initialBoard[r][c] != 0
                            ? Theme.of(context).colorScheme.onSurface
                            : DesignSystem.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        // Draw thick box borders
        IgnorePointer(
          child: CustomPaint(
            size: Size(boardSize, boardSize),
            painter: _GridPainter(
              size: state.size,
              boxSize: boxSize,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Color _getCellColor(BuildContext context, int r, int c) {
    final isSelected = state.selectedRow == r && state.selectedCol == c;
    if (isSelected) return DesignSystem.primary.withValues(alpha: 0.2);
    
    // Highlight row and column
    if (state.selectedRow == r || state.selectedCol == c) {
      return DesignSystem.primary.withValues(alpha: 0.05);
    }

    return Colors.transparent;
  }
}

class _GridPainter extends CustomPainter {
  final int size;
  final int boxSize;
  final Color color;

  _GridPainter({required this.size, required this.boxSize, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final cellSize = size.width / this.size;

    for (int i = 0; i <= this.size; i += boxSize) {
      // Horizontal
      canvas.drawLine(Offset(0, i * cellSize), Offset(size.width, i * cellSize), paint);
      // Vertical
      canvas.drawLine(Offset(i * cellSize, 0), Offset(i * cellSize, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AlphabetInput extends StatelessWidget {
  final int size;
  final Function(int) onSelect;
  final String Function(int) getLetter;

  const _AlphabetInput({
    required this.size,
    required this.onSelect,
    required this.getLetter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(size, (i) {
          final val = i + 1;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TangibleButton(
                onTap: () => onSelect(val),
                color: Theme.of(context).colorScheme.surface,
                shadowColor: Theme.of(context).colorScheme.outline,
                child: Center(
                  child: Text(
                    getLetter(val),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
