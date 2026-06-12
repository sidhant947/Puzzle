import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/math_guess/math_guess_engine.dart';

void main() {
  group('MathGuessEngine', () {
    late MathGuessEngine engine;

    setUp(() {
      engine = MathGuessEngine();
    });

    group('generateTargetNumber', () {
      test('returns a number between 1 and 10000', () {
        for (int i = 0; i < 100; i++) {
          final num = engine.generateTargetNumber();
          expect(num, greaterThanOrEqualTo(1));
          expect(num, lessThanOrEqualTo(10000));
        }
      });

      test('generates different numbers', () {
        final numbers = <int>{};
        for (int i = 0; i < 100; i++) {
          numbers.add(engine.generateTargetNumber());
        }
        // Very likely to have multiple different values
        expect(numbers.length, greaterThan(1));
      });

      test('returns integers', () {
        for (int i = 0; i < 50; i++) {
          final num = engine.generateTargetNumber();
          expect(num, isA<int>());
        }
      });
    });
  });
}
