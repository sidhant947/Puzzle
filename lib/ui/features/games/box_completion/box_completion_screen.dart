import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import 'box_completion_provider.dart';

class BoxCompletionScreen extends ConsumerStatefulWidget {
  const BoxCompletionScreen({super.key});

  @override
  ConsumerState<BoxCompletionScreen> createState() => _BoxCompletionScreenState();
}

class _BoxCompletionScreenState extends ConsumerState<BoxCompletionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(boxCompletionNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(boxCompletionNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isTrialMode ? l10n.completed : l10n.timeUp,
        message: l10n.boxCompletionScoreMessage(state.score, state.totalTrials),
        isVictory: state.isTrialMode ? state.score >= 16 : state.score > 5,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(boxCompletionNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(boxCompletionNotifierProvider);
    final notifier = ref.read(boxCompletionNotifierProvider.notifier);

    ref.listen(boxCompletionNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('box_completion');
        if (!context.mounted) return;
        _showCompletionDialog();
      }
    });

    if (state.isLoading || state.currentPuzzle == null) {
      return GameScaffold(
        title: l10n.boxCompletionTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.boxCompletionTitle,
      subtitle: l10n.boxCompletionSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat(l10n.score.toUpperCase(), state.score.toString()),
                if (state.isTrialMode)
                  _buildStat(l10n.trials.toUpperCase(), '${state.totalTrials}/${state.targetTrials}')
                else
                  _buildStat(l10n.timeLeft.toUpperCase(), '${state.timeLeft}s', color: state.timeLeft < 10 ? DesignSystem.error : null),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          _buildNet(state.currentPuzzle!.net),
          const Spacer(),
          Text(l10n.boxCompletionOptions, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
          const SizedBox(height: DesignSystem.spaceMD),
          _buildOptions(state.currentPuzzle!.options, notifier),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildNet(List<int?> net) {
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (r) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(4, (c) {
              final val = net[r * 4 + c];
              return Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: val != null ? Theme.of(context).colorScheme.surface : Colors.transparent,
                  border: val != null ? Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.3)) : null,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: val != null 
                    ? Center(child: Text(val.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface))) 
                    : null,
              );
            }),
          );
        }),
      ),
    );
  }

  Widget _buildOptions(List<List<int>> options, BoxCompletionNotifier notifier) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options.asMap().entries.map((entry) {
        return TangibleButton(
          onTap: () {
            HapticFeedbackUtil.lightImpact();
            notifier.onOptionPressed(entry.key);
          },
          color: Theme.of(context).colorScheme.surface,
          child: _buildCubeView(entry.value),
        );
      }).toList(),
    );
  }

  Widget _buildCubeView(List<int> faces) {
    // faces: [Top, Front, Right]
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final onSurfaceColor = Theme.of(context).colorScheme.onSurface;
    final borderColor = onSurfaceColor.withValues(alpha: 0.7).withValues(alpha: 0.2);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: surfaceColor,
            border: Border.all(color: borderColor),
          ),
          child: Center(
            child: Text(
              faces[0].toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: onSurfaceColor,
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: surfaceColor,
                border: Border.all(color: borderColor),
              ),
              child: Center(
                child: Text(
                  faces[1].toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: onSurfaceColor,
                  ),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: surfaceColor,
                border: Border.all(color: borderColor),
              ),
              child: Center(
                child: Text(
                  faces[2].toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: onSurfaceColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
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
