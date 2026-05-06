import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pipes_engine.dart';
import 'pipes_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';

class PipesScreen extends ConsumerWidget {
  const PipesScreen({super.key});

  static const List<Color> pipeColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pipesNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(pipesNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'PIPES',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              ref.read(pipesNotifierProvider.notifier).newGame();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            _buildInstructions(theme),
            const Spacer(),
            Center(
              child: _buildBoard(context, ref, state),
            ),
            const Spacer(),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructions(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Column(
        children: [
          Text(
            'FLOW CONNECT',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          Text(
            'Connect matching colored dots with pipes to create a flow. Fill the entire grid to solve the puzzle.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, PipesState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.9;
        final cellSize = boardSize / state.level.size;

        return GestureDetector(
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
            width: boardSize,
            height: boardSize,
            child: CustomPaint(
              painter: PipesPainter(
                state: state,
                cellSize: cellSize,
                pipeColors: pipeColors,
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
      builder: (context) => AlertDialog(
        title: const Text('WELL DONE!'),
        content: const Text('You connected all the pipes and filled the grid.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('HOME'),
          ),
        ],
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
      ..color = Colors.grey.withValues(alpha: 0.2)
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
