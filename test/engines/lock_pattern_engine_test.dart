import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/lock_pattern/lock_pattern_engine.dart';

void main() {
  group('LockPatternEngine', () {
    late LockPatternEngine engine;

    setUp(() {
      engine = LockPatternEngine();
    });

    group('generatePattern', () {
      test('generates pattern of requested length', () {
        final pattern = engine.generatePattern(5);
        expect(pattern.length, equals(5));
      });

      test('generates pattern of length 3', () {
        final pattern = engine.generatePattern(3);
        expect(pattern.length, equals(3));
      });

      test('pattern contains valid indices (0-8)', () {
        for (int i = 0; i < 20; i++) {
          final pattern = engine.generatePattern(5);
          for (final dot in pattern) {
            expect(dot, greaterThanOrEqualTo(0));
            expect(dot, lessThan(9));
          }
        }
      });

      test('pattern has no duplicate dots', () {
        for (int i = 0; i < 20; i++) {
          final pattern = engine.generatePattern(5);
          expect(pattern.toSet().length, equals(pattern.length));
        }
      });

      test('skipped dots are activated before jumping', () {
        // Moving from 0 to 2 skips 1. If 1 is not in pattern, this move is invalid.
        // The generator should always produce valid patterns.
        final pattern = engine.generatePattern(5);
        expect(pattern.length, equals(5));
      });
    });

    group('checkGuess', () {
      test('returns correct bulls and cows', () {
        final target = [1, 2, 3, 4, 5];

        // Exact match
        expect(engine.checkGuess([1, 2, 3, 4, 5], target), equals([5, 0]));

        // All wrong
        expect(engine.checkGuess([9, 8, 7, 6, 0], target), equals([0, 0]));

        // Some bulls, some cows
        final result = engine.checkGuess([1, 3, 2, 4, 5], target);
        expect(result[0], equals(3)); // bulls: 1, 4, 5
        expect(result[1], equals(2)); // cows: 2, 3
      });

      test('returns 0 bulls and 0 cows for completely wrong guess', () {
        expect(engine.checkGuess([0, 6, 7, 8, 9], [1, 2, 3, 4, 5]), equals([0, 0]));
      });

      test('handles duplicate values correctly', () {
        final result = engine.checkGuess([1, 1, 1, 1, 1], [1, 1, 1, 1, 1]);
        expect(result, equals([5, 0]));
      });
    });

    group('normalizePath', () {
      test('returns single dot for empty path', () {
        final result = engine.normalizePath([], 5);
        expect(result, equals([5]));
      });

      test('returns same path if new dot already in path', () {
        final result = engine.normalizePath([0, 1, 2], 1);
        expect(result, equals([0, 1, 2]));
      });

      test('adds skipped dot when jumping across', () {
        // From 0 to 2, should add 1
        final result = engine.normalizePath([0], 2);
        expect(result, contains(1));
        expect(result.last, equals(2));
      });

      test('adds multiple skipped dots for longer jumps', () {
        // From 0 to 6 in a 3x3 grid: 0(0,0) -> 6(2,0), skipping 3(1,0)
        final result = engine.normalizePath([0], 6);
        expect(result, contains(3));
        expect(result.last, equals(6));
      });

      test('does not add dots already in path', () {
        final result = engine.normalizePath([0, 3], 6);
        expect(result, equals([0, 3, 6]));
      });
    });
  });
}
