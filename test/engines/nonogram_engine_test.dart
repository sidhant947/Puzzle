import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/nonogram/nonogram_engine.dart';

void main() {
  group('NonogramEngine', () {
    late NonogramEngine engine;

    setUp(() {
      engine = NonogramEngine();
    });

    group('generatePuzzle', () {
      test('generates puzzle with correct size', () {
        final puzzle = engine.generatePuzzle(5);
        expect(puzzle.rowClues.length, equals(5));
        expect(puzzle.colClues.length, equals(5));
      });

      test('row clues are non-empty lists', () {
        final puzzle = engine.generatePuzzle(5);
        for (final clues in puzzle.rowClues) {
          expect(clues, isNotEmpty);
          expect(clues.first, greaterThanOrEqualTo(0));
        }
      });

      test('col clues are non-empty lists', () {
        final puzzle = engine.generatePuzzle(5);
        for (final clues in puzzle.colClues) {
          expect(clues, isNotEmpty);
          expect(clues.first, greaterThanOrEqualTo(0));
        }
      });

      test('generates different puzzles on multiple calls', () {
        final puzzle1 = engine.generatePuzzle(5);
        final puzzle2 = engine.generatePuzzle(5);

        // Very unlikely to be identical
        final clues1 = puzzle1.rowClues.join(',');
        final clues2 = puzzle2.rowClues.join(',');
        expect(clues1, isNot(equals(clues2)));
      });
    });

    group('isCorrect', () {
      test('returns true for correct solution', () {
        // Create a simple 3x3 solution
        final grid = [
          [1, 1, 0],
          [0, 1, 0],
          [1, 0, 1],
        ];

        final rowClues = [
          [2],
          [1],
          [1, 1],
        ];

        final colClues = [
          [1, 1],
          [2],
          [1],
        ];

        expect(NonogramEngine.isCorrect(grid, rowClues, colClues), isTrue);
      });

      test('returns false for incorrect solution', () {
        final grid = [
          [1, 1, 1], // Wrong - should be [1, 1, 0]
          [0, 1, 0],
          [1, 0, 1],
        ];

        final rowClues = [
          [2], // Expects only 2 filled
          [1],
          [1, 1],
        ];

        final colClues = [
          [1, 1],
          [2],
          [1],
        ];

        expect(NonogramEngine.isCorrect(grid, rowClues, colClues), isFalse);
      });

      test('returns true for all empty grid with zero clues', () {
        final grid = [
          [0, 0],
          [0, 0],
        ];

        final rowClues = [
          [0],
          [0],
        ];

        final colClues = [
          [0],
          [0],
        ];

        expect(NonogramEngine.isCorrect(grid, rowClues, colClues), isTrue);
      });

      test('returns true for all filled grid', () {
        final grid = [
          [1, 1],
          [1, 1],
        ];

        final rowClues = [
          [2],
          [2],
        ];

        final colClues = [
          [2],
          [2],
        ];

        expect(NonogramEngine.isCorrect(grid, rowClues, colClues), isTrue);
      });
    });

    group('generatePuzzleWrapper', () {
      test('returns a valid puzzle', () {
        final puzzle = NonogramEngine.generatePuzzleWrapper(5);
        expect(puzzle, isA<NonogramPuzzle>());
        expect(puzzle.rowClues.length, equals(5));
        expect(puzzle.colClues.length, equals(5));
      });
    });
  });
}
