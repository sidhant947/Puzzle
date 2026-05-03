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
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(crosswordNotifierProvider.notifier).initGame());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      final notifier = ref.read(crosswordNotifierProvider.notifier);
      if (event.logicalKey == LogicalKeyboardKey.backspace) {
        notifier.removeLetter();
      } else if (event.character != null && event.character!.length == 1) {
        final char = event.character!.toUpperCase();
        if (RegExp(r'[A-Z]').hasMatch(char)) {
          notifier.setLetter(char);
        }
      }
    }
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

    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKeyEvent,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CROSSWORD'),
        ),
        body: state.board == null
            ? Center(child: CircularProgressIndicator(color: theme.colorScheme.primary))
            : SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () => _focusNode.requestFocus(),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _buildGrid(state, notifier, theme),
                        ),
                      ),
                    ),
                    _buildCurrentClue(state, theme),
                    Divider(height: 1, color: theme.colorScheme.onSurface.withValues(alpha: 0.1)),
                    Expanded(
                      flex: 2,
                      child: _buildClueList(state, notifier, theme),
                    ),
                  ],
                ),
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
              _focusNode.requestFocus();
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.colorScheme.onSurface, width: 1)),
      ),
      child: Text(
        clue.toUpperCase(),
        style: TextStyle(
          fontSize: 13, 
          fontWeight: FontWeight.w900,
          color: theme.colorScheme.onSurface,
          letterSpacing: 1.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildClueList(CrosswordState state, CrosswordNotifier notifier, ThemeData theme) {
    final across = state.board!.words.where((w) => w.isHorizontal).toList();
    final down = state.board!.words.where((w) => !w.isHorizontal).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildClueColumn("ACROSS", across, state, notifier, theme)),
        Container(width: 1, color: theme.colorScheme.onSurface),
        Expanded(child: _buildClueColumn("DOWN", down, state, notifier, theme)),
      ],
    );
  }

  Widget _buildClueColumn(String title, List<CrosswordWord> words, CrosswordState state, CrosswordNotifier notifier, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: theme.colorScheme.onSurface, width: 1)),
          ),
          child: Text(
            title, 
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 2.0),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: words.length,
            itemBuilder: (context, index) {
              final w = words[index];
              bool isSelected = state.selectedX != null && state.selectedY != null;
              bool active = false;
              if (isSelected) {
                if (w.isHorizontal && state.isAcross && state.selectedY == w.y && state.selectedX! >= w.x && state.selectedX! < w.x + w.word.length) active = true;
                if (!w.isHorizontal && !state.isAcross && state.selectedX == w.x && state.selectedY! >= w.y && state.selectedY! < w.y + w.word.length) active = true;
              }

              return ListTile(
                dense: true,
                selected: active,
                selectedTileColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                leading: Text("${w.number}.", style: const TextStyle(fontWeight: FontWeight.bold)),
                title: Text(w.clue, style: const TextStyle(fontSize: 13)),
                onTap: () {
                  notifier.selectCell(w.x, w.y);
                  if (state.isAcross != w.isHorizontal) {
                    notifier.selectCell(w.x, w.y); // Toggle
                  }
                  _focusNode.requestFocus();
                },
              );
            },
          ),
        ),
      ],
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
