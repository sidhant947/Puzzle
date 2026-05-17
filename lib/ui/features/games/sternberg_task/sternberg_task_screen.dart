import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'sternberg_task_provider.dart';

class SternbergTaskScreen extends ConsumerStatefulWidget {
  const SternbergTaskScreen({super.key});

  @override
  ConsumerState<SternbergTaskScreen> createState() => _SternbergTaskScreenState();
}

class _SternbergTaskScreenState extends ConsumerState<SternbergTaskScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sternbergTaskNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final score = ref.read(sternbergTaskNotifierProvider).score;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.sternbergTaskTitle.toUpperCase(),
        message: l10n.sternbergTaskScore(score),
        isVictory: score > 15,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(sternbergTaskNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(sternbergTaskNotifierProvider);
    final notifier = ref.read(sternbergTaskNotifierProvider.notifier);

    ref.listen(sternbergTaskNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('sternberg_task');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.sternbergTaskTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.sternbergTaskTitle,
      subtitle: state.phase == SternbergPhase.memorize ? l10n.sternbergTaskMemorize : l10n.sternbergTaskWasLetterSet,
      actions: [
        _buildTimer(state.timeLeft),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Text(
              '${l10n.score}: ${state.score}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: DesignSystem.primary),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            Expanded(
              child: Center(
                child: _buildMainContent(state),
              ),
            ),
            if (state.phase == SternbergPhase.probe)
              Row(
                children: [
                  Expanded(
                    child: TangibleButton(
                      onTap: () => notifier.answer(true),
                      color: DesignSystem.success,
                      child: Text(l10n.yes.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                    ),
                  ),
                  const SizedBox(width: DesignSystem.spaceMD),
                  Expanded(
                    child: TangibleButton(
                      onTap: () => notifier.answer(false),
                      color: DesignSystem.error,
                      child: Text(l10n.no.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                    ),
                  ),
                ],
              )
            else
              const SizedBox(height: 60), // Placeholder
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(SternbergState state) {
    if (state.phase == SternbergPhase.memorize) {
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: state.memorySet.map((letter) => Text(
          letter,
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface),
        )).toList(),
      );
    } else if (state.phase == SternbergPhase.probe) {
      return Text(
        state.probe,
        style: const TextStyle(fontSize: 80, fontWeight: FontWeight.w900, color: DesignSystem.primary),
      );
    } else {
      return const Icon(Icons.check_circle_outline, size: 80, color: DesignSystem.success);
    }
  }

  Widget _buildTimer(int timeLeft) {
    return TangibleContainer(
      color: timeLeft < 10 ? DesignSystem.error.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      radius: DesignSystem.radiusSM,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface),
          SizedBox(width: 4),
          Text(
            timeLeft.toString(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
