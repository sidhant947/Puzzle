import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/akari/akari_engine.dart';

void main() {
  group('AkariEngine', () {
    late AkariEngine engine;

    setUp(() {
      engine = AkariEngine();
    });

    group('generateLevel', () {
      test('returns a grid', () {
        final level = engine.generateLevel();
        expect(level['grid'], isA<List<List<int>>>());
      });

      test('grid is 5x5', () {
        final level = engine.generateLevel();
        final grid = level['grid'] as List<List<int>>;
        expect(grid.length, 5);
        for (final row in grid) {
          expect(row.length, 5);
        }
      });

      test('grid contains valid cell values (-2, -1, or >= 0)', () {
        final level = engine.generateLevel();
        final grid = level['grid'] as List<List<int>>;
        for (final row in grid) {
          for (final cell in row) {
            expect(cell == -2 || cell == -1 || cell >= 0, isTrue,
                reason: 'Invalid cell value: $cell');
          }
        }
      });

      test('generates independent copies (not same reference)', () {
        final level1 = engine.generateLevel();
        final level2 = engine.generateLevel();
        final grid1 = level1['grid'] as List<List<int>>;
        final grid2 = level2['grid'] as List<List<int>>;
        grid1[0][0] = 999;
        expect(grid2[0][0], isNot(equals(999)));
      });
    });

    group('calculateLit', () {
      test('marks bulb cells as lit', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        bulbs[2][2] = true;
        final lit = AkariEngine.calculateLit(grid, bulbs);
        expect(lit[2][2], isTrue);
      });

      test('lights cells in same row as bulb', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        bulbs[2][2] = true;
        final lit = AkariEngine.calculateLit(grid, bulbs);
        expect(lit[2][0], isTrue);
        expect(lit[2][4], isTrue);
      });

      test('lights cells in same column as bulb', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        bulbs[2][2] = true;
        final lit = AkariEngine.calculateLit(grid, bulbs);
        expect(lit[0][2], isTrue);
        expect(lit[4][2], isTrue);
      });

      test('wall blocks light propagation', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        grid[2][3] = 1; // wall with number
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        bulbs[2][0] = true;
        final lit = AkariEngine.calculateLit(grid, bulbs);
        expect(lit[2][2], isTrue);
        expect(lit[2][4], isFalse);
      });

      test('no bulbs produces no lit cells', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        final lit = AkariEngine.calculateLit(grid, bulbs);
        for (final row in lit) {
          for (final cell in row) {
            expect(cell, isFalse);
          }
        }
      });
    });

    group('checkVictory', () {
      test('returns false when not all white cells are lit', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        final lit = List.generate(5, (_) => List.filled(5, false));
        lit[0][0] = false;
        expect(AkariEngine.checkVictory(grid, bulbs, lit), isFalse);
      });

      test('returns false when two bulbs see each other', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        bulbs[2][1] = true;
        bulbs[2][3] = true;
        final lit = List.generate(5, (_) => List.filled(5, true));
        expect(AkariEngine.checkVictory(grid, bulbs, lit), isFalse);
      });

      test('returns false when numbered wall has wrong adjacent count', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        grid[2][2] = 1; // expects 1 adjacent bulb
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        bulbs[1][2] = true;
        bulbs[3][2] = true;
        final lit = List.generate(5, (_) => List.filled(5, true));
        expect(AkariEngine.checkVictory(grid, bulbs, lit), isFalse);
      });

      test('returns true when numbered wall has correct adjacent count', () {
        final grid = List.generate(5, (_) => List.filled(5, -2));
        grid[2][2] = 1;
        final bulbs = List.generate(5, (_) => List.filled(5, false));
        bulbs[1][2] = true;
        final lit = List.generate(5, (_) => List.filled(5, true));
        expect(AkariEngine.checkVictory(grid, bulbs, lit), isTrue);
      });
    });
  });
}
