import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/dual_mirror/dual_mirror_engine.dart';

void main() {
  group('DualMirrorEngine', () {
    late DualMirrorEngine engine;

    setUp(() {
      engine = DualMirrorEngine();
    });

    group('generateLevel', () {
      test('returns a DualMirrorLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<DualMirrorLevel>());
      });

      test('both mazes are 5x5', () {
        final level = engine.generateLevel();
        expect(level.maze1.length, 5);
        expect(level.maze1[0].length, 5);
        expect(level.maze2.length, 5);
        expect(level.maze2[0].length, 5);
      });

      test('start and target positions are within bounds', () {
        final level = engine.generateLevel();
        expect(level.start1.x, greaterThanOrEqualTo(0));
        expect(level.start1.x, lessThan(5));
        expect(level.start1.y, greaterThanOrEqualTo(0));
        expect(level.start1.y, lessThan(5));
        expect(level.target1.x, greaterThanOrEqualTo(0));
        expect(level.target1.x, lessThan(5));
        expect(level.target1.y, greaterThanOrEqualTo(0));
        expect(level.target1.y, lessThan(5));
      });

      test('start and target cells are not blocked', () {
        final level = engine.generateLevel();
        expect(level.maze1[level.start1.y][level.start1.x], isFalse);
        expect(level.maze1[level.target1.y][level.target1.x], isFalse);
        expect(level.maze2[level.start2.y][level.start2.x], isFalse);
        expect(level.maze2[level.target2.y][level.target2.x], isFalse);
      });
    });

    group('move', () {
      test('moves UP reduces y by 1', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(2, 3);
        final result = engine.move(start, 'UP', maze, false);
        expect(result, Point(2, 2));
      });

      test('moves DOWN increases y by 1', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(2, 1);
        final result = engine.move(start, 'DOWN', maze, false);
        expect(result, Point(2, 2));
      });

      test('moves LEFT reduces x by 1', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(3, 2);
        final result = engine.move(start, 'LEFT', maze, false);
        expect(result, Point(2, 2));
      });

      test('moves RIGHT increases x by 1', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(1, 2);
        final result = engine.move(start, 'RIGHT', maze, false);
        expect(result, Point(2, 2));
      });

      test('does not move into blocked cell', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        maze[3][2] = true;
        final start = Point(2, 2);
        final result = engine.move(start, 'DOWN', maze, false);
        expect(result, start);
      });

      test('does not move outside bounds', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(0, 0);
        final result = engine.move(start, 'LEFT', maze, false);
        expect(result, start);
      });

      test('mirrored mode reverses direction', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(2, 2);
        final result = engine.move(start, 'UP', maze, true);
        expect(result, Point(2, 3));
      });

      test('mirrored DOWN moves up', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(2, 2);
        final result = engine.move(start, 'DOWN', maze, true);
        expect(result, Point(2, 1));
      });

      test('mirrored RIGHT moves left', () {
        final maze = List.generate(5, (_) => List.filled(5, false));
        final start = Point(2, 2);
        final result = engine.move(start, 'RIGHT', maze, true);
        expect(result, Point(1, 2));
      });
    });
  });
}
