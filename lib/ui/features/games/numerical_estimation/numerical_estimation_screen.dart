import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'numerical_estimation_provider.dart';

class NumericalEstimationScreen extends ConsumerStatefulWidget {
  const NumericalEstimationScreen({super.key});

  @override
  ConsumerState<NumericalEstimationScreen> createState() => _NumericalEstimationScreenState();
}

class _NumericalEstimationScreenState extends ConsumerState<NumericalEstimationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(numericalEstimationNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(numericalEstimationNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isTrialMode ? l10n.completed.toUpperCase() : l10n.timeUp.toUpperCase(),
        message: 'You made ${state.score} correct estimations.',
        isVictory: state.isTrialMode ? state.score >= 10 : state.score > 5,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(numericalEstimationNotifierProvider.notifier).resetGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(numericalEstimationNotifierProvider);
    final notifier = ref.read(numericalEstimationNotifierProvider.notifier);

    ref.listen(numericalEstimationNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('numerical_estimation');
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'Quick Estimate',
      subtitle: l10n.numericalEstimationSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(context, 'SCORE', state.score.toString()),
                state.isTrialMode
                    ? _buildStatCard(context, 'TRIALS', '${state.totalTrials}/${state.targetTrials}')
                    : _buildStatCard(context, 'TIME', '${state.timeLeft}s', color: state.timeLeft < 10 ? DesignSystem.error : null),
              ],
            ),
          ),
          SizedBox(height: DesignSystem.spaceXL),
          
          Expanded(
            child: Center(
              child: state.currentPuzzle == null
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              state.currentPuzzle!.question,
                              style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: DesignSystem.space2XL),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                          child: Wrap(
                            spacing: DesignSystem.spaceMD,
                            runSpacing: DesignSystem.spaceMD,
                            alignment: WrapAlignment.center,
                            children: state.currentPuzzle!.options.map((option) {
                              final isSelected = state.selectedAnswer == option;
                              final isCorrect = isSelected && (state.isLastCorrect ?? false);
                              final isWrong = isSelected && !(state.isLastCorrect ?? true);

                              Color buttonColor = colorScheme.surface;
                              if (isCorrect) buttonColor = DesignSystem.success.withValues(alpha: 0.2);
                              if (isWrong) buttonColor = DesignSystem.error.withValues(alpha: 0.2);

                              return SizedBox(
                                width: (MediaQuery.of(context).size.width - DesignSystem.spaceLG * 2 - DesignSystem.spaceMD) / 2,
                                child: TangibleButton(
                                  onTap: () {
                                    HapticFeedbackUtil.lightImpact();
                                    notifier.selectOption(option);
                                  },
                                  color: buttonColor,
                                  child: Center(
                                    child: Text(
                                      option.toString(),
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900,
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: color ?? Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
