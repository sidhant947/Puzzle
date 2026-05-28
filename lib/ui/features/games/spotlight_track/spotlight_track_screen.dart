import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'spotlight_track_engine.dart';
import 'spotlight_track_provider.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class SpotlightTrackScreen extends ConsumerWidget {
  const SpotlightTrackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(spotlightTrackNotifierProvider);
    final notifier = ref.read(spotlightTrackNotifierProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    ref.listen(spotlightTrackNotifierProvider, (previous, next) {
      if (next.isCompleted && !(previous?.isCompleted ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'VICTORY',
            message: 'Incredible spatial tracking! You scored ${next.score} points.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == SpotlightTrackStatus.successFeedback && previous?.status != SpotlightTrackStatus.successFeedback) {
        HapticFeedbackUtil.selection();
      } else if (next.status == SpotlightTrackStatus.failFeedback && previous?.status != SpotlightTrackStatus.failFeedback) {
        HapticFeedbackUtil.vibrate();
      }
    });

    return GameScaffold(
      title: 'Spotlight Track',
      subtitle: 'Track the Object in the Dark - Tap its Ending Spot',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.reset();
      },
      onHowToPlay: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('HOW TO PLAY'),
            content: const Text(
              'A bright cyan target will move along a path. The screen will be dark except for a sweeping spotlight.\n\n'
              'The target is ONLY visible when the spotlight shines on it.\n\n'
              'Mentally track the target when it enters the dark. Once it stops moving, tap where you think it ended.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('GOT IT'),
              ),
            ],
          ),
        );
      },
      body: Column(
        children: [
          // Round & Score info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TangibleContainer(
                  depth: 2.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  radius: DesignSystem.radiusSM,
                  child: Text(
                    'ROUND: ${state.currentRound}/${state.totalRounds}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
                TangibleContainer(
                  depth: 2.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  radius: DesignSystem.radiusSM,
                  child: Text(
                    'SCORE: ${state.score}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),

          // Central board widget containing the animation setup
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: TangibleContainer(
                  color: const Color(0xFF070B19), // Dark AMOLED compatible space
                  shadowColor: isDark ? Colors.black : DesignSystem.outline,
                  depth: 6.0,
                  radius: DesignSystem.radiusLG,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 1),
                    child: _SpotlightTrackingBoard(
                      state: state,
                      notifier: notifier,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
        ],
      ),
    );
  }
}

class _SpotlightTrackingBoard extends StatefulWidget {
  final SpotlightTrackState state;
  final SpotlightTrackNotifier notifier;

  const _SpotlightTrackingBoard({
    required this.state,
    required this.notifier,
  });

  @override
  State<_SpotlightTrackingBoard> createState() => _SpotlightTrackingBoardState();
}

class _SpotlightTrackingBoardState extends State<_SpotlightTrackingBoard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final SpotlightTrackEngine _engine = SpotlightTrackEngine();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.notifier.finishTracking();
      }
    });
  }

  @override
  void didUpdateWidget(covariant _SpotlightTrackingBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.status == SpotlightTrackStatus.tracking &&
        oldWidget.state.status != SpotlightTrackStatus.tracking) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        final objPos = _engine.getPositionOnPath(widget.state.level.objectPath, t);
        final spotPos = _engine.getPositionOnPath(widget.state.level.spotlightPath, t);
        final spotlightRadius = widget.state.level.spotlightRadius;
        final isVisible = _engine.isVisible(objPos, spotPos, spotlightRadius);

        return GestureDetector(
          onTapDown: (details) {
            if (widget.state.status != SpotlightTrackStatus.answering) return;

            final RenderBox box = context.findRenderObject() as RenderBox;
            final localPos = box.globalToLocal(details.globalPosition);
            final normTapX = localPos.dx / box.size.width;
            final normTapY = localPos.dy / box.size.height;

            HapticFeedbackUtil.lightImpact();
            widget.notifier.submitTap(Point2D(normTapX, normTapY));
          },
          child: CustomPaint(
            painter: _SpotlightPainter(
              status: widget.state.status,
              objPos: objPos,
              spotPos: spotPos,
              spotlightRadius: spotlightRadius,
              isVisible: isVisible,
              level: widget.state.level,
              tapPos: widget.state.tapPosition,
            ),
            child: widget.state.status == SpotlightTrackStatus.idle
                ? _buildIdleOverlay()
                : widget.state.status == SpotlightTrackStatus.answering
                    ? _buildAnsweringOverlay()
                    : const SizedBox.expand(),
          ),
        );
      },
    );
  }

  Widget _buildIdleOverlay() {
    return Container(
      color: Colors.black.withValues(alpha: 0.2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.track_changes_rounded,
              size: 44,
              color: DesignSystem.gameCyan,
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            const Text(
              'TRACK TARGET',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            TangibleButton(
              onTap: () {
                HapticFeedbackUtil.selection();
                widget.notifier.startTracking();
              },
              color: DesignSystem.gameCyan,
              shadowColor: const Color(0xFF0891B2),
              child: const Text('START ROUND'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnsweringOverlay() {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: IgnorePointer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceMD),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1),
                ),
                child: const Text(
                  'TAP WHERE TARGET STOPPED!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  final SpotlightTrackStatus status;
  final Point2D objPos;
  final Point2D spotPos;
  final double spotlightRadius;
  final bool isVisible;
  final TrackingLevel level;
  final Point2D? tapPos;

  _SpotlightPainter({
    required this.status,
    required this.objPos,
    required this.spotPos,
    required this.spotlightRadius,
    required this.isVisible,
    required this.level,
    this.tapPos,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    if (status == SpotlightTrackStatus.tracking || status == SpotlightTrackStatus.idle || status == SpotlightTrackStatus.answering) {
      // 1. Draw partial overlay to represent the dark screen
      final bgPaint = Paint()..color = const Color(0xFF050814);
      canvas.drawRect(Rect.fromLTWH(0, 0, w, h), bgPaint);

      if (status == SpotlightTrackStatus.tracking) {
        // 2. Draw spotlight illumination circle
        final spotPaint = Paint()
          ..color = const Color(0xFF1E293B).withValues(alpha: 0.3)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(Offset(spotPos.x * w, spotPos.y * h), spotlightRadius * w, spotPaint);

        final spotBorder = Paint()
          ..color = Colors.white.withValues(alpha: 0.15)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;
        canvas.drawCircle(Offset(spotPos.x * w, spotPos.y * h), spotlightRadius * w, spotBorder);
      }

      // 3. Draw object if it falls inside the spotlight circle OR we are in IDLE state (to show target at start)
      if (status == SpotlightTrackStatus.idle || (status == SpotlightTrackStatus.tracking && isVisible)) {
        final objPaint = Paint()
          ..color = DesignSystem.gameCyan
          ..style = PaintingStyle.fill;

        // Glow ring
        final glowPaint = Paint()
          ..color = DesignSystem.gameCyan.withValues(alpha: 0.4)
          ..style = PaintingStyle.fill;

        canvas.drawCircle(Offset(objPos.x * w, objPos.y * h), 16.0, glowPaint);
        canvas.drawCircle(Offset(objPos.x * w, objPos.y * h), 8.0, objPaint);
      }
    } else if (status == SpotlightTrackStatus.successFeedback || status == SpotlightTrackStatus.failFeedback) {
      // Reveal everything in feedback mode
      final bgPaint = Paint()..color = const Color(0xFF0F172A).withValues(alpha: 0.85);
      canvas.drawRect(Rect.fromLTWH(0, 0, w, h), bgPaint);

      // Draw the full trajectory path of the target
      final pathPaint = Paint()
        ..color = Colors.white.withValues(alpha: 0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      final path = Path();
      path.moveTo(level.objectPath[0].x * w, level.objectPath[0].y * h);
      for (int i = 1; i < level.objectPath.length; i++) {
        path.lineTo(level.objectPath[i].x * w, level.objectPath[i].y * h);
      }
      canvas.drawPath(path, pathPaint);

      // Draw actual target final position
      final finalPos = level.finalPosition;
      final actualPaint = Paint()
        ..color = DesignSystem.success
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(finalPos.x * w, finalPos.y * h), 10.0, actualPaint);

      // Draw pulse glow around final position
      final actualGlow = Paint()
        ..color = DesignSystem.success.withValues(alpha: 0.3)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(finalPos.x * w, finalPos.y * h), 18.0, actualGlow);

      // Draw user's tap
      if (tapPos != null) {
        final tapPaint = Paint()
          ..color = status == SpotlightTrackStatus.successFeedback ? DesignSystem.success : DesignSystem.error
          ..style = PaintingStyle.fill;
        canvas.drawCircle(Offset(tapPos!.x * w, tapPos!.y * h), 6.0, tapPaint);

        // Draw line connecting Tap to Final
        final linePaint = Paint()
          ..color = Colors.white.withValues(alpha: 0.4)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        canvas.drawLine(
          Offset(tapPos!.x * w, tapPos!.y * h),
          Offset(finalPos.x * w, finalPos.y * h),
          linePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SpotlightPainter oldDelegate) => true;
}
