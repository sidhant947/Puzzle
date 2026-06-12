import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/base_shift/base_shift_engine.dart';

void main() {
  group('BaseShiftEngine', () {
    late BaseShiftEngine engine;

    setUp(() {
      engine = BaseShiftEngine();
    });

    group('generateLevel', () {
      test('returns a BaseShiftLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<BaseShiftLevel>());
      });

      test('level has expression, result, and explanation', () {
        final level = engine.generateLevel();
        expect(level.expression, isNotEmpty);
        expect(level.result, isA<int>());
        expect(level.explanation, isNotEmpty);
      });

      test('result is a positive integer', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          expect(level.result, greaterThan(0));
        }
      });

      test('expression contains a + sign', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          expect(level.expression, contains('+'));
        }
      });

      test('generates different levels', () {
        final results = <int>{};
        for (int i = 0; i < 20; i++) {
          results.add(engine.generateLevel().result);
        }
        expect(results.length, greaterThan(1));
      });
    });
  });

  group('BaseShiftLevel', () {
    test('stores fields correctly', () {
      final level = BaseShiftLevel(
        expression: '1010 (bin) + 5 (dec)',
        result: 15,
        explanation: '1010 in binary is 10',
      );
      expect(level.expression, '1010 (bin) + 5 (dec)');
      expect(level.result, 15);
      expect(level.explanation, '1010 in binary is 10');
    });
  });
}
