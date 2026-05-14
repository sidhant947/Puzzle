import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'logical_syllogisms_provider.dart';

class LogicalSyllogismsScreen extends ConsumerStatefulWidget {
  const LogicalSyllogismsScreen({super.key});

  @override
  ConsumerState<LogicalSyllogismsScreen> createState() => _LogicalSyllogismsScreenState();
}

class _LogicalSyllogismsScreenState extends ConsumerState<LogicalSyllogismsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(logicalSyllogismsNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(logicalSyllogismsNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isTrialMode ? 'COMPLETED!' : 'TIME\'S UP!',
        message: 'You solved ${state.score} syllogisms correctly!',
        isVictory: state.isTrialMode ? state.score >= 8 : state.score > 5,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(logicalSyllogismsNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(logicalSyllogismsNotifierProvider);
    final notifier = ref.read(logicalSyllogismsNotifierProvider.notifier);

    ref.listen(logicalSyllogismsNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('logical_syllogisms');
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
      title: l10n.logicalSyllogismsTitle.toUpperCase(),
      subtitle: l10n.logicalSyllogismsSubtitle,
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
                    state.isTrialMode ? 'Trials: ${state.totalTrials}/${state.targetTrials}' : 'Time: ${state.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: (!state.isTrialMode && state.timeLeft < 10) ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          if (state.puzzle != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
              child: TangibleContainer(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: Column(
                  children: [
                    _buildText(state.puzzle!.premise1),
                    const SizedBox(height: DesignSystem.spaceSM),
                    _buildText(state.puzzle!.premise2),
                    const Divider(height: DesignSystem.spaceXL, thickness: 2),
                    _buildText(state.puzzle!.conclusion, isConclusion: true),
                  ],
                ),
              ),
            ),
          ],
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: () => notifier.submitAnswer(false),
                    color: colorScheme.surface,
                    child: Center(
                      child: Text(
                        'INVALID',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.error,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceMD),
                Expanded(
                  child: TangibleButton(
                    onTap: () => notifier.submitAnswer(true),
                    color: colorScheme.surface,
                    child: const Center(
                      child: Text(
                        'VALID',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.success,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
        ],
      ),
    );
  }

  Widget _buildText(String text, {bool isConclusion = false}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: isConclusion ? 22 : 18,
        fontWeight: isConclusion ? FontWeight.w900 : FontWeight.w500,
        color: isConclusion ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
