import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/calculation_sprint/calculation_sprint_engine.dart';

void main() {
  group('CalculationSprintEngine', () {
    late CalculationSprintEngine engine;

    setUp(() {
      engine = CalculationSprintEngine();
    });

    group('generateProblem', () {
      test('returns a MathProblem', () {
        final problem = engine.generateProblem(0);
        expect(problem, isA<MathProblem>());
      });

      test('problem has equation, answer, and options', () {
        final problem = engine.generateProblem(0);
        expect(problem.equation, isNotEmpty);
        expect(problem.answer, isA<int>());
        expect(problem.options.length, 4);
      });

      test('answer is in options', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          expect(problem.options, contains(problem.answer));
        }
      });

      test('options are unique', () {
        final problem = engine.generateProblem(0);
        expect(problem.options.toSet().length, problem.options.length);
      });

      test('equation contains an operator', () {
        final problem = engine.generateProblem(0);
        expect(problem.equation, matches(RegExp(r'[+\-×]')));
      });

      test('answer is non-negative', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          expect(problem.answer, greaterThanOrEqualTo(0));
        }
      });

      test('higher difficulty can produce multiplication', () {
        bool hasMultiplication = false;
        for (int i = 0; i < 50; i++) {
          final problem = engine.generateProblem(15);
          if (problem.equation.contains('×')) {
            hasMultiplication = true;
            break;
          }
        }
        expect(hasMultiplication, isTrue);
      });
    });
  });

  group('MathProblem', () {
    test('stores all fields', () {
      final problem = MathProblem(
        equation: '3 + 4',
        answer: 7,
        options: [7, 6, 8, 5],
      );
      expect(problem.equation, '3 + 4');
      expect(problem.answer, 7);
      expect(problem.options, [7, 6, 8, 5]);
    });
  });
}
