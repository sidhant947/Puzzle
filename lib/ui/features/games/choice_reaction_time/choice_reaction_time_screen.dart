import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'choice_reaction_time_provider.dart';

class ChoiceReactionTimeScreen extends ConsumerStatefulWidget {
  const ChoiceReactionTimeScreen({super.key});

  @override
  ConsumerState<ChoiceReactionTimeScreen> createState() => _ChoiceReactionTimeScreenState();
}

class _ChoiceReactionTimeScreenState extends ConsumerState<ChoiceReactionTimeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(choiceReactionTimeNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(List<int> reactionTimes) {
    final l10n = AppLocalizations.of(context)!;
    final avgRt = reactionTimes.isEmpty
        ? 0
        : reactionTimes.reduce((a, b) => a + b) / reactionTimes.length;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.timeUp.toUpperCase(),
        message: l10n.choiceRtAvgMessage(avgRt.toStringAsFixed(0)),        isVictory: reactionTimes.isNotEmpty,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(choiceReactionTimeNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(choiceReactionTimeNotifierProvider);
    final notifier = ref.read(choiceReactionTimeNotifierProvider.notifier);

    ref.listen(choiceReactionTimeNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.reactionTimes.isNotEmpty) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('choice_reaction_time');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(next.reactionTimes);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.choiceRtTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.choiceRtTitle,
      subtitle: l10n.choiceRtSubtitle,
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.spaceXL),
          Text(
            'Time Remaining: ${state.timeLeft}s',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: DesignSystem.spaceLG,
                      mainAxisSpacing: DesignSystem.spaceLG,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final isActive = state.targetIndex == index;
                      return TangibleButton(
                        onTap: () => notifier.onSquarePressed(index),
                        color: isActive ? DesignSystem.primary : colorScheme.surface,
                        shadowColor: isActive 
                            ? DesignSystem.primary.withValues(alpha: 0.5) 
                            : colorScheme.outline,
                        padding: EdgeInsets.zero,
                        child: isActive 
                            ? const Center(
                                child: FittedBox(
                                  child: Icon(Icons.flash_on, color: Colors.white, size: 64),
                                ),
                              )
                            : const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          TangibleContainer(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Text(
              'Taps: ${state.reactionTimes.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: DesignSystem.primary,
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }
}
