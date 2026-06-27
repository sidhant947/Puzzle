import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/reflex_tap/reflex_tap_engine.dart';

void main() {
  group('ReflexTapEngine', () {
    late ReflexTapEngine engine;

    setUp(() {
      engine = ReflexTapEngine();
    });

    group('getRandomTargetPosition', () {
      test('returns a Point with coordinates between 0.1 and 0.9', () {
        for (int i = 0; i < 20; i++) {
          final pos = engine.getRandomTargetPosition();
          expect(pos.x, greaterThanOrEqualTo(0.1));
          expect(pos.x, lessThanOrEqualTo(0.9));
          expect(pos.y, greaterThanOrEqualTo(0.1));
          expect(pos.y, lessThanOrEqualTo(0.9));
        }
      });

      test('generates different positions across calls', () {
        final positions = <String>{};
        for (int i = 0; i < 20; i++) {
          final pos = engine.getRandomTargetPosition();
          positions.add('${pos.x.toStringAsFixed(6)},${pos.y.toStringAsFixed(6)}');
        }
        expect(positions.length, greaterThan(1));
      });
    });

    group('calculateTargetSize', () {
      test('returns 80 for score 0', () {
        expect(engine.calculateTargetSize(0), equals(80.0));
      });

      test('decreases as score increases', () {
        final size0 = engine.calculateTargetSize(0);
        final size10 = engine.calculateTargetSize(10);
        expect(size10, lessThan(size0));
      });

      test('never goes below 40', () {
        final size100 = engine.calculateTargetSize(100);
        expect(size100, greaterThanOrEqualTo(40.0));
      });

      test('never exceeds 80', () {
        final size = engine.calculateTargetSize(0);
        expect(size, lessThanOrEqualTo(80.0));
      });

      test('decreases by 2 per score unit (within bounds)', () {
        expect(engine.calculateTargetSize(1), equals(78.0));
        expect(engine.calculateTargetSize(2), equals(76.0));
      });
    });
  });
}
