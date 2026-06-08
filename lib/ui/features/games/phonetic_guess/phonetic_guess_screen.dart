import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'phonetic_guess_provider.dart';

class PhoneticGuessScreen extends ConsumerStatefulWidget {
  const PhoneticGuessScreen({super.key});

  @override
  ConsumerState<PhoneticGuessScreen> createState() => _PhoneticGuessScreenState();
}

class _PhoneticGuessScreenState extends ConsumerState<PhoneticGuessScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(phoneticGuessNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    ref.read(gameStreakNotifierProvider.notifier).completeGame('phonetic_guess');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.phoneticGuessTitle.toUpperCase(),
        message: l10n.wordFoundMessage(ref.read(phoneticGuessNotifierProvider).targetWord),
        onPlayAgain: () {
          ref.read(phoneticGuessNotifierProvider.notifier).initGame();
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
    final state = ref.watch(phoneticGuessNotifierProvider);
    final notifier = ref.read(phoneticGuessNotifierProvider.notifier);

    ref.listen(phoneticGuessNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver && next.isGameWon) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: l10n.phoneticGuessTitle.toUpperCase(),
      subtitle: l10n.phoneticGuessSubtitle,
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: TangibleContainer(
                        padding: const EdgeInsets.all(24),
                        color: DesignSystem.gamePurple,
                        shadowColor: const Color(0xFF7E22CE),
                        child: Center(
                          child: Text(
                            state.ipa,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(state.targetWord.length, (index) {
                            final letter = index < state.currentGuess.length ? state.currentGuess[index] : '';
                            return Container(
                              width: 45,
                              height: 55,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                border: Border.all(
                                  color: letter.isNotEmpty ? DesignSystem.gamePurple : colorScheme.outline,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  letter.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: state.scrambledLetters.split('').map((letter) {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: TangibleButton(
                              onTap: () => notifier.onLetterPressed(letter),
                              color: colorScheme.surface,
                              shadowColor: colorScheme.outline,
                              padding: EdgeInsets.zero,
                              child: Center(
                                child: Text(
                                  letter,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: DesignSystem.gamePurple,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Row(
                        children: [
                          TangibleButton(
                            onTap: notifier.onBackspace,
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            padding: const EdgeInsets.all(16),
                            child: Icon(Icons.backspace_rounded, color: colorScheme.onSurface),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TangibleButton(
                              onTap: notifier.submit,
                              color: DesignSystem.gamePurple,
                              shadowColor: const Color(0xFF7E22CE),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: const Center(
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
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
