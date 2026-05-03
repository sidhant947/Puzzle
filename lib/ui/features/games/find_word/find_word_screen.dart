import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'find_word_provider.dart';
import 'find_word_engine.dart';
import '../../../../../providers/user_providers.dart';

class FindWordScreen extends ConsumerStatefulWidget {
  const FindWordScreen({super.key});

  @override
  ConsumerState<FindWordScreen> createState() => _FindWordScreenState();
}

class _FindWordScreenState extends ConsumerState<FindWordScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(findWordNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findWordNotifierProvider);
    final notifier = ref.read(findWordNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(findWordNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showGameOverDialog(context, ref, next, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('FIND WORD'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Expanded(
              child: _buildGrid(state, theme),
            ),
            _buildKeyboard(state, notifier, theme),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(FindWordState state, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: List.generate(FindWordEngine.maxTries, (rowIndex) {
          String word = '';
          List<LetterStatus>? results;

          if (rowIndex < state.guesses.length) {
            word = state.guesses[rowIndex];
            results = state.results[rowIndex];
          } else if (rowIndex == state.guesses.length) {
            word = state.currentGuess;
          }

          return Expanded(
            child: Row(
              children: List.generate(FindWordEngine.wordLength, (colIndex) {
                String letter = '';
                if (colIndex < word.length) {
                  letter = word[colIndex];
                }
                LetterStatus status = results != null ? results[colIndex] : LetterStatus.initial;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _buildTile(letter, status, theme),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTile(String letter, LetterStatus status, ThemeData theme) {
    Color color = Colors.transparent;
    Color textColor = theme.colorScheme.onSurface;
    Border border = Border.all(color: theme.colorScheme.onSurface.withValues(alpha: 0.2), width: 1);

    switch (status) {
      case LetterStatus.correctSpot:
        color = const Color(0xFF6AAA64); // Wordle Green
        textColor = Colors.white;
        border = Border.all(color: color, width: 1);
        break;
      case LetterStatus.wrongSpot:
        color = const Color(0xFFC9B458); // Wordle Yellow
        textColor = Colors.white;
        border = Border.all(color: color, width: 1);
        break;
      case LetterStatus.notInWord:
        color = theme.brightness == Brightness.light ? Colors.grey.shade400 : Colors.grey.shade700;
        textColor = Colors.white;
        border = Border.all(color: color, width: 1);
        break;
      case LetterStatus.initial:
        if (letter.isNotEmpty) {
          border = Border.all(color: theme.colorScheme.onSurface, width: 2);
        }
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.zero,
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard(FindWordState state, FindWordNotifier notifier, ThemeData theme) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
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
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String label, FindWordState state, FindWordNotifier notifier, ThemeData theme) {
    bool isSpecialKey = label == 'ENTER' || label == 'DEL';
    int flex = isSpecialKey ? 3 : 2;

    LetterStatus status = state.keyboardStatus[label] ?? LetterStatus.initial;
    Color color = theme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade800;
    Color textColor = theme.colorScheme.onSurface;
    Border border = Border.all(color: Colors.transparent);

    switch (status) {
      case LetterStatus.correctSpot:
        color = const Color(0xFF6AAA64);
        textColor = Colors.white;
        break;
      case LetterStatus.wrongSpot:
        color = const Color(0xFFC9B458);
        textColor = Colors.white;
        break;
      case LetterStatus.notInWord:
        color = theme.brightness == Brightness.light ? Colors.grey.shade700 : Colors.black;
        textColor = Colors.white;
        break;
      default:
        break;
    }

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            if (label == 'ENTER') {
              notifier.submitGuess();
            } else if (label == 'DEL') {
              notifier.removeLetter();
            } else {
              notifier.addLetter(label);
            }
          },
          child: Container(
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              border: border,
              borderRadius: BorderRadius.zero,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: label.length > 1 ? 10 : 16,
                fontWeight: FontWeight.w900,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, FindWordState state, ThemeData theme) async {
    if (state.isGameWon) {
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('find_word');
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: Text(state.isGameWon ? 'WELL DONE' : 'GAME OVER', style: const TextStyle(fontWeight: FontWeight.w900)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(state.isGameWon ? 'Word found successfully.' : 'No more tries left.'),
            const SizedBox(height: 16),
            Text('WORD: ${state.targetWord}', style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2.0)),
          ],
        ),
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
