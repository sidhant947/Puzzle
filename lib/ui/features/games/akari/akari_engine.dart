import 'dart:math';

class AkariEngine {
  final Random _random = Random();

  // Grid cell types:
  // 0-4: Numbered wall (adjacent bulb count)
  // -1: Wall without number
  // -2: White cell (placeable)

  Map<String, dynamic> generateLevel({int size = 5}) {
    while (true) {
      final result = _tryGenerate(size);
      if (result != null) return result;
    }
  }

  Map<String, dynamic>? _tryGenerate(int size) {
    // 1. Generate a valid bulb placement
    final solution = _generateSolution(size);
    if (solution == null) return null;

    // 2. Build grid from solution
    final grid = List.generate(size, (_) => List.filled(size, -2));

    // 3. Add numbered walls
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (!solution[r][c]) continue;
        // This cell has a bulb — number its wall neighbors
        final dirs = [
          [r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]
        ];
        for (final d in dirs) {
          final dr = d[0], dc = d[1];
          if (dr >= 0 && dr < size && dc >= 0 && dc < size && !solution[dr][dc]) {
            // Neighbor is white — count bulbs around it
            int count = 0;
            for (final dd in [
              [dr - 1, dc], [dr + 1, dc], [dr, dc - 1], [dr, dc + 1]
            ]) {
              final nr = dd[0], nc = dd[1];
              if (nr >= 0 && nr < size && nc >= 0 && nc < size && solution[nr][nc]) {
                count++;
              }
            }
            if (grid[dr][dc] == -2) {
              grid[dr][dc] = count;
            }
          }
        }
      }
    }

    // 4. Convert some numbered walls to plain walls (-1) for difficulty
    final numberCells = <List<int>>[];
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] >= 0) numberCells.add([r, c]);
      }
    }
    numberCells.shuffle(_random);
    // Keep enough numbers to ensure unique solution, hide some
    final revealCount = max(1, (numberCells.length * 0.6).toInt());
    for (int i = revealCount; i < numberCells.length; i++) {
      grid[numberCells[i][0]][numberCells[i][1]] = -1;
    }

    // 5. Verify unique solution
    final solutionCount = _countSolutions(grid, size);
    if (solutionCount != 1) return null;

    return {'grid': grid};
  }

  List<List<bool>>? _generateSolution(int size) {
    // Try random bulb placement with backtracking
    final bulbs = List.generate(size, (_) => List.filled(size, false));
    final lit = List.generate(size, (_) => List.filled(size, false));

    if (_placeBulbs(bulbs, lit, size, 0, 0)) {
      return bulbs;
    }
    return null;
  }

  bool _placeBulbs(List<List<bool>> bulbs, List<List<bool>> lit, int size, int row, int col) {
    if (row == size) {
      // Check all white cells are lit (all cells start as white in generation)
      for (int r = 0; r < size; r++) {
        for (int c = 0; c < size; c++) {
          if (!lit[r][c]) return false;
        }
      }
      return true;
    }

    int nextRow = col == size - 1 ? row + 1 : row;
    int nextCol = col == size - 1 ? 0 : col + 1;

    // Try placing bulb at (row, col)
    if (_canPlaceBulb(bulbs, lit, size, row, col)) {
      bulbs[row][col] = true;
      _updateLit(lit, bulbs, size, row, col, true);
      if (_placeBulbs(bulbs, lit, size, nextRow, nextCol)) return true;
      bulbs[row][col] = false;
      _updateLit(lit, bulbs, size, row, col, false);
    }

    // Try without bulb
    return _placeBulbs(bulbs, lit, size, nextRow, nextCol);
  }

  bool _canPlaceBulb(List<List<bool>> bulbs, List<List<bool>> lit, int size, int r, int c) {
    // Can't place if another bulb sees this cell
    // Check horizontal
    for (int j = c - 1; j >= 0 && !bulbs[r][j]; j--) {
      // No wall checks during generation — all cells are white
    }
    for (int j = c + 1; j < size && !bulbs[r][j]; j++) {}
    // Actually check: no bulb in same row/column before a wall
    for (int j = c - 1; j >= 0; j--) {
      if (bulbs[r][j]) return false;
    }
    for (int j = c + 1; j < size; j++) {
      if (bulbs[r][j]) return false;
    }
    for (int i = r - 1; i >= 0; i--) {
      if (bulbs[i][c]) return false;
    }
    for (int i = r + 1; i < size; i++) {
      if (bulbs[i][c]) return false;
    }
    return true;
  }

  void _updateLit(List<List<bool>> lit, List<List<bool>> bulbs, int size, int r, int c, bool add) {
    // During generation all cells are white, so light travels until grid edge
    if (add) {
      lit[r][c] = true;
      for (int i = r - 1; i >= 0; i--) { lit[i][c] = true; }
      for (int i = r + 1; i < size; i++) { lit[i][c] = true; }
      for (int j = c - 1; j >= 0; j--) { lit[r][j] = true; }
      for (int j = c + 1; j < size; j++) { lit[r][j] = true; }
    } else {
      // Recalculate all lit from scratch
      for (int rr = 0; rr < size; rr++) {
        for (int cc = 0; cc < size; cc++) {
          lit[rr][cc] = false;
        }
      }
      for (int rr = 0; rr < size; rr++) {
        for (int cc = 0; cc < size; cc++) {
          if (bulbs[rr][cc]) {
            lit[rr][cc] = true;
            for (int i = rr - 1; i >= 0; i--) { lit[i][cc] = true; }
            for (int i = rr + 1; i < size; i++) { lit[i][cc] = true; }
            for (int j = cc - 1; j >= 0; j--) { lit[rr][j] = true; }
            for (int j = cc + 1; j < size; j++) { lit[rr][j] = true; }
          }
        }
      }
    }
  }

  int _countSolutions(List<List<int>> grid, int size) {
    final bulbs = List.generate(size, (_) => List.filled(size, false));
    return _solve(grid, bulbs, size, 0, 0, 0);
  }

  int _solve(List<List<int>> grid, List<List<bool>> bulbs, int size, int row, int col, int count) {
    if (count > 1) return count;

    if (row == size) {
      if (_isValidSolution(grid, bulbs, size)) return count + 1;
      return count;
    }

    int nextRow = col == size - 1 ? row + 1 : row;
    int nextCol = col == size - 1 ? 0 : col + 1;

    // Skip wall cells
    if (grid[row][col] != -2) {
      return _solve(grid, bulbs, size, nextRow, nextCol, count);
    }

    // Try without bulb
    count = _solve(grid, bulbs, size, nextRow, nextCol, count);
    if (count > 1) return count;

    // Try with bulb
    if (_canPlaceInPuzzle(grid, bulbs, size, row, col)) {
      bulbs[row][col] = true;
      count = _solve(grid, bulbs, size, nextRow, nextCol, count);
      bulbs[row][col] = false;
    }

    return count;
  }

  bool _canPlaceInPuzzle(List<List<int>> grid, List<List<bool>> bulbs, int size, int r, int c) {
    // Check no bulb sees this cell (through white cells only)
    for (int j = c - 1; j >= 0 && grid[r][j] == -2; j--) {
      if (bulbs[r][j]) return false;
    }
    for (int j = c + 1; j < size && grid[r][j] == -2; j++) {
      if (bulbs[r][j]) return false;
    }
    for (int i = r - 1; i >= 0 && grid[i][c] == -2; i--) {
      if (bulbs[i][c]) return false;
    }
    for (int i = r + 1; i < size && grid[i][c] == -2; i++) {
      if (bulbs[i][c]) return false;
    }

    // Temporarily place and check numbered wall constraints
    bulbs[r][c] = true;

    // Check adjacent numbered walls — count of bulbs must not exceed the number
    final dirs = [[r-1,c],[r+1,c],[r,c-1],[r,c+1]];
    for (final d in dirs) {
      final dr = d[0], dc = d[1];
      if (dr >= 0 && dr < size && dc >= 0 && dc < size && grid[dr][dc] >= 0) {
        int count = 0;
        for (final dd in [[dr-1,dc],[dr+1,dc],[dr,dc-1],[dr,dc+1]]) {
          final nr = dd[0], nc = dd[1];
          if (nr >= 0 && nr < size && nc >= 0 && nc < size && bulbs[nr][nc]) count++;
        }
        if (count > grid[dr][dc]) { bulbs[r][c] = false; return false; }
      }
    }

    bulbs[r][c] = false;
    return true;
  }

  bool _isValidSolution(List<List<int>> grid, List<List<bool>> bulbs, int size) {
    // 1. All white cells must be lit
    final lit = List.generate(size, (_) => List.filled(size, false));
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (bulbs[r][c]) {
          lit[r][c] = true;
          for (int i = r - 1; i >= 0 && grid[i][c] == -2; i--) lit[i][c] = true;
          for (int i = r + 1; i < size && grid[i][c] == -2; i++) lit[i][c] = true;
          for (int j = c - 1; j >= 0 && grid[r][j] == -2; j--) lit[r][j] = true;
          for (int j = c + 1; j < size && grid[r][j] == -2; j++) lit[r][j] = true;
        }
      }
    }
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == -2 && !lit[r][c]) return false;
      }
    }

    // 2. Bulbs can't see each other
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (bulbs[r][c]) {
          for (int j = c + 1; j < size && grid[r][j] == -2; j++) {
            if (bulbs[r][j]) return false;
          }
          for (int i = r + 1; i < size && grid[i][c] == -2; i++) {
            if (bulbs[i][c]) return false;
          }
        }
      }
    }

    // 3. Numbered walls must have exact adjacent bulbs
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final val = grid[r][c];
        if (val >= 0) {
          int count = 0;
          if (r > 0 && bulbs[r - 1][c]) count++;
          if (r < size - 1 && bulbs[r + 1][c]) count++;
          if (c > 0 && bulbs[r][c - 1]) count++;
          if (c < size - 1 && bulbs[r][c + 1]) count++;
          if (count != val) return false;
        }
      }
    }

    return true;
  }

  static List<List<bool>> calculateLit(List<List<int>> grid, List<List<bool>> bulbs) {
    final size = grid.length;
    final lit = List.generate(size, (_) => List.filled(size, false));

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (bulbs[r][c]) {
          lit[r][c] = true;
          for (int i = r - 1; i >= 0 && grid[i][c] == -2; i--) lit[i][c] = true;
          for (int i = r + 1; i < size && grid[i][c] == -2; i++) lit[i][c] = true;
          for (int j = c - 1; j >= 0 && grid[r][j] == -2; j--) lit[r][j] = true;
          for (int j = c + 1; j < size && grid[r][j] == -2; j++) lit[r][j] = true;
        }
      }
    }
    return lit;
  }

  static bool checkVictory(List<List<int>> grid, List<List<bool>> bulbs, List<List<bool>> lit) {
    final size = grid.length;

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == -2 && !lit[r][c]) return false;
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (bulbs[r][c]) {
          for (int j = c + 1; j < size && grid[r][j] == -2; j++) {
            if (bulbs[r][j]) return false;
          }
          for (int i = r + 1; i < size && grid[i][c] == -2; i++) {
            if (bulbs[i][c]) return false;
          }
        }
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final val = grid[r][c];
        if (val >= 0) {
          int count = 0;
          if (r > 0 && bulbs[r - 1][c]) count++;
          if (r < size - 1 && bulbs[r + 1][c]) count++;
          if (c > 0 && bulbs[r][c - 1]) count++;
          if (c < size - 1 && bulbs[r][c + 1]) count++;
          if (count != val) return false;
        }
      }
    }

    return true;
  }

  static List<List<bool>> calculateLitWrapper(Map<String, dynamic> params) {
    return calculateLit(
      params['grid'] as List<List<int>>,
      params['bulbs'] as List<List<bool>>,
    );
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    return checkVictory(
      params['grid'] as List<List<int>>,
      params['bulbs'] as List<List<bool>>,
      params['lit'] as List<List<bool>>,
    );
  }
}
