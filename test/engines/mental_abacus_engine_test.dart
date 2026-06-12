import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/mental_abacus/mental_abacus_engine.dart';

void main() {
  group('MentalAbacusEngine', () {
    late MentalAbacusEngine engine;

    setUp(() {
      engine = MentalAbacusEngine();
    });

    group('generateProblem', () {
      test('returns a problem with value1, value2, operator, and result', () {
        final problem = engine.generateProblem();
        expect(problem.value1, isA<int>());
        expect(problem.value2, isA<int>());
        expect(problem.operator, anyOf(equals('+'), equals('-')));
        expect(problem.result, isA<int>());
      });

      test('addition problems have correct result', () {
        for (int i = 0; i < 100; i++) {
          final problem = engine.generateProblem();
          if (problem.operator == '+') {
            expect(problem.result, equals(problem.value1 + problem.value2));
          }
        }
      });

      test('subtraction problems have correct result', () {
        for (int i = 0; i < 100; i++) {
          final problem = engine.generateProblem();
          if (problem.operator == '-') {
            expect(problem.result, equals(problem.value1 - problem.value2));
          }
        }
      });

      test('subtraction ensures non-negative result', () {
        for (int i = 0; i < 100; i++) {
          final problem = engine.generateProblem();
          if (problem.operator == '-') {
            expect(problem.result, greaterThanOrEqualTo(0));
            expect(problem.value1, greaterThanOrEqualTo(problem.value2));
          }
        }
      });

      test('generates both addition and subtraction', () {
        bool hasAdd = false;
        bool hasSub = false;
        for (int i = 0; i < 50; i++) {
          final problem = engine.generateProblem();
          if (problem.operator == '+') hasAdd = true;
          if (problem.operator == '-') hasSub = true;
          if (hasAdd && hasSub) break;
        }
        expect(hasAdd, isTrue);
        expect(hasSub, isTrue);
      });
    });

    group('AbacusProblem', () {
      test('stores fields correctly', () {
        final problem = AbacusProblem(
          value1: 123,
          value2: 45,
          operator: '+',
          result: 168,
        );
        expect(problem.value1, equals(123));
        expect(problem.value2, equals(45));
        expect(problem.operator, equals('+'));
        expect(problem.result, equals(168));
      });
    });
  });
}
