import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/dominosa/dominosa_engine.dart';

void main() {
  group('DominosaEngine', () {
    late DominosaEngine engine;

    setUp(() {
      engine = DominosaEngine();
    });

    group('generateLevel', () {
      test('returns a map with grid and maxVal', () {
        final level = engine.generateLevel(maxVal: 3);
        expect(level.containsKey('grid'), isTrue);
        expect(level.containsKey('maxVal'), isTrue);
      });

      test('grid dimensions are (maxVal+1) x (maxVal+2)', () {
        final level = engine.generateLevel(maxVal: 3);
        final grid = level['grid'] as List<List<int>>;
        expect(grid.length, 4); // rows = maxVal+1
        expect(grid[0].length, 5); // cols = maxVal+2
      });

      test('generates level with default maxVal', () {
        final level = engine.generateLevel();
        expect(level.containsKey('grid'), isTrue);
        expect(level.containsKey('maxVal'), isTrue);
      });

      test('grid values are in range 0..maxVal', () {
        final level = engine.generateLevel(maxVal: 3);
        final grid = level['grid'] as List<List<int>>;
        for (final row in grid) {
          for (final cell in row) {
            expect(cell, greaterThanOrEqualTo(0));
            expect(cell, lessThanOrEqualTo(3));
          }
        }
      });

      test('grid has no unassigned cells (-1)', () {
        final level = engine.generateLevel(maxVal: 3);
        final grid = level['grid'] as List<List<int>>;
        for (final row in grid) {
          for (final cell in row) {
            expect(cell, isNot(-1));
          }
        }
      });
    });

    group('checkVictoryWrapper', () {
      test('returns false when selections count does not match cell count', () {
        final grid = [
          [0, 1, 0, 1, 0],
          [1, 0, 1, 0, 1],
          [0, 1, 0, 1, 0],
          [1, 0, 1, 0, 1],
        ];
        final result = DominosaEngine.checkVictoryWrapper({
          'grid': grid,
          'selections': [
            [[0, 0], [0, 1]],
          ],
          'maxVal': 1,
        });
        expect(result, isFalse);
      });

      test('returns false for overlapping cells', () {
        final grid = [
          [0, 0, 1],
          [1, 0, 1],
          [0, 1, 1],
        ];
        final result = DominosaEngine.checkVictoryWrapper({
          'grid': grid,
          'selections': [
            [[0, 0], [0, 1]],
            [[0, 0], [1, 0]],
            [[0, 2], [1, 2]],
          ],
          'maxVal': 1,
        });
        expect(result, isFalse);
      });

      test('returns false for duplicate dominoes', () {
        final grid = [
          [0, 1, 0],
          [1, 0, 1],
          [0, 1, 0],
        ];
        final result = DominosaEngine.checkVictoryWrapper({
          'grid': grid,
          'selections': [
            [[0, 0], [0, 1]],
            [[0, 2], [1, 0]],
            [[1, 1], [1, 2]],
          ],
          'maxVal': 1,
        });
        expect(result, isFalse);
      });
    });
  });
}
