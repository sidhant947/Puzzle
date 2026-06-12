import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/laser_link/laser_link_engine.dart';

void main() {
  group('LaserLinkEngine', () {
    group('generateLevel', () {
      test('returns source position, direction, targets, and mirrors', () {
        final engine = LaserLinkEngine(size: 5);
        final level = engine.generateLevel();
        expect(level.containsKey('sourcePos'), isTrue);
        expect(level.containsKey('sourceDir'), isTrue);
        expect(level.containsKey('targets'), isTrue);
        expect(level.containsKey('solutionMirrors'), isTrue);
      });

      test('source position is within bounds', () {
        final engine = LaserLinkEngine(size: 5);
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          final src = level['sourcePos'] as dynamic;
          expect(src.x, greaterThanOrEqualTo(0));
          expect(src.x, lessThan(5));
          expect(src.y, greaterThanOrEqualTo(0));
          expect(src.y, lessThan(5));
        }
      });

      test('source position is on an edge', () {
        final engine = LaserLinkEngine(size: 5);
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          final src = level['sourcePos'] as dynamic;
          final onEdge = src.x == 0 || src.x == 4 || src.y == 0 || src.y == 4;
          expect(onEdge, isTrue, reason: 'Source should be on edge');
        }
      });

      test('targets list is not empty', () {
        final engine = LaserLinkEngine(size: 5);
        final level = engine.generateLevel();
        final targets = level['targets'] as List;
        expect(targets, isNotEmpty);
      });
    });

    group('tracePath', () {
      test('returns a path starting at source', () {
        final engine = LaserLinkEngine(size: 5);
        final src = const Point(0, 2);
        final path = engine.tracePath(src, Direction.down, {});
        expect(path.first, equals(src));
      });

      test('path stays within bounds', () {
        final engine = LaserLinkEngine(size: 5);
        final path = engine.tracePath(const Point(0, 2), Direction.down, {});
        for (final p in path) {
          expect(p.x, greaterThanOrEqualTo(0));
          expect(p.x, lessThan(5));
          expect(p.y, greaterThanOrEqualTo(0));
          expect(p.y, lessThan(5));
        }
      });

      test('path reflects off forwardSlash mirror', () {
        final engine = LaserLinkEngine(size: 5);
        // Place a / mirror at (1,1), laser goes down from (1,0)
        // Down + / => Left
        final mirrors = {const Point(1, 1): MirrorType.forwardSlash};
        final path = engine.tracePath(const Point(1, 0), Direction.down, mirrors);
        expect(path.length, greaterThan(2));
        // After hitting mirror, should go left
        if (path.length >= 3) {
          expect(path[2].x, equals(0));
          expect(path[2].y, equals(1));
        }
      });

      test('path reflects off backSlash mirror', () {
        final engine = LaserLinkEngine(size: 5);
        // Place a \ mirror at (1,1), laser goes down from (1,0)
        // Down + \ => Right
        final mirrors = {const Point(1, 1): MirrorType.backSlash};
        final path = engine.tracePath(const Point(1, 0), Direction.down, mirrors);
        expect(path.length, greaterThan(2));
        if (path.length >= 3) {
          expect(path[2].x, equals(2));
          expect(path[2].y, equals(1));
        }
      });

      test('path stops at edge without mirrors', () {
        final engine = LaserLinkEngine(size: 5);
        final path = engine.tracePath(const Point(2, 0), Direction.down, {});
        expect(path.last.y, equals(4));
      });
    });

    group('generateLevelWrapper', () {
      test('returns a valid level', () {
        final level = LaserLinkEngine.generateLevelWrapper(5);
        expect(level.containsKey('sourcePos'), isTrue);
      });
    });
  });
}
