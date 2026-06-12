import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/numerical_estimation/numerical_estimation_engine.dart';

void main() {
  group('NumericalEstimationEngine', () {
    late NumericalEstimationEngine engine;

    setUp(() {
      engine = NumericalEstimationEngine();
    });

    group('generatePuzzle', () {
      test('returns a NumericalEstimationPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<NumericalEstimationPuzzle>());
      });

      test('has a non-empty question', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.question.isNotEmpty, isTrue);
      });

      test('question contains an operator', () {
        final puzzle = engine.generatePuzzle();
        expect(
          puzzle.question.contains('+') ||
              puzzle.question.contains('-') ||
              puzzle.question.contains('×'),
          isTrue,
        );
      });

      test('options list contains exactly 4 items', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.length, equals(4));
      });

      test('answer is included in options', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.contains(puzzle.answer), isTrue);
      });

      test('all options are positive', () {
        final puzzle = engine.generatePuzzle();
        for (final opt in puzzle.options) {
          expect(opt, greaterThan(0));
        }
      });

      test('all options are unique', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.toSet().length, equals(4));
      });

      test('generates different puzzles on multiple calls', () {
        final questions = <String>{};
        for (int i = 0; i < 10; i++) {
          questions.add(engine.generatePuzzle().question);
        }
        expect(questions.length, greaterThan(1));
      });
    });
  });
}
