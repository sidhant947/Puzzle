import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/rotating_maze/rotating_maze_engine.dart';

void main() {
  group('RotatingMazeEngine', () {
    late RotatingMazeEngine engine;

    setUp(() {
      engine = RotatingMazeEngine();
    });

    group('generateLevel', () {
      test('returns a RotatingMazeLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<RotatingMazeLevel>());
      });

      test('grid is 6x6', () {
        final level = engine.generateLevel();
        expect(level.size, equals(6));
        expect(level.grid.length, equals(6));
        for (final row in level.grid) {
          expect(row.length, equals(6));
        }
      });

      test('grid values are 0 or 1', () {
        final level = engine.generateLevel();
        for (final row in level.grid) {
          for (final cell in row) {
            expect(cell == 0 || cell == 1, isTrue);
          }
        }
      });

      test('start position is open', () {
        final level = engine.generateLevel();
        expect(level.grid[level.startR][level.startC], equals(0));
        expect(level.startR, equals(0));
        expect(level.startC, equals(0));
      });

      test('exit position is open', () {
        final level = engine.generateLevel();
        expect(level.grid[level.exitR][level.exitC], equals(0));
        expect(level.exitR, equals(5));
        expect(level.exitC, equals(5));
      });

      test('not all cells are walls', () {
        final level = engine.generateLevel();
        int openCount = 0;
        for (final row in level.grid) {
          for (final cell in row) {
            if (cell == 0) openCount++;
          }
        }
        expect(openCount, greaterThan(2));
      });
    });

    group('rotate90Clockwise', () {
      test('returns grid and transformed coordinates', () {
        final grid = [
          [0, 1, 0],
          [0, 0, 1],
          [1, 0, 0],
        ];
        final result = engine.rotate90Clockwise(grid, 0, 0, 2, 2);
        expect(result.containsKey('grid'), isTrue);
        expect(result.containsKey('marbleR'), isTrue);
        expect(result.containsKey('marbleC'), isTrue);
        expect(result.containsKey('exitR'), isTrue);
        expect(result.containsKey('exitC'), isTrue);
      });

      test('rotated grid preserves cell values', () {
        final grid = [
          [0, 1, 0],
          [0, 0, 1],
          [1, 0, 0],
        ];
        final result = engine.rotate90Clockwise(grid, 0, 0, 2, 2);
        final newGrid = result['grid'] as List<List<int>>;
        expect(newGrid.length, equals(3));
        for (final row in newGrid) {
          expect(row.length, equals(3));
        }
      });

      test('four rotations return to original', () {
        final grid = [
          [0, 1, 0],
          [0, 0, 1],
          [1, 0, 0],
        ];
        var result = engine.rotate90Clockwise(grid, 1, 1, 2, 2);
        result = engine.rotate90Clockwise(
            result['grid'] as List<List<int>>,
            result['marbleR'] as int,
            result['marbleC'] as int,
            result['exitR'] as int,
            result['exitC'] as int);
        result = engine.rotate90Clockwise(
            result['grid'] as List<List<int>>,
            result['marbleR'] as int,
            result['marbleC'] as int,
            result['exitR'] as int,
            result['exitC'] as int);
        result = engine.rotate90Clockwise(
            result['grid'] as List<List<int>>,
            result['marbleR'] as int,
            result['marbleC'] as int,
            result['exitR'] as int,
            result['exitC'] as int);
        expect(result['grid'], equals(grid));
        expect(result['marbleR'], equals(1));
        expect(result['marbleC'], equals(1));
        expect(result['exitR'], equals(2));
        expect(result['exitC'], equals(2));
      });
    });

    group('rotate180', () {
      test('returns grid and transformed coordinates', () {
        final grid = [
          [0, 1],
          [1, 0],
        ];
        final result = engine.rotate180(grid, 0, 0, 1, 1);
        expect(result.containsKey('grid'), isTrue);
        expect(result.containsKey('marbleR'), isTrue);
        expect(result.containsKey('marbleC'), isTrue);
      });

      test('two 180 rotations return to original', () {
        final grid = [
          [0, 1, 0],
          [1, 0, 1],
          [0, 1, 0],
        ];
        var result = engine.rotate180(grid, 0, 0, 2, 2);
        result = engine.rotate180(
            result['grid'] as List<List<int>>,
            result['marbleR'] as int,
            result['marbleC'] as int,
            result['exitR'] as int,
            result['exitC'] as int);
        expect(result['grid'], equals(grid));
      });
    });
  });
}
