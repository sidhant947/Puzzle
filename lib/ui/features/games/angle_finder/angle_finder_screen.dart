import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'angle_finder_provider.dart';
import '../../../../../providers/user_providers.dart';

class AngleFinderScreen extends ConsumerStatefulWidget {
  const AngleFinderScreen({super.key});

  @override
  ConsumerState<AngleFinderScreen> createState() => _AngleFinderScreenState();
}

class _AngleFinderScreenState extends ConsumerState<AngleFinderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(angleFinderNotifierProvider.notifier).initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(angleFinderNotifierProvider);
    final notifier = ref.read(angleFinderNotifierProvider.notifier);

    ref.listen(angleFinderNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('angle_finder');
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.angleFinderTitle.toUpperCase(),
            message: "Your geometric intuition is perfect!",
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              Navigator.of(context).pop();
              notifier.initGame();
            },
          ),
        );
      } else if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.error();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.gameOver.toUpperCase(),
            message: "The correct answer was ${state.currentProblem?.answer}°",
            isVictory: false,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              Navigator.of(context).pop();
              notifier.initGame();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.angleFinderTitle.toUpperCase(),
      subtitle: l10n.angleFinderSubtitle,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  _buildScoreBoard(state),
                  const Spacer(),
                  _buildQuestionCard(state),
                  const Spacer(),
                  _buildOptions(state, notifier),
                  const SizedBox(height: DesignSystem.space2XL),
                ],
              ),
            ),
    );
  }

  Widget _buildScoreBoard(AngleFinderState state) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: DesignSystem.primary.withValues(alpha: 0.1),
      child: Text(
        "PROGRESS: ${state.score}/10",
        style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
      ),
    );
  }

  Widget _buildQuestionCard(AngleFinderState state) {
    final problem = state.currentProblem!;
    return TangibleContainer(
      padding: const EdgeInsets.all(DesignSystem.spaceXL),
      child: Column(
        children: [
          Text(
            problem.description.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          Text(
            problem.question,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions(AngleFinderState state, AngleFinderNotifier notifier) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: state.currentProblem!.options.map((opt) {
        return TangibleButton(
          onTap: () {
            HapticFeedbackUtil.selectionClick();
            notifier.selectOption(opt);
          },
          child: Text("$opt°"),
        );
      }).toList(),
    );
  }
}
