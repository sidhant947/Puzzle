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
    final score = ref.read(semanticLinkNotifierProvider).score;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'TIME\'S UP!',
        message: 'You linked $score word sets correctly!',
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
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(semanticLinkNotifierProvider);
    final notifier = ref.read(semanticLinkNotifierProvider.notifier);

    ref.listen(semanticLinkNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('semantic_link');
        _showCompletionDialog();
      }
      if (next.lastResult != null && next.lastResult != previous?.lastResult) {
        if (next.lastResult!) {
          HapticFeedbackUtil.lightImpact();
        } else {
          HapticFeedbackUtil.vibrate();
        }
      }
    });

    return GameScaffold(
      title: 'Semantic Link',
      subtitle: 'Find the word that connects all three',
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
                children: state.puzzle!.options.map((option) => TangibleButton(
                  onTap: () => notifier.submitAnswer(option),
                  color: colorScheme.surface,
                  child: Center(
                    child: Text(
                      option.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                )).toList(),
              ),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
