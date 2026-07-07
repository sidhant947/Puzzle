import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/compass_maze/compass_maze_engine.dart';

void main() {
  group('CompassMazeEngine', () {
    late CompassMazeEngine engine;

    setUp(() {
      engine = CompassMazeEngine();
    });

    group('generateLevel', () {
      test('returns a CompassMazeLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<CompassMazeLevel>());
      });

      test('grid is 7x7', () {
        final level = engine.generateLevel();
        expect(level.size, 7);
        expect(level.grid.length, 7);
        for (final row in level.grid) {
          expect(row.length, 7);
        }
      });

      test('grid contains only 0s and 1s', () {
        final level = engine.generateLevel();
        for (final row in level.grid) {
          for (final cell in row) {
            expect(cell == 0 || cell == 1, isTrue);
          }
        }
      });

      test('start is at (0,0)', () {
        final level = engine.generateLevel();
        expect(level.startR, 0);
        expect(level.startC, 0);
        expect(level.grid[0][0], 0);
      });

      test('exit is at (6,6)', () {
        final level = engine.generateLevel();
        expect(level.exitR, 6);
        expect(level.exitC, 6);
        expect(level.grid[6][6], 0);
      });

      test('orientation rotation is 0, 90, 180, or 270', () {
        final level = engine.generateLevel();
        expect([0, 90, 180, 270], contains(level.orientationRotation));
      });
    });

    group('getMove', () {
      test('north with 0 rotation goes up', () {
        final move = engine.getMove(CompassDirection.north, 0);
        expect(move, [-1, 0]);
      });

      test('east with 0 rotation goes right', () {
        final move = engine.getMove(CompassDirection.east, 0);
        expect(move, [0, 1]);
      });

      test('south with 0 rotation goes down', () {
        final move = engine.getMove(CompassDirection.south, 0);
        expect(move, [1, 0]);
      });

      test('west with 0 rotation goes left', () {
        final move = engine.getMove(CompassDirection.west, 0);
        expect(move, [0, -1]);
      });

      test('north with 90 rotation goes up', () {
        final move = engine.getMove(CompassDirection.north, 90);
        expect(move, equals([-1, 0]));
      });

      test('north with 360 rotation same as 0', () {
        final move0 = engine.getMove(CompassDirection.north, 0);
        final move360 = engine.getMove(CompassDirection.north, 360);
        expect(move0, equals(move360));
      });
    });
  });

  group('CompassMazeLevel', () {
    test('stores all fields', () {
      final level = CompassMazeLevel(
        grid: [[0, 1], [1, 0]],
        size: 2,
        startR: 0,
        startC: 0,
        exitR: 1,
        exitC: 1,
        orientationRotation: 90,
      );
      expect(level.size, 2);
      expect(level.orientationRotation, 90);
    });
  });
}
