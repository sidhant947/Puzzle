import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(missingVowelsNotifierProvider);
    final notifier = ref.read(missingVowelsNotifierProvider.notifier);

    ref.listen(missingVowelsNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver && next.isGameWon) {
        HapticFeedbackUtil.victory();
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'MISSING VOWELS',
      subtitle: 'Identify the word with its vowels hidden.',
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
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
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.help_outline_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              SizedBox(height: DesignSystem.spaceMD),
              // Hidden Word Display
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.2),
                child: TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  color: colorScheme.onSurface,
                  depth: 4,
                  child: FittedBox(
                    child: Text(
                      state.hiddenWord,
                      style: TextStyle(
                        color: colorScheme.surface,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 8,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Guess Input Area
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.2),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 4,
                  runSpacing: 8,
                  children: List.generate(
                    state.targetWord.length,
                    (index) {
                      final letter = index < state.currentGuess.length ? state.currentGuess[index] : '';
                      return TangibleContainer(
                        depth: 1,
                        radius: DesignSystem.radiusXS,
                        color: state.isInvalidGuess 
                            ? DesignSystem.accentBerry.withValues(alpha: 0.1)
                            : colorScheme.surface,
                        child: SizedBox(
                          width: 32,
                          height: 40,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                letter,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: state.isInvalidGuess ? DesignSystem.accentBerry : colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Spacer(),
              // Simple Alphabet Keyboard (A-Z)
              _buildKeyboard(notifier),
              const SizedBox(height: DesignSystem.spaceSM),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: Row(
                  children: [
                    Expanded(
                      child: TangibleButton(
                        onTap: notifier.onBackspace,
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Icon(Icons.backspace_rounded, color: colorScheme.onSurface, size: 24),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceMD),
                    Expanded(
                      flex: 2,
                      child: TangibleButton(
                        onTap: notifier.submitGuess,
                        color: DesignSystem.primary,
                        depth: 4,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: const Center(
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontWeight: FontWeight.w900, 
                              fontSize: 16,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
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
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((letter) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: TangibleContainer(
                  depth: 1,
                  radius: 4,
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    notifier.onLetterPressed(letter);
                  },
                  child: SizedBox(
                    width: 28,
                    height: 36,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          letter,
                          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                        ),
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
