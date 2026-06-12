import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/symmetry/symmetry_engine.dart';

void main() {
  group('SymmetryEngine', () {
    late SymmetryEngine engine;

    setUp(() {
      engine = SymmetryEngine();
    });

    test('engine has size 6', () {
      expect(engine.size, 6);
    });

    group('generatePattern', () {
      test('returns a 6x6 grid', () {
        final grid = engine.generatePattern();
        expect(grid.length, 6);
        for (final row in grid) {
          expect(row.length, 6);
        }
      });

      test('all values are booleans', () {
        final grid = engine.generatePattern();
        for (final row in grid) {
          for (final val in row) {
            expect(val, isA<bool>());
          }
        }
      });

      test('left half is populated (has at least one true)', () {
        final grid = engine.generatePattern();
        bool hasTrue = false;
        for (final row in grid) {
          for (int x = 0; x < 3; x++) {
            if (row[x]) hasTrue = true;
          }
        }
        expect(hasTrue, isTrue);
      });

      test('right half is all false (unfilled)', () {
        final grid = engine.generatePattern();
        for (final row in grid) {
          for (int x = 3; x < 6; x++) {
            expect(row[x], isFalse);
          }
        }
      });

      test('generates different patterns', () {
        final patterns = List.generate(10, (_) => engine.generatePattern());
        final firstVal = patterns[0][0][0];
        final allSame = patterns.every((p) => p[0][0] == firstVal);
        expect(allSame, isFalse);
      });
    });

    group('checkSymmetry', () {
      test('returns true for a symmetric grid', () {
        final symmetricGrid = [
          [true, false, true, true, false, true],
          [false, true, false, false, true, false],
          [true, false, true, true, false, true],
          [true, true, false, false, true, true],
          [false, true, false, false, true, false],
          [true, false, true, true, false, true],
        ];
        expect(engine.checkSymmetry(symmetricGrid), isTrue);
      });

      test('returns false for a non-symmetric grid', () {
        final asymmetricGrid = [
          [true, false, true, false, false, false],
          [false, true, false, false, false, false],
          [true, false, true, false, false, false],
          [false, false, false, false, false, false],
          [false, false, false, false, false, false],
          [false, false, false, false, false, false],
        ];
        expect(engine.checkSymmetry(asymmetricGrid), isFalse);
      });

      test('returns true for all-false grid', () {
        final grid = List.generate(6, (_) => List.filled(6, false));
        expect(engine.checkSymmetry(grid), isTrue);
      });

      test('returns true for all-true grid', () {
        final grid = List.generate(6, (_) => List.filled(6, true));
        expect(engine.checkSymmetry(grid), isTrue);
      });

      test('single difference breaks symmetry', () {
        final grid = List.generate(6, (_) => List.filled(6, true));
        grid[0][0] = false;
        grid[0][5] = true;
        expect(engine.checkSymmetry(grid), isFalse);
      });

      test('mirror of left half creates symmetric grid', () {
        final leftHalf = [
          [true, false, true],
          [false, true, false],
          [true, true, false],
          [false, false, true],
          [true, false, false],
          [false, true, true],
        ];
        final grid = List.generate(6, (y) => List.filled(6, false));
        for (int y = 0; y < 6; y++) {
          for (int x = 0; x < 3; x++) {
            grid[y][x] = leftHalf[y][x];
            grid[y][5 - x] = leftHalf[y][x];
          }
        }
        expect(engine.checkSymmetry(grid), isTrue);
      });
    });
  });
}
