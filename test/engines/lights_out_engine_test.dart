import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/lights_out/lights_out_engine.dart';

void main() {
  group('LightsOutEngine', () {
    late LightsOutEngine engine;

    setUp(() {
      engine = LightsOutEngine();
    });

    group('generateLevel', () {
      test('returns a 5x5 grid', () {
        final grid = engine.generateLevel();
        expect(grid.length, equals(5));
        for (final row in grid) {
          expect(row.length, equals(5));
        }
      });

      test('grid contains only booleans', () {
        final grid = engine.generateLevel();
        for (final row in grid) {
          for (final cell in row) {
            expect(cell, isA<bool>());
          }
        }
      });

      test('generated level is not already solved', () {
        for (int i = 0; i < 20; i++) {
          final grid = engine.generateLevel();
          expect(engine.isSolved(grid), isFalse);
        }
      });
    });

    group('toggle', () {
      test('toggles the target cell', () {
        final grid = List.generate(5, (_) => List.filled(5, false));
        engine.toggle(grid, 2, 2);
        expect(grid[2][2], isTrue);
      });

      test('toggles adjacent cells', () {
        final grid = List.generate(5, (_) => List.filled(5, false));
        engine.toggle(grid, 2, 2);
        expect(grid[1][2], isTrue); // up
        expect(grid[3][2], isTrue); // down
        expect(grid[2][1], isTrue); // left
        expect(grid[2][3], isTrue); // right
      });

      test('does not toggle cells out of bounds', () {
        final grid = List.generate(5, (_) => List.filled(5, false));
        // Toggle corner - should not crash
        engine.toggle(grid, 0, 0);
        expect(grid[0][0], isTrue);
        expect(grid[0][1], isTrue);
        expect(grid[1][0], isTrue);
      });

      test('double toggle returns to original state', () {
        final grid = List.generate(5, (_) => List.filled(5, false));
        engine.toggle(grid, 2, 2);
        engine.toggle(grid, 2, 2);
        expect(engine.isSolved(grid), isTrue);
      });

      test('toggle flips true to false', () {
        final grid = List.generate(5, (_) => List.filled(5, false));
        grid[2][2] = true;
        engine.toggle(grid, 2, 2);
        expect(grid[2][2], isFalse);
      });
    });

    group('isSolved', () {
      test('returns true for all-false grid', () {
        final grid = List.generate(5, (_) => List.filled(5, false));
        expect(engine.isSolved(grid), isTrue);
      });

      test('returns false when any cell is true', () {
        final grid = List.generate(5, (_) => List.filled(5, false));
        grid[3][3] = true;
        expect(engine.isSolved(grid), isFalse);
      });

      test('returns false for fully true grid', () {
        final grid = List.generate(5, (_) => List.filled(5, true));
        expect(engine.isSolved(grid), isFalse);
      });
    });
  });
}
