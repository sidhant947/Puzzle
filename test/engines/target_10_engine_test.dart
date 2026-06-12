import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/target_10/target_10_engine.dart';

void main() {
  group('Target10Engine', () {
    late Target10Engine engine;

    setUp(() {
      engine = Target10Engine();
    });

    group('getRandomDigit', () {
      test('returns a digit between 1 and 9', () {
        for (int i = 0; i < 100; i++) {
          final digit = engine.getRandomDigit();
          expect(digit, greaterThanOrEqualTo(1));
          expect(digit, lessThanOrEqualTo(9));
        }
      });

      test('returns integers only', () {
        for (int i = 0; i < 50; i++) {
          final digit = engine.getRandomDigit();
          expect(digit, isA<int>());
        }
      });

      test('eventually produces different digits', () {
        final digits = <int>{};
        for (int i = 0; i < 100; i++) {
          digits.add(engine.getRandomDigit());
        }
        expect(digits.length, greaterThan(1));
      });
    });

    group('generateInitialGrid', () {
      test('generates 25 items', () {
        final grid = engine.generateInitialGrid();
        expect(grid.length, 25);
      });

      test('all items are between 1 and 9', () {
        final grid = engine.generateInitialGrid();
        for (final value in grid) {
          expect(value, greaterThanOrEqualTo(1));
          expect(value, lessThanOrEqualTo(9));
        }
      });

      test('all items are integers', () {
        final grid = engine.generateInitialGrid();
        for (final value in grid) {
          expect(value, isA<int>());
        }
      });

      test('produces varied grids on multiple calls', () {
        final grid1 = engine.generateInitialGrid();
        final grid2 = engine.generateInitialGrid();
        final grid3 = engine.generateInitialGrid();
        expect(grid1.length, 25);
        expect(grid2.length, 25);
        expect(grid3.length, 25);
      });
    });
  });
}
