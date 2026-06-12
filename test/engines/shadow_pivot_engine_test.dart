import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/shadow_pivot/shadow_pivot_engine.dart';

void main() {
  group('ShadowPivotEngine', () {
    late ShadowPivotEngine engine;

    setUp(() {
      engine = ShadowPivotEngine();
    });

    group('projectSilhouette', () {
      test('returns 2D grid of correct size', () {
        final grid3D = _create3DGrid([
          [
            [true, false, false],
            [false, false, false],
            [false, false, false],
          ],
          [
            [false, false, false],
            [false, false, false],
            [false, false, false],
          ],
          [
            [false, false, false],
            [false, false, false],
            [false, false, false],
          ],
        ]);
        final result = engine.projectSilhouette(grid3D, LightDirection.top);
        expect(result.length, 3);
        for (final row in result) {
          expect(row.length, 3);
        }
      });

      test('top projection with single block at (0,0,0)', () {
        final grid3D = _emptyGrid(3);
        grid3D[0][0][0] = true;
        final result = engine.projectSilhouette(grid3D, LightDirection.top);
        expect(result[0][0], true);
        // All other cells should be false
        int trueCount = 0;
        for (final row in result) {
          for (final cell in row) {
            if (cell) trueCount++;
          }
        }
        expect(trueCount, 1);
      });

      test('front projection with single block at (0,0,0)', () {
        final grid3D = _emptyGrid(3);
        grid3D[0][0][0] = true;
        final result = engine.projectSilhouette(grid3D, LightDirection.front);
        // Front projection: result[size-1-z][x], so z=0 -> result[2][0]
        expect(result[2][0], true);
      });

      test('side projection with single block at (0,0,0)', () {
        final grid3D = _emptyGrid(3);
        grid3D[0][0][0] = true;
        final result = engine.projectSilhouette(grid3D, LightDirection.side);
        // Side projection: result[size-1-z][y], so z=0 -> result[2][0]
        expect(result[2][0], true);
      });

      test('top projection flattens z-axis correctly', () {
        final grid3D = _emptyGrid(3);
        grid3D[1][2][0] = true;
        grid3D[1][2][1] = true;
        grid3D[1][2][2] = true;
        final result = engine.projectSilhouette(grid3D, LightDirection.top);
        // Top: result[y][x], so (1,2) -> result[2][1]
        expect(result[2][1], true);
        // Only one cell should be true (z-axis collapsed)
        int trueCount = 0;
        for (final row in result) {
          for (final cell in row) {
            if (cell) trueCount++;
          }
        }
        expect(trueCount, 1);
      });

      test('empty grid produces all-false silhouette', () {
        final grid3D = _emptyGrid(3);
        final result = engine.projectSilhouette(grid3D, LightDirection.top);
        for (final row in result) {
          for (final cell in row) {
            expect(cell, false);
          }
        }
      });

      test('fully filled grid produces all-true silhouette for top', () {
        final grid3D = List.generate(
            3,
            (_) => List.generate(
                3, (_) => List.filled(3, true)));
        final result = engine.projectSilhouette(grid3D, LightDirection.top);
        for (final row in result) {
          for (final cell in row) {
            expect(cell, true);
          }
        }
      });
    });

    group('generateLevel', () {
      test('returns a ShadowPivotLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<ShadowPivotLevel>());
      });

      test('level has grid3D of 3x3x3', () {
        final level = engine.generateLevel();
        expect(level.grid3D.length, 3);
        for (final slice in level.grid3D) {
          expect(slice.length, 3);
          for (final row in slice) {
            expect(row.length, 3);
          }
        }
      });

      test('level has exactly 4 options', () {
        final level = engine.generateLevel();
        expect(level.options.length, 4);
      });

      test('correctOptionIndex is within range', () {
        final level = engine.generateLevel();
        expect(level.correctOptionIndex, greaterThanOrEqualTo(0));
        expect(level.correctOptionIndex, lessThan(4));
      });

      test('correct option matches projected silhouette', () {
        final level = engine.generateLevel();
        final expected =
            engine.projectSilhouette(level.grid3D, level.lightDirection);
        final actual = level.options[level.correctOptionIndex];
        expect(_gridsEqual(actual, expected), true);
      });

      test('all options are 3x3 grids', () {
        final level = engine.generateLevel();
        for (final option in level.options) {
          expect(option.length, 3);
          for (final row in option) {
            expect(row.length, 3);
          }
        }
      });

      test('options are not all identical', () {
        final level = engine.generateLevel();
        final first = level.options[0];
        final allSame =
            level.options.every((o) => _gridsEqual(o, first));
        expect(allSame, false);
      });

      test('grid3D contains at least some true values', () {
        final level = engine.generateLevel();
        bool hasTrue = false;
        for (final slice in level.grid3D) {
          for (final row in slice) {
            if (row.contains(true)) hasTrue = true;
          }
        }
        expect(hasTrue, true);
      });
    });
  });
}

List<List<List<bool>>> _emptyGrid(int size) {
  return List.generate(
      size, (_) => List.generate(size, (_) => List.filled(size, false)));
}

List<List<List<bool>>> _create3DGrid(List<List<List<bool>>> data) {
  return data;
}

bool _gridsEqual(List<List<bool>> a, List<List<bool>> b) {
  if (a.length != b.length) return false;
  for (int r = 0; r < a.length; r++) {
    for (int c = 0; c < a[r].length; c++) {
      if (a[r][c] != b[r][c]) return false;
    }
  }
  return true;
}
