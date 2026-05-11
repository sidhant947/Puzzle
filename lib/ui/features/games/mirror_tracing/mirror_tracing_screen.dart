import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'mirror_tracing_provider.dart';

class MirrorTracingScreen extends ConsumerStatefulWidget {
  const MirrorTracingScreen({super.key});

  @override
  ConsumerState<MirrorTracingScreen> createState() => _MirrorTracingScreenState();
}

class _MirrorTracingScreenState extends ConsumerState<MirrorTracingScreen> {
  Offset? _lastTouch;

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'TRACED TO PERFECTION!',
        message: 'Your brain successfully rewired its coordination.',
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          _lastTouch = null;
          // Trigger re-init if needed or just reset
          ref.read(mirrorTracingNotifierProvider.notifier).resetTrace();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mirrorTracingNotifierProvider);
    final notifier = ref.read(mirrorTracingNotifierProvider.notifier);

    ref.listen(mirrorTracingNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('mirror_tracing');
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'Mirror Tracing',
      subtitle: 'Trace the star! Controls are MIRRORED.',
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.canvasSize == Size.zero) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              notifier.initGame(Size(constraints.maxWidth, constraints.maxHeight));
            });
            return const Center(child: CircularProgressIndicator());
          }

          return GestureDetector(
            onPanStart: (details) {
              setState(() => _lastTouch = details.localPosition);
              notifier.updateTrace(details.localPosition);
            },
            onPanUpdate: (details) {
              setState(() => _lastTouch = details.localPosition);
              notifier.updateTrace(details.localPosition);
            },
            onPanEnd: (_) {
              setState(() => _lastTouch = null);
            },
            child: Container(
              color: Colors.white,
              child: CustomPaint(
                size: Size.infinite,
                painter: MirrorTracingPainter(
                  targetPath: state.targetPath,
                  userTrace: state.userTrace,
                  currentTouch: _lastTouch,
                  canvasSize: state.canvasSize,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MirrorTracingPainter extends CustomPainter {
  final List<Offset> targetPath;
  final List<Offset> userTrace;
  final Offset? currentTouch;
  final Size canvasSize;

  MirrorTracingPainter({
    required this.targetPath,
    required this.userTrace,
    required this.currentTouch,
    required this.canvasSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw target path
    final pathPaint = Paint()
      ..color = DesignSystem.outlineVariant
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (targetPath.isNotEmpty) {
      path.moveTo(targetPath.first.dx, targetPath.first.dy);
      for (int i = 1; i < targetPath.length; i++) {
        path.lineTo(targetPath[i].dx, targetPath[i].dy);
      }
    }
    canvas.drawPath(path, pathPaint);

    // Draw user trace
    final tracePaint = Paint()
      ..color = DesignSystem.primary
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final tracePath = Path();
    if (userTrace.isNotEmpty) {
      tracePath.moveTo(userTrace.first.dx, userTrace.first.dy);
      for (int i = 1; i < userTrace.length; i++) {
        // Only draw lines between points that are close (to avoid jumps when starting new pan)
        if ((userTrace[i] - userTrace[i-1]).distance < 100) {
           tracePath.lineTo(userTrace[i].dx, userTrace[i].dy);
        } else {
           tracePath.moveTo(userTrace[i].dx, userTrace[i].dy);
        }
      }
    }
    canvas.drawPath(tracePath, tracePaint);

    // Draw touch markers
    if (currentTouch != null) {
      // Actual touch (faint)
      canvas.drawCircle(currentTouch!, 10, Paint()..color = DesignSystem.ink.withValues(alpha: 0.1));
      
      // Mirrored cursor (bright)
      final mirroredX = canvasSize.width - currentTouch!.dx;
      final mirroredY = canvasSize.height - currentTouch!.dy;
      canvas.drawCircle(Offset(mirroredX, mirroredY), 15, Paint()..color = DesignSystem.accentBerry);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
