import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'trail_making_provider.dart';

class TrailMakingScreen extends ConsumerStatefulWidget {
  const TrailMakingScreen({super.key});

  @override
  ConsumerState<TrailMakingScreen> createState() => _TrailMakingScreenState();
}

class _TrailMakingScreenState extends ConsumerState<TrailMakingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(trailMakingNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 3;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('trail_making');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'TRACKER PRO!' : 'LOST TRAIL',
        message: 'You completed $score trails! This test measures your visual search speed and mental flexibility.',
        onPlayAgain: () {
          ref.read(trailMakingNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(trailMakingNotifierProvider);
    final notifier = ref.read(trailMakingNotifierProvider.notifier);

    ref.listen(trailMakingNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'TRAIL MAKING',
      subtitle: 'Connect the numbers in order (1 -> 2 -> 3...) as fast as you can.',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      Expanded(
                        child: Stack(
                          children: [
                            ...state.points.asMap().entries.map((entry) {
                              final index = entry.key;
                              final point = entry.value;
                              final isCompleted = index < state.nextIndex;
                              final isNext = index == state.nextIndex;

                              return Positioned(
                                left: point.x * constraints.maxWidth - 25,
                                top: point.y * (constraints.maxHeight - 150) - 25,
                                child: TangibleButton(
                                  onTap: () {
                                    HapticFeedbackUtil.lightImpact();
                                    notifier.onPointTap(index);
                                  },
                                  radius: 25,
                                  color: isCompleted 
                                      ? DesignSystem.success 
                                      : (isNext ? DesignSystem.primary : DesignSystem.surface),
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isNext ? Colors.white : DesignSystem.outline,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        point.label,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: isCompleted || isNext ? Colors.white : DesignSystem.ink,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildStats(TrailMakingState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('TRAILS', '${state.score}', DesignSystem.success, isSmall),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color, bool isSmall) {
    return TangibleContainer(
      color: DesignSystem.surface,
      shadowColor: DesignSystem.outlineVariant,
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 12 : 16, 
        vertical: isSmall ? 4 : 8
      ),
      child: Column(
        children: [
          Text(
            label, 
            style: TextStyle(
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
              color: DesignSystem.inkSlate,
              letterSpacing: 1.5,
            ),
          ),
          Text(
            value, 
            style: TextStyle(
              fontWeight: FontWeight.w900, 
              fontSize: isSmall ? 18 : 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
