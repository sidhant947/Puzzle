import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'mental_rotation_provider.dart';

class MentalRotationScreen extends ConsumerStatefulWidget {
  const MentalRotationScreen({super.key});

  @override
  ConsumerState<MentalRotationScreen> createState() => _MentalRotationScreenState();
}

class _MentalRotationScreenState extends ConsumerState<MentalRotationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mentalRotationNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(mentalRotationNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isTrialMode ? 'COMPLETED!' : 'TIME\'S UP!',
        message: 'You rotated ${state.score} shapes correctly!',
        isVictory: state.isTrialMode ? state.score >= 8 : state.score > 5,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(mentalRotationNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(mentalRotationNotifierProvider);
    final notifier = ref.read(mentalRotationNotifierProvider.notifier);

    ref.listen(mentalRotationNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('mental_rotation');
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
      title: l10n.mentalRotationTitle.toUpperCase(),
      subtitle: l10n.mentalRotationSubtitle,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPatternGrid(state.puzzle!.original, 'Shape A'),
                _buildPatternGrid(state.puzzle!.transformed, 'Shape B'),
              ],
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
                    child: Text(
                      'DIFFERENT',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: DesignSystem.error,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceMD),
                Expanded(
                  child: TangibleButton(
                    onTap: () => notifier.submitAnswer(true),
                    color: colorScheme.surface,
                    child: const Text(
                      'SAME',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: DesignSystem.success,
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

  Widget _buildPatternGrid(List<int> pattern, String label) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.5),
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: DesignSystem.spaceMD),
        Container(
          width: 140,
          height: 140,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 16,
            itemBuilder: (context, index) {
              final isSelected = pattern.contains(index);
              return Container(
                decoration: BoxDecoration(
                  color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
