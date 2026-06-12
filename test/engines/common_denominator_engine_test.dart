import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/common_denominator/common_denominator_engine.dart';

void main() {
  group('CommonDenominatorEngine', () {
    late CommonDenominatorEngine engine;

    setUp(() {
      engine = CommonDenominatorEngine();
    });

    group('generateProblem', () {
      test('returns a CommonDenominatorProblem', () {
        final problem = engine.generateProblem(0);
        expect(problem, isA<CommonDenominatorProblem>());
      });

      test('problem has numbers, type, and answer', () {
        final problem = engine.generateProblem(0);
        expect(problem.numbers, isNotEmpty);
        expect(problem.type, isA<CommonDenominatorType>());
        expect(problem.answer, isA<int>());
      });

      test('numbers are at least 2', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          for (final n in problem.numbers) {
            expect(n, greaterThanOrEqualTo(2));
          }
        }
      });

      test('numbers are distinct', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          expect(problem.numbers.toSet().length, problem.numbers.length);
        }
      });

      test('GCD answer divides all numbers', () {
        for (int i = 0; i < 30; i++) {
          final problem = engine.generateProblem(0);
          if (problem.type == CommonDenominatorType.gcd) {
            for (final n in problem.numbers) {
              expect(n % problem.answer, 0);
            }
          }
        }
      });

      test('LCM answer is divisible by all numbers', () {
        for (int i = 0; i < 30; i++) {
          final problem = engine.generateProblem(0);
          if (problem.type == CommonDenominatorType.lcm) {
            for (final n in problem.numbers) {
              expect(problem.answer % n, 0);
            }
          }
        }
      });

      test('LCM answer is <= 100', () {
        for (int i = 0; i < 30; i++) {
          final problem = engine.generateProblem(0);
          if (problem.type == CommonDenominatorType.lcm) {
            expect(problem.answer, lessThanOrEqualTo(100));
          }
        }
      });

      test('higher score can produce 3-number problems', () {
        bool hasThree = false;
        for (int i = 0; i < 30; i++) {
          final problem = engine.generateProblem(10);
          if (problem.numbers.length == 3) {
            hasThree = true;
            break;
          }
        }
        expect(hasThree, isTrue);
      });
    });
  });

  group('CommonDenominatorProblem', () {
    test('question getter formats GCD', () {
      final problem = CommonDenominatorProblem(
        numbers: [12, 18],
        type: CommonDenominatorType.gcd,
        answer: 6,
      );
      expect(problem.question, 'GCD(12, 18)');
    });

    test('question getter formats LCM', () {
      final problem = CommonDenominatorProblem(
        numbers: [4, 6],
        type: CommonDenominatorType.lcm,
        answer: 12,
      );
      expect(problem.question, 'LCM(4, 6)');
    });
  });
}
