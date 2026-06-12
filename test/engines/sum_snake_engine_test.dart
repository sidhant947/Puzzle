import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/sum_snake/sum_snake_engine.dart';

void main() {
  group('SumSnakeEngine', () {
    late SumSnakeEngine engine;

    setUp(() {
      engine = SumSnakeEngine();
    });

    group('generateGrid', () {
      test('returns a 4x4 grid', () {
        final grid = engine.generateGrid();
        expect(grid.length, 4);
        for (final row in grid) {
          expect(row.length, 4);
        }
      });

      test('all values are between 1 and 9', () {
        final grid = engine.generateGrid();
        for (final row in grid) {
          for (final val in row) {
            expect(val, greaterThanOrEqualTo(1));
            expect(val, lessThanOrEqualTo(9));
          }
        }
      });

      test('grid is not always the same', () {
        final grids = List.generate(10, (_) => engine.generateGrid());
        final allSame = grids.every((g) =>
            g[0][0] == grids[0][0][0] && g[3][3] == grids[0][0][3]);
        expect(allSame, isFalse);
      });
    });

    group('generateLevel', () {
      test('returns map with grid and targetSum', () {
        final level = engine.generateLevel();
        expect(level.containsKey('grid'), isTrue);
        expect(level.containsKey('targetSum'), isTrue);
      });

      test('grid is 4x4', () {
        final level = engine.generateLevel();
        final grid = level['grid'] as List<List<int>>;
        expect(grid.length, 4);
        for (final row in grid) {
          expect(row.length, 4);
        }
      });

      test('targetSum is a positive integer', () {
        final level = engine.generateLevel();
        expect(level['targetSum'], isA<int>());
        expect(level['targetSum'], greaterThan(0));
      });

      test('targetSum does not exceed possible maximum for path of 5', () {
        final level = engine.generateLevel();
        final grid = level['grid'] as List<List<int>>;
        final maxSum = 9 * 5;
        expect(level['targetSum'], lessThanOrEqualTo(maxSum));
      });

      test('targetSum is at least minimum for path of 3', () {
        final level = engine.generateLevel();
        expect(level['targetSum'], greaterThanOrEqualTo(3));
      });

      test('grid values are in valid range', () {
        final level = engine.generateLevel();
        final grid = level['grid'] as List<List<int>>;
        for (final row in grid) {
          for (final val in row) {
            expect(val, greaterThanOrEqualTo(1));
            expect(val, lessThanOrEqualTo(9));
          }
        }
      });

      test('targetSum is achievable by summing 3-5 adjacent cells', () {
        final level = engine.generateLevel();
        final grid = level['grid'] as List<List<int>>;
        final targetSum = level['targetSum'] as int;

        bool foundPath = false;
        for (int y = 0; y < 4 && !foundPath; y++) {
          for (int x = 0; x < 4 && !foundPath; x++) {
            if (_canReachSum(grid, x, y, targetSum, 5, {})) {
              foundPath = true;
            }
          }
        }
        expect(foundPath, isTrue);
      });
    });
  });
}

bool _canReachSum(
    List<List<int>> grid, int x, int y, int target, int maxLen, Set<String> visited) {
  if (x < 0 || x >= 4 || y < 0 || y >= 4) return false;
  final key = '$x,$y';
  if (visited.contains(key)) return false;

  final newVisited = Set<String>.from(visited)..add(key);
  final remaining = target - grid[y][x];

  if (remaining == 0) return true;
  if (remaining < 0 || newVisited.length >= maxLen) return false;

  final dirs = [
    [0, 1], [0, -1], [1, 0], [-1, 0]
  ];
  for (final d in dirs) {
    if (_canReachSum(grid, x + d[0], y + d[1], remaining, maxLen, newVisited)) {
      return true;
    }
  }
  return false;
}
