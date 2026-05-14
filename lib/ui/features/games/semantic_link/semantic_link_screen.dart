import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'semantic_link_provider.dart';

class SemanticLinkScreen extends ConsumerStatefulWidget {
  const SemanticLinkScreen({super.key});

  @override
  ConsumerState<SemanticLinkScreen> createState() => _SemanticLinkScreenState();
}

class _SemanticLinkScreenState extends ConsumerState<SemanticLinkScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(semanticLinkNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final score = ref.read(semanticLinkNotifierProvider).score;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.timeUp.toUpperCase(),
        message: 'You scored $score points!',
        isVictory: score > 5,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(semanticLinkNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(semanticLinkNotifierProvider);
    final notifier = ref.read(semanticLinkNotifierProvider.notifier);

    ref.listen(semanticLinkNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('semantic_link');
        _showCompletionDialog();
      }
      if (previous != null) {
        if (next.score > previous.score) {
          HapticFeedbackUtil.lightImpact();
        } else if (next.score < previous.score) {
          HapticFeedbackUtil.vibrate();
        }
      }
    });

    return GameScaffold(
      title: 'Semantic Link',
      subtitle: l10n.semanticLinkSubtitle,
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
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: state.score < 0 ? DesignSystem.error : colorScheme.onSurface,
                    ),
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
          Spacer(),
          if (state.puzzle != null) ...[
            Wrap(
              spacing: DesignSystem.spaceMD,
              runSpacing: DesignSystem.spaceMD,
              alignment: WrapAlignment.center,
              children: state.puzzle!.words.map((word) => TangibleContainer(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: DesignSystem.primary.withValues(alpha: 0.1),
                child: Text(
                  word.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.primary,
                  ),
                ),
              )).toList(),
            ),
            const SizedBox(height: DesignSystem.space2XL),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: DesignSystem.spaceMD,
                mainAxisSpacing: DesignSystem.spaceMD,
                children: state.puzzle!.options.map((option) {
                  final isWrong = state.wrongAttempts.contains(option);
                  return TangibleButton(
                    onTap: isWrong ? null : () => notifier.submitAnswer(option),
                    color: isWrong ? DesignSystem.error.withValues(alpha: 0.2) : colorScheme.surface,
                    shadowColor: isWrong ? DesignSystem.error.withValues(alpha: 0.3) : colorScheme.outline,
                    child: Center(
                      child: Text(
                        option.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: isWrong ? DesignSystem.error : colorScheme.onSurface,
                          decoration: isWrong ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}

