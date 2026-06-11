import 'package:puzzle/utils/l10n_game_helpers.dart';
import "package:puzzle/l10n/app_localizations.dart";

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import 'etymology_origin_provider.dart';

class EtymologyOriginScreen extends ConsumerStatefulWidget {
  const EtymologyOriginScreen({super.key});

  @override
  ConsumerState<EtymologyOriginScreen> createState() => _EtymologyOriginScreenState();
}

class _EtymologyOriginScreenState extends ConsumerState<EtymologyOriginScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(etymologyOriginNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(etymologyOriginNotifierProvider);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('etymology_origin');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isGameWon ? l10n.wellDone.toUpperCase() : l10n.gameOver.toUpperCase(),
        message: state.description,
        onPlayAgain: () {
          ref.read(etymologyOriginNotifierProvider.notifier).initGame();
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
    final state = ref.watch(etymologyOriginNotifierProvider);
    final notifier = ref.read(etymologyOriginNotifierProvider.notifier);

    ref.listen(etymologyOriginNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'etymology_origin'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'etymology_origin'),
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
                      TangibleContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        color: DesignSystem.gameGreen,
                        shadowColor: DesignSystem.gameGreen.withValues(alpha: 0.7),
                        child: Text(
                          state.word,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 2,
                        children: state.options.map((option) {
                          final isSelected = state.selectedLanguage == option;
                          final isCorrect = option == state.correctLanguage;
                          
                          Color btnColor = colorScheme.surface;
                          Color shadowColor = colorScheme.outline;
                          
                          if (state.isGameOver) {
                            if (isCorrect) {
                              btnColor = DesignSystem.gameGreen;
                              shadowColor = DesignSystem.gameGreen.withValues(alpha: 0.7);
                            } else if (isSelected) {
                               btnColor = DesignSystem.error;
                               shadowColor = DesignSystem.error.withValues(alpha: 0.7);
                            }
                          }

                          return TangibleButton(
                            onTap: () => notifier.selectLanguage(option),
                            color: btnColor,
                            shadowColor: shadowColor,
                            depth: 4,
                            child: Center(
                              child: Text(
                                option,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: (state.isGameOver && (isCorrect || isSelected)) 
                                      ? Colors.white 
                                      : colorScheme.onSurface,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
