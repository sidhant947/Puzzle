import 'package:puzzle/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(pipesNotifierProvider);

    ref.listen(pipesNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.pipesTitle.toUpperCase(),
      subtitle: l10n.pipesSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(pipesNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildInstructions(context),
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

  Widget _buildInstructions(BuildContext context) {
    return TangibleContainer(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Theme.of(context).colorScheme.surface,
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
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
          padding: const EdgeInsets.all(DesignSystem.spaceSM),
          child: GestureDetector(
            onPanStart: (details) {
              final pos = _getPos(details.localPosition, cellSize, state.level.size);
              if (pos != null) {
                ref.read(pipesNotifierProvider.notifier).startPath(pos.x, pos.y);
              }
            },
            onPanUpdate: (details) {
              final pos = _getPos(details.localPosition, cellSize, state.level.size);
              if (pos != null) {
                ref.read(pipesNotifierProvider.notifier).updatePath(pos.x, pos.y);
              }
            },
            onPanEnd: (_) {
              ref.read(pipesNotifierProvider.notifier).endPath();
            },
            child: SizedBox(
              width: boardSize - DesignSystem.spaceSM * 2,
              height: boardSize - DesignSystem.spaceSM * 2,
              child: ClipRect(
                child: CustomPaint(
                  painter: PipesPainter(
                    state: state,
                    cellSize: cellSize,
                    pipeColors: pipeColors,
                    gridColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Point? _getPos(Offset localPos, double cellSize, int size) {
    final x = (localPos.dx / cellSize).floor();
    final y = (localPos.dy / cellSize).floor();
    if (x < 0 || x >= size || y < 0 || y >= size) return null;
    return Point(x, y);
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
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
  final Color gridColor;

  PipesPainter({
    required this.state,
    required this.cellSize,
    required this.pipeColors,
    required this.gridColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = gridColor
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
