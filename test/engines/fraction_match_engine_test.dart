import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/fraction_match/fraction_match_engine.dart';

void main() {
  group('FractionMatchEngine', () {
    late FractionMatchEngine engine;

    setUp(() {
      engine = FractionMatchEngine();
    });

    group('generateLevel', () {
      test('returns a FractionMatchLevel', () {
        final level = engine.generateLevel(0);
        expect(level, isA<FractionMatchLevel>());
      });

      test('numerator is less than denominator', () {
        for (int i = 0; i < 30; i++) {
          final level = engine.generateLevel(i);
          expect(level.numerator, lessThan(level.denominator));
        }
      });

      test('numerator is at least 1', () {
        for (int i = 0; i < 30; i++) {
          final level = engine.generateLevel(i);
          expect(level.numerator, greaterThanOrEqualTo(1));
        }
      });

      test('denominator is at least 2', () {
        for (int i = 0; i < 30; i++) {
          final level = engine.generateLevel(i);
          expect(level.denominator, greaterThanOrEqualTo(2));
        }
      });

      test('options has exactly 4 entries', () {
        final level = engine.generateLevel(0);
        expect(level.options.length, 4);
      });

      test('correctAnswer is among the options', () {
        final level = engine.generateLevel(0);
        expect(level.options.contains(level.correctAnswer), isTrue);
      });

      test('correctAnswer format matches numerator/denominator', () {
        final level = engine.generateLevel(0);
        expect(level.correctAnswer, '${level.numerator}/${level.denominator}');
      });

      test('all options are unique', () {
        for (int i = 0; i < 30; i++) {
          final level = engine.generateLevel(i);
          expect(level.options.toSet().length, 4);
        }
      });

      test('early levels use small denominators', () {
        final level = engine.generateLevel(0);
        expect(level.denominator, lessThanOrEqualTo(4));
      });
    });
  });
}
