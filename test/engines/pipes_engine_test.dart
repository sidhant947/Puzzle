import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/pipes/pipes_engine.dart';

void main() {
  group('PipesEngine', () {
    late PipesEngine engine;

    setUp(() {
      engine = PipesEngine();
    });

    group('generateRandomLevel', () {
      test('returns a PipesLevel', () {
        final level = engine.generateRandomLevel();
        expect(level, isA<PipesLevel>());
      });

      test('level has correct board size', () {
        final level = engine.generateRandomLevel();
        expect(level.size, equals(4));
      });

      test('level has 4 color pairs', () {
        final level = engine.generateRandomLevel();
        expect(level.pairs.length, equals(4));
      });

      test('each pair has exactly 2 points', () {
        final level = engine.generateRandomLevel();
        for (final pair in level.pairs) {
          expect(pair.length, equals(2));
        }
      });

      test('pair endpoints are within grid bounds', () {
        final level = engine.generateRandomLevel();
        for (final pair in level.pairs) {
          for (final point in pair) {
            expect(point.x, greaterThanOrEqualTo(0));
            expect(point.x, lessThan(level.size));
            expect(point.y, greaterThanOrEqualTo(0));
            expect(point.y, lessThan(level.size));
          }
        }
      });

      test('all pairs have distinct start points', () {
        final level = engine.generateRandomLevel();
        final starts = level.pairs.map((p) => '${p[0].x},${p[0].y}').toSet();
        expect(starts.length, equals(4));
      });
    });

    group('isSolved', () {
      test('returns false for mismatched path count', () {
        final level = engine.generateRandomLevel();
        expect(engine.isSolved(level.size, level.pairs, []), isFalse);
      });

      test('returns false for empty paths', () {
        final level = engine.generateRandomLevel();
        final emptyPaths = List.generate(4, (_) => <Point>[]);
        expect(engine.isSolved(level.size, level.pairs, emptyPaths), isFalse);
      });

      test('returns true for a valid solved configuration', () {
        final size = 2;
        final pairs = [
          [Point(0, 0), Point(1, 0)],
          [Point(0, 1), Point(1, 1)],
        ];
        final paths = [
          [Point(0, 0), Point(1, 0)],
          [Point(0, 1), Point(1, 1)],
        ];
        expect(engine.isSolved(size, pairs, paths), isTrue);
      });

      test('returns true for valid path connecting two points', () {
        final size = 2;
        final pairs = [
          [Point(0, 0), Point(0, 1)],
          [Point(1, 0), Point(1, 1)],
        ];
        final paths = [
          [Point(0, 0), Point(0, 1)],
          [Point(1, 0), Point(1, 1)],
        ];
        expect(engine.isSolved(size, pairs, paths), isTrue);
      });

      test('returns false for path with wrong endpoints', () {
        final size = 2;
        final pairs = [
          [Point(0, 0), Point(1, 1)],
        ];
        final paths = [
          [Point(1, 1), Point(0, 0)],
        ];
        expect(engine.isSolved(size, pairs, paths), isFalse);
      });

      test('returns false for path with wrong endpoints', () {
        final size = 2;
        final pairs = [
          [Point(0, 0), Point(1, 1)],
        ];
        final paths = [
          [Point(1, 1), Point(0, 0)],
        ];
        expect(engine.isSolved(size, pairs, paths), isFalse);
      });

      test('returns false for non-contiguous path', () {
        final size = 3;
        final pairs = [
          [Point(0, 0), Point(2, 0)],
        ];
        final paths = [
          [Point(0, 0), Point(2, 0)],
        ];
        expect(engine.isSolved(size, pairs, paths), isFalse);
      });
    });
  });

  group('Point (pipes)', () {
    test('equality works correctly', () {
      expect(Point(1, 2), equals(Point(1, 2)));
      expect(Point(1, 2), isNot(equals(Point(2, 1))));
    });

    test('hashCode is consistent', () {
      expect(Point(1, 2).hashCode, equals(Point(1, 2).hashCode));
    });

    test('toString is formatted', () {
      expect(Point(3, 4).toString(), equals('(3, 4)'));
    });
  });
}
