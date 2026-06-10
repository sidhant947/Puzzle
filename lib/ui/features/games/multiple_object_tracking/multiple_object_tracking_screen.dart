import 'package:puzzle/l10n/app_localizations.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'multiple_object_tracking_provider.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class MultipleObjectTrackingScreen extends ConsumerWidget {
  const MultipleObjectTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(mOTNotifierProvider);

    ref.listen(mOTNotifierProvider, (previous, next) {
      if (next.phase == MOTPhase.result && previous?.phase != MOTPhase.result) {
        HapticFeedbackUtil.victory();
        _showResultDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.multipleObjectTrackingTitle.toUpperCase(),
      subtitle: l10n.multipleObjectTrackingSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(mOTNotifierProvider.notifier).resetGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boardSize = min(constraints.maxWidth, constraints.maxHeight * 0.7);
          
          return Column(
            children: [
              const Spacer(),
              Center(
                child: _buildBoard(context, ref, state, boardSize),
              ),
              const Spacer(),
              _buildControls(context, ref, state, Size(boardSize, boardSize)),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, MOTState state, double size) {
    return Builder(
      builder: (boardContext) {
        return GestureDetector(
          onTapDown: (details) {
            if (state.phase == MOTPhase.selection) {
              final RenderBox box = boardContext.findRenderObject() as RenderBox;
              final localOffset = box.globalToLocal(details.globalPosition);
              
              // Find which ball was tapped
              for (var ball in state.balls) {
                final distance = (ball.position - localOffset).distance;
                if (distance <= 20.0 * 1.5) {
                  ref.read(mOTNotifierProvider.notifier).toggleBallSelection(ball.id);
                  HapticFeedbackUtil.lightImpact();
                  break;
                }
              }
            }
          },
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 2),
              child: CustomPaint(
                painter: MOTPainter(state, context),
                size: Size(size, size),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildControls(BuildContext context, WidgetRef ref, MOTState state, Size size) {
    if (state.phase == MOTPhase.initial) {
      return TangibleButton(
        onTap: () {
          HapticFeedbackUtil.mediumImpact();
          ref.read(mOTNotifierProvider.notifier).initGame(size);
        },
        color: DesignSystem.primary,
        child: const Text(
          'START TRACKING',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      );
    }

    if (state.phase == MOTPhase.selection) {
      return Text(
        'SELECT THE TARGETS',
        style: TextStyle(
          color: DesignSystem.primary,
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
        ),
      );
    }

    if (state.phase == MOTPhase.moving) {
      return Text(
        'TRACKING...',
        style: TextStyle(
          color: DesignSystem.primary.withValues(alpha: 0.7),
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
        ),
      );
    }

    return const SizedBox(height: 48);
  }

  void _showResultDialog(BuildContext context, WidgetRef ref) {
    final state = ref.read(mOTNotifierProvider);
    final targetCount = state.balls.where((b) => b.isTarget).length;
    final correctCount = state.balls.where((b) => b.isSelected && b.isTarget).length;
    final isVictory = correctCount == targetCount;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'ROUND COMPLETE' : 'TRY AGAIN',
        message: isVictory 
          ? 'You found all targets!'
          : 'You missed some targets. Keep practicing!',
        isVictory: isVictory,
        onHome: () => Navigator.of(context).popUntil((route) => route.isFirst),
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(mOTNotifierProvider.notifier).resetGame();
        },
      ),
    );
  }
}

class MOTPainter extends CustomPainter {
  final MOTState state;
  final BuildContext context;

  MOTPainter(this.state, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    const ballRadius = 20.0;
    for (var ball in state.balls) {
      // Draw shadow
      canvas.drawCircle(
        ball.position + const Offset(0, 2),
        ballRadius,
        Paint()..color = Colors.black.withValues(alpha: 0.1),
      );

      // Draw ball
      bool isSelected = ball.isSelected;
      bool shouldHighlight = state.phase == MOTPhase.highlight && ball.isTarget;
      
      if (shouldHighlight) {
        paint.color = DesignSystem.primary;
      } else if (isSelected) {
        paint.color = DesignSystem.primary.withValues(alpha: 0.6);
      } else if (state.phase == MOTPhase.result && ball.isTarget) {
        paint.color = DesignSystem.success;
      } else {
        paint.color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2);
      }

      canvas.drawCircle(ball.position, ballRadius, paint);

      // Add a small shine
      paint.color = Colors.white.withValues(alpha: 0.3);
      canvas.drawCircle(ball.position - Offset(ballRadius * 0.3, ballRadius * 0.3), ballRadius * 0.2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MOTPainter oldDelegate) => true;
}
