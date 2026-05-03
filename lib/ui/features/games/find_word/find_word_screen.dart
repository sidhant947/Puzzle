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

    ref.listen(findWordNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showGameOverDialog(context, ref, next);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Word'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: _buildGrid(state),
            ),
            _buildKeyboard(state, notifier),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(FindWordState state) {
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
                    child: _buildTile(letter, status),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTile(String letter, LetterStatus status) {
    Color color = Colors.white;
    Color textColor = Colors.black;
    Border border = Border.all(color: Colors.grey.shade300);

    switch (status) {
      case LetterStatus.correctSpot:
        color = Colors.green;
        textColor = Colors.white;
        border = Border.all(color: Colors.green);
        break;
      case LetterStatus.wrongSpot:
        color = Colors.orange;
        textColor = Colors.white;
        border = Border.all(color: Colors.orange);
        break;
      case LetterStatus.notInWord:
        color = Colors.grey;
        textColor = Colors.white;
        border = Border.all(color: Colors.grey);
        break;
      case LetterStatus.initial:
        if (letter.isNotEmpty) {
          border = Border.all(color: Colors.black, width: 2);
        }
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard(FindWordState state, FindWordNotifier notifier) {
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
                ...row.map((key) => _buildKey(key, state, notifier)),
                if (rowIndex == 1) const Spacer(flex: 1),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String label, FindWordState state, FindWordNotifier notifier) {
    bool isSpecialKey = label == 'ENTER' || label == 'DEL';
    int flex = isSpecialKey ? 3 : 2;

    LetterStatus status = state.keyboardStatus[label] ?? LetterStatus.initial;
    Color color = Colors.grey.shade300;
    Color textColor = Colors.black;

    switch (status) {
      case LetterStatus.correctSpot:
        color = Colors.green;
        textColor = Colors.white;
        break;
      case LetterStatus.wrongSpot:
        color = Colors.orange;
        textColor = Colors.white;
        break;
      case LetterStatus.notInWord:
        color = Colors.grey.shade700;
        textColor = Colors.white;
        break;
      default:
        break;
    }

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
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
              height: 48,
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: label.length > 1 ? 10 : 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, FindWordState state) async {
    if (state.isGameWon) {
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('find_word');
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(state.isGameWon ? 'Well Done!' : 'Game Over'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state.isGameWon ? 'You found the word!' : 'Better luck next time!'),
            const SizedBox(height: 12),
            Text('The word was: ${state.targetWord}', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
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
