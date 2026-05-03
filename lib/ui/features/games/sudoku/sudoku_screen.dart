import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sudoku_provider.dart';
import '../../../../../providers/user_providers.dart';

class SudokuScreen extends ConsumerStatefulWidget {
  const SudokuScreen({super.key});

  @override
  ConsumerState<SudokuScreen> createState() => _SudokuScreenState();
}

class _SudokuScreenState extends ConsumerState<SudokuScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sudokuNotifierProvider);
    final notifier = ref.read(sudokuNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(sudokuNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('SUDOKU'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildGrid(state, notifier, theme),
            const Spacer(),
            _buildNumberPad(notifier, theme),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(SudokuState state, SudokuNotifier notifier, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface,
        border: Border.all(color: theme.colorScheme.onSurface, width: 2),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: List.generate(4, (r) {
            return Expanded(
              child: Row(
                children: List.generate(4, (c) {
                  final isInitial = state.initialBoard[r][c] != 0;
                  final isSelected = state.selectedRow == r && state.selectedCol == c;
                  final value = state.currentBoard[r][c];

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (!isInitial) {
                          HapticFeedback.selectionClick();
                          notifier.selectCell(r, c);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? theme.colorScheme.onSurface : theme.colorScheme.surface,
                          border: Border(
                            right: BorderSide(color: theme.colorScheme.onSurface, width: c == 1 ? 2 : 1),
                            bottom: BorderSide(color: theme.colorScheme.onSurface, width: r == 1 ? 2 : 1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            value == 0 ? '' : value.toString(),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: isInitial ? FontWeight.w900 : FontWeight.w400,
                              color: isSelected ? theme.colorScheme.surface : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNumberPad(SudokuNotifier notifier, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (i) {
          final num = i + 1;
          return SizedBox(
            width: 70,
            height: 70,
            child: OutlinedButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                notifier.setNumber(num);
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(num.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
            ),
          );
        }),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('sudoku');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('WELL DONE', style: TextStyle(fontWeight: FontWeight.w900)),
        content: const Text('Puzzle solved successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('EXIT'),
          ),
        ],
      ),
    );
  }
}
