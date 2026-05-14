import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'trace_path_provider.dart';

class TracePathScreen extends ConsumerStatefulWidget {
  const TracePathScreen({super.key});

  @override
  ConsumerState<TracePathScreen> createState() => _TracePathScreenState();
}

class _TracePathScreenState extends ConsumerState<TracePathScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      ref.read(tracePathNotifierProvider.notifier).initGame(Size(size.width, size.height * 0.6));
    });
  }

  void _showGameOverDialog(int score, double accuracy) {
    final l10n = AppLocalizations.of(context)!;
    bool won = accuracy >= 0.7;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('trace_path');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'STEADY HANDS!' : 'SHAKY LINE',
        message: 'Your accuracy was ${(accuracy * 100).toInt()}%!',
        isVictory: won,
        onPlayAgain: () {
          final size = MediaQuery.of(context).size;
          ref.read(tracePathNotifierProvider.notifier).initGame(Size(size.width, size.height * 0.6));
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
    final state = ref.watch(tracePathNotifierProvider);
    final notifier = ref.read(tracePathNotifierProvider.notifier);

    ref.listen(tracePathNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.accuracy >= 0.7) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.vibrate();
        }
        _showGameOverDialog(next.score, next.accuracy);
      }
    });

    if (state.isLoading) {
      return GameScaffold(title: l10n.tracePathTitle.toUpperCase(), body: Center(child: CircularProgressIndicator()));
    }

    return GameScaffold(
      title: 'TRACE PATH',
      subtitle: l10n.tracePathSubtitle,
      body: Column(
        children: [
          SizedBox(height: DesignSystem.spaceLG),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(DesignSystem.spaceMD),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.2), width: 2),
              ),
              child: Listener(
                onPointerDown: (event) => notifier.onPointerDown(event.localPosition),
                onPointerMove: (event) => notifier.onPointerMove(event.localPosition),
                onPointerUp: (event) => notifier.onPointerUp(),
                child: CustomPaint(
                  painter: _PathPainter(state.targetPath, state.userPath, state.accuracy, state.isGameOver),
                  size: Size.infinite,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(DesignSystem.spaceXL),
            child: Text(
              'TRACE FROM LEFT TO RIGHT',
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
    );
  }
}

class _PathPainter extends CustomPainter {
  final List<Offset> targetPath;
  final List<Offset> userPath;
  final double accuracy;
  final bool isGameOver;

  _PathPainter(this.targetPath, this.userPath, this.accuracy, this.isGameOver);

  @override
  void paint(Canvas canvas, Size size) {
    if (targetPath.isEmpty) return;

    final targetPaint = Paint()
      ..color = DesignSystem.primary.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final guidelinePaint = Paint()
      ..color = DesignSystem.primary.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final markerPaint = Paint()
      ..color = DesignSystem.primary.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final userPaint = Paint()
      ..color = isGameOver ? (accuracy >= 0.7 ? DesignSystem.success : DesignSystem.error) : DesignSystem.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Draw Target Path
    final targetPathObj = Path();
    targetPathObj.moveTo(targetPath[0].dx, targetPath[0].dy);
    for (int i = 1; i < targetPath.length; i++) {
      targetPathObj.lineTo(targetPath[i].dx, targetPath[i].dy);
    }
    canvas.drawPath(targetPathObj, targetPaint);
    canvas.drawPath(targetPathObj, guidelinePaint);

    // Draw Markers
    canvas.drawCircle(targetPath.first, 12, markerPaint);
    canvas.drawCircle(targetPath.last, 12, markerPaint);

    // Draw User Path
    if (userPath.isNotEmpty) {
      final userPathObj = Path();
      userPathObj.moveTo(userPath[0].dx, userPath[0].dy);
      for (int i = 1; i < userPath.length; i++) {
        userPathObj.lineTo(userPath[i].dx, userPath[i].dy);
      }
      canvas.drawPath(userPathObj, userPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _PathPainter oldDelegate) {
    return true;
  }
}
