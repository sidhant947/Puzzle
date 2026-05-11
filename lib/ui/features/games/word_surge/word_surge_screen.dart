import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'word_surge_provider.dart';
import 'word_surge_engine.dart';

class WordSurgeScreen extends ConsumerStatefulWidget {
  const WordSurgeScreen({super.key});

  @override
  ConsumerState<WordSurgeScreen> createState() => _WordSurgeScreenState();
}

class _WordSurgeScreenState extends ConsumerState<WordSurgeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wordSurgeNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'SURGE COMPLETE!' : 'TIME EXPIRED!',
        message: isVictory 
            ? 'Your linguistic reflexes are incredible.' 
            : 'You scored ${ref.read(wordSurgeNotifierProvider).score} points.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(wordSurgeNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(wordSurgeNotifierProvider);
    final notifier = ref.read(wordSurgeNotifierProvider.notifier);

    ref.listen(wordSurgeNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        final isVictory = next.score >= next.targetScore;
        if (isVictory) {
          HapticFeedbackUtil.victory();
          ref.read(gameStreakNotifierProvider.notifier).completeGame('word_surge');
        } else {
          HapticFeedbackUtil.lightImpact();
        }
        _showCompletionDialog(isVictory);
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Word Surge',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Word Surge',
      subtitle: 'Synonyms & Antonyms',
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Score: ${state.score} / ${state.targetScore}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: state.timeLeft <= 5 ? DesignSystem.error.withValues(alpha: 0.1) : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: state.timeLeft <= 5 ? DesignSystem.error : DesignSystem.outline,
                    ),
                  ),
                  child: Text(
                    '${state.timeLeft}s',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: state.timeLeft <= 5 ? DesignSystem.error : DesignSystem.ink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            LinearProgressIndicator(
              value: state.score / state.targetScore,
              backgroundColor: DesignSystem.outline,
              valueColor: const AlwaysStoppedAnimation<Color>(DesignSystem.success),
            ),
            const Spacer(),
            Text(
              state.currentChallenge?.type == WordSurgeType.synonym 
                  ? 'SYNONYM of' 
                  : 'ANTONYM of',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: DesignSystem.inkSlate,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceSM),
            Text(
              state.currentChallenge?.target.toUpperCase() ?? '',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 42),
            ),
            const Spacer(),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2,
              children: state.currentChallenge?.options.map((option) {
                final isSelected = state.selectedOption == option;
                final isCorrect = state.currentChallenge?.answer == option;

                Color buttonColor = Colors.white;
                if (isSelected) {
                  buttonColor = isCorrect ? DesignSystem.success : DesignSystem.error;
                } else if (state.selectedOption != null && isCorrect) {
                  buttonColor = DesignSystem.success.withValues(alpha: 0.3);
                }

                return ElevatedButton(
                  onPressed: state.selectedOption == null ? () => notifier.selectOption(option) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: isSelected || (state.selectedOption != null && isCorrect)
                        ? Colors.white
                        : DesignSystem.ink,
                    side: BorderSide(
                      color: isSelected ? Colors.transparent : DesignSystem.outline,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    option,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList() ?? [],
            ),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
        ),
      ),
    );
  }
}
