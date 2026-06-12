import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/classic_maze/classic_maze_engine.dart';

void main() {
  group('ClassicMazeEngine', () {
    late ClassicMazeEngine engine;

    setUp(() {
      engine = ClassicMazeEngine();
    });

    group('generateLevel', () {
      test('returns a ClassicMazeLevel', () {
        final level = engine.generateLevel(7);
        expect(level, isA<ClassicMazeLevel>());
      });

      test('grid size is odd', () {
        final level = engine.generateLevel(8);
        expect(level.size % 2, 1);
      });

      test('grid has correct dimensions', () {
        final level = engine.generateLevel(7);
        expect(level.grid.length, level.size);
        for (final row in level.grid) {
          expect(row.length, level.size);
        }
      });

      test('start and exit positions are paths', () {
        final level = engine.generateLevel(7);
        expect(level.grid[level.startR][level.startC], 0);
        expect(level.grid[level.exitR][level.exitC], 0);
      });

      test('start is at (1,1)', () {
        final level = engine.generateLevel(7);
        expect(level.startR, 1);
        expect(level.startC, 1);
      });

      test('exit is at (size-2, size-2)', () {
        final level = engine.generateLevel(7);
        expect(level.exitR, level.size - 2);
        expect(level.exitC, level.size - 2);
      });

      test('grid contains only 0s and 1s', () {
        final level = engine.generateLevel(7);
        for (final row in level.grid) {
          for (final cell in row) {
            expect(cell == 0 || cell == 1, isTrue);
          }
        }
      });

      test('border cells are walls', () {
        final level = engine.generateLevel(7);
        // Top and bottom rows
        for (int c = 0; c < level.size; c++) {
          expect(level.grid[0][c], 1);
          expect(level.grid[level.size - 1][c], 1);
        }
        // Left and right columns
        for (int r = 0; r < level.size; r++) {
          expect(level.grid[r][0], 1);
          expect(level.grid[r][level.size - 1], 1);
        }
      });
    });
  });

  group('ClassicMazeLevel', () {
    test('stores all fields', () {
      final level = ClassicMazeLevel(
        grid: [[0, 1], [1, 0]],
        size: 2,
        startR: 0,
        startC: 0,
        exitR: 1,
        exitC: 1,
      );
      expect(level.size, 2);
      expect(level.startR, 0);
      expect(level.exitC, 1);
    });
  });
}
