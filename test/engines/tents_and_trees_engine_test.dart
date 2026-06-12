import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/tents_and_trees/tents_and_trees_engine.dart';

void main() {
  group('TentsAndTreesEngine', () {
    late TentsAndTreesEngine engine;

    setUp(() {
      engine = TentsAndTreesEngine();
    });

    group('generatePuzzle', () {
      test('generates puzzle with correct size', () {
        final level = engine.generatePuzzle(5);
        expect(level.size, 5);
      });

      test('row clues have correct length', () {
        final level = engine.generatePuzzle(5);
        expect(level.rowClues.length, 5);
      });

      test('col clues have correct length', () {
        final level = engine.generatePuzzle(5);
        expect(level.colClues.length, 5);
      });

      test('row clues are non-negative', () {
        final level = engine.generatePuzzle(5);
        for (final clue in level.rowClues) {
          expect(clue, greaterThanOrEqualTo(0));
        }
      });

      test('col clues are non-negative', () {
        final level = engine.generatePuzzle(5);
        for (final clue in level.colClues) {
          expect(clue, greaterThanOrEqualTo(0));
        }
      });

      test('generates puzzle with size 4', () {
        final level = engine.generatePuzzle(4);
        expect(level.size, 4);
        expect(level.rowClues.length, 4);
        expect(level.colClues.length, 4);
      });
    });

    group('getRandomPuzzle', () {
      test('returns a 5x5 puzzle', () {
        final level = engine.getRandomPuzzle();
        expect(level.size, 5);
      });

      test('has tree positions', () {
        final level = engine.getRandomPuzzle();
        expect(level.treePositions, isNotEmpty);
      });
    });

    group('isSolved', () {
      test('returns false for empty grid', () {
        final level = engine.generatePuzzle(5);
        final grid = List.generate(5, (_) => List.filled(5, CellType.empty));
        expect(engine.isSolved(level, grid), isFalse);
      });

      test('returns false when row clue not met', () {
        const level = TentsLevel(
          size: 3,
          treePositions: [Point(0, 0), Point(1, 2)],
          rowClues: [1, 1, 0],
          colClues: [1, 0, 1],
        );
        final grid = [
          [CellType.tree, CellType.tent, CellType.grass],
          [CellType.grass, CellType.grass, CellType.tree],
          [CellType.grass, CellType.grass, CellType.grass],
        ];
        expect(engine.isSolved(level, grid), isFalse);
      });

      test('returns false when tent adjacent to another tent', () {
        const level = TentsLevel(
          size: 3,
          treePositions: [Point(0, 0), Point(2, 2)],
          rowClues: [1, 0, 1],
          colClues: [0, 1, 1],
        );
        final grid = [
          [CellType.tree, CellType.tent, CellType.grass],
          [CellType.grass, CellType.tent, CellType.grass],
          [CellType.grass, CellType.grass, CellType.tree],
        ];
        expect(engine.isSolved(level, grid), isFalse);
      });

      test('returns false when tent not adjacent to tree', () {
        const level = TentsLevel(
          size: 3,
          treePositions: [Point(0, 0), Point(2, 2)],
          rowClues: [1, 0, 1],
          colClues: [1, 0, 1],
        );
        final grid = [
          [CellType.tree, CellType.grass, CellType.tent],
          [CellType.grass, CellType.grass, CellType.grass],
          [CellType.tent, CellType.grass, CellType.tree],
        ];
        expect(engine.isSolved(level, grid), isFalse);
      });
    });
  });
}
