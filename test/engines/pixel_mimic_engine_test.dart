import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/pixel_mimic/pixel_mimic_engine.dart';

void main() {
  group('PixelMimicEngine', () {
    late PixelMimicEngine engine;

    setUp(() {
      engine = PixelMimicEngine();
    });

    group('generatePattern', () {
      test('returns a 4x4 grid', () {
        final pattern = engine.generatePattern();
        expect(pattern.length, equals(4));
        for (final row in pattern) {
          expect(row.length, equals(4));
        }
      });

      test('cells contain values 0-4', () {
        final pattern = engine.generatePattern();
        for (final row in pattern) {
          for (final cell in row) {
            expect(cell, greaterThanOrEqualTo(0));
            expect(cell, lessThanOrEqualTo(4));
          }
        }
      });

      test('has between 4 and 7 filled cells', () {
        final pattern = engine.generatePattern();
        int filledCount = 0;
        for (final row in pattern) {
          for (final cell in row) {
            if (cell != 0) filledCount++;
          }
        }
        expect(filledCount, greaterThanOrEqualTo(4));
        expect(filledCount, lessThanOrEqualTo(7));
      });
    });

    group('checkMatch', () {
      test('returns true for identical grids', () {
        final pattern = engine.generatePattern();
        final copy = pattern.map((r) => List<int>.from(r)).toList();
        expect(engine.checkMatch(pattern, copy), isTrue);
      });

      test('returns false for different grids', () {
        final target = [
          [0, 0, 0, 0],
          [0, 1, 2, 0],
          [0, 3, 4, 0],
          [0, 0, 0, 0],
        ];
        final user = [
          [0, 0, 0, 0],
          [0, 1, 3, 0],
          [0, 3, 4, 0],
          [0, 0, 0, 0],
        ];
        expect(engine.checkMatch(target, user), isFalse);
      });

      test('returns true for all-empty grids', () {
        final empty = List.generate(4, (_) => List.filled(4, 0));
        expect(engine.checkMatch(empty, empty), isTrue);
      });

      test('returns false when one extra cell is filled', () {
        final target = [
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
        ];
        final user = [
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
        ];
        expect(engine.checkMatch(target, user), isFalse);
      });
    });
  });
}
