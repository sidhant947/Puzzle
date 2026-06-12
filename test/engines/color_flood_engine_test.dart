import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/color_flood/color_flood_engine.dart';

void main() {
  group('ColorFloodEngine', () {
    late ColorFloodEngine engine;

    setUp(() {
      engine = ColorFloodEngine();
    });

    group('generateGrid', () {
      test('generates grid of correct size', () {
        final grid = engine.generateGrid(5);
        expect(grid.length, 5);
        for (final row in grid) {
          expect(row.length, 5);
        }
      });

      test('grid values are valid color indices', () {
        final grid = engine.generateGrid(5);
        for (final row in grid) {
          for (final cell in row) {
            expect(cell, greaterThanOrEqualTo(0));
            expect(cell, lessThan(ColorFloodEngine.colors.length));
          }
        }
      });

      test('generates different grids', () {
        final grid1 = engine.generateGrid(5);
        final grid2 = engine.generateGrid(5);
        // Very unlikely to be identical
        bool allSame = true;
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            if (grid1[r][c] != grid2[r][c]) {
              allSame = false;
              break;
            }
          }
        }
        expect(allSame, isFalse);
      });
    });

    group('floodFill', () {
      test('fills connected region', () {
        final grid = [
          [0, 0, 1],
          [0, 1, 1],
          [2, 2, 0],
        ];
        engine.floodFill(grid, 0, 0, 0, 3);
        expect(grid[0][0], 3);
        expect(grid[0][1], 3);
        expect(grid[1][0], 3);
        expect(grid[2][2], 0); // Not connected
      });

      test('does nothing if target == replacement', () {
        final grid = [
          [0, 0],
          [0, 0],
        ];
        engine.floodFill(grid, 0, 0, 0, 0);
        expect(grid[0][0], 0);
      });

      test('does nothing for out of bounds', () {
        final grid = [[0]];
        engine.floodFill(grid, -1, 0, 0, 1);
        expect(grid[0][0], 0);
      });
    });

    group('isSolved', () {
      test('returns true when all cells are same color', () {
        final grid = [
          [2, 2, 2],
          [2, 2, 2],
          [2, 2, 2],
        ];
        expect(engine.isSolved(grid), isTrue);
      });

      test('returns false when cells differ', () {
        final grid = [
          [2, 2, 2],
          [2, 1, 2],
          [2, 2, 2],
        ];
        expect(engine.isSolved(grid), isFalse);
      });

      test('returns true for single cell grid', () {
        final grid = [[3]];
        expect(engine.isSolved(grid), isTrue);
      });
    });
  });

  group('ColorFloodEngine colors', () {
    test('has 6 colors', () {
      expect(ColorFloodEngine.colors.length, 6);
    });
  });
}
