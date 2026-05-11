import 'dart:math';
import 'package:flutter/material.dart';

class TangleNode {
  final String id;
  Offset position;

  TangleNode({required this.id, required this.position});
}

class TangleEdge {
  final String startNodeId;
  final String endNodeId;

  TangleEdge(this.startNodeId, this.endNodeId);
}

class TangleFixEngine {
  final Random _random = Random();

  List<TangleNode> generateNodes(Size bounds, int count) {
    return List.generate(count, (i) {
      return TangleNode(
        id: 'node_$i',
        position: Offset(
          50 + _random.nextDouble() * (bounds.width - 100),
          50 + _random.nextDouble() * (bounds.height - 100),
        ),
      );
    });
  }

  List<TangleEdge> generateEdges(int nodeCount) {
    List<TangleEdge> edges = [];
    // Create a cycle for simplicity and guaranteed "tangleness"
    for (int i = 0; i < nodeCount; i++) {
      edges.add(TangleEdge('node_$i', 'node_${(i + 1) % nodeCount}'));
    }
    // Add some cross-connections
    if (nodeCount > 4) {
      edges.add(TangleEdge('node_0', 'node_2'));
      edges.add(TangleEdge('node_1', 'node_3'));
    }
    return edges;
  }

  bool doIntersect(Offset a, Offset b, Offset c, Offset d) {
    // Standard line segment intersection test
    double det = (b.dx - a.dx) * (d.dy - c.dy) - (b.dy - a.dy) * (d.dx - c.dx);
    if (det == 0) return false;

    double lambda = ((d.dy - c.dy) * (d.dx - a.dx) + (c.dx - d.dx) * (d.dy - a.dy)) / det;
    double gamma = ((a.dy - b.dy) * (d.dx - a.dx) + (b.dx - a.dx) * (d.dy - a.dy)) / det;
    
    return (0 < lambda && lambda < 1) && (0 < gamma && gamma < 1);
  }

  bool isSolved(List<TangleNode> nodes, List<TangleEdge> edges) {
    for (int i = 0; i < edges.length; i++) {
      for (int j = i + 1; j < edges.length; j++) {
        final e1 = edges[i];
        final e2 = edges[j];
        
        // Skip edges that share a node
        if (e1.startNodeId == e2.startNodeId || e1.startNodeId == e2.endNodeId ||
            e1.endNodeId == e2.startNodeId || e1.endNodeId == e2.endNodeId) {
          continue;
        }

        final n1 = nodes.firstWhere((n) => n.id == e1.startNodeId);
        final n2 = nodes.firstWhere((n) => n.id == e1.endNodeId);
        final n3 = nodes.firstWhere((n) => n.id == e2.startNodeId);
        final n4 = nodes.firstWhere((n) => n.id == e2.endNodeId);

        if (doIntersect(n1.position, n2.position, n3.position, n4.position)) {
          return false;
        }
      }
    }
    return true;
  }
}
