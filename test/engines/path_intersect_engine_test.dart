import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/path_intersect/path_intersect_engine.dart';

void main() {
  group('PathIntersectEngine', () {
    late PathIntersectEngine engine;

    setUp(() {
      engine = PathIntersectEngine();
    });

    group('generateLevel', () {
      test('returns a map with required keys', () {
        final level = engine.generateLevel();
        expect(level.containsKey('path1'), isTrue);
        expect(level.containsKey('path2'), isTrue);
        expect(level.containsKey('intersection'), isTrue);
        expect(level.containsKey('gridSize'), isTrue);
      });

      test('path1 is non-empty', () {
        final level = engine.generateLevel();
        final path1 = level['path1'] as List<Point<int>>;
        expect(path1.isNotEmpty, isTrue);
      });

      test('path2 is non-empty', () {
        final level = engine.generateLevel();
        final path2 = level['path2'] as List<Point<int>>;
        expect(path2.isNotEmpty, isTrue);
      });

      test('intersection is in both paths', () {
        final level = engine.generateLevel();
        final path1 = level['path1'] as List<Point<int>>;
        final path2 = level['path2'] as List<Point<int>>;
        final intersection = level['intersection'] as Point<int>;
        expect(path1, contains(intersection));
        expect(path2, contains(intersection));
      });

      test('gridSize is set correctly', () {
        final level = engine.generateLevel();
        expect(level['gridSize'], equals(8));
      });

      test('intersection is within grid bounds (not on edge)', () {
        final level = engine.generateLevel();
        final intersection = level['intersection'] as Point<int>;
        expect(intersection.x, greaterThanOrEqualTo(2));
        expect(intersection.x, lessThan(6));
        expect(intersection.y, greaterThanOrEqualTo(2));
        expect(intersection.y, lessThan(6));
      });
    });

    group('generateLevelWrapper', () {
      test('works with custom grid size', () {
        final level = PathIntersectEngine.generateLevelWrapper(10);
        expect(level['gridSize'], equals(10));
      });

      test('generates valid paths for custom size', () {
        final level = PathIntersectEngine.generateLevelWrapper(6);
        final path1 = level['path1'] as List<Point<int>>;
        expect(path1.isNotEmpty, isTrue);
      });
    });
  });
}
