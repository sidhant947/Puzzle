import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
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
    final l10n = AppLocalizations.of(context)!;
    ref.read(gameStreakNotifierProvider.notifier).completeGame('word_scramble');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.wordScrambleWin.toUpperCase(),
        message: l10n.wordFoundMessage(ref.read(wordScrambleNotifierProvider).targetWord),
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(wordScrambleNotifierProvider);
    final notifier = ref.read(wordScrambleNotifierProvider.notifier);

    ref.listen(wordScrambleNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver && next.isGameWon) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: l10n.wordScrambleTitle.toUpperCase(),
      subtitle: l10n.wordScrambleSubtitle,
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
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.primary))
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.05),
                    // Scrambled Word Display
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: TangibleContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        color: DesignSystem.accentAmber,
                        shadowColor: const Color(0xFFD97706),
                        depth: 2,
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              state.scrambledWord.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 6,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Guess Input Area
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.targetWord.length,
                            (index) {
                              final letter = index < state.currentGuess.length ? state.currentGuess[index] : '';
                              return Container(
                                width: (constraints.maxWidth * 0.1).clamp(35.0, 45.0),
                                height: (constraints.maxWidth * 0.12).clamp(45.0, 55.0),
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  color: state.isInvalidGuess 
                                      ? DesignSystem.error.withValues(alpha: 0.1)
                                      : colorScheme.surface,
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                  border: Border.all(
                                    color: state.isInvalidGuess 
                                        ? DesignSystem.error 
                                        : (letter.isNotEmpty ? DesignSystem.primary : colorScheme.outline.withValues(alpha: 0.5)),
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        letter.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          color: state.isInvalidGuess ? DesignSystem.error : colorScheme.onSurface,
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
                    ),
                    Spacer(),
                    // Keyboard / Letter Selection
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.25),
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: state.scrambledWord.split('').map((letter) {
                              return SizedBox(
                                width: 44,
                                height: 44,
                                child: TangibleButton(
                                  onTap: () => notifier.onLetterPressed(letter),
                                  color: colorScheme.surface,
                                  shadowColor: colorScheme.outline,
                                  depth: 2,
                                  padding: EdgeInsets.zero,
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        letter.toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          color: DesignSystem.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TangibleButton(
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            depth: 2,
                            padding: const EdgeInsets.all(18),
                            onTap: notifier.resetGuess,
                            child: Icon(Icons.refresh_rounded, color: colorScheme.onSurface, size: 24),
                          ),
                          SizedBox(width: DesignSystem.spaceMD),
                          TangibleButton(
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            depth: 2,
                            padding: const EdgeInsets.all(18),
                            onTap: notifier.onBackspace,
                            child: Icon(Icons.backspace_rounded, color: colorScheme.onSurface, size: 24),
                          ),
                          const SizedBox(width: DesignSystem.spaceMD),
                          Expanded(
                            child: TangibleButton(
                              onTap: notifier.submitGuess,
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
                    SizedBox(height: constraints.maxHeight * 0.05),
                  ],
                );
              },
            ),
    );
  }
}
