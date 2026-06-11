import 'package:puzzle/utils/l10n_game_helpers.dart';
import "package:puzzle/l10n/app_localizations.dart";

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'etymon_oddball_provider.dart';

class EtymonOddballScreen extends ConsumerStatefulWidget {
  const EtymonOddballScreen({super.key});

  @override
  ConsumerState<EtymonOddballScreen> createState() => _EtymonOddballScreenState();
}

class _EtymonOddballScreenState extends ConsumerState<EtymonOddballScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(etymonOddballNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(etymonOddballNotifierProvider);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('etymon_oddball');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isGameWon ? l10n.wellDone.toUpperCase() : l10n.gameOver.toUpperCase(),
        message: state.description,
        onPlayAgain: () {
          ref.read(etymonOddballNotifierProvider.notifier).initGame();
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
    final state = ref.watch(etymonOddballNotifierProvider);
    final notifier = ref.read(etymonOddballNotifierProvider.notifier);

    ref.listen(etymonOddballNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'etymon_oddball'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'etymon_oddball'),
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
                return Padding(
                  padding: const EdgeInsets.all(DesignSystem.spaceLG),
                  child: Column(
                    children: [
                      const Spacer(),
                      ...state.words.map((word) {
                        final isSelected = state.selectedWord == word;
                        final isCorrect = word == state.correctWord;
                        
                        Color btnColor = colorScheme.surface;
                        Color shadowColor = colorScheme.outline;
                        
                        if (state.isGameOver) {
                          if (isCorrect) {
                            btnColor = DesignSystem.gameGreen;
                            shadowColor = DesignSystem.gameGreen.withValues(alpha: 0.7);
                          } else if (isSelected && !isGameWon) {
                             btnColor = DesignSystem.error;
                             shadowColor = DesignSystem.error.withValues(alpha: 0.7);
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                          child: TangibleButton(
                            onTap: () => notifier.selectWord(word),
                            color: btnColor,
                            shadowColor: shadowColor,
                            depth: 4,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                word,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: (state.isGameOver && (isCorrect || isSelected)) 
                                      ? Colors.white 
                                      : colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
    );
  }

  bool get isGameWon => ref.read(etymonOddballNotifierProvider).isGameWon;
}
