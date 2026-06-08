import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'anagram_definition_provider.dart';

class AnagramDefinitionScreen extends ConsumerStatefulWidget {
  const AnagramDefinitionScreen({super.key});

  @override
  ConsumerState<AnagramDefinitionScreen> createState() => _AnagramDefinitionScreenState();
}

class _AnagramDefinitionScreenState extends ConsumerState<AnagramDefinitionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(anagramDefinitionNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final state = ref.read(anagramDefinitionNotifierProvider);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('anagram_definition');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'SOLVED!',
        message: 'The word was indeed "${state.target}".',
        onPlayAgain: () {
          ref.read(anagramDefinitionNotifierProvider.notifier).initGame();
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
    final state = ref.watch(anagramDefinitionNotifierProvider);
    final notifier = ref.read(anagramDefinitionNotifierProvider.notifier);

    ref.listen(anagramDefinitionNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showCompletionDialog();
      }
    });

    final targetLength = state.target.replaceAll(' ', '').length;

    return GameScaffold(
      title: 'ANAGRAM DEFINITION',
      subtitle: 'Solve using the hint',
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () => notifier.initGame(),
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.gameGreen))
          : Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  const SizedBox(height: DesignSystem.spaceLG),
                  TangibleContainer(
                    padding: const EdgeInsets.all(DesignSystem.spaceLG),
                    color: DesignSystem.gameGreen.withValues(alpha: 0.1),
                    shadowColor: DesignSystem.gameGreen.withValues(alpha: 0.2),
                    depth: 2,
                    child: Column(
                      children: [
                        const Icon(Icons.lightbulb_outline_rounded, color: DesignSystem.gameGreen),
                        const SizedBox(height: DesignSystem.spaceSM),
                        Text(
                          state.definition,
                          style: TextStyle(
                            fontSize: DesignSystem.fontSizeMD,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Anagram of:',
                    style: TextStyle(
                      fontSize: DesignSystem.fontSizeSM,
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  Text(
                    state.scrambled,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.gameGreen,
                      letterSpacing: 4,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(targetLength, (index) {
                      final char = index < state.currentGuess.length ? state.currentGuess[index] : '';
                      return Container(
                        width: 36,
                        height: 44,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: char.isEmpty ? colorScheme.outline : DesignSystem.gameGreen,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            char,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  _buildKeyboard(context, state, notifier),
                  const SizedBox(height: DesignSystem.spaceLG),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TangibleButton(
                        onTap: notifier.onBackspace,
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        child: Row(
                          children: [
                            Icon(Icons.backspace_rounded, color: colorScheme.onSurface, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'CLEAR',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignSystem.spaceLG),
                ],
              ),
            ),
    );
  }

  Widget _buildKeyboard(BuildContext context, AnagramDefinitionState state, AnagramDefinitionNotifier notifier) {
    final colorScheme = Theme.of(context).colorScheme;
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ];

    // Count available letters in the scrambled word
    final availableLetters = <String, int>{};
    for (final char in state.scrambled.replaceAll(' ', '').split('')) {
      availableLetters[char] = (availableLetters[char] ?? 0) + 1;
    }

    // Subtract letters already guessed
    for (final char in state.currentGuess.split('')) {
      if (availableLetters.containsKey(char) && availableLetters[char]! > 0) {
        availableLetters[char] = availableLetters[char]! - 1;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: rows.map((row) {
          final horizontalPadding = (10 - row.length) * 12.0;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((letter) {
                final isAvailable = (availableLetters[letter] ?? 0) > 0;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: SizedBox(
                      height: 48,
                      child: TangibleButton(
                        onTap: isAvailable ? () => notifier.onLetterPressed(letter) : null,
                        color: isAvailable ? colorScheme.surface : colorScheme.surface.withValues(alpha: 0.3),
                        shadowColor: colorScheme.outline,
                        padding: EdgeInsets.zero,
                        radius: DesignSystem.radiusSM,
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: isAvailable ? DesignSystem.gameGreen : colorScheme.onSurface.withValues(alpha: 0.2),
                              ),
                            ),
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
      ),
    );
  }
}
