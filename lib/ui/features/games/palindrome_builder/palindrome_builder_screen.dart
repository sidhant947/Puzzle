import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'palindrome_builder_provider.dart';

class PalindromeBuilderScreen extends ConsumerStatefulWidget {
  const PalindromeBuilderScreen({super.key});

  @override
  ConsumerState<PalindromeBuilderScreen> createState() => _PalindromeBuilderScreenState();
}

class _PalindromeBuilderScreenState extends ConsumerState<PalindromeBuilderScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(palindromeBuilderNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    ref.read(gameStreakNotifierProvider.notifier).completeGame('palindrome_builder');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.palindromeBuilderTitle.toUpperCase(),
        message: l10n.wordFoundMessage(ref.read(palindromeBuilderNotifierProvider).display.replaceAll('..', ref.read(palindromeBuilderNotifierProvider).solution)),
        onPlayAgain: () {
          ref.read(palindromeBuilderNotifierProvider.notifier).initGame();
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
    final state = ref.watch(palindromeBuilderNotifierProvider);
    final notifier = ref.read(palindromeBuilderNotifierProvider.notifier);

    ref.listen(palindromeBuilderNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver && next.isGameWon) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: l10n.palindromeBuilderTitle.toUpperCase(),
      subtitle: l10n.palindromeBuilderSubtitle,
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
                        color: DesignSystem.gameAmber,
                        shadowColor: const Color(0xFFB45309),
                        child: Center(
                          child: Text(
                            state.display.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(state.solution.length, (index) {
                        final letter = index < state.currentGuess.length ? state.currentGuess[index] : '';
                        return Container(
                          width: 50,
                          height: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                            border: Border.all(
                              color: letter.isNotEmpty ? DesignSystem.gameAmber : colorScheme.outline,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              letter.toUpperCase(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letter) {
                          return SizedBox(
                            width: 45,
                            height: 45,
                            child: TangibleButton(
                              onTap: () => notifier.onLetterPressed(letter),
                              color: colorScheme.surface,
                              shadowColor: colorScheme.outline,
                              padding: EdgeInsets.zero,
                              child: Center(
                                child: Text(
                                  letter,
                                  style: const TextStyle(fontWeight: FontWeight.w900),
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
                              color: DesignSystem.gameAmber,
                              shadowColor: const Color(0xFFB45309),
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
