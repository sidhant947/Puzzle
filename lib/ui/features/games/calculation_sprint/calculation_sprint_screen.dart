import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import 'calculation_sprint_provider.dart';

class CalculationSprintScreen extends ConsumerWidget {
  const CalculationSprintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculationSprintNotifierProvider);
    final notifier = ref.read(calculationSprintNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(calculationSprintNotifierProvider, (previous, next) {
      if (next.status == SprintStatus.gameOver && 
          previous?.status != SprintStatus.gameOver) {
        if (next.score >= 15) {
          HapticFeedbackUtil.victory();
          _showGameOverDialog(context, ref, next, true);
        } else {
          HapticFeedbackUtil.error();
          _showGameOverDialog(context, ref, next, false);
        }
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('CALCULATION SPRINT'),
        actions: [
          IconButton(
            onPressed: () {
              HapticFeedbackUtil.lightImpact();
              notifier.reset();
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildHeader(context, state),
            const Spacer(),
            if (state.status == SprintStatus.ready)
              _buildReadyState(context, notifier)
            else if (state.status == SprintStatus.playing && state.currentProblem != null)
              _buildPlayingState(context, state, notifier)
            else if (state.status == SprintStatus.gameOver)
                _buildGameOverState(context, state, notifier),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, CalculationSprintState state) {
    final theme = Theme.of(context);
    final isLowTime = state.timeRemaining <= 10 && state.timeRemaining > 0;
    final timeColor = isLowTime ? DesignSystem.lightError : DesignSystem.gameEmerald;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(context, 'SCORE', state.score.toString(), DesignSystem.gameEmerald),
          _buildStatCard(context, 'TIME', '${state.timeRemaining}s', timeColor, animate: isLowTime),
          _buildStatCard(context, 'BEST', state.bestScore.toString(), DesignSystem.gameEmerald),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, Color color, {bool animate = false}) {
    final theme = Theme.of(context);
    
    Widget content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(color: color, fontWeight: FontWeight.w900),
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

  Widget _buildReadyState(BuildContext context, CalculationSprintNotifier notifier) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer_rounded, size: 64, color: DesignSystem.gameEmerald.withValues(alpha: 0.8)),
        const SizedBox(height: 24),
        Text(
          '60 SECONDS',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            color: DesignSystem.gameEmerald,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Solve as many equations as possible.\nWrong answers deduct 3 seconds!',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () {
            HapticFeedbackUtil.selectionClick();
            notifier.startGame();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignSystem.gameEmerald,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
          ),
          child: const Text('START SPRINT'),
        ),
      ],
    );
  }

  Widget _buildPlayingState(BuildContext context, CalculationSprintState state, CalculationSprintNotifier notifier) {
    final theme = Theme.of(context);
    final problem = state.currentProblem!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            problem.equation,
            style: theme.textTheme.displayLarge?.copyWith(
              fontSize: 64,
              fontWeight: FontWeight.w900,
              letterSpacing: 4.0,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '=',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(height: 48),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2.0,
            children: problem.options.map((option) {
              return ElevatedButton(
                onPressed: () {
                  if (option == problem.answer) {
                    HapticFeedbackUtil.lightImpact();
                  } else {
                    HapticFeedbackUtil.error();
                  }
                  notifier.submitAnswer(option);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.surface,
                  foregroundColor: theme.colorScheme.primary,
                  elevation: 0,
                  side: BorderSide(
                    color: theme.colorScheme.outline.withValues(alpha: 0.2),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  ),
                ),
                child: Text(
                  option.toString(),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGameOverState(BuildContext context, CalculationSprintState state, CalculationSprintNotifier notifier) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'TIME IS UP!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
          ),
        ),
      ],
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, CalculationSprintState state, bool isGoalReached) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusXL)),
        title: Text(
          isGoalReached ? 'GOAL REACHED!' : 'TIME IS UP',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: isGoalReached ? DesignSystem.gameEmerald : DesignSystem.gameOrange,
          ),
        ),
        content: Text(
          isGoalReached 
            ? 'Excellent calculation speed! You scored ${state.score} points and completed the daily goal.' 
            : 'You scored ${state.score} points. You need at least 15 points to complete the daily goal.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(calculationSprintNotifierProvider.notifier).reset();
                  },
                  child: const Text('PLAY AGAIN'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Pop dialog
                    Navigator.pop(context); // Pop screen
                  },
                  child: Text(
                    'BACK TO HUB',
                    style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
