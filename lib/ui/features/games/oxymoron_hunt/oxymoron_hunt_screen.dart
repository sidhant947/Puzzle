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
import 'oxymoron_hunt_provider.dart';

class OxymoronHuntScreen extends ConsumerStatefulWidget {
  const OxymoronHuntScreen({super.key});

  @override
  ConsumerState<OxymoronHuntScreen> createState() => _OxymoronHuntScreenState();
}

class _OxymoronHuntScreenState extends ConsumerState<OxymoronHuntScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(oxymoronHuntNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final score = ref.read(oxymoronHuntNotifierProvider).score;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.timeUp.toUpperCase(),
        message: AppLocalizations.of(context)!.oxymoronHuntMessage((score).toString()),
        isVictory: score > 3,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(oxymoronHuntNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(oxymoronHuntNotifierProvider);
    final notifier = ref.read(oxymoronHuntNotifierProvider.notifier);

    ref.listen(oxymoronHuntNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('oxymoron_hunt');
        _showCompletionDialog();
      }
      if (next.foundWords.length > (previous?.foundWords.length ?? 0)) {
        HapticFeedbackUtil.lightImpact();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'oxymoron_hunt'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'oxymoron_hunt'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Score: ${state.score}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Time: ${state.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: state.timeLeft < 10 ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (state.puzzle != null)
            Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceMD),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: DesignSystem.spaceMD,
                  mainAxisSpacing: DesignSystem.spaceMD,
                ),
                itemCount: state.puzzle!.words.length,
                itemBuilder: (context, index) {
                  final word = state.puzzle!.words[index];
                  final isSelected = state.selectedWords.contains(word);
                  final isFound = state.foundWords.contains(word);
                  
                  return TangibleButton(
                    onTap: isFound ? null : () => notifier.selectWord(word),
                    color: isFound 
                        ? DesignSystem.gamePurple.withValues(alpha: 0.2)
                        : isSelected 
                            ? DesignSystem.gamePurple 
                            : colorScheme.surface,
                    child: Center(
                      child: Text(
                        word.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: isFound 
                              ? DesignSystem.gamePurple 
                              : isSelected 
                                  ? Colors.white 
                                  : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          const Spacer(),
        ],
      ),
    );
  }
}
