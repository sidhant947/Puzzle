import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'missing_vowels_provider.dart';

class MissingVowelsScreen extends ConsumerStatefulWidget {
  const MissingVowelsScreen({super.key});

  @override
  ConsumerState<MissingVowelsScreen> createState() => _MissingVowelsScreenState();
}

class _MissingVowelsScreenState extends ConsumerState<MissingVowelsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(missingVowelsNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    ref.read(gameStreakNotifierProvider.notifier).completeGame('missing_vowels');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'VOWELS RESTORED!',
        message: 'You successfully identified the full word.',
        onPlayAgain: () {
          ref.read(missingVowelsNotifierProvider.notifier).initGame();
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
    final state = ref.watch(missingVowelsNotifierProvider);
    final notifier = ref.read(missingVowelsNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(missingVowelsNotifierProvider, (previous, next) {
      if (!previous!.isGameOver && next.isGameOver && next.isGameWon) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'MISSING VOWELS',
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_rounded),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('How to Play'),
                content: const Text('A word is shown with its vowels (A, E, I, O, U) hidden. Guess the full word!'),
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
                // Hidden Word Display
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: DesignSystem.gameBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: DesignSystem.gameBlue.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    state.hiddenWord,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: DesignSystem.gameBlue,
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
                        width: 40,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: state.isInvalidGuess 
                              ? DesignSystem.gameRose.withValues(alpha: 0.1)
                              : theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
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
                            style: theme.textTheme.titleLarge?.copyWith(
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
                // Simple Alphabet Keyboard (A-Z)
                _buildKeyboard(notifier),
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
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
    );
  }

  Widget _buildKeyboard(MissingVowelsNotifier notifier) {
    const rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ];

    return Column(
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((letter) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: InkWell(
                  onTap: () => notifier.onLetterPressed(letter),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: 32,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3)),
                    ),
                    child: Center(
                      child: Text(
                        letter,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
