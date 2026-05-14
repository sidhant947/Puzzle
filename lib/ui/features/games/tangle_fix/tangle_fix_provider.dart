import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'tangle_fix_engine.dart';

part 'tangle_fix_provider.g.dart';

class TangleFixState {
  final List<TangleNode> nodes;
  final List<TangleEdge> edges;
  final bool isSolved;
  final String? draggingNodeId;

  TangleFixState({
    required this.nodes,
    required this.edges,
    this.isSolved = false,
    this.draggingNodeId,
  });

  TangleFixState copyWith({
    List<TangleNode>? nodes,
    List<TangleEdge>? edges,
    bool? isSolved,
    String? draggingNodeId,
  }) {
    return TangleFixState(
      nodes: nodes ?? this.nodes,
      edges: edges ?? this.edges,
      isSolved: isSolved ?? this.isSolved,
      draggingNodeId: draggingNodeId ?? this.draggingNodeId,
    );
  }
}

@riverpod
class TangleFixNotifier extends _$TangleFixNotifier {
  final _engine = TangleFixEngine();
  static const int defaultNodeCount = 6;

  @override
  TangleFixState build() {
    return TangleFixState(nodes: [], edges: []);
  }

  void initGame(Size bounds) {
    final nodes = _engine.generateNodes(bounds, defaultNodeCount);
    final edges = _engine.generateEdges(defaultNodeCount);
    state = TangleFixState(
      nodes: nodes,
      edges: edges,
      isSolved: _engine.isSolved(nodes, edges),
    );
  }

  void onDragStart(Offset position) {
    if (state.isSolved) return;
    
    String? closestNodeId;
    double minDistance = 30.0;

    for (var node in state.nodes) {
      double dist = (node.position - position).distance;
      if (dist < minDistance) {
        minDistance = dist;
        closestNodeId = node.id;
      }
    }

    if (closestNodeId != null) {
      state = state.copyWith(draggingNodeId: closestNodeId);
    }
  }

  void onDragUpdate(Offset position, Size bounds) {
    if (state.draggingNodeId == null) return;

    // Clamp position to bounds
    final clampedPosition = Offset(
      position.dx.clamp(20, bounds.width - 20),
      position.dy.clamp(20, bounds.height - 20),
    );

    final updatedNodes = state.nodes.map((node) {
      if (node.id == state.draggingNodeId) {
        return TangleNode(id: node.id, position: clampedPosition);
      }
      return node;
    }).toList();

    state = state.copyWith(nodes: updatedNodes);
  }

  void onDragEnd() {
    if (state.draggingNodeId == null) return;
    
    state = state.copyWith(
      draggingNodeId: null,
      isSolved: _engine.isSolved(state.nodes, state.edges),
    );
  }
}
