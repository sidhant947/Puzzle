import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'matrix_reasoning_provider.dart';
import 'matrix_reasoning_engine.dart';

class MatrixReasoningScreen extends ConsumerStatefulWidget {
  const MatrixReasoningScreen({super.key});

  @override
  ConsumerState<MatrixReasoningScreen> createState() => _MatrixReasoningScreenState();
}

class _MatrixReasoningScreenState extends ConsumerState<MatrixReasoningScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(matrixReasoningNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final score = ref.read(matrixReasoningNotifierProvider).score;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'TIME\'S UP!',
        message: 'You completed $score matrices correctly!',
        isVictory: score > 5,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(matrixReasoningNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(matrixReasoningNotifierProvider);
    final notifier = ref.read(matrixReasoningNotifierProvider.notifier);

    ref.listen(matrixReasoningNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('matrix_reasoning');
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
      title: 'Matrix Reasoning',
      subtitle: 'Complete the pattern in the 3x3 grid',
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
                    'Time: ${state.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: state.timeLeft < 10 ? DesignSystem.error : DesignSystem.ink,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (state.puzzle != null) ...[
            Container(
              padding: const EdgeInsets.all(DesignSystem.spaceMD),
              decoration: BoxDecoration(
                color: DesignSystem.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: DesignSystem.outlineVariant, width: 2),
              ),
              child: SizedBox(
                width: 280,
                height: 280,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    if (index == state.puzzle!.missingIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          color: DesignSystem.outlineVariant.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: DesignSystem.primary, width: 2, style: BorderStyle.solid),
                        ),
                        child: const Center(
                          child: Text(
                            '?',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: DesignSystem.primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final cell = state.puzzle!.cells[index];
                    return _buildCell(cell);
                  },
                ),
              ),
            ),
          ],
          const Spacer(),
          if (state.puzzle != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: state.puzzle!.options.map((option) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TangibleButton(
                      onTap: () => notifier.submitAnswer(option),
                      color: DesignSystem.surface,
                      padding: const EdgeInsets.all(8),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: _buildCell(option),
                      ),
                    ),
                  ),
                )).toList(),
              ),
            ),
          const SizedBox(height: DesignSystem.spaceXL),
        ],
      ),
    );
  }

  Widget _buildCell(MatrixCell cell) {
    return Container(
      decoration: BoxDecoration(
        color: cell.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(
          cell.shape,
          color: cell.color,
          size: 40,
        ),
      ),
    );
  }
}
