import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/hitori/hitori_engine.dart';

void main() {
  group('HitoriEngine', () {
    late HitoriEngine engine;

    setUp(() {
      engine = HitoriEngine();
    });

    group('generateLevel', () {
      test('returns a map with grid and solution', () {
        final level = engine.generateLevel(size: 5);
        expect(level.containsKey('grid'), isTrue);
        expect(level.containsKey('solution'), isTrue);
      });

      test('grid dimensions match requested size', () {
        final level = engine.generateLevel(size: 5);
        final grid = level['grid'] as List<List<int>>;
        expect(grid.length, 5);
        expect(grid[0].length, 5);
      });

      test('solution has no adjacent shaded cells', () {
        final level = engine.generateLevel(size: 5);
        final solution = level['solution'] as List<List<bool>>;
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            if (solution[r][c]) {
              if (r > 0) expect(solution[r - 1][c], isFalse);
              if (r < 4) expect(solution[r + 1][c], isFalse);
              if (c > 0) expect(solution[r][c - 1], isFalse);
              if (c < 4) expect(solution[r][c + 1], isFalse);
            }
          }
        }
      });

      test('grid values are positive integers', () {
        final level = engine.generateLevel(size: 5);
        final grid = level['grid'] as List<List<int>>;
        for (final row in grid) {
          for (final cell in row) {
            expect(cell, greaterThan(0));
          }
        }
      });
    });

    group('checkVictoryWrapper', () {
      test('returns true for valid complete solution', () {
        final level = engine.generateLevel(size: 5);
        final grid = level['grid'] as List<List<int>>;
        final solution = level['solution'] as List<List<bool>>;
        final result = HitoriEngine.checkVictoryWrapper({
          'grid': grid,
          'shaded': solution,
        });
        expect(result, isTrue);
      });

      test('returns false when cells have duplicate values in a row', () {
        final grid = [
          [1, 1, 3, 4, 5],
          [2, 3, 4, 5, 1],
          [3, 4, 5, 1, 2],
          [4, 5, 1, 2, 3],
          [5, 1, 2, 3, 4],
        ];
        final shaded = List.generate(5, (_) => List.filled(5, false));
        expect(HitoriEngine.checkVictoryWrapper({'grid': grid, 'shaded': shaded}), isFalse);
      });

      test('returns false when shaded cells are adjacent', () {
        final grid = List.generate(5, (r) => List.generate(5, (c) => (r + c) % 5 + 1));
        final shaded = List.generate(5, (_) => List.filled(5, false));
        shaded[0][0] = true;
        shaded[0][1] = true;
        expect(HitoriEngine.checkVictoryWrapper({'grid': grid, 'shaded': shaded}), isFalse);
      });
    });
  });
}
