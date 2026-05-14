import 'package:puzzle/l10n/app_localizations.dart';
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
        title: 'Mirror Tracing'.toUpperCase(),
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
    final l10n = AppLocalizations.of(context)!;
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
      subtitle: l10n.mirrorTracingSubtitle,
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
              color: Theme.of(context).colorScheme.surface,
              child: CustomPaint(
                size: Size.infinite,
                painter: MirrorTracingPainter(
                  targetPath: state.targetPath,
                  userTrace: state.userTrace,
                  currentTouch: _lastTouch,
                  canvasSize: state.canvasSize,
                  segmentsVisited: state.segmentsVisited,
                  activeSegmentIndex: state.activeSegmentIndex,
                  context: context,
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
  final List<bool> segmentsVisited;
  final int activeSegmentIndex;
  final BuildContext context;

  MirrorTracingPainter({
    required this.targetPath,
    required this.userTrace,
    required this.currentTouch,
    required this.canvasSize,
    required this.segmentsVisited,
    required this.activeSegmentIndex,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw target path segments with state colors
    for (int i = 0; i < targetPath.length - 1; i++) {
      Color segmentColor = Theme.of(context).colorScheme.outline;
      if (segmentsVisited[i]) {
        segmentColor = DesignSystem.accentEmerald;
      } else if (i == activeSegmentIndex) {
        segmentColor = DesignSystem.accentAmber;
      }

      final segmentPaint = Paint()
        ..color = segmentColor
        ..strokeWidth = 35
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      canvas.drawLine(targetPath[i], targetPath[i + 1], segmentPaint);
    }

    // Draw user trace
    final tracePaint = Paint()
      ..color = DesignSystem.primary
      ..strokeWidth = 6
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

    // Draw START / END markers
    if (targetPath.isNotEmpty) {
      _drawMarker(canvas, targetPath.first, 'START', DesignSystem.success);
      _drawMarker(canvas, targetPath.last, 'END', DesignSystem.error);
    }

    // Draw touch markers
    if (currentTouch != null) {
      // Actual touch (very faint)
      canvas.drawCircle(currentTouch!, 10, Paint()..color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05));
      
      // Mirrored cursor (bright)
      final mirroredX = canvasSize.width - currentTouch!.dx;
      final mirroredY = currentTouch!.dy; // Only X mirrored
      canvas.drawCircle(Offset(mirroredX, mirroredY), 15, Paint()..color = DesignSystem.accentBerry);
    }
  }

  void _drawMarker(Canvas canvas, Offset position, String text, Color color) {
    final paint = Paint()..color = color;
    canvas.drawCircle(position, 12, paint);
    
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position - Offset(textPainter.width / 2, textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
