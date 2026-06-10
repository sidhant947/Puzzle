import 'package:flutter/material.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'tangle_fix_engine.dart';

part 'tangle_fix_provider.g.dart';

class TangleFixState {
  final List<TangleNode> nodes;
  final List<TangleEdge> edges;
  final bool isSolved;
  final String? draggingNodeId;
  final Set<int> intersectingEdgeIndices;
  final bool gameCompleted;

  TangleFixState({
    required this.nodes,
    required this.edges,
    this.isSolved = false,
    this.draggingNodeId,
    this.intersectingEdgeIndices = const {},
    this.gameCompleted = false,
  });

  TangleFixState copyWith({
    List<TangleNode>? nodes,
    List<TangleEdge>? edges,
    bool? isSolved,
    String? draggingNodeId,
    Set<int>? intersectingEdgeIndices,
    bool? gameCompleted,
  }) {
    return TangleFixState(
      nodes: nodes ?? this.nodes,
      edges: edges ?? this.edges,
      isSolved: isSolved ?? this.isSolved,
      draggingNodeId: draggingNodeId ?? this.draggingNodeId,
      intersectingEdgeIndices:
          intersectingEdgeIndices ?? this.intersectingEdgeIndices,
      gameCompleted: gameCompleted ?? this.gameCompleted,
    );
  }
}

@riverpod
class TangleFixNotifier extends _$TangleFixNotifier {
  final _engine = TangleFixEngine();
  static const int defaultNodeCount = 8;

  @override
  TangleFixState build() {
    return TangleFixState(nodes: [], edges: []);
  }

  void initGame(Size bounds) {
    List<TangleNode> nodes;
    List<TangleEdge> edges = _engine.generateEdges(defaultNodeCount);
    Set<int> intersecting;

    int attempts = 0;
    do {
      nodes = _engine.generateNodes(bounds, defaultNodeCount);
      intersecting = _engine.getIntersectingEdgeIndices(nodes, edges);
      attempts++;
    } while (intersecting.isEmpty && attempts < 15);

    state = TangleFixState(
      nodes: nodes,
      edges: edges,
      isSolved: intersecting.isEmpty,
      intersectingEdgeIndices: intersecting,
      gameCompleted: false,
    );
  }

  void onDragStart(Offset position) {
    if (state.gameCompleted) return;

    String? closestNodeId;
    double minDistance = 45.0; // Generous hitbox

    for (var node in state.nodes) {
      double dist = (node.position - position).distance;
      if (dist < minDistance) {
        minDistance = dist;
        closestNodeId = node.id;
      }
    }

    if (closestNodeId != null) {
      state = state.copyWith(draggingNodeId: closestNodeId);
      HapticFeedbackUtil.lightImpact();
    }
  }

  void onDragUpdate(Offset position, Size bounds) {
    if (state.draggingNodeId == null || state.gameCompleted) return;

    // Clamp position to bounds with padding
    const padding = 25.0;
    final clampedPosition = Offset(
      position.dx.clamp(padding, bounds.width - padding),
      position.dy.clamp(padding, bounds.height - padding),
    );

    final updatedNodes = state.nodes.map((node) {
      if (node.id == state.draggingNodeId) {
        return TangleNode(id: node.id, position: clampedPosition);
      }
      return node;
    }).toList();

    final intersecting =
        _engine.getIntersectingEdgeIndices(updatedNodes, state.edges);

    state = state.copyWith(
      nodes: updatedNodes,
      intersectingEdgeIndices: intersecting,
      isSolved: intersecting.isEmpty,
    );
  }

  void onDragEnd() {
    if (state.draggingNodeId == null) return;

    // Final check for win condition on release
    final isSolved = state.isSolved;
    
    state = state.copyWith(
      draggingNodeId: null,
      gameCompleted: isSolved,
    );
    
    if (isSolved) {
      HapticFeedbackUtil.victory();
    }
  }
}
