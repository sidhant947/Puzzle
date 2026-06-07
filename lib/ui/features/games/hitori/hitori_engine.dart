import 'dart:math';

class HitoriEngine {
  final Random _random = Random();

  Map<String, dynamic> generateLevel({int size = 5}) {
    // Generate a solved Hitori board
    // 1. Fill a board with numbers (like a Latin Square, or just random and then fix)
    // 2. Shade some cells ensuring rules are met
    // 3. The resulting unshaded cells must have unique numbers in rows/cols
    
    // Simplest approach for a puzzle: 
    // Start with a Latin Square (unique in rows/cols), 
    // then "unsolve" it by adding duplicates that MUST be shaded.
    
    List<List<int>> grid = List.generate(size, (_) => List.filled(size, 0));
    List<List<bool>> solution = List.generate(size, (_) => List.filled(size, false));

    // 1. Create a Latin Square
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        grid[r][c] = ((r + c) % size) + 1;
      }
    }

    // 2. Randomly shuffle rows and columns to randomize Latin Square
    grid.shuffle();
    // Transpose and shuffle again for better randomness
    grid = _transpose(grid);
    grid.shuffle();
    grid = _transpose(grid);

    // 3. Add duplicates that must be shaded
    // We want to shade some cells. Let's pick random cells to shade.
    // Ensure no two shaded cells are adjacent.
    int shadeCount = (size * size * 0.2).toInt();
    int attempts = 0;
    while (shadeCount > 0 && attempts < 100) {
      attempts++;
      int r = _random.nextInt(size);
      int c = _random.nextInt(size);
      
      if (!solution[r][c] && _canShade(r, c, solution, size)) {
        solution[r][c] = true;
        shadeCount--;
        
        // Change the value to create a duplicate in row or column
        // so that shading this cell becomes mandatory.
        bool duplicateInRow = _random.nextBool();
        if (duplicateInRow) {
          int otherC = (c + 1 + _random.nextInt(size - 1)) % size;
          grid[r][c] = grid[r][otherC];
        } else {
          int otherR = (r + 1 + _random.nextInt(size - 1)) % size;
          grid[r][c] = grid[otherR][c];
        }
      }
    }

    // 4. Ensure all unshaded cells are connected
    if (!_isConnected(solution, size)) {
      // If not connected, just retry generation (lazy but effective for small grids)
      return generateLevel(size: size);
    }

    return {
      'grid': grid,
      'solution': solution,
    };
  }

  bool _canShade(int r, int c, List<List<bool>> solution, int size) {
    // Shaded cells cannot be adjacent
    if (r > 0 && solution[r - 1][c]) return false;
    if (r < size - 1 && solution[r + 1][c]) return false;
    if (c > 0 && solution[r][c - 1]) return false;
    if (c < size - 1 && solution[r][c + 1]) return false;
    return true;
  }

  bool _isConnected(List<List<bool>> solution, int size) {
    int startR = -1, startC = -1;
    int unshadedCount = 0;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (!solution[r][c]) {
          if (startR == -1) {
            startR = r;
            startC = c;
          }
          unshadedCount++;
        }
      }
    }

    if (unshadedCount == 0) return true;

    List<List<bool>> visited = List.generate(size, (_) => List.filled(size, false));
    int count = 0;
    List<List<int>> stack = [[startR, startC]];
    visited[startR][startC] = true;

    while (stack.isNotEmpty) {
      List<int> current = stack.removeLast();
      count++;
      int r = current[0];
      int c = current[1];

      final neighbors = [
        [r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]
      ];

      for (var n in neighbors) {
        int nr = n[0];
        int nc = n[1];
        if (nr >= 0 && nr < size && nc >= 0 && nc < size && !solution[nr][nc] && !visited[nr][nc]) {
          visited[nr][nc] = true;
          stack.add([nr, nc]);
        }
      }
    }

    return count == unshadedCount;
  }

  List<List<int>> _transpose(List<List<int>> grid) {
    int size = grid.length;
    List<List<int>> result = List.generate(size, (_) => List.filled(size, 0));
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        result[c][r] = grid[r][c];
      }
    }
    return result;
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    final grid = params['grid'] as List<List<int>>;
    final shaded = params['shaded'] as List<List<bool>>;
    final size = grid.length;

    // 1. No duplicates in rows/cols for unshaded cells
    for (int r = 0; r < size; r++) {
      Set<int> rowValues = {};
      for (int c = 0; c < size; c++) {
        if (!shaded[r][c]) {
          if (rowValues.contains(grid[r][c])) return false;
          rowValues.add(grid[r][c]);
        }
      }
    }
    for (int c = 0; c < size; c++) {
      Set<int> colValues = {};
      for (int r = 0; r < size; r++) {
        if (!shaded[r][c]) {
          if (colValues.contains(grid[r][c])) return false;
          colValues.add(grid[r][c]);
        }
      }
    }

    // 2. Shaded cells cannot be adjacent
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (shaded[r][c]) {
          if (r > 0 && shaded[r - 1][c]) return false;
          if (r < size - 1 && shaded[r + 1][c]) return false;
          if (c > 0 && shaded[r][c - 1]) return false;
          if (c < size - 1 && shaded[r][c + 1]) return false;
        }
      }
    }

    // 3. Unshaded cells must be connected
    return HitoriEngine()._isConnected(shaded, size);
  }
}
