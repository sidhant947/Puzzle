import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
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

  void _showCompletionDialog() {
    final state = ref.read(letterCancellationNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'TIME\'S UP!',
        message: 'You found ${state.score} letters!',
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
    final state = ref.watch(letterCancellationNotifierProvider);
    final notifier = ref.read(letterCancellationNotifierProvider.notifier);

    ref.listen(letterCancellationNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('letter_cancellation');
        if (!context.mounted) return;
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Letter Cancellation',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Letter Cancel',
      subtitle: 'Find all "${state.target}" letters',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat('FOUND', '${state.foundIndices.length}/${state.targetCount}'),
                _buildStat('TIME', '${state.timeLeft}s', color: state.timeLeft < 10 ? DesignSystem.error : null),
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
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isFound ? DesignSystem.success : DesignSystem.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isFound ? Colors.transparent : DesignSystem.outlineVariant,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        state.grid[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: isFound ? Colors.white : DesignSystem.ink,
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
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: DesignSystem.inkSlate)),
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color ?? DesignSystem.ink)),
      ],
    );
  }
}
