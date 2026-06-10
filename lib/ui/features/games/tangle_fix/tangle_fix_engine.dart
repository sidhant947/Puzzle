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
    List<TangleNode> nodes = [];
    double minDistance = 50.0;
    double margin = 30.0;

    for (int i = 0; i < count; i++) {
      Offset pos = Offset.zero;
      int attempts = 0;
      bool tooClose;
      do {
        tooClose = false;
        if (bounds.width > margin * 2 && bounds.height > margin * 2) {
          pos = Offset(
            margin + _random.nextDouble() * (bounds.width - margin * 2),
            margin + _random.nextDouble() * (bounds.height - margin * 2),
          );
        } else {
          pos = Offset(_random.nextDouble() * bounds.width, _random.nextDouble() * bounds.height);
        }
        
        for (var existingNode in nodes) {
          if ((existingNode.position - pos).distance < minDistance) {
            tooClose = true;
            break;
          }
        }
        attempts++;
      } while (tooClose && attempts < 100);
      nodes.add(TangleNode(id: 'node_$i', position: pos));
    }
    return nodes;
  }

  List<TangleEdge> generateEdges(int nodeCount) {
    List<TangleEdge> edges = [];
    // Create a cycle
    for (int i = 0; i < nodeCount; i++) {
      edges.add(TangleEdge('node_$i', 'node_${(i + 1) % nodeCount}'));
    }
    
    // Add chords carefully to keep it planar
    if (nodeCount >= 6) {
      edges.add(TangleEdge('node_0', 'node_2'));
      edges.add(TangleEdge('node_0', 'node_3'));
      edges.add(TangleEdge('node_3', 'node_5'));
    }
    
    if (nodeCount >= 8) {
      edges.add(TangleEdge('node_4', 'node_6'));
      edges.add(TangleEdge('node_4', 'node_7'));
    }
    
    return edges;
  }

  bool _onSegment(Offset p, Offset q, Offset r) {
    return q.dx <= max(p.dx, r.dx) + 0.1 &&
        q.dx >= min(p.dx, r.dx) - 0.1 &&
        q.dy <= max(p.dy, r.dy) + 0.1 &&
        q.dy >= min(p.dy, r.dy) - 0.1;
  }

  int _orientation(Offset p, Offset q, Offset r) {
    double val = (q.dy - p.dy) * (r.dx - q.dx) - (q.dx - p.dx) * (r.dy - q.dy);
    if (val.abs() < 1e-4) return 0; // Much lower tolerance for better precision
    return (val > 0) ? 1 : 2; 
  }

  bool doIntersect(Offset p1, Offset q1, Offset p2, Offset q2) {
    int o1 = _orientation(p1, q1, p2);
    int o2 = _orientation(p1, q1, q2);
    int o3 = _orientation(p2, q2, p1);
    int o4 = _orientation(p2, q2, q1);

    if (o1 != o2 && o3 != o4) return true;

    if (o1 == 0 && _onSegment(p1, p2, q1)) return true;
    if (o2 == 0 && _onSegment(p1, q2, q1)) return true;
    if (o3 == 0 && _onSegment(p2, p1, q2)) return true;
    if (o4 == 0 && _onSegment(p2, q1, q2)) return true;

    return false;
  }

  Set<int> getIntersectingEdgeIndices(List<TangleNode> nodes, List<TangleEdge> edges) {
    Set<int> intersectingIndices = {};
    for (int i = 0; i < edges.length; i++) {
      for (int j = i + 1; j < edges.length; j++) {
        final e1 = edges[i];
        final e2 = edges[j];
        
        if (e1.startNodeId == e2.startNodeId || e1.startNodeId == e2.endNodeId ||
            e1.endNodeId == e2.startNodeId || e1.endNodeId == e2.endNodeId) {
          continue;
        }

        final n1 = nodes.firstWhere((n) => n.id == e1.startNodeId);
        final n2 = nodes.firstWhere((n) => n.id == e1.endNodeId);
        final n3 = nodes.firstWhere((n) => n.id == e2.startNodeId);
        final n4 = nodes.firstWhere((n) => n.id == e2.endNodeId);

        if (doIntersect(n1.position, n2.position, n3.position, n4.position)) {
          intersectingIndices.add(i);
          intersectingIndices.add(j);
        }
      }
    }
    return intersectingIndices;
  }

  bool isSolved(List<TangleNode> nodes, List<TangleEdge> edges) {
    return getIntersectingEdgeIndices(nodes, edges).isEmpty;
  }
}
