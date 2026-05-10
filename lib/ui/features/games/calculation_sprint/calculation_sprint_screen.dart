import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'calculation_sprint_provider.dart';

class CalculationSprintScreen extends ConsumerWidget {
  const CalculationSprintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculationSprintNotifierProvider);
    final notifier = ref.read(calculationSprintNotifierProvider.notifier);

    ref.listen(calculationSprintNotifierProvider, (previous, next) {
      if (next.status == SprintStatus.gameOver &&
          previous?.status != SprintStatus.gameOver) {
        final isGoalReached = next.score >= 15;
        if (isGoalReached) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.error();
        }

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: isGoalReached ? 'GOAL REACHED!' : 'TIME IS UP',
            message: isGoalReached
                ? 'Excellent calculation speed! You scored ${next.score} points.'
                : 'You scored ${next.score} points. Try to beat your best!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(calculationSprintNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'CALCULATION SPRINT',
      subtitle: 'Solve as many equations as possible in 60 seconds.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.lightImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded,
              size: 20, color: DesignSystem.ink),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceSM),
              _buildHeader(state),
              const Spacer(),
              if (state.status == SprintStatus.ready)
                _buildReadyState(notifier)
              else if (state.status == SprintStatus.playing &&
                  state.currentProblem != null)
                _buildPlayingState(state, notifier)
              else if (state.status == SprintStatus.gameOver)
                _buildGameOverState(),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(CalculationSprintState state) {
    final isLowTime = state.timeRemaining <= 10 && state.timeRemaining > 0;
    final timeColor = isLowTime ? DesignSystem.error : DesignSystem.accentAmber;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: _buildStatCard(
                  'SCORE', state.score.toString(), DesignSystem.accentEmerald)),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
              child: _buildStatCard(
                  'TIME', '${state.timeRemaining}s', timeColor,
                  animate: isLowTime)),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
              child: _buildStatCard(
                  'BEST', state.bestScore.toString(), DesignSystem.primary)),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color,
      {bool animate = false}) {
    Widget content = TangibleContainer(
      padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceSM),
      color: DesignSystem.surface,
      depth: 3.0,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: DesignSystem.inkSlate.withValues(alpha: 0.6),
              fontWeight: FontWeight.w900,
              fontSize: 10,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

    if (animate) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 1.1),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: content,
      );
    }

    return content;
  }

  Widget _buildReadyState(CalculationSprintNotifier notifier) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.timer_rounded, size: 80, color: DesignSystem.primary),
        const SizedBox(height: DesignSystem.spaceLG),
        const Text(
          '60 SECONDS',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            color: DesignSystem.ink,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        Text(
          'Solve equations quickly.\nWrong answers deduct 3 seconds!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: DesignSystem.inkSlate.withValues(alpha: 0.7),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        TangibleButton(
          onTap: () {
            HapticFeedbackUtil.selectionClick();
            notifier.startGame();
          },
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
          child: const Text('START SPRINT'),
        ),
      ],
    );
  }

  Widget _buildPlayingState(
      CalculationSprintState state, CalculationSprintNotifier notifier) {
    final problem = state.currentProblem!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxHeight < 500;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TangibleContainer(
                color: DesignSystem.ink,
                shadowColor: DesignSystem.inkSlate,
                depth: 6.0,
                padding: EdgeInsets.all(isSmall
                    ? DesignSystem.spaceXL
                    : DesignSystem.spaceXL * 1.5),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight * 0.3,
                    maxWidth: constraints.maxWidth,
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      problem.equation,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4.0,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: isSmall ? 32 : 64),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: isSmall ? 12 : DesignSystem.spaceLG,
                crossAxisSpacing: isSmall ? 12 : DesignSystem.spaceLG,
                childAspectRatio: 2.0,
                children: problem.options.map((option) {
                  return TangibleButton(
                    color: DesignSystem.surface,
                    shadowColor: DesignSystem.outlineVariant,
                    onTap: () {
                      if (option == problem.answer) {
                        HapticFeedbackUtil.lightImpact();
                      } else {
                        HapticFeedbackUtil.error();
                      }
                      notifier.submitAnswer(option);
                    },
                    depth: 3.0,
                    padding: EdgeInsets.zero,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          option.toString(),
                          style: const TextStyle(
                            color: DesignSystem.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
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
      },
    );
  }

  Widget _buildGameOverState() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'TIME IS UP!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            color: DesignSystem.error,
          ),
        ),
      ],
    );
  }
}
