import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'silent_letter_search_provider.dart';

class SilentLetterSearchScreen extends ConsumerStatefulWidget {
  const SilentLetterSearchScreen({super.key});

  @override
  ConsumerState<SilentLetterSearchScreen> createState() => _SilentLetterSearchScreenState();
}

class _SilentLetterSearchScreenState extends ConsumerState<SilentLetterSearchScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(silentLetterSearchNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    ref.read(gameStreakNotifierProvider.notifier).completeGame('silent_letter_search');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.silentLetterSearchTitle.toUpperCase(),
        message: l10n.wordFoundMessage(ref.read(silentLetterSearchNotifierProvider).word),
        onPlayAgain: () {
          ref.read(silentLetterSearchNotifierProvider.notifier).initGame();
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
    final state = ref.watch(silentLetterSearchNotifierProvider);
    final notifier = ref.read(silentLetterSearchNotifierProvider.notifier);

    ref.listen(silentLetterSearchNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver && next.isGameWon) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: l10n.silentLetterSearchTitle.toUpperCase(),
      subtitle: l10n.silentLetterSearchSubtitle,
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
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(state.word.length, (index) {
                            final isSelected = state.selectedIndices.contains(index);
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: SizedBox(
                                width: 50,
                                height: 60,
                                child: TangibleButton(
                                  onTap: () => notifier.toggleLetter(index),
                                  color: isSelected ? DesignSystem.gameGreen : colorScheme.surface,
                                  shadowColor: isSelected ? const Color(0xFF166534) : colorScheme.outline,
                                  depth: isSelected ? 2 : 4,
                                  padding: EdgeInsets.zero,
                                  child: Center(
                                    child: Text(
                                      state.word[index].toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 24,
                                        color: isSelected ? Colors.white : colorScheme.onSurface,
                                      ),
                                    ),
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
                      padding: const EdgeInsets.all(DesignSystem.spaceLG),
                      child: TangibleButton(
                        onTap: notifier.submit,
                        color: DesignSystem.gameGreen,
                        shadowColor: const Color(0xFF166534),
                        depth: 4,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const Center(
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
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
