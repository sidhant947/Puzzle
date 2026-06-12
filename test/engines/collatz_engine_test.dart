import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/collatz/collatz_engine.dart';

void main() {
  group('CollatzEngine', () {
    late CollatzEngine engine;

    setUp(() {
      engine = CollatzEngine();
    });

    group('generateLevel', () {
      test('returns a CollatzLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<CollatzLevel>());
      });

      test('start number is between 50 and 150', () {
        for (int i = 0; i < 10; i++) {
          final level = engine.generateLevel();
          expect(level.startNumber, greaterThanOrEqualTo(50));
          expect(level.startNumber, lessThanOrEqualTo(150));
        }
      });

      test('target is 1', () {
        final level = engine.generateLevel();
        expect(level.target, 1);
      });

      test('minSteps is at least 5', () {
        for (int i = 0; i < 10; i++) {
          final level = engine.generateLevel();
          expect(level.minSteps, greaterThanOrEqualTo(5));
        }
      });
    });

    group('applyOp', () {
      test('opIndex 0 divides by 2 when even', () {
        expect(engine.applyOp(10, 0), 5);
        expect(engine.applyOp(8, 0), 4);
      });

      test('opIndex 0 returns same when odd', () {
        expect(engine.applyOp(7, 0), 7);
        expect(engine.applyOp(3, 0), 3);
      });

      test('opIndex 1 applies 3n+1', () {
        expect(engine.applyOp(5, 1), 16);
        expect(engine.applyOp(10, 1), 31);
      });

      test('opIndex 2 adds 1', () {
        expect(engine.applyOp(5, 2), 6);
        expect(engine.applyOp(10, 2), 11);
      });

      test('default returns same value', () {
        expect(engine.applyOp(5, 99), 5);
      });
    });
  });

  group('CollatzLevel', () {
    test('stores all fields', () {
      final level = CollatzLevel(
        startNumber: 100,
        target: 1,
        minSteps: 10,
      );
      expect(level.startNumber, 100);
      expect(level.target, 1);
      expect(level.minSteps, 10);
    });
  });
}
