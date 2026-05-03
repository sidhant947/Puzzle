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

    ref.listen(sudokuNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildGrid(state, notifier),
            const Spacer(),
            _buildNumberPad(notifier),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(SudokuState state, SudokuNotifier notifier) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
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
                          color: isSelected ? Colors.blue.withValues(alpha: 0.1) : (isInitial ? Colors.grey.shade100 : Colors.white),
                          border: Border(
                            right: BorderSide(color: c == 1 ? Colors.black : Colors.grey.shade300, width: c == 1 ? 2 : 1),
                            bottom: BorderSide(color: r == 1 ? Colors.black : Colors.grey.shade300, width: r == 1 ? 2 : 1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            value == 0 ? '' : value.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: isInitial ? FontWeight.bold : FontWeight.normal,
                              color: isInitial ? Colors.black : Colors.blue,
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

  Widget _buildNumberPad(SudokuNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (i) {
          final num = i + 1;
          return OutlinedButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              notifier.setNumber(num);
            },
            child: Text(num.toString(), style: const TextStyle(fontSize: 20)),
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
        title: const Text('Well Done!'),
        content: const Text('You solved the puzzle!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}
