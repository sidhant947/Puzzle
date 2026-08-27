import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/sum_pyramid/sum_pyramid_engine.dart';

void main() {
  group('SumPyramidEngine', () {
    late SumPyramidEngine engine;

    setUp(() {
      engine = SumPyramidEngine();
    });

    group('generateLevel', () {
      test('returns a SumPyramidLevel instance', () {
        final level = engine.generateLevel(0);
        expect(level, isA<SumPyramidLevel>());
      });

      test('correctValues has 10 elements', () {
        final level = engine.generateLevel(0);
        expect(level.correctValues.length, 10);
      });

      test('isHidden has 10 elements', () {
        final level = engine.generateLevel(0);
        expect(level.isHidden.length, 10);
      });

      test('initialValues has 10 elements', () {
        final level = engine.generateLevel(0);
        expect(level.initialValues.length, 10);
      });

      test('pyramid addition is correct: row1 = base sums', () {
        final level = engine.generateLevel(0);
        final v = level.correctValues;
        expect(v[4], v[0] + v[1]);
        expect(v[5], v[1] + v[2]);
        expect(v[6], v[2] + v[3]);
      });

      test('pyramid addition is correct: row2 = row1 sums', () {
        final level = engine.generateLevel(0);
        final v = level.correctValues;
        expect(v[7], v[4] + v[5]);
        expect(v[8], v[5] + v[6]);
      });

      test('pyramid addition is correct: apex = row2 sum', () {
        final level = engine.generateLevel(0);
        final v = level.correctValues;
        expect(v[9], v[7] + v[8]);
      });

      test('base values are positive integers', () {
        final level = engine.generateLevel(0);
        for (int i = 0; i < 4; i++) {
          expect(level.correctValues[i], greaterThan(0));
        }
      });

      test('hidden count is at least 3', () {
        final level = engine.generateLevel(0);
        final hiddenCount = level.isHidden.where((h) => h).length;
        expect(hiddenCount, greaterThanOrEqualTo(3));
      });

      test('hidden count increases with higher score', () {
        final lowLevel = engine.generateLevel(0);
        final highLevel = engine.generateLevel(10);
        final lowHidden = lowLevel.isHidden.where((h) => h).length;
        final highHidden = highLevel.isHidden.where((h) => h).length;
        expect(highHidden, greaterThanOrEqualTo(lowHidden));
      });

      test('initialValues is empty string for hidden blocks', () {
        final level = engine.generateLevel(0);
        for (int i = 0; i < 10; i++) {
          if (level.isHidden[i]) {
            expect(level.initialValues[i], '');
          } else {
            expect(level.initialValues[i], isNotEmpty);
          }
        }
      });

      test('non-hidden initialValues match correctValues as strings', () {
        final level = engine.generateLevel(0);
        for (int i = 0; i < 10; i++) {
          if (!level.isHidden[i]) {
            expect(level.initialValues[i], '${level.correctValues[i]}');
          }
        }
      });

      test('low score uses base values <= 5', () {
        for (int i = 0; i < 10; i++) {
          final level = engine.generateLevel(0);
          for (int j = 0; j < 4; j++) {
            expect(level.correctValues[j], lessThanOrEqualTo(5));
          }
        }
      });

      test('every generated level is uniquely and logically solvable', () {
        for (int score = 0; score <= 15; score++) {
          for (int trial = 0; trial < 10; trial++) {
            final level = engine.generateLevel(score);
            expect(engine.isSolvable(level.isHidden), isTrue);
          }
        }
      });
    });
  });
}
