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

    ref.listen(crosswordNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref);
      }
    });

    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKeyEvent,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crossword'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => notifier.initGame(),
            ),
          ],
        ),
        body: state.board == null
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () => _focusNode.requestFocus(),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _buildGrid(state, notifier),
                        ),
                      ),
                    ),
                    _buildCurrentClue(state),
                    const Divider(height: 1),
                    Expanded(
                      flex: 2,
                      child: _buildClueList(state, notifier),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildGrid(CrosswordState state, CrosswordNotifier notifier) {
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
            return Container(color: Colors.black.withValues(alpha: 0.05));
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
                    ? Colors.orange.withValues(alpha: 0.4) 
                    : (isInCurrentWord ? Colors.blue.withValues(alpha: 0.1) : Colors.white),
                border: Border.all(color: Colors.grey.shade400, width: 0.5),
              ),
              child: Stack(
                children: [
                  if (num != null)
                    Positioned(
                      left: 1,
                      top: 0,
                      child: Text(
                        num.toString(),
                        style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                    ),
                  Center(
                    child: Text(
                      state.userGrid[y][x],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  Widget _buildCurrentClue(CrosswordState state) {
    String clue = "Tap a square to start";
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
      color: Colors.blue.shade50,
      child: Text(
        clue,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildClueList(CrosswordState state, CrosswordNotifier notifier) {
    final across = state.board!.words.where((w) => w.isHorizontal).toList();
    final down = state.board!.words.where((w) => !w.isHorizontal).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildClueColumn("ACROSS", across, state, notifier)),
        const VerticalDivider(width: 1),
        Expanded(child: _buildClueColumn("DOWN", down, state, notifier)),
      ],
    );
  }

  Widget _buildClueColumn(String title, List<CrosswordWord> words, CrosswordState state, CrosswordNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
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
                selectedTileColor: Colors.blue.shade50,
                leading: Text("${w.number}.", style: const TextStyle(fontWeight: FontWeight.bold)),
                title: Text(w.clue, style: const TextStyle(fontSize: 12)),
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

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crossword');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Congratulations!'),
        content: const Text('You completed the crossword!'),
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
