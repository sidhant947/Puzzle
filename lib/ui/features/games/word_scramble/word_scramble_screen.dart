import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'word_scramble_provider.dart';

class WordScrambleScreen extends ConsumerStatefulWidget {
  const WordScrambleScreen({super.key});

  @override
  ConsumerState<WordScrambleScreen> createState() => _WordScrambleScreenState();
}

class _WordScrambleScreenState extends ConsumerState<WordScrambleScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(wordScrambleNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    ref.read(gameStreakNotifierProvider.notifier).completeGame('word_scramble');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'WORD UNRAVELED!',
        message: 'You unscrambled the word perfectly.',
        onPlayAgain: () {
          ref.read(wordScrambleNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(wordScrambleNotifierProvider);
    final notifier = ref.read(wordScrambleNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(wordScrambleNotifierProvider, (previous, next) {
      if (!previous!.isGameOver && next.isGameOver && next.isGameWon) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'WORD SCRAMBLE',
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_rounded),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('How to Play'),
                content: const Text('Unscramble the letters to find the correct word. Tap letters to build your answer.'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Got it')),
                ],
              ),
            );
          },
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 40),
                // Scrambled Word Display
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: DesignSystem.gameAmber.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: DesignSystem.gameAmber.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    state.scrambledWord,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: DesignSystem.gameAmber,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 8,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                // Guess Input Area
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.targetWord.length,
                    (index) {
                      final letter = index < state.currentGuess.length ? state.currentGuess[index] : '';
                      return Container(
                        width: 45,
                        height: 55,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: state.isInvalidGuess 
                              ? DesignSystem.gameRose.withValues(alpha: 0.1)
                              : theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                          border: Border.all(
                            color: state.isInvalidGuess 
                                ? DesignSystem.gameRose 
                                : (letter.isNotEmpty ? theme.colorScheme.primary : theme.colorScheme.outline),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            letter,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: state.isInvalidGuess ? DesignSystem.gameRose : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                // Keyboard / Letter Selection
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: state.scrambledWord.split('').map((letter) {
                    // Logic to handle multiple same letters: count how many times it's used in guess
                    // For simplicity in this mini-game, just let them type.
                    // But usually, unscramble games have tiles you tap.
                    return _LetterTile(
                      letter: letter,
                      onTap: () => notifier.onLetterPressed(letter),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                      onPressed: notifier.onBackspace,
                      icon: const Icon(Icons.backspace_rounded),
                      padding: const EdgeInsets.all(16),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: notifier.submitGuess,
                      icon: const Icon(Icons.check_rounded),
                      label: const Text('SUBMIT'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton.filledTonal(
                      onPressed: notifier.resetGuess,
                      icon: const Icon(Icons.refresh_rounded),
                      padding: const EdgeInsets.all(16),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
    );
  }
}

class _LetterTile extends StatelessWidget {
  final String letter;
  final VoidCallback onTap;

  const _LetterTile({required this.letter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            letter,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
