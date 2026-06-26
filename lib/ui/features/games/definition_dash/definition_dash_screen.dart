import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'definition_dash_provider.dart';

class DefinitionDashScreen extends ConsumerStatefulWidget {
  const DefinitionDashScreen({super.key});

  @override
  ConsumerState<DefinitionDashScreen> createState() => _DefinitionDashScreenState();
}

class _DefinitionDashScreenState extends ConsumerState<DefinitionDashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(definitionDashNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final state = ref.read(definitionDashNotifierProvider);
    final isCorrect = state.isCorrect ?? false;
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isCorrect ? l10n.winExcellent : l10n.gameOver,
        message: isCorrect 
            ? l10n.snackbarCorrectRecall
            : l10n.snackbarIncorrectStudyAgain,
        isVictory: isCorrect,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(definitionDashNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(definitionDashNotifierProvider);
    final notifier = ref.read(definitionDashNotifierProvider.notifier);

    ref.listen(definitionDashNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isCorrect == true) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.error();
        }
        ref.read(gameStreakNotifierProvider.notifier).completeGame('definition_dash');
        _showCompletionDialog();
      }
    });

    if (state.puzzle == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'definition_dash'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'definition_dash'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: TangibleContainer(
                        color: DesignSystem.gamePurple,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              state.puzzle!.word.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(DesignSystem.spaceMD),
                      child: Column(
                        children: state.puzzle!.options.map((option) {
                          final isSelected = state.selectedDefinition == option;
                          final isCorrect = option == state.puzzle!.correctDefinition;
                          
                          Color? buttonColor;
                          if (isSelected) {
                            buttonColor = isCorrect ? DesignSystem.gameGreen : DesignSystem.error;
                          } else if (state.selectedDefinition != null && isCorrect) {
                            buttonColor = DesignSystem.gameGreen.withValues(alpha: 0.5);
                          }

                          return Padding(
                            padding: const EdgeInsets.only(bottom: DesignSystem.spaceSM),
                            child: TangibleButton(
                              onTap: () => notifier.selectOption(option),
                              color: buttonColor,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: buttonColor != null ? Colors.white : colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
