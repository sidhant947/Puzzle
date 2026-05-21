import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'distractor_matrix_provider.dart';

class DistractorMatrixScreen extends ConsumerWidget {
  const DistractorMatrixScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(distractorMatrixNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(distractorMatrixNotifierProvider, (previous, next) {
      if (next.status == DistractorMatrixStatus.completed &&
          previous?.status != DistractorMatrixStatus.completed) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'DISTRACTOR MATRIX COMPLETE',
            message: 'Incredible! You recalled patterns despite cognitive math distractors!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(distractorMatrixNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == DistractorMatrixStatus.failure &&
          previous?.status != DistractorMatrixStatus.failure) {
        HapticFeedbackUtil.error();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GAME OVER',
            message: 'The distractors got you! Retrain your working memory.',
            isVictory: false,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(distractorMatrixNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == DistractorMatrixStatus.success &&
          previous?.status != DistractorMatrixStatus.success) {
        HapticFeedbackUtil.success();
      } else if (next.mathAnsweredCorrectly == false &&
          previous?.mathAnsweredCorrectly != false) {
        HapticFeedbackUtil.error();
      } else if (next.mathAnsweredCorrectly == true &&
          previous?.mathAnsweredCorrectly != true) {
        HapticFeedbackUtil.success();
      }
    });

    return GameScaffold(
      title: 'DISTRACTOR MATRIX',
      subtitle: 'Recall cells after solving the math distraction',
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(distractorMatrixNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildHeader(state, context),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.55),
                child: Center(
                  child: _buildMainArea(ref, state, context),
                ),
              ),
              const Spacer(),
              _buildInstruction(state, context),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(DistractorMatrixState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('LEVEL', '${state.currentLevel}/5', DesignSystem.accentAmber, context),
        _buildStatCard('TILES', '${state.targetPattern.length}', DesignSystem.primary, context),
        _buildStatCard('STRIKES', '${state.mathStrikes}/3', DesignSystem.accentBerry, context),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color, BuildContext context) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).colorScheme.surface,
      depth: 2,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainArea(WidgetRef ref, DistractorMatrixState state, BuildContext context) {
    if (state.status == DistractorMatrixStatus.distractor) {
      return _buildMathArea(ref, state, context);
    }
    return _buildBoard(ref, state, context);
  }

  Widget _buildMathArea(WidgetRef ref, DistractorMatrixState state, BuildContext context) {
    final question = state.mathQuestion;
    if (question == null) return const SizedBox.shrink();

    final isCorrect = state.mathAnsweredCorrectly;

    return Padding(
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TangibleContainer(
            color: Theme.of(context).colorScheme.surface,
            depth: 4,
            padding: const EdgeInsets.all(24),
            radius: DesignSystem.radiusMD,
            child: Column(
              children: [
                Text(
                  'COGNITIVE INTERFERENCE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.accentBerry,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: question.options.map((option) {
              Color btnColor = Theme.of(context).colorScheme.surface;
              if (isCorrect != null && option == question.correctAnswer) {
                btnColor = DesignSystem.accentEmerald;
              }

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      ref.read(distractorMatrixNotifierProvider.notifier).answerMath(option);
                    },
                    color: btnColor,
                    depth: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        option.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: isCorrect != null && option == question.correctAnswer
                              ? Colors.white
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(WidgetRef ref, DistractorMatrixState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          padding: const EdgeInsets.all(DesignSystem.spaceXS),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: state.boardSize,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: state.boardSize * state.boardSize,
          itemBuilder: (context, index) {
            return _buildTile(ref, state, index, context);
          },
        ),
      ),
    );
  }

  Widget _buildTile(WidgetRef ref, DistractorMatrixState state, int index, BuildContext context) {
    final isTarget = state.targetPattern.contains(index);
    final isSelected = state.selectedPattern.contains(index);
    final isMemorizing = state.status == DistractorMatrixStatus.memorizing;
    final isSuccess = state.status == DistractorMatrixStatus.success ||
        state.status == DistractorMatrixStatus.completed;
    final isFailure = state.status == DistractorMatrixStatus.failure;

    Color tileColor;
    double depth = 2;

    if (isMemorizing && isTarget) {
      tileColor = DesignSystem.accentAmber;
      depth = 0;
    } else if (isSelected) {
      tileColor = DesignSystem.accentAmber;
      depth = 0;
    } else if (isSuccess && isTarget) {
      tileColor = DesignSystem.accentEmerald;
      depth = 0;
    } else if (isFailure && isTarget) {
      tileColor = DesignSystem.accentAmber.withValues(alpha: 0.5);
      depth = 1;
    } else {
      tileColor = Theme.of(context).colorScheme.surface;
    }

    return TangibleContainer(
      depth: depth,
      radius: DesignSystem.radiusXS,
      color: tileColor,
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ref.read(distractorMatrixNotifierProvider.notifier).selectTile(index);
      },
      child: const SizedBox.expand(),
    );
  }

  Widget _buildInstruction(DistractorMatrixState state, BuildContext context) {
    String text = '';
    Color color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7);

    switch (state.status) {
      case DistractorMatrixStatus.memorizing:
        text = 'MEMORIZE THE PATTERN';
        color = DesignSystem.accentAmber;
        break;
      case DistractorMatrixStatus.distractor:
        text = 'SOLVE THE DISTRACTOR QUESTION!';
        color = DesignSystem.accentBerry;
        break;
      case DistractorMatrixStatus.playing:
        text = 'SELECT THE MEMORIZED CELLS';
        color = DesignSystem.primary;
        break;
      case DistractorMatrixStatus.success:
      case DistractorMatrixStatus.completed:
        text = 'PERFECT RECALL!';
        color = DesignSystem.accentEmerald;
        break;
      case DistractorMatrixStatus.failure:
        text = 'WRONG!';
        color = DesignSystem.error;
        break;
    }

    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: color.withValues(alpha: 0.1),
      radius: DesignSystem.radiusFull,
      depth: 1,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
