import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../l10n/app_localizations.dart';
import 'letter_cancellation_provider.dart';

class LetterCancellationScreen extends ConsumerStatefulWidget {
  const LetterCancellationScreen({super.key});

  @override
  ConsumerState<LetterCancellationScreen> createState() => _LetterCancellationScreenState();
}

class _LetterCancellationScreenState extends ConsumerState<LetterCancellationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(letterCancellationNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(AppLocalizations l10n) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(letterCancellationNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.timeUp.toUpperCase(),
        message: l10n.letterCancellationScoreMessage(state.score),
        isVictory: state.score > 30,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(letterCancellationNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(letterCancellationNotifierProvider);
    final notifier = ref.read(letterCancellationNotifierProvider.notifier);

    ref.listen(letterCancellationNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('letter_cancellation');
        if (!context.mounted) return;
        _showCompletionDialog(l10n);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.letterCancellationTitleFull,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.letterCancellationTitle,
      subtitle: l10n.letterCancellationSubtitle(state.target),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat(l10n.letterCancellationFound, '${state.foundIndices.length}/${state.targetCount}'),
                _buildStat(l10n.letterCancellationTime, '${state.timeLeft}s', color: state.timeLeft < 10 ? DesignSystem.error : null),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.grid.length,
              itemBuilder: (context, index) {
                final isFound = state.foundIndices.contains(index);
                return GestureDetector(
                  onTap: () {
                    if (state.grid[index] == state.target) {
                      HapticFeedbackUtil.lightImpact();
                    } else {
                      HapticFeedbackUtil.vibrate();
                    }
                    notifier.onLetterPressed(index);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isFound ? DesignSystem.success : colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isFound ? Colors.transparent : colorScheme.outline,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        state.grid[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: isFound ? Colors.white : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
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
