import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/radical_roots/radical_roots_engine.dart';

void main() {
  group('RadicalRootsEngine', () {
    late RadicalRootsEngine engine;

    setUp(() {
      engine = RadicalRootsEngine();
    });

    group('generateProblem', () {
      test('returns a RadicalProblem', () {
        final problem = engine.generateProblem(0);
        expect(problem, isA<RadicalProblem>());
      });

      test('question contains a radical symbol', () {
        final problem = engine.generateProblem(0);
        expect(
          problem.question.contains('√') || problem.question.contains('∛'),
          isTrue,
        );
      });

      test('answer is positive', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          expect(problem.answer, greaterThan(0));
        }
      });

      test('options contain the correct answer', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          expect(problem.options.contains(problem.answer), isTrue);
        }
      });

      test('options list has 4 items', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          expect(problem.options.length, equals(4));
        }
      });

      test('all options are positive', () {
        final problem = engine.generateProblem(0);
        for (final opt in problem.options) {
          expect(opt, greaterThan(0));
        }
      });

      test('all options are unique', () {
        final problem = engine.generateProblem(0);
        expect(problem.options.toSet().length, equals(4));
      });
    });
  });

  group('RadicalProblem', () {
    test('stores values correctly', () {
      final problem = RadicalProblem(
        question: '√25',
        answer: 5,
        options: [3, 4, 5, 6],
      );
      expect(problem.question, equals('√25'));
      expect(problem.answer, equals(5));
      expect(problem.options, equals([3, 4, 5, 6]));
    });
  });
}
