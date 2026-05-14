import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'orbit_tap_provider.dart';

class OrbitTapScreen extends ConsumerStatefulWidget {
  const OrbitTapScreen({super.key});

  @override
  ConsumerState<OrbitTapScreen> createState() => _OrbitTapScreenState();
}

class _OrbitTapScreenState extends ConsumerState<OrbitTapScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
      ref.read(orbitTapNotifierProvider.notifier).updateAngle(_controller.value * 2 * pi);
    });
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orbitTapNotifierProvider.notifier).initGame();
      _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 10;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('orbit_tap');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'ORBIT MASTER!' : 'OUT OF SYNC',
        message: 'You successfully tapped $score times!',
        isVictory: won,
        onPlayAgain: () {
          ref.read(orbitTapNotifierProvider.notifier).initGame();
          _controller.repeat();
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(orbitTapNotifierProvider);
    
    ref.listen(orbitTapNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _controller.stop();
        HapticFeedbackUtil.vibrate();
        _showGameOverDialog(next.score);
      }
      if (next.speed != (previous?.speed ?? 1.0)) {
        _controller.duration = Duration(milliseconds: (4000 / next.speed).toInt());
        if (_controller.isAnimating) _controller.repeat();
      }
    });

    return GameScaffold(
      title: l10n.orbitTapTitle.toUpperCase(),
      subtitle: l10n.orbitTapSubtitle,
      body: GestureDetector(
        onTapDown: (_) {
          HapticFeedbackUtil.lightImpact();
          ref.read(orbitTapNotifierProvider.notifier).onTap();
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStat('LIVES', '❤' * state.lives, DesignSystem.error),
                    _buildStat('SCORE', '${state.score}', DesignSystem.primary),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double boardSize = min(constraints.maxWidth, constraints.maxHeight);
                        final double orbitRadius = (boardSize / 2) - 40; // 40px safety margin
                        final Offset center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);

                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Orbit Path
                            Center(
                              child: Container(
                                width: orbitRadius * 2,
                                height: orbitRadius * 2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.2),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            // The Gate
                            _buildGate(state.gateAngle, state.gateWidth, orbitRadius, center),
                            // Rotating Balls
                            _buildOrbitingBalls(state.currentAngle, orbitRadius, center),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(DesignSystem.spaceXL),
                child: Text(
                  'TAP ANYWHERE TO SYNC',
                  style: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }

  Widget _buildGate(double angle, double width, double radius, Offset center) {
    return CustomPaint(
      painter: _GatePainter(angle, width, radius, center),
      size: Size.infinite,
    );
  }

  Widget _buildOrbitingBalls(double angle, double radius, Offset center) {
    // Ball 1
    final x1 = center.dx + radius * cos(angle);
    final y1 = center.dy + radius * sin(angle);
    
    // Ball 2 (Opposite side)
    final x2 = center.dx + radius * cos(angle + pi);
    final y2 = center.dy + radius * sin(angle + pi);

    return Stack(
      children: [
        _buildBall(x1, y1, DesignSystem.primary),
        _buildBall(x2, y2, DesignSystem.accentAmber),
      ],
    );
  }

  Widget _buildBall(double x, double y, Color color) {
    return Positioned(
      left: x - 12,
      top: y - 12,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.white, width: 3),
        ),
      ),
    );
  }
}

class _GatePainter extends CustomPainter {
  final double angle;
  final double width;
  final double radius;
  final Offset center;

  _GatePainter(this.angle, this.width, this.radius, this.center);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = DesignSystem.success.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      angle - width,
      width * 2,
      false,
      paint,
    );
    
    // Draw the bright edges
    paint.color = DesignSystem.success;
    paint.strokeWidth = 4;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      angle - width,
      width * 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _GatePainter oldDelegate) {
    return oldDelegate.angle != angle || oldDelegate.width != width;
  }
}
