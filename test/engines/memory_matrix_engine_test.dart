import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/memory_matrix/memory_matrix_engine.dart';

void main() {
  group('MemoryMatrixEngine', () {
    late MemoryMatrixEngine engine;

    setUp(() {
      engine = MemoryMatrixEngine();
    });

    group('getLevel', () {
      test('returns correct size and tileCount for level 1', () {
        final level = engine.getLevel(1);
        expect(level.size, equals(3));
        expect(level.tileCount, equals(3));
      });

      test('returns correct size for level 3', () {
        final level = engine.getLevel(3);
        expect(level.size, equals(4));
        expect(level.tileCount, equals(5));
      });

      test('returns correct size for level 5', () {
        final level = engine.getLevel(5);
        expect(level.size, equals(5));
        expect(level.tileCount, equals(7));
      });

      test('showDuration increases with level', () {
        final l1 = engine.getLevel(1);
        final l2 = engine.getLevel(2);
        expect(l2.showDuration.inMilliseconds, greaterThan(l1.showDuration.inMilliseconds));
      });

      test('clamps size at 6', () {
        final level = engine.getLevel(20);
        expect(level.size, lessThanOrEqualTo(6));
      });

      test('clamps tileCount at 15', () {
        final level = engine.getLevel(20);
        expect(level.tileCount, lessThanOrEqualTo(15));
      });

      test('handles level 0 by treating as level 1', () {
        final level = engine.getLevel(0);
        expect(level.size, equals(3));
        expect(level.tileCount, equals(3));
      });
    });

    group('generatePattern', () {
      test('generates pattern with correct number of tiles', () {
        final pattern = engine.generatePattern(3, 5);
        expect(pattern.length, equals(5));
      });

      test('pattern indices are within bounds', () {
        for (int i = 0; i < 20; i++) {
          final pattern = engine.generatePattern(4, 6);
          for (final idx in pattern) {
            expect(idx, greaterThanOrEqualTo(0));
            expect(idx, lessThan(16)); // 4*4
          }
        }
      });

      test('pattern has no duplicates', () {
        final pattern = engine.generatePattern(5, 8);
        expect(pattern.toSet().length, equals(pattern.length));
      });

      test('generates different patterns', () {
        final p1 = engine.generatePattern(4, 6);
        final p2 = engine.generatePattern(4, 6);
        // Very unlikely to be identical
        expect(p1, isNot(equals(p2)));
      });
    });

    group('MemoryMatrixLevel', () {
      test('stores fields correctly', () {
        final level = MemoryMatrixLevel(
          size: 3,
          tileCount: 4,
          showDuration: Duration(milliseconds: 1200),
        );
        expect(level.size, equals(3));
        expect(level.tileCount, equals(4));
        expect(level.showDuration, equals(Duration(milliseconds: 1200)));
      });
    });
  });
}
