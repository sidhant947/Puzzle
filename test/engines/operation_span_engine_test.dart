import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/operation_span/operation_span_engine.dart';

void main() {
  group('OperationSpanEngine', () {
    late OperationSpanEngine engine;

    setUp(() {
      engine = OperationSpanEngine();
    });

    group('generateProblem', () {
      test('returns a map with equation and isCorrect', () {
        final problem = engine.generateProblem();
        expect(problem.containsKey('equation'), isTrue);
        expect(problem.containsKey('isCorrect'), isTrue);
      });

      test('equation is a string', () {
        final problem = engine.generateProblem();
        expect(problem['equation'], isA<String>());
      });

      test('isCorrect is a boolean', () {
        final problem = engine.generateProblem();
        expect(problem['isCorrect'], isA<bool>());
      });

      test('equation contains multiplication operator', () {
        for (int i = 0; i < 10; i++) {
          final problem = engine.generateProblem();
          final eq = problem['equation'] as String;
          expect(eq.contains('×'), isTrue);
        }
      });

      test('equation contains + or - operator', () {
        for (int i = 0; i < 10; i++) {
          final problem = engine.generateProblem();
          final eq = problem['equation'] as String;
          expect(
            eq.contains('+') || eq.contains('-'),
            isTrue,
          );
        }
      });
    });

    group('getRandomLetter', () {
      test('returns a single letter', () {
        final letter = engine.getRandomLetter();
        expect(letter.length, equals(1));
      });

      test('returns a valid letter from the allowed set', () {
        final validLetters = {'F', 'H', 'J', 'K', 'L', 'N', 'P', 'Q', 'R', 'S', 'T', 'Y'};
        for (int i = 0; i < 20; i++) {
          final letter = engine.getRandomLetter();
          expect(validLetters.contains(letter), isTrue);
        }
      });

      test('returns different letters across calls', () {
        final letters = <String>{};
        for (int i = 0; i < 50; i++) {
          letters.add(engine.getRandomLetter());
        }
        expect(letters.length, greaterThan(1));
      });
    });
  });
}
