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
import 'grammar_sort_engine.dart';
import 'grammar_sort_provider.dart';

class GrammarSortScreen extends ConsumerStatefulWidget {
  const GrammarSortScreen({super.key});

  @override
  ConsumerState<GrammarSortScreen> createState() => _GrammarSortScreenState();
}

class _GrammarSortScreenState extends ConsumerState<GrammarSortScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(grammarSortNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(grammarSortNotifierProvider);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.gameOver.toUpperCase(),
        message: AppLocalizations.of(context)!.grammarSortMessage((state.score / 10).toString()),
        isVictory: state.score > 0,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(grammarSortNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(grammarSortNotifierProvider);
    final notifier = ref.read(grammarSortNotifierProvider.notifier);

    ref.listen(grammarSortNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('grammar_sort');
        _showCompletionDialog();
      }
      if (next.lastCorrect == true && previous?.lastCorrect != true) {
        HapticFeedbackUtil.success();
      } else if (next.lastCorrect == false && previous?.lastCorrect != false) {
        HapticFeedbackUtil.error();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'grammar_sort'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'grammar_sort'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'SCORE: ${state.score}',
                        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'TIME: ${state.timeLeft}S',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: state.timeLeft < 10 ? DesignSystem.error : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Current word to sort
          if (state.currentWord != null)
            TangibleContainer(
              color: state.lastCorrect == true 
                  ? DesignSystem.gameGreen 
                  : (state.lastCorrect == false ? DesignSystem.error : colorScheme.surface),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Center(
                child: FittedBox(
                  child: Text(
                    state.currentWord!.word.toUpperCase(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: state.lastCorrect != null ? Colors.white : colorScheme.onSurface,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          const Spacer(),
          // Sorting buckets
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TangibleButton(
                        onTap: () => notifier.sortWord(PartOfSpeech.noun),
                        color: DesignSystem.gameBlue,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: const Center(
                          child: FittedBox(
                            child: Text(
                              'NOUN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignSystem.spaceSM),
                Row(
                  children: [
                    Expanded(
                      child: TangibleButton(
                        onTap: () => notifier.sortWord(PartOfSpeech.verb),
                        color: DesignSystem.gameGreen,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: const Center(
                          child: FittedBox(
                            child: Text(
                              'VERB',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceSM),
                    Expanded(
                      child: TangibleButton(
                        onTap: () => notifier.sortWord(PartOfSpeech.adjective),
                        color: DesignSystem.gamePurple,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: const Center(
                          child: FittedBox(
                            child: Text(
                              'ADJECTIVE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
        ],
      ),
    );
  }
}
