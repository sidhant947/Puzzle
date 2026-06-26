import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/ui/core/juice/game_scaffold.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'path_intersect_provider.dart';

class PathIntersectScreen extends ConsumerStatefulWidget {
  const PathIntersectScreen({super.key});

  @override
  ConsumerState<PathIntersectScreen> createState() => _PathIntersectScreenState();
}

class _PathIntersectScreenState extends ConsumerState<PathIntersectScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(pathIntersectNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => GameCompletionDialog(
        title: isVictory ? l10n.pathIntersectTitle : AppLocalizations.of(context)!.gameOver,
        message: isVictory ? l10n.pathIntersectCongrats : AppLocalizations.of(context)!.loseTryAgainSolution,
        isVictory: isVictory,
        onHome: () {
          Navigator.of(dialogCtx).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(dialogCtx).pop();
          ref.read(pathIntersectNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pathIntersectNotifierProvider);

    ref.listen(pathIntersectNotifierProvider, (prev, next) {
      if (next.isVictory && !(prev?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(true);
        });
      } else if (next.isFailed && !(prev?.isFailed ?? false)) {
        HapticFeedbackUtil.error();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(false);
        });
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'path_intersect'),
      onReset: () => ref.read(pathIntersectNotifierProvider.notifier).initGame(),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    AppLocalizations.of(context)!.phaseFindTheTarget,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        fontSize: DesignSystem.fontSizeSM),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                        ),
                        child: Stack(
                          children: [
                            _buildGrid(context, state),
                            _buildPaths(state),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
    );
  }

  Widget _buildGrid(BuildContext context, PathIntersectState state) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: state.gridSize,
      ),
      itemCount: state.gridSize * state.gridSize,
      itemBuilder: (context, index) {
        final x = index % state.gridSize;
        final y = index ~/ state.gridSize;
        final isSelected = state.selectedPoint == Point(x, y);

        return GestureDetector(
          onTap: () {
            HapticFeedbackUtil.selection();
            ref.read(pathIntersectNotifierProvider.notifier).selectPoint(x, y);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)),
              color: isSelected
                  ? (state.isVictory ? Colors.green.withValues(alpha: 0.3) : Colors.red.withValues(alpha: 0.3))
                  : null,
            ),
            child: isSelected
                ? Center(
                    child: Icon(state.isVictory ? Icons.check : Icons.close,
                        size: 16, color: state.isVictory ? Colors.green : Colors.red))
                : null,
          ),
        );
      },
    );
  }

  Widget _buildPaths(PathIntersectState state) {
    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: PathsPainter(state.path1.toList(), state.path2.toList(), state.gridSize),
      ),
    );
  }
}

class PathsPainter extends CustomPainter {
  final List<Point<int>> path1;
  final List<Point<int>> path2;
  final int gridSize;

  PathsPainter(this.path1, this.path2, this.gridSize);

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / gridSize;
    
    final paint1 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final paint2 = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    _drawPath(canvas, path1, cellSize, paint1);
    _drawPath(canvas, path2, cellSize, paint2);
  }

  void _drawPath(Canvas canvas, List<Point<int>> points, double cellSize, Paint paint) {
    if (points.isEmpty) {
      return;
    }
    
    final path = Path();
    path.moveTo((points.first.x + 0.5) * cellSize, (points.first.y + 0.5) * cellSize);
    
    for (int i = 1; i < points.length; i++) {
      path.lineTo((points[i].x + 0.5) * cellSize, (points[i].y + 0.5) * cellSize);
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
