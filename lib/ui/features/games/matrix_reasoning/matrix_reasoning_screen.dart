import 'package:puzzle/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(matrixReasoningNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isTrialMode ? 'COMPLETED!' : 'TIME\'S UP!',
        message: 'You completed ${state.score} matrices correctly!',
        isVictory: state.isTrialMode ? state.score >= 8 : state.score > 5,
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
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
      title: l10n.matrixReasoningTitle.toUpperCase(),
      subtitle: l10n.matrixReasoningSubtitle,
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
            Container(
              padding: const EdgeInsets.all(DesignSystem.spaceMD),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.outline, width: 2),
              ),
              child: SizedBox(
                width: 280,
                height: 280,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                          color: colorScheme.outline.withValues(alpha: 0.2),
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
          Spacer(),
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
                      color: colorScheme.surface,
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
