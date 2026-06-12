import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/silhouette_match_ortho/silhouette_match_ortho_engine.dart';

void main() {
  group('SilhouetteMatchOrthoEngine', () {
    late SilhouetteMatchOrthoEngine engine;

    setUp(() {
      engine = SilhouetteMatchOrthoEngine();
    });

    group('projectPerspective', () {
      test('returns 3x3 grid', () {
        final grid3D = _emptyGrid();
        final result = engine.projectPerspective(grid3D, PerspectiveType.top);
        expect(result.length, 3);
        for (final row in result) {
          expect(row.length, 3);
        }
      });

      test('top projection with single block at (0,0,0)', () {
        final grid3D = _emptyGrid();
        grid3D[0][0][0] = true;
        final result = engine.projectPerspective(grid3D, PerspectiveType.top);
        expect(result[0][0], true);
        int trueCount = _countTrue(result);
        expect(trueCount, 1);
      });

      test('front projection with single block at (0,0,0)', () {
        final grid3D = _emptyGrid();
        grid3D[0][0][0] = true;
        final result =
            engine.projectPerspective(grid3D, PerspectiveType.front);
        // Front: result[size-1-z][x], z=0 -> result[2][0]
        expect(result[2][0], true);
      });

      test('side projection with single block at (0,0,0)', () {
        final grid3D = _emptyGrid();
        grid3D[0][0][0] = true;
        final result = engine.projectPerspective(grid3D, PerspectiveType.side);
        // Side: result[size-1-z][y], z=0 -> result[2][0]
        expect(result[2][0], true);
      });

      test('top projection collapses z-axis', () {
        final grid3D = _emptyGrid();
        grid3D[1][2][0] = true;
        grid3D[1][2][1] = true;
        grid3D[1][2][2] = true;
        final result = engine.projectPerspective(grid3D, PerspectiveType.top);
        // Top: result[y][x] -> result[2][1]
        expect(result[2][1], true);
        expect(_countTrue(result), 1);
      });

      test('front projection collapses y-axis', () {
        final grid3D = _emptyGrid();
        grid3D[0][0][0] = true;
        grid3D[0][1][0] = true;
        grid3D[0][2][0] = true;
        final result =
            engine.projectPerspective(grid3D, PerspectiveType.front);
        // Front: result[size-1-z][x] -> result[2][0]
        expect(result[2][0], true);
        expect(_countTrue(result), 1);
      });

      test('side projection collapses x-axis', () {
        final grid3D = _emptyGrid();
        grid3D[0][1][0] = true;
        grid3D[1][1][0] = true;
        grid3D[2][1][0] = true;
        final result = engine.projectPerspective(grid3D, PerspectiveType.side);
        // Side: result[size-1-z][y] -> result[2][1]
        expect(result[2][1], true);
        expect(_countTrue(result), 1);
      });

      test('empty grid produces all-false', () {
        final grid3D = _emptyGrid();
        for (final view in PerspectiveType.values) {
          final result = engine.projectPerspective(grid3D, view);
          expect(_countTrue(result), 0);
        }
      });

      test('fully filled grid produces all-true for top', () {
        final grid3D = List.generate(
            3,
            (_) => List.generate(
                3, (_) => List.filled(3, true)));
        final result = engine.projectPerspective(grid3D, PerspectiveType.top);
        expect(_countTrue(result), 9);
      });
    });

    group('generateLevel', () {
      test('returns an OrthoLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<OrthoLevel>());
      });

      test('grid3D is 3x3x3', () {
        final level = engine.generateLevel();
        expect(level.grid3D.length, 3);
        for (final slice in level.grid3D) {
          expect(slice.length, 3);
          for (final row in slice) {
            expect(row.length, 3);
          }
        }
      });

      test('has exactly 3 options', () {
        final level = engine.generateLevel();
        expect(level.options.length, 3);
      });

      test('correctOptionIndex is valid', () {
        final level = engine.generateLevel();
        expect(level.correctOptionIndex, greaterThanOrEqualTo(0));
        expect(level.correctOptionIndex, lessThan(3));
      });

      test('correct option matches projected view', () {
        final level = engine.generateLevel();
        final expected =
            engine.projectPerspective(level.grid3D, level.targetView);
        final actual = level.options[level.correctOptionIndex];
        expect(_gridsEqual(actual, expected), true);
      });

      test('all options are 3x3', () {
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

      test('grid3D contains blocks', () {
        final level = engine.generateLevel();
        expect(_countTrue3D(level.grid3D), greaterThan(0));
      });

      test('targetView is a valid PerspectiveType', () {
        final level = engine.generateLevel();
        expect(
          PerspectiveType.values.contains(level.targetView),
          true,
        );
      });
    });
  });
}

List<List<List<bool>>> _emptyGrid() {
  return List.generate(
      3, (_) => List.generate(3, (_) => List.filled(3, false)));
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

int _countTrue(List<List<bool>> grid) {
  int count = 0;
  for (final row in grid) {
    for (final cell in row) {
      if (cell) count++;
    }
  }
  return count;
}

int _countTrue3D(List<List<List<bool>>> grid) {
  int count = 0;
  for (final slice in grid) {
    for (final row in slice) {
      for (final cell in row) {
        if (cell) count++;
      }
    }
  }
  return count;
}
