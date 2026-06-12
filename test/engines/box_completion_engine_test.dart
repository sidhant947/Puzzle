import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/box_completion/box_completion_engine.dart';

void main() {
  group('BoxCompletionEngine', () {
    late BoxCompletionEngine engine;

    setUp(() {
      engine = BoxCompletionEngine();
    });

    group('generatePuzzle', () {
      test('returns a BoxCompletionPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<BoxCompletionPuzzle>());
      });

      test('net has 12 cells (3x4)', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.net.length, 12);
      });

      test('options have 3 values each', () {
        final puzzle = engine.generatePuzzle();
        for (final option in puzzle.options) {
          expect(option.length, 3);
        }
      });

      test('correct option index is valid', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.correctOptionIndex, greaterThanOrEqualTo(0));
        expect(puzzle.correctOptionIndex, lessThan(puzzle.options.length));
      });

      test('generates different puzzles', () {
        final results = <String>{};
        for (int i = 0; i < 10; i++) {
          final puzzle = engine.generatePuzzle();
          results.add(puzzle.net.toString());
        }
        expect(results.length, greaterThan(1));
      });
    });
  });

  group('BoxCompletionPuzzle', () {
    test('stores all fields', () {
      final puzzle = BoxCompletionPuzzle(
        net: [null, 1, null, null, 2, 3, 4, 5, null, 6, null, null],
        options: [
          [1, 3, 4],
          [1, 3, 5],
        ],
        correctOptionIndex: 0,
      );
      expect(puzzle.net.length, 12);
      expect(puzzle.options.length, 2);
      expect(puzzle.correctOptionIndex, 0);
    });
  });
}
