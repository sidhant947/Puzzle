import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/orbit_tap/orbit_tap_engine.dart';

void main() {
  group('OrbitTapEngine', () {
    late OrbitTapEngine engine;

    setUp(() {
      engine = OrbitTapEngine();
    });

    group('generateGateAngle', () {
      test('returns a value between 0 and 2pi', () {
        for (int i = 0; i < 20; i++) {
          final angle = engine.generateGateAngle();
          expect(angle, greaterThanOrEqualTo(0));
          expect(angle, lessThan(2 * pi));
        }
      });

      test('generates different angles across calls', () {
        final angles = <double>{};
        for (int i = 0; i < 20; i++) {
          angles.add(engine.generateGateAngle());
        }
        expect(angles.length, greaterThan(1));
      });
    });

    group('isTargetInGate', () {
      test('returns true when angles are identical', () {
        expect(engine.isTargetInGate(1.0, 1.0, 0.5), isTrue);
      });

      test('returns true when angle is within tolerance', () {
        expect(engine.isTargetInGate(1.0, 1.3, 0.5), isTrue);
      });

      test('returns false when angle is outside tolerance', () {
        expect(engine.isTargetInGate(1.0, 3.0, 0.5), isFalse);
      });

      test('handles wrap-around at 0/2pi boundary', () {
        expect(engine.isTargetInGate(0.1, 6.2, 0.3), isTrue);
        expect(engine.isTargetInGate(6.2, 0.1, 0.3), isTrue);
      });

      test('returns false for zero tolerance with different angles', () {
        expect(engine.isTargetInGate(1.0, 1.001, 0.0), isFalse);
      });

      test('returns false for zero tolerance with exact match (strict less-than)', () {
        expect(engine.isTargetInGate(1.0, 1.0, 0.0), isFalse);
      });
    });
  });
}
