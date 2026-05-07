import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'word_mastermind_provider.dart';
import 'word_mastermind_engine.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class WordMastermindScreen extends ConsumerWidget {
  const WordMastermindScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wordMastermindNotifierProvider);
    final notifier = ref.read(wordMastermindNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(wordMastermindNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isGameWon) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.heavyImpact();
        }
        _showGameOverDialog(context, ref, next, theme);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'WORD MASTERMIND',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              notifier.reset();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
              child: Column(
                children: [
                  Text(
                    'GUESS THE 4-LETTER WORD',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  const Text(
                    'Bulls = Correct letter, Correct spot\nCows = Correct letter, Wrong spot',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, height: 1.5, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildGuessList(state, theme),
            ),
            _buildCurrentInput(state, theme),
            _buildKeyboard(state, notifier, theme),
            const SizedBox(height: DesignSystem.spaceLG),
          ],
        ),
      ),
    );
  }

  Widget _buildGuessList(WordMastermindState state, ThemeData theme) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      itemCount: state.guesses.length,
      itemBuilder: (context, index) {
        final guess = state.guesses[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                '${index + 1}.',
                style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
              ),
              const SizedBox(width: 16),
              ...guess.guess.split('').map((l) => _buildLetterTile(l, theme)),
              const Spacer(),
              _buildStatIndicator(guess.bulls, Colors.green, 'B'),
              const SizedBox(width: 8),
              _buildStatIndicator(guess.cows, Colors.orange, 'C'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLetterTile(String letter, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        letter,
        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _buildStatIndicator(int count, Color color, String label) {
    return Row(
      children: [
        Text('$count', style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        const SizedBox(width: 2),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _buildCurrentInput(WordMastermindState state, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(WordMastermindEngine.wordLength, (i) {
          String letter = i < state.currentGuess.length ? state.currentGuess[i] : '';
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 50,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: letter.isNotEmpty ? theme.colorScheme.primary : theme.colorScheme.outline.withValues(alpha: 0.2),
                width: letter.isNotEmpty ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              letter,
              style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildKeyboard(WordMastermindState state, WordMastermindNotifier notifier, ThemeData theme) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: rows.map((row) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((key) => Expanded(
            flex: (key == 'ENTER' || key == 'DEL') ? 3 : 2,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: InkWell(
                onTap: () {
                  HapticFeedbackUtil.selectionClick();
                  if (key == 'ENTER') notifier.submitGuess();
                  else if (key == 'DEL') notifier.removeLetter();
                  else notifier.addLetter(key);
                },
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: key == 'DEL' ? const Icon(Icons.backspace_outlined, size: 18) : Text(key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
            ),
          )).toList(),
        )).toList(),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, WordMastermindState state, ThemeData theme) async {
    if (state.isGameWon) {
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_mastermind', xpAmount: 40);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(state.isGameWon ? 'SOLVED!' : 'OUT OF TRIES'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state.isGameWon ? 'You mastered the code!' : 'The hidden word was:'),
            const SizedBox(height: 8),
            Text(state.targetWord, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 4)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('CONTINUE'),
          ),
        ],
      ),
    );
  }
}
