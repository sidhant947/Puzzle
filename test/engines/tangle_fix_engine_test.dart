import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/tangle_fix/tangle_fix_engine.dart';

void main() {
  group('TangleFixEngine', () {
    late TangleFixEngine engine;

    setUp(() {
      engine = TangleFixEngine();
    });

    group('generateNodes', () {
      test('generates correct number of nodes', () {
        final nodes = engine.generateNodes(const Size(300, 300), 5);
        expect(nodes.length, 5);
      });

      test('nodes are within bounds', () {
        final nodes = engine.generateNodes(const Size(200, 200), 10);
        for (final node in nodes) {
          expect(node.position.dx, greaterThanOrEqualTo(0));
          expect(node.position.dx, lessThanOrEqualTo(200));
          expect(node.position.dy, greaterThanOrEqualTo(0));
          expect(node.position.dy, lessThanOrEqualTo(200));
        }
      });

      test('nodes have unique ids', () {
        final nodes = engine.generateNodes(const Size(400, 400), 8);
        final ids = nodes.map((n) => n.id).toList();
        expect(ids.toSet().length, ids.length);
      });

      test('nodes maintain minimum distance', () {
        final nodes = engine.generateNodes(const Size(500, 500), 10);
        for (int i = 0; i < nodes.length; i++) {
          for (int j = i + 1; j < nodes.length; j++) {
            final dist = (nodes[i].position - nodes[j].position).distance;
            expect(dist, greaterThan(0));
          }
        }
      });
    });

    group('generateEdges', () {
      test('generates cycle edges', () {
        final edges = engine.generateEdges(5);
        expect(edges.length, 5);
      });

      test('edges reference valid node ids', () {
        final edges = engine.generateEdges(4);
        for (final edge in edges) {
          expect(edge.startNodeId, startsWith('node_'));
          expect(edge.endNodeId, startsWith('node_'));
        }
      });

      test('generates more edges for larger node counts', () {
        final edges4 = engine.generateEdges(4);
        final edges6 = engine.generateEdges(6);
        final edges8 = engine.generateEdges(8);
        expect(edges6.length, greaterThan(edges4.length));
        expect(edges8.length, greaterThan(edges6.length));
      });

      test('cycle edges connect consecutive nodes', () {
        final edges = engine.generateEdges(5);
        for (int i = 0; i < 5; i++) {
          expect(edges[i].startNodeId, 'node_$i');
          expect(edges[i].endNodeId, 'node_${(i + 1) % 5}');
        }
      });
    });

    group('doIntersect', () {
      test('returns true for crossing segments', () {
        final p1 = const Offset(0, 0);
        final q1 = const Offset(10, 10);
        final p2 = const Offset(10, 0);
        final q2 = const Offset(0, 10);
        expect(engine.doIntersect(p1, q1, p2, q2), isTrue);
      });

      test('returns false for parallel segments', () {
        final p1 = const Offset(0, 0);
        final q1 = const Offset(10, 0);
        final p2 = const Offset(0, 5);
        final q2 = const Offset(10, 5);
        expect(engine.doIntersect(p1, q1, p2, q2), isFalse);
      });

      test('returns false for non-intersecting segments', () {
        final p1 = const Offset(0, 0);
        final q1 = const Offset(5, 0);
        final p2 = const Offset(0, 5);
        final q2 = const Offset(5, 5);
        expect(engine.doIntersect(p1, q1, p2, q2), isFalse);
      });

      test('returns true for collinear overlapping segments', () {
        final p1 = const Offset(0, 0);
        final q1 = const Offset(10, 0);
        final p2 = const Offset(5, 0);
        final q2 = const Offset(15, 0);
        expect(engine.doIntersect(p1, q1, p2, q2), isTrue);
      });
    });

    group('getIntersectingEdgeIndices', () {
      test('returns empty set for non-intersecting edges', () {
        final nodes = [
          TangleNode(id: 'node_0', position: const Offset(0, 0)),
          TangleNode(id: 'node_1', position: const Offset(10, 0)),
          TangleNode(id: 'node_2', position: const Offset(10, 10)),
          TangleNode(id: 'node_3', position: const Offset(0, 10)),
        ];
        final edges = [
          TangleEdge('node_0', 'node_1'),
          TangleEdge('node_2', 'node_3'),
        ];
        expect(engine.getIntersectingEdgeIndices(nodes, edges), isEmpty);
      });

      test('returns indices of intersecting edges', () {
        final nodes = [
          TangleNode(id: 'node_0', position: const Offset(0, 0)),
          TangleNode(id: 'node_1', position: const Offset(10, 10)),
          TangleNode(id: 'node_2', position: const Offset(10, 0)),
          TangleNode(id: 'node_3', position: const Offset(0, 10)),
        ];
        final edges = [
          TangleEdge('node_0', 'node_1'),
          TangleEdge('node_2', 'node_3'),
        ];
        final result = engine.getIntersectingEdgeIndices(nodes, edges);
        expect(result, containsAll([0, 1]));
      });

      test('skips edges sharing a node', () {
        final nodes = [
          TangleNode(id: 'node_0', position: const Offset(0, 0)),
          TangleNode(id: 'node_1', position: const Offset(10, 10)),
          TangleNode(id: 'node_2', position: const Offset(20, 0)),
        ];
        final edges = [
          TangleEdge('node_0', 'node_1'),
          TangleEdge('node_1', 'node_2'),
        ];
        final result = engine.getIntersectingEdgeIndices(nodes, edges);
        expect(result, isEmpty);
      });
    });

    group('isSolved', () {
      test('returns true when no edges intersect', () {
        final nodes = [
          TangleNode(id: 'node_0', position: const Offset(0, 0)),
          TangleNode(id: 'node_1', position: const Offset(10, 0)),
          TangleNode(id: 'node_2', position: const Offset(10, 10)),
          TangleNode(id: 'node_3', position: const Offset(0, 10)),
        ];
        final edges = [
          TangleEdge('node_0', 'node_1'),
          TangleEdge('node_1', 'node_2'),
          TangleEdge('node_2', 'node_3'),
          TangleEdge('node_3', 'node_0'),
        ];
        expect(engine.isSolved(nodes, edges), isTrue);
      });

      test('returns false when edges intersect', () {
        final nodes = [
          TangleNode(id: 'node_0', position: const Offset(0, 0)),
          TangleNode(id: 'node_1', position: const Offset(10, 10)),
          TangleNode(id: 'node_2', position: const Offset(10, 0)),
          TangleNode(id: 'node_3', position: const Offset(0, 10)),
        ];
        final edges = [
          TangleEdge('node_0', 'node_1'),
          TangleEdge('node_2', 'node_3'),
        ];
        expect(engine.isSolved(nodes, edges), isFalse);
      });
    });
  });
}
