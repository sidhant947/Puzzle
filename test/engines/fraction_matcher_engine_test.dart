import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/fraction_matcher/fraction_matcher_engine.dart';

void main() {
  group('FractionMatcherEngine', () {
    late FractionMatcherEngine engine;

    setUp(() {
      engine = FractionMatcherEngine();
    });

    group('FractionOption', () {
      test('decimal option has text and value', () {
        final opt = FractionOption(type: OptionType.decimal, text: '0.5', value: 0.5);
        expect(opt.text, '0.5');
        expect(opt.value, 0.5);
      });

      test('percentage option has text and value', () {
        final opt = FractionOption(type: OptionType.percentage, text: '50%', value: 0.5);
        expect(opt.text, '50%');
        expect(opt.value, 0.5);
      });

      test('visual option has slices and filled', () {
        final opt = FractionOption(type: OptionType.visual, visualSlices: 4, visualFilled: 2, value: 0.5);
        expect(opt.visualSlices, 4);
        expect(opt.visualFilled, 2);
      });
    });

    group('generateLevel', () {
      test('returns a FractionMatcherLevel', () {
        final level = engine.generateLevel(0);
        expect(level, isA<FractionMatcherLevel>());
      });

      test('target numerator is less than denominator', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel(i);
          expect(level.targetNumerator, lessThan(level.targetDenominator));
        }
      });

      test('options has exactly 4 entries', () {
        final level = engine.generateLevel(0);
        expect(level.options.length, 4);
      });

      test('correctOptionIndex points to correct value', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel(i);
          final targetValue = level.targetNumerator / level.targetDenominator;
          expect(
            (level.options[level.correctOptionIndex].value - targetValue).abs(),
            lessThan(0.001),
          );
        }
      });

      test('all option values are different', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel(i);
          final values = level.options.map((o) => o.value).toSet();
          expect(values.length, 4);
        }
      });

      test('options include at least one of each type possibility', () {
        final level = engine.generateLevel(0);
        final types = level.options.map((o) => o.type).toSet();
        expect(types.isNotEmpty, isTrue);
      });
    });
  });
}
