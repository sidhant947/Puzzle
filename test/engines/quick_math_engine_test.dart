import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/quick_math/quick_math_engine.dart';

void main() {
  group('QuickMathEngine', () {
    late QuickMathEngine engine;

    setUp(() {
      engine = QuickMathEngine();
    });

    group('generateProblem', () {
      test('returns a MathProblem', () {
        final problem = engine.generateProblem();
        expect(problem, isA<MathProblem>());
      });

      test('equation is non-empty', () {
        final problem = engine.generateProblem();
        expect(problem.equation.isNotEmpty, isTrue);
      });

      test('answer is positive', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem();
          expect(problem.answer, greaterThan(0));
        }
      });

      test('equation contains an operator', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem();
          expect(
            problem.equation.contains('+') ||
                problem.equation.contains('-') ||
                problem.equation.contains('×'),
            isTrue,
          );
        }
      });

      test('generates different problems on multiple calls', () {
        final equations = <String>{};
        for (int i = 0; i < 10; i++) {
          equations.add(engine.generateProblem().equation);
        }
        expect(equations.length, greaterThan(1));
      });
    });
  });

  group('MathProblem', () {
    test('stores values correctly', () {
      final problem = MathProblem(equation: '3 + 4', answer: 7);
      expect(problem.equation, equals('3 + 4'));
      expect(problem.answer, equals(7));
    });
  });
}
