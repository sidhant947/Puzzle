import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pipes_engine.dart';
import 'pipes_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class PipesScreen extends ConsumerWidget {
  const PipesScreen({super.key});

  static const List<Color> pipeColors = [
    DesignSystem.primary,
    DesignSystem.accentBerry,
    DesignSystem.accentEmerald,
    DesignSystem.accentAmber,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pipesNotifierProvider);

    ref.listen(pipesNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'PIPES',
      subtitle: 'Connect matching colored dots with pipes.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(pipesNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildInstructions(),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.6),
                child: Center(
                  child: _buildBoard(ref, state),
                ),
              ),
              const Spacer(),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInstructions() {
    return const TangibleContainer(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: DesignSystem.surface,
      depth: 1,
      radius: DesignSystem.radiusFull,
      child: Text(
        'FILL THE ENTIRE GRID',
        style: TextStyle(
          color: DesignSystem.primary,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildBoard(WidgetRef ref, PipesState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.biggest.shortestSide;
        final cellSize = (boardSize - DesignSystem.spaceSM * 2) / state.level.size;

        return TangibleContainer(
          depth: 4.0,
          color: DesignSystem.ink,
          shadowColor: DesignSystem.ink.withValues(alpha: 0.2),
          padding: const EdgeInsets.all(DesignSystem.spaceSM),
          child: GestureDetector(
            onPanStart: (details) {
              final pos = _getPos(details.localPosition, cellSize);
              ref.read(pipesNotifierProvider.notifier).startPath(pos.x, pos.y);
            },
            onPanUpdate: (details) {
              final pos = _getPos(details.localPosition, cellSize);
              ref.read(pipesNotifierProvider.notifier).updatePath(pos.x, pos.y);
            },
            onPanEnd: (_) {
              ref.read(pipesNotifierProvider.notifier).endPath();
            },
            child: SizedBox(
              width: boardSize - DesignSystem.spaceSM * 2,
              height: boardSize - DesignSystem.spaceSM * 2,
              child: CustomPaint(
                painter: PipesPainter(
                  state: state,
                  cellSize: cellSize,
                  pipeColors: pipeColors,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Point _getPos(Offset localPos, double cellSize) {
    return Point(
      (localPos.dx / cellSize).floor(),
      (localPos.dy / cellSize).floor(),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('pipes');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(pipesNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
        title: 'CONGRATS',
        message: 'You connected all the pipes and filled the grid.',
      ),
    );
  }
}

class PipesPainter extends CustomPainter {
  final PipesState state;
  final double cellSize;
  final List<Color> pipeColors;

  PipesPainter({
    required this.state,
    required this.cellSize,
    required this.pipeColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 0; i <= state.level.size; i++) {
      canvas.drawLine(Offset(i * cellSize, 0), Offset(i * cellSize, size.height), gridPaint);
      canvas.drawLine(Offset(0, i * cellSize), Offset(size.width, i * cellSize), gridPaint);
    }

    for (int i = 0; i < state.paths.length; i++) {
      final path = state.paths[i];
      if (path.isEmpty) continue;

      final paint = Paint()
        ..color = pipeColors[i % pipeColors.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = cellSize * 0.4
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;

      final drawPath = Path();
      drawPath.moveTo(path[0].x * cellSize + cellSize / 2, path[0].y * cellSize + cellSize / 2);
      for (int j = 1; j < path.length; j++) {
        drawPath.lineTo(path[j].x * cellSize + cellSize / 2, path[j].y * cellSize + cellSize / 2);
      }
      canvas.drawPath(drawPath, paint);
    }

    for (int i = 0; i < state.level.pairs.length; i++) {
      final pair = state.level.pairs[i];
      final paint = Paint()..color = pipeColors[i % pipeColors.length];

      for (var point in pair) {
        canvas.drawCircle(
          Offset(point.x * cellSize + cellSize / 2, point.y * cellSize + cellSize / 2),
          cellSize * 0.35,
          paint,
        );
        
        if (state.paths[i].contains(point)) {
           canvas.drawCircle(
            Offset(point.x * cellSize + cellSize / 2, point.y * cellSize + cellSize / 2),
            cellSize * 0.15,
            Paint()..color = Colors.white.withValues(alpha: 0.5),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant PipesPainter oldDelegate) => true;
}
