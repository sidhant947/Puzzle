import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/fillomino/fillomino_engine.dart';

void main() {
  group('FillominoEngine', () {
    late FillominoEngine engine;

    setUp(() {
      engine = FillominoEngine();
    });

    group('generateLevel', () {
      test('returns a map with grid and solution', () {
        final level = engine.generateLevel(size: 5);
        expect(level.containsKey('grid'), isTrue);
        expect(level.containsKey('solution'), isTrue);
      });

      test('grid and solution have correct size', () {
        final level = engine.generateLevel(size: 5);
        final grid = level['grid'] as List<List<int>>;
        final solution = level['solution'] as List<List<int>>;
        expect(grid.length, 5);
        expect(grid[0].length, 5);
        expect(solution.length, 5);
        expect(solution[0].length, 5);
      });

      test('solution has no zero cells', () {
        final level = engine.generateLevel(size: 5);
        final solution = level['solution'] as List<List<int>>;
        for (final row in solution) {
          for (final cell in row) {
            expect(cell, greaterThan(0));
          }
        }
      });

      test('grid values are subset of solution (with zeros for hints)', () {
        final level = engine.generateLevel(size: 5);
        final grid = level['grid'] as List<List<int>>;
        final solution = level['solution'] as List<List<int>>;
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            if (grid[r][c] != 0) {
              expect(grid[r][c], solution[r][c]);
            }
          }
        }
      });

      test('generated solution follows Fillomino rules (no adjacent polyominoes of same size)', () {
        for (int i = 0; i < 50; i++) {
          final level = engine.generateLevel(size: 5);
          final solution = level['solution'] as List<List<int>>;
          final size = solution.length;

          for (int r = 0; r < size; r++) {
            for (int c = 0; c < size; c++) {
              int val = solution[r][c];
              
              // Find the size of the polyomino this cell belongs to
              int actualSize = _getPolyominoSize(solution, r, c);
              expect(actualSize, equals(val), reason: 'Cell at ($r, $c) has value $val but belongs to a polyomino of size $actualSize');
            }
          }
        }
      });
    });

    group('checkVictoryWrapper', () {
      test('returns false when cells are zero (incomplete)', () {
        final grid = [
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
        ];
        expect(FillominoEngine.checkVictoryWrapper({'grid': grid}), isFalse);
      });

      test('returns true for valid fillomino solution', () {
        final grid = [
          [3, 3, 3, 2, 2],
          [4, 4, 4, 4, 1],
          [5, 5, 5, 5, 5],
          [4, 4, 4, 4, 1],
          [3, 3, 3, 2, 2],
        ];
        expect(FillominoEngine.checkVictoryWrapper({'grid': grid}), isTrue);
      });

      test('returns false when polyomino size mismatch', () {
        final grid = [
          [2, 2, 3, 3, 4],
          [2, 2, 3, 4, 4],
          [5, 5, 5, 6, 6],
          [5, 7, 5, 6, 8],
          [5, 7, 9, 9, 8],
        ];
        expect(FillominoEngine.checkVictoryWrapper({'grid': grid}), isFalse);
      });
    });
  });
}

int _getPolyominoSize(List<List<int>> grid, int r, int c) {
  int size = grid.length;
  int val = grid[r][c];
  List<List<int>> stack = [[r, c]];
  Set<String> visited = {'$r,$c'};
  int count = 0;

  while (stack.isNotEmpty) {
    var curr = stack.removeLast();
    count++;
    int cr = curr[0], cc = curr[1];

    final neighbors = [[cr-1, cc], [cr+1, cc], [cr, cc-1], [cr, cc+1]];
    for (var neighbor in neighbors) {
      int nr = neighbor[0], nc = neighbor[1];
      if (nr >= 0 && nr < size && nc >= 0 && nc < size && 
          grid[nr][nc] == val && !visited.contains('$nr,$nc')) {
        visited.add('$nr,$nc');
        stack.add(neighbor);
      }
    }
  }
  return count;
}
