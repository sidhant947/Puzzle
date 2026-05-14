import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      ref.read(tangleFixNotifierProvider.notifier).initGame(
        Size(size.width - 40, size.height * 0.6),
      );
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.tangleFixTitle.toUpperCase(),
        message: 'All lines are clear and smooth.',
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          final size = MediaQuery.of(context).size;
          ref.read(tangleFixNotifierProvider.notifier).initGame(
            Size(size.width - 40, size.height * 0.6),
          );
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
      if (next.isSolved && !previous!.isSolved) {
        HapticFeedbackUtil.victory();
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('tangle_fix');
        if (!context.mounted) return;
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'Tangle Fix',
      subtitle: l10n.tangleFixSubtitle,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bounds = Size(constraints.maxWidth, constraints.maxHeight);
          return GestureDetector(
            onPanStart: (details) => notifier.onDragStart(details.localPosition),
            onPanUpdate: (details) => notifier.onDragUpdate(details.localPosition, bounds),
            onPanEnd: (_) => notifier.onDragEnd(),
            child: Container(
              color: Colors.transparent,
              child: CustomPaint(
                painter: TanglePainter(
                  nodes: state.nodes,
                  edges: state.edges,
                  draggingNodeId: state.draggingNodeId,
                  isSolved: state.isSolved,
                  onSurfaceColor: Theme.of(context).colorScheme.onSurface,
                ),
                size: Size.infinite,
              ),
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
  final String? draggingNodeId;
  final bool isSolved;
  final Color onSurfaceColor;

  TanglePainter({
    required this.nodes,
    required this.edges,
    this.draggingNodeId,
    required this.isSolved,
    required this.onSurfaceColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final edgePaint = Paint()
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final nodePaint = Paint()..style = PaintingStyle.fill;

    // Draw Edges
    for (var edge in edges) {
      final start = nodes.firstWhere((n) => n.id == edge.startNodeId).position;
      final end = nodes.firstWhere((n) => n.id == edge.endNodeId).position;
      
      edgePaint.color = isSolved 
          ? DesignSystem.success 
          : DesignSystem.primary.withValues(alpha: 0.6);
      
      canvas.drawLine(start, end, edgePaint);
    }

    // Draw Nodes
    for (var node in nodes) {
      final isDragging = node.id == draggingNodeId;
      
      nodePaint.color = isDragging 
          ? DesignSystem.accentAmber 
          : (isSolved ? DesignSystem.success : onSurfaceColor.withValues(alpha: 0.7));
      
      // Draw Shadow
      canvas.drawCircle(
        node.position + const Offset(0, 3), 
        isDragging ? 18 : 12, 
        Paint()..color = Colors.black.withValues(alpha: 0.1),
      );
      
      // Draw Node
      canvas.drawCircle(node.position, isDragging ? 16 : 10, nodePaint);
      
      // Highlight for dragging
      if (isDragging) {
        canvas.drawCircle(
          node.position, 
          16, 
          Paint()..color = Colors.white.withValues(alpha: 0.3)..style = PaintingStyle.stroke..strokeWidth = 2,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant TanglePainter oldDelegate) => true;
}
