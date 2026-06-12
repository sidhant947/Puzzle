import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/roman_arithmetic/roman_arithmetic_engine.dart';

void main() {
  group('RomanArithmeticEngine', () {
    late RomanArithmeticEngine engine;

    setUp(() {
      engine = RomanArithmeticEngine();
    });

    group('intToRoman', () {
      test('converts 1 to I', () {
        expect(engine.intToRoman(1), equals('I'));
      });

      test('converts 4 to IV', () {
        expect(engine.intToRoman(4), equals('IV'));
      });

      test('converts 9 to IX', () {
        expect(engine.intToRoman(9), equals('IX'));
      });

      test('converts 14 to XIV', () {
        expect(engine.intToRoman(14), equals('XIV'));
      });

      test('converts 42 to XLII', () {
        expect(engine.intToRoman(42), equals('XLII'));
      });

      test('converts 99 to XCIX', () {
        expect(engine.intToRoman(99), equals('XCIX'));
      });

      test('converts 2023 to MMXXIII', () {
        expect(engine.intToRoman(2023), equals('MMXXIII'));
      });

      test('returns empty string for 0', () {
        expect(engine.intToRoman(0), equals(''));
      });

      test('returns empty string for negative', () {
        expect(engine.intToRoman(-5), equals(''));
      });
    });

    group('romanToInt', () {
      test('converts I to 1', () {
        expect(engine.romanToInt('I'), equals(1));
      });

      test('converts IV to 4', () {
        expect(engine.romanToInt('IV'), equals(4));
      });

      test('converts IX to 9', () {
        expect(engine.romanToInt('IX'), equals(9));
      });

      test('converts XIV to 14', () {
        expect(engine.romanToInt('XIV'), equals(14));
      });

      test('converts XLII to 42', () {
        expect(engine.romanToInt('XLII'), equals(42));
      });

      test('converts XCIX to 99', () {
        expect(engine.romanToInt('XCIX'), equals(99));
      });

      test('roundtrip conversion is consistent', () {
        for (int i = 1; i <= 200; i++) {
          final roman = engine.intToRoman(i);
          expect(engine.romanToInt(roman), equals(i),
              reason: 'Roundtrip failed for $i -> $roman');
        }
      });
    });

    group('generateProblem', () {
      test('returns a RomanProblem', () {
        final problem = engine.generateProblem(0);
        expect(problem, isA<RomanProblem>());
      });

      test('equation contains a Roman numeral', () {
        final problem = engine.generateProblem(0);
        expect(problem.equation.isNotEmpty, isTrue);
      });

      test('equation contains + or -', () {
        final problem = engine.generateProblem(0);
        expect(
          problem.equation.contains('+') || problem.equation.contains('-'),
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

      test('options has 4 items', () {
        final problem = engine.generateProblem(0);
        expect(problem.options.length, equals(4));
      });

      test('all options are unique', () {
        final problem = engine.generateProblem(0);
        expect(problem.options.toSet().length, equals(4));
      });

      test('all options are positive', () {
        final problem = engine.generateProblem(0);
        for (final opt in problem.options) {
          expect(opt, greaterThan(0));
        }
      });
    });
  });
}
