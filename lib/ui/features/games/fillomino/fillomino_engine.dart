import 'dart:math';

class FillominoEngine {
  final Random _random = Random();

  Map<String, dynamic> generateLevel({int size = 5}) {
    // 1. Generate a complete Fillomino board (tiling with polyominoes)
    // 2. Remove some numbers to create the puzzle.
    
    List<List<int>> solution = List.generate(size, (_) => List.filled(size, 0));
    
    // Simple tiling: fill with random small polyominoes (1-4)
    // For simplicity, let's use a greedy approach to fill the grid.
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (solution[r][c] != 0) continue;
        
        // Pick a size (1-4)
        int n = _random.nextInt(4) + 1;
        
        // Try to place a polyomino of size n
        List<List<int>> cells = [[r, c]];
        solution[r][c] = n;
        
        for (int i = 1; i < n; i++) {
          // Find adjacent empty cells
          List<List<int>> candidates = [];
          for (var cell in cells) {
            int cr = cell[0], cc = cell[1];
            final neighbors = [[cr-1, cc], [cr+1, cc], [cr, cc-1], [cr, cc+1]];
            for (var neighbor in neighbors) {
              int nr = neighbor[0], nc = neighbor[1];
              if (nr >= 0 && nr < size && nc >= 0 && nc < size && solution[nr][nc] == 0) {
                candidates.add(neighbor);
              }
            }
          }
          if (candidates.isEmpty) break;
          var next = candidates[_random.nextInt(candidates.length)];
          solution[next[0]][next[1]] = n;
          cells.add(next);
        }
        
        // If we couldn't reach size n, update all cells to the actual size achieved
        int actualSize = cells.length;
        for (var cell in cells) {
          solution[cell[0]][cell[1]] = actualSize;
        }
      }
    }

    // Now remove some numbers
    List<List<int>> grid = solution.map((r) => r.toList()).toList();
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (_random.nextDouble() < 0.6) {
          grid[r][c] = 0;
        }
      }
    }

    return {
      'grid': grid,
      'solution': solution,
    };
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    final grid = params['grid'] as List<List<int>>;
    final size = grid.length;

    // Check all cells filled
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == 0) return false;
      }
    }

    // Find polyominoes and check sizes
    List<List<bool>> visited = List.generate(size, (_) => List.filled(size, false));
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (visited[r][c]) continue;
        
        int n = grid[r][c];
        List<List<int>> stack = [[r, c]];
        visited[r][c] = true;
        int count = 0;
        
        List<List<int>> polyominoCells = [];

        while (stack.isNotEmpty) {
          var curr = stack.removeLast();
          count++;
          polyominoCells.add(curr);
          int cr = curr[0], cc = curr[1];
          
          final neighbors = [[cr-1, cc], [cr+1, cc], [cr, cc-1], [cr, cc+1]];
          for (var neighbor in neighbors) {
            int nr = neighbor[0], nc = neighbor[1];
            if (nr >= 0 && nr < size && nc >= 0 && nc < size && !visited[nr][nc] && grid[nr][nc] == n) {
              visited[nr][nc] = true;
              stack.add(neighbor);
            }
          }
        }
        
        if (count != n) return false;
        
        // Also check that no other polyomino of same size is adjacent
        // Wait, the rules say polyominoes of SAME size cannot be adjacent.
        // But they can if they merge into a larger one. 
        // My connectivity check already handles "same size adjacent" by merging them.
        // If the merged size != the number in them, it's a fail. This is correct.
      }
    }

    return true;
  }
}
