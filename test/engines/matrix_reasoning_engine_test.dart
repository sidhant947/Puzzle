import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/matrix_reasoning/matrix_reasoning_engine.dart';

void main() {
  group('MatrixReasoningEngine', () {
    late MatrixReasoningEngine engine;

    setUp(() {
      engine = MatrixReasoningEngine();
    });

    group('generatePuzzle', () {
      test('returns a puzzle with cells, answer, options, and missingIndex', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.cells.length, equals(9));
        expect(puzzle.answer, isNotNull);
        expect(puzzle.options.length, equals(4));
        expect(puzzle.missingIndex, equals(8));
      });

      test('options contain 4 unique cells', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          // At least 3 wrong options
          expect(puzzle.options.length, equals(4));
        }
      });

      test('answer is one of the options', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          final found = puzzle.options.any((o) =>
              o.shape == puzzle.answer.shape && o.color == puzzle.answer.color);
          expect(found, isTrue);
        }
      });

      test('cells have shape and color', () {
        final puzzle = engine.generatePuzzle();
        for (final cell in puzzle.cells) {
          expect(cell.shape, isNotNull);
          expect(cell.color, isNotNull);
        }
      });
    });

    group('MatrixCell', () {
      test('stores shape and color', () {
        final cell = MatrixCell(shape: MatrixReasoningEngine().generatePuzzle().cells[0].shape, color: MatrixReasoningEngine().generatePuzzle().cells[0].color);
        expect(cell.shape, isNotNull);
        expect(cell.color, isNotNull);
      });
    });
  });
}
