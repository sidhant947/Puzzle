import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/rhythm_master/rhythm_master_engine.dart';

void main() {
  group('RhythmMasterEngine', () {
    late RhythmMasterEngine engine;

    setUp(() {
      engine = RhythmMasterEngine();
    });

    group('calculateAccuracy', () {
      test('returns 100 for very small diff (perfect)', () {
        expect(engine.calculateAccuracy(0, 1000), equals(100));
        expect(engine.calculateAccuracy(49, 1000), equals(100));
      });

      test('returns 80 for small diff (great)', () {
        expect(engine.calculateAccuracy(50, 1000), equals(80));
        expect(engine.calculateAccuracy(99, 1000), equals(80));
      });

      test('returns 50 for medium diff (good)', () {
        expect(engine.calculateAccuracy(100, 1000), equals(50));
        expect(engine.calculateAccuracy(149, 1000), equals(50));
      });

      test('returns 20 for larger diff (ok)', () {
        expect(engine.calculateAccuracy(150, 1000), equals(20));
        expect(engine.calculateAccuracy(249, 1000), equals(20));
      });

      test('returns 0 for very large diff (miss)', () {
        expect(engine.calculateAccuracy(250, 1000), equals(0));
        expect(engine.calculateAccuracy(500, 1000), equals(0));
      });

      test('accuracy values are monotonically non-increasing', () {
        int prev = 101;
        for (int diff = 0; diff <= 300; diff += 10) {
          final acc = engine.calculateAccuracy(diff, 1000);
          expect(acc, lessThanOrEqualTo(prev));
          prev = acc;
        }
      });
    });

    group('getAccuracyLabel', () {
      test('returns PERFECT for 100', () {
        expect(engine.getAccuracyLabel(100), equals('PERFECT'));
      });

      test('returns GREAT for 80-99', () {
        expect(engine.getAccuracyLabel(80), equals('GREAT'));
        expect(engine.getAccuracyLabel(99), equals('GREAT'));
      });

      test('returns GOOD for 50-79', () {
        expect(engine.getAccuracyLabel(50), equals('GOOD'));
        expect(engine.getAccuracyLabel(79), equals('GOOD'));
      });

      test('returns OK for 20-49', () {
        expect(engine.getAccuracyLabel(20), equals('OK'));
        expect(engine.getAccuracyLabel(49), equals('OK'));
      });

      test('returns MISS for 0-19', () {
        expect(engine.getAccuracyLabel(0), equals('MISS'));
        expect(engine.getAccuracyLabel(19), equals('MISS'));
      });
    });
  });
}
