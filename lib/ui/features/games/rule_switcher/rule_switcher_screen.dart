import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import 'rule_switcher_engine.dart';
import 'rule_switcher_provider.dart';

class RuleSwitcherScreen extends ConsumerStatefulWidget {
  const RuleSwitcherScreen({super.key});

  @override
  ConsumerState<RuleSwitcherScreen> createState() => _RuleSwitcherScreenState();
}

class _RuleSwitcherScreenState extends ConsumerState<RuleSwitcherScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ruleSwitcherNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(ruleSwitcherNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isTrialMode ? 'COMPLETED!' : 'TIME\'S UP!',
        message: 'You scored ${state.score} correct out of ${state.totalTrials}!',
        isVictory: state.isTrialMode ? state.score >= 8 : state.score > 15,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(ruleSwitcherNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(ruleSwitcherNotifierProvider);
    final notifier = ref.read(ruleSwitcherNotifierProvider.notifier);

    ref.listen(ruleSwitcherNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('rule_switcher');
        if (!context.mounted) return;
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.ruleSwitcherTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Rule Switcher',
      subtitle: l10n.ruleSwitcherSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat('SCORE', state.score.toString()),
                if (state.isTrialMode)
                  _buildStat('TRIALS', '${state.totalTrials}/${state.targetTrials}')
                else
                  _buildStat('TIME', '${state.timeLeft}s', color: state.timeLeft < 10 ? DesignSystem.error : null),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              _buildStimulus(state),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildCue(state.rule),
            ],
          ),
          const Spacer(),
          _buildButtons(state, notifier),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildCue(SwitchRule rule) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: rule == SwitchRule.number ? DesignSystem.primary : DesignSystem.accentBerry,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        rule == SwitchRule.number ? 'NUMBER RULE' : 'COLOR RULE',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildStimulus(RuleSwitcherState state) {
    return Text(
      state.number.toString(),
      style: TextStyle(
        fontSize: 120,
        fontWeight: FontWeight.w900,
        color: state.colorName == 'Red' ? DesignSystem.error : DesignSystem.success,
      ),
    );
  }

  Widget _buildButtons(RuleSwitcherState state, RuleSwitcherNotifier notifier) {
    final bool isNumberRule = state.rule == SwitchRule.number;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Row(
        children: [
          Expanded(
            child: TangibleButton(
              onTap: () {
                HapticFeedbackUtil.lightImpact();
                notifier.onOptionPressed(true);
              },
              color: Theme.of(context).colorScheme.surface,
              child: Center(
                child: Text(
                  isNumberRule ? 'EVEN' : 'RED',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: DesignSystem.spaceLG),
          Expanded(
            child: TangibleButton(
              onTap: () {
                HapticFeedbackUtil.lightImpact();
                notifier.onOptionPressed(false);
              },
              color: Theme.of(context).colorScheme.surface,
              child: Center(
                child: Text(
                  isNumberRule ? 'ODD' : 'GREEN',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color ?? Theme.of(context).colorScheme.onSurface)),
      ],
    );
  }
}
