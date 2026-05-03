import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'crossword_provider.dart';
import 'crossword_engine.dart';
import '../../../../../providers/user_providers.dart';

class CrosswordScreen extends ConsumerStatefulWidget {
  const CrosswordScreen({super.key});

  @override
  ConsumerState<CrosswordScreen> createState() => _CrosswordScreenState();
}

class _CrosswordScreenState extends ConsumerState<CrosswordScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(crosswordNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(crosswordNotifierProvider);
    final notifier = ref.read(crosswordNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(crosswordNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('CROSSWORD'),
      ),
      body: state.board == null
          ? Center(child: CircularProgressIndicator(color: theme.colorScheme.primary))
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: _buildGrid(state, notifier, theme),
                      ),
                    ),
                  ),
                  _buildCurrentClue(state, theme),
                  const SizedBox(height: 8),
                  _buildKeyboard(state, notifier, theme),
                  const SizedBox(height: 16),
                ],
              ),
            ),
    );
  }

  Widget _buildGrid(CrosswordState state, CrosswordNotifier notifier, ThemeData theme) {
    final board = state.board!;
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: board.size,
        ),
        itemCount: board.size * board.size,
        itemBuilder: (context, index) {
          int x = index % board.size;
          int y = index ~/ board.size;
          String char = board.grid[y][x];
          bool isSelected = state.selectedX == x && state.selectedY == y;
          
          bool isInCurrentWord = false;
          if (state.selectedX != null && state.selectedY != null) {
            for (var w in board.words) {
              if (w.isHorizontal == state.isAcross) {
                if (state.isAcross && y == w.y && x >= w.x && x < w.x + w.word.length && state.selectedY == y && state.selectedX! >= w.x && state.selectedX! < w.x + w.word.length) {
                  isInCurrentWord = true;
                } else if (!state.isAcross && x == w.x && y >= w.y && y < w.y + w.word.length && state.selectedX == x && state.selectedY! >= w.y && state.selectedY! < w.y + w.word.length) {
                  isInCurrentWord = true;
                }
              }
            }
          }

          if (char == ' ') {
            return Container(color: theme.colorScheme.onSurface);
          }

          int? num;
          for (var w in board.words) {
            if (w.x == x && w.y == y) {
              num = w.number;
              break;
            }
          }

          return GestureDetector(
            onTap: () {
              notifier.selectCell(x, y);
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected 
                    ? theme.colorScheme.primary.withValues(alpha: 0.2) 
                    : (isInCurrentWord ? theme.colorScheme.primary.withValues(alpha: 0.05) : theme.colorScheme.surface),
                border: Border.all(color: theme.colorScheme.onSurface, width: 0.5),
              ),
              child: Stack(
                children: [
                  if (num != null)
                    Positioned(
                      left: 2,
                      top: 1,
                      child: Text(
                        num.toString(),
                        style: TextStyle(
                          fontSize: 10, 
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  Center(
                    child: Text(
                      state.userGrid[y][x],
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCurrentClue(CrosswordState state, ThemeData theme) {
    String clue = "SELECT A SQUARE";
    if (state.selectedX != null && state.selectedY != null) {
      for (var w in state.board!.words) {
        bool inWord = false;
        if (w.isHorizontal && state.isAcross) {
          if (state.selectedY == w.y && state.selectedX! >= w.x && state.selectedX! < w.x + w.word.length) inWord = true;
        } else if (!w.isHorizontal && !state.isAcross) {
          if (state.selectedX == w.x && state.selectedY! >= w.y && state.selectedY! < w.y + w.word.length) inWord = true;
        }
        if (inWord) {
          clue = "${w.number} ${w.isHorizontal ? 'ACROSS' : 'DOWN'}: ${w.clue}";
          break;
        }
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.symmetric(horizontal: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.1), width: 1)),
      ),
      child: Text(
        clue.toUpperCase(),
        style: TextStyle(
          fontSize: 14, 
          fontWeight: FontWeight.w900,
          color: theme.colorScheme.onSurface,
          letterSpacing: 1.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildKeyboard(CrosswordState state, CrosswordNotifier notifier, ThemeData theme) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: rows.asMap().entries.map((entry) {
          int rowIndex = entry.key;
          List<String> row = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (rowIndex == 1) const Spacer(flex: 1),
                ...row.map((key) => _buildKey(key, state, notifier, theme)),
                if (rowIndex == 1) const Spacer(flex: 1),
                if (rowIndex == 2) const Spacer(flex: 1),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String label, CrosswordState state, CrosswordNotifier notifier, ThemeData theme) {
    bool isSpecialKey = label == 'DEL';
    int flex = isSpecialKey ? 3 : 2;

    Color color = theme.brightness == Brightness.light ? Colors.grey.shade200 : Colors.grey.shade900;
    Color textColor = theme.colorScheme.onSurface;

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            if (label == 'DEL') {
              notifier.removeLetter();
            } else {
              notifier.setLetter(label);
            }
          },
          child: Container(
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: theme.colorScheme.onSurface.withValues(alpha: 0.1)),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: label.length > 1 ? 12 : 16,
                fontWeight: FontWeight.w900,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref, ThemeData theme) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crossword');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('WELL DONE', style: TextStyle(fontWeight: FontWeight.w900)),
        content: const Text('Crossword completed successfully.'),
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
