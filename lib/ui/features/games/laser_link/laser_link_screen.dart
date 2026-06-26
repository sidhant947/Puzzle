import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../utils/l10n_game_helpers.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'laser_link_provider.dart';
import 'laser_link_engine.dart';

class LaserLinkScreen extends ConsumerStatefulWidget {
  const LaserLinkScreen({super.key});

  @override
  ConsumerState<LaserLinkScreen> createState() => _LaserLinkScreenState();
}

class _LaserLinkScreenState extends ConsumerState<LaserLinkScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(laserLinkNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => GameCompletionDialog(
        isVictory: isVictory,
        title: isVictory ? l10n.laserLinkTitle.toUpperCase() : AppLocalizations.of(context)!.gameOver,
        message: isVictory ? l10n.laserLinkCongrats : AppLocalizations.of(context)!.loseTryAgainSolution,
        onHome: () {
          Navigator.of(dialogCtx).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(dialogCtx).pop();
          ref.read(laserLinkNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(laserLinkNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(laserLinkNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(true);
        });
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'laser_link'),
      onReset: () => ref.read(laserLinkNotifierProvider.notifier).initGame(),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    AppLocalizations.of(context)!.phaseFindTheTarget,
                    style: theme.textTheme.titleMedium,
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
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: theme.colorScheme.primary, width: 2),
                        ),
                        child: Stack(
                          children: [
                            _buildGrid(state, theme),
                            _buildLaserPath(state),
                            _buildSourceAndTargets(state),
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

  Widget _buildGrid(LaserLinkState state, ThemeData theme) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: state.size,
      ),
      itemCount: state.size * state.size,
      itemBuilder: (context, index) {
        final r = index ~/ state.size;
        final c = index % state.size;
        final mirror = state.grid[r][c];

        return GestureDetector(
          onTap: () {
            HapticFeedbackUtil.selection();
            ref.read(laserLinkNotifierProvider.notifier).toggleMirror(r, c);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
            ),
            child: Center(
              child: _buildMirror(mirror, theme),
            ),
          ),
        );
      },
    );
  }

              Widget _buildMirror(MirrorType type, ThemeData theme) {
              if (type == MirrorType.none) return const SizedBox.shrink();

              return CustomPaint(
              size: const Size(40, 40),
              painter: MirrorPainter(type, theme.colorScheme.secondary),
              );
              }
  Widget _buildLaserPath(LaserLinkState state) {
    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: PathPainter(state.laserPath, state.size),
      ),
    );
  }

  Widget _buildSourceAndTargets(LaserLinkState state) {
    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: SourceTargetPainter(state.sourcePos, state.targets, state.size),
      ),
    );
  }
}

class MirrorPainter extends CustomPainter {
  final MirrorType type;
  final Color color;
  MirrorPainter(this.type, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    if (type == MirrorType.forwardSlash) {
      canvas.drawLine(Offset(size.width * 0.2, size.height * 0.8), Offset(size.width * 0.8, size.height * 0.2), paint);
    } else {
      canvas.drawLine(Offset(size.width * 0.2, size.height * 0.2), Offset(size.width * 0.8, size.height * 0.8), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PathPainter extends CustomPainter {
  final IList<Point<int>> path;
  final int gridSize;
  PathPainter(this.path, this.gridSize);

  @override
  void paint(Canvas canvas, Size size) {
    if (path.isEmpty) return;
    
    final paint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final cellSize = size.width / gridSize;
    final offsets = path.map((p) => Offset((p.x + 0.5) * cellSize, (p.y + 0.5) * cellSize)).toList();

    final pathObj = Path();
    pathObj.moveTo(offsets.first.dx, offsets.first.dy);
    for (int i = 1; i < offsets.length; i++) {
      pathObj.lineTo(offsets[i].dx, offsets[i].dy);
    }

    canvas.drawPath(pathObj, paint);
    
    // Add glow effect
    canvas.drawPath(pathObj, paint..strokeWidth = 6..color = Colors.redAccent.withValues(alpha: 0.3));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SourceTargetPainter extends CustomPainter {
  final Point<int> source;
  final IList<Point<int>> targets;
  final int gridSize;
  SourceTargetPainter(this.source, this.targets, this.gridSize);

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / gridSize;
    
    // Draw source
    final sourcePaint = Paint()..color = Colors.orange;
    canvas.drawCircle(Offset((source.x + 0.5) * cellSize, (source.y + 0.5) * cellSize), cellSize * 0.3, sourcePaint);

    // Draw targets
    final targetPaint = Paint()..color = Colors.green..style = PaintingStyle.stroke..strokeWidth = 3;
    for (final target in targets) {
      final center = Offset((target.x + 0.5) * cellSize, (target.y + 0.5) * cellSize);
      canvas.drawCircle(center, cellSize * 0.35, targetPaint);
      canvas.drawCircle(center, cellSize * 0.1, targetPaint..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
