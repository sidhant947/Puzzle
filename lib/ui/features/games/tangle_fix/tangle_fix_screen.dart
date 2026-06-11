import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'tangle_fix_engine.dart';
import 'tangle_fix_provider.dart';

class TangleFixScreen extends ConsumerStatefulWidget {
  const TangleFixScreen({super.key});

  @override
  ConsumerState<TangleFixScreen> createState() => _TangleFixScreenState();
}

class _TangleFixScreenState extends ConsumerState<TangleFixScreen> {
  bool _initialized = false;

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.tangleFixTitle.toUpperCase(),
        message: l10n.tangleFixMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          _initialized = false;
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(tangleFixNotifierProvider);
    final notifier = ref.read(tangleFixNotifierProvider.notifier);

    ref.listen(tangleFixNotifierProvider, (previous, next) async {
      if (next.gameCompleted && !(previous?.gameCompleted ?? false)) {
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('tangle_fix');
        if (!context.mounted) return;
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: l10n.tangleFixTitle,
      subtitle: l10n.tangleFixSubtitle,
      onReset: () {
        _initialized = false;
        setState(() {});
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bounds = Size(constraints.maxWidth, constraints.maxHeight);
          
          if (!_initialized && bounds.width > 0 && bounds.height > 0) {
            _initialized = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              notifier.initGame(bounds);
            });
          }

          if (state.nodes.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: (details) => notifier.onDragStart(details.localPosition),
            onPanUpdate: (details) => notifier.onDragUpdate(details.localPosition, bounds),
            onPanEnd: (_) => notifier.onDragEnd(),
            onPanCancel: () => notifier.onDragEnd(),
            child: CustomPaint(
              painter: TanglePainter(
                nodes: state.nodes,
                edges: state.edges,
                intersectingEdgeIndices: state.intersectingEdgeIndices,
                draggingNodeId: state.draggingNodeId,
                isSolved: state.isSolved,
                onSurfaceColor: Theme.of(context).colorScheme.onSurface,
              ),
              size: Size.infinite,
            ),
          );
        },
      ),
    );
  }
}

class TanglePainter extends CustomPainter {
  final List<TangleNode> nodes;
  final List<TangleEdge> edges;
  final Set<int> intersectingEdgeIndices;
  final String? draggingNodeId;
  final bool isSolved;
  final Color onSurfaceColor;

  TanglePainter({
    required this.nodes,
    required this.edges,
    required this.intersectingEdgeIndices,
    this.draggingNodeId,
    required this.isSolved,
    required this.onSurfaceColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final edgePaint = Paint()
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final nodePaint = Paint()..style = PaintingStyle.fill;

    // Draw Edges
    for (int i = 0; i < edges.length; i++) {
      final edge = edges[i];
      final start = nodes.firstWhere((n) => n.id == edge.startNodeId).position;
      final end = nodes.firstWhere((n) => n.id == edge.endNodeId).position;
      
      final isIntersecting = intersectingEdgeIndices.contains(i);
      
      if (isSolved) {
        edgePaint.color = DesignSystem.success;
      } else if (isIntersecting) {
        edgePaint.color = DesignSystem.error.withValues(alpha: 0.8);
        edgePaint.strokeWidth = 4.5;
      } else {
        edgePaint.color = DesignSystem.primary.withValues(alpha: 0.4);
        edgePaint.strokeWidth = 3.5;
      }
      
      canvas.drawLine(start, end, edgePaint);
    }

    // Draw Nodes
    for (var node in nodes) {
      final isDragging = node.id == draggingNodeId;
      
      if (isSolved) {
        nodePaint.color = DesignSystem.success;
      } else if (isDragging) {
        nodePaint.color = DesignSystem.accentAmber;
      } else {
        nodePaint.color = onSurfaceColor.withValues(alpha: 0.9);
      }
      
      // Draw Shadow
      canvas.drawCircle(
        node.position + const Offset(0, 4), 
        isDragging ? 22 : 14, 
        Paint()..color = Colors.black.withValues(alpha: 0.15),
      );
      
      // Draw Node
      canvas.drawCircle(node.position, isDragging ? 20 : 12, nodePaint);
      
      // Highlight for dragging
      if (isDragging) {
        canvas.drawCircle(
          node.position, 
          20, 
          Paint()..color = Colors.white.withValues(alpha: 0.5)..style = PaintingStyle.stroke..strokeWidth = 3,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant TanglePainter oldDelegate) => true;
}
