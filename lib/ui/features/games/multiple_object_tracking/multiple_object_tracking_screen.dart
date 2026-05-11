import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'multiple_object_tracking_provider.dart';
import 'multiple_object_tracking_engine.dart';

class MultipleObjectTrackingScreen extends ConsumerStatefulWidget {
  const MultipleObjectTrackingScreen({super.key});

  @override
  ConsumerState<MultipleObjectTrackingScreen> createState() => _MultipleObjectTrackingScreenState();
}

class _MultipleObjectTrackingScreenState extends ConsumerState<MultipleObjectTrackingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final gameBoxWidth = size.width - 2 * DesignSystem.spaceLG;
      // Use square bounds to match the AspectRatio(1) container
      ref.read(mOTNotifierProvider.notifier).initGame(Size(gameBoxWidth, gameBoxWidth));
    });
  }

  void _showCompletionDialog(bool isVictory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'GREAT FOCUS!' : 'LOST THEM?',
        message: isVictory 
            ? 'You tracked all targets successfully!' 
            : 'Try to keep your eyes on the highlighted ones.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          final size = MediaQuery.of(context).size;
          final gameBoxWidth = size.width - 2 * DesignSystem.spaceLG;
          ref.read(mOTNotifierProvider.notifier).initGame(Size(gameBoxWidth, gameBoxWidth));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mOTNotifierProvider);
    
    ref.listen(mOTNotifierProvider, (previous, next) async {
      if (next.phase == MOTPhase.result && previous?.phase != MOTPhase.result) {
        final correctCount = next.balls.where((b) => b.isSelected && b.isTarget).length;
        final isVictory = correctCount == MOTNotifier.targetCount;
        
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('multiple_object_tracking');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory);
      }
    });

    return GameScaffold(
      title: 'Object Tracking',
      subtitle: _getSubtitle(state.phase),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(color: DesignSystem.outlineVariant, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: DesignSystem.inkSlate.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 2),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTapDown: (details) {
                            if (state.phase == MOTPhase.selection) {
                              _handleTap(details.localPosition, state.balls);
                            }
                          },
                          child: CustomPaint(
                            painter: MOTPainter(
                              balls: state.balls,
                              phase: state.phase,
                            ),
                            size: constraints.biggest,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceXL),
              if (state.phase == MOTPhase.selection)
                Text(
                  'Select the ${MOTNotifier.targetCount} targets',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getSubtitle(MOTPhase phase) {
    switch (phase) {
      case MOTPhase.highlight:
        return 'Memorize the highlighted balls';
      case MOTPhase.moving:
        return 'Track the targets!';
      case MOTPhase.selection:
        return 'Identify the targets';
      default:
        return 'Watch closely';
    }
  }

  void _handleTap(Offset localPosition, List<Ball> balls) {
    for (var ball in balls) {
      if ((ball.position - localPosition).distance < 30) {
        ref.read(mOTNotifierProvider.notifier).toggleBallSelection(ball.id);
        HapticFeedbackUtil.lightImpact();
        break;
      }
    }
  }
}

class MOTPainter extends CustomPainter {
  final List<Ball> balls;
  final MOTPhase phase;

  MOTPainter({required this.balls, required this.phase});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var ball in balls) {
      if (phase == MOTPhase.highlight && ball.isTarget) {
        paint.color = DesignSystem.primary;
      } else if (phase == MOTPhase.selection && ball.isSelected) {
        paint.color = DesignSystem.accentAmber;
      } else if (phase == MOTPhase.result) {
        if (ball.isTarget) {
          paint.color = DesignSystem.success;
        } else if (ball.isSelected && !ball.isTarget) {
          paint.color = DesignSystem.error;
        } else {
          paint.color = DesignSystem.inkSlate.withValues(alpha: 0.3);
        }
      } else {
        paint.color = DesignSystem.inkSlate;
      }

      canvas.drawCircle(ball.position, 20.0, paint);
      
      // Add a small inner circle for better look
      paint.color = Colors.white.withValues(alpha: 0.3);
      canvas.drawCircle(ball.position, 8.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MOTPainter oldDelegate) => true;
}
