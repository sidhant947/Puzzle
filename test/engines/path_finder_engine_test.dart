import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/path_finder/path_finder_engine.dart';

void main() {
  group('PathFinderEngine', () {
    late PathFinderEngine engine;

    setUp(() {
      engine = PathFinderEngine();
    });

    group('generateLevel', () {
      test('returns a list of points', () {
        final path = engine.generateLevel();
        expect(path, isA<List<Point<int>>>());
      });

      test('path has minimum length of 10', () {
        final path = engine.generateLevel();
        expect(path.length, greaterThanOrEqualTo(10));
      });

      test('all points are within grid bounds', () {
        final path = engine.generateLevel();
        for (final point in path) {
          expect(point.x, greaterThanOrEqualTo(0));
          expect(point.x, lessThan(engine.size));
          expect(point.y, greaterThanOrEqualTo(0));
          expect(point.y, lessThan(engine.size));
        }
      });

      test('path has no duplicate points', () {
        final path = engine.generateLevel();
        final pointSet = <String>{};
        for (final point in path) {
          final key = '${point.x},${point.y}';
          expect(pointSet.contains(key), isFalse,
              reason: 'Duplicate point at $key');
          pointSet.add(key);
        }
      });

      test('path is continuous (adjacent points)', () {
        final path = engine.generateLevel();
        for (int i = 1; i < path.length; i++) {
          final prev = path[i - 1];
          final curr = path[i];
          final manhattan = (prev.x - curr.x).abs() + (prev.y - curr.y).abs();
          expect(manhattan, equals(1),
              reason: 'Non-adjacent points at index $i');
        }
      });
    });

    group('isLevelComplete', () {
      test('returns true for matching paths', () {
        final path = engine.generateLevel();
        expect(engine.isLevelComplete(path, path), isTrue);
      });

      test('returns false for different length paths', () {
        final path = engine.generateLevel();
        expect(engine.isLevelComplete(path, path.sublist(0, path.length - 1)),
            isFalse);
      });

      test('returns false for different paths of same length', () {
        final path1 = [Point(0, 0), Point(0, 1)];
        final path2 = [Point(0, 0), Point(1, 0)];
        expect(engine.isLevelComplete(path1, path2), isFalse);
      });
    });
  });
}
