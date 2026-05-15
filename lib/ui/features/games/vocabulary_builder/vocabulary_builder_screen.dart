import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import 'vocabulary_builder_provider.dart';
import 'vocabulary_builder_engine.dart';
import '../../../../providers/game_providers.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class VocabularyBuilderScreen extends ConsumerStatefulWidget {
  const VocabularyBuilderScreen({super.key});

  @override
  ConsumerState<VocabularyBuilderScreen> createState() => _VocabularyBuilderScreenState();
}

class _VocabularyBuilderScreenState extends ConsumerState<VocabularyBuilderScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(vocabularyBuilderNotifierProvider.notifier).startGame());
  }

  void _showHowToPlay(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.howToPlay),
        content: Text(l10n.vocabularyBuilderHowToPlay),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.gotIt),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(vocabularyBuilderNotifierProvider);
    final notifier = ref.read(vocabularyBuilderNotifierProvider.notifier);

    ref.listen(vocabularyBuilderNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, next.score);
      } else if (next.lastAnswerCorrect != null && next.lastAnswerCorrect != previous?.lastAnswerCorrect) {
        if (next.lastAnswerCorrect!) {
          HapticFeedbackUtil.success();
        } else {
          HapticFeedbackUtil.error();
        }
      }
    });

    return GameScaffold(
      title: l10n.vocabularyBuilderTitle.toUpperCase(),
      subtitle: l10n.vocabularyBuilderSubtitle,
      onHowToPlay: () => _showHowToPlay(context, l10n),
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.startGame();
      },
      body: state.currentQuestion == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  _buildHeader(state),
                  const Spacer(),
                  _buildQuestion(state),
                  const Spacer(),
                  _buildOptions(state, notifier),
                  const SizedBox(height: DesignSystem.spaceXL),
                ],
              ),
            ),
    );
  }

  Widget _buildHeader(VocabularyBuilderState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard('SCORE', state.score.toString(), DesignSystem.primary),
        _buildStatCard('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.secondary),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      color: color.withValues(alpha: 0.1),
      shadowColor: color.withValues(alpha: 0.2),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: color)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }

  Widget _buildQuestion(VocabularyBuilderState state) {
    final question = state.currentQuestion!;
    return Column(
      children: [
        Text(
          question.relation == VocabularyRelation.synonym ? 'FIND THE SYNONYM OF' : 'FIND THE ANTONYM OF',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          question.word.toUpperCase(),
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: 4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildOptions(VocabularyBuilderState state, VocabularyBuilderNotifier notifier) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
      itemCount: state.currentQuestion!.options.length,
      itemBuilder: (context, index) {
        final option = state.currentQuestion!.options[index];
        return TangibleButton(
          onTap: () => notifier.submitAnswer(option),
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          child: Center(
            child: Text(
              option,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, int score) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('vocabulary_builder');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(vocabularyBuilderNotifierProvider.notifier).startGame();
          Navigator.of(context).pop();
        },
        message: 'Great job! Your vocabulary is impressive. Score: $score',
      ),
    );
  }
}
