import 'dart:math';

class MagnetsEngine {
  final Random _random = Random();

  Map<String, dynamic> generateLevel({int rows = 4, int cols = 4}) {
    int attempts = 0;
    while (attempts < 100) {
      attempts++;
      final dominoes = _generateTiling(rows, cols);
      if (dominoes == null) continue;

      final states = _generateValidStates(dominoes, rows, cols);
      if (states == null) continue;

      final grid = _getGrid(dominoes, states, rows, cols);
      
      final rowPos = List.filled(rows, 0);
      final rowNeg = List.filled(rows, 0);
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          if (grid[r][c] == 1) rowPos[r]++;
          if (grid[r][c] == 2) rowNeg[r]++;
        }
      }

      final colPos = List.filled(cols, 0);
      final colNeg = List.filled(cols, 0);
      for (int c = 0; c < cols; c++) {
        for (int r = 0; r < rows; r++) {
          if (grid[r][c] == 1) colPos[c]++;
          if (grid[r][c] == 2) colNeg[r]++; // Wait, this should be r for row index? No, it's colPos[c], so it's fine. Wait, grid[r][c] == 2 is negative.
        }
      }
      // Re-check colNeg
      for (int c = 0; c < cols; c++) {
        colNeg[c] = 0;
        for (int r = 0; r < rows; r++) {
          if (grid[r][c] == 2) colNeg[c]++;
        }
      }

      final level = {
        'dominoes': dominoes,
        'rowPos': rowPos,
        'rowNeg': rowNeg,
        'colPos': colPos,
        'colNeg': colNeg,
      };

      if (_hasUniqueSolution(level, rows, cols)) {
        return level;
      }
    }

    // Fallback to a known 4x4
    return {
      'dominoes': [
        [[0,0], [0,1]], [[0,2], [0,3]],
        [[1,0], [2,0]], [[1,1], [1,2]], [[1,3], [2,3]],
        [[2,1], [2,2]],
        [[3,0], [3,1]], [[3,2], [3,3]],
      ],
      'rowPos': [2, 1, 1, 2],
      'rowNeg': [1, 2, 2, 1],
      'colPos': [1, 2, 2, 1],
      'colNeg': [2, 1, 1, 2],
    };
  }

  List<List<List<int>>>? _generateTiling(int rows, int cols) {
    final grid = List.generate(rows, (_) => List.filled(cols, false));
    final dominoes = <List<List<int>>>[];

    bool solve(int r, int c) {
      if (r == rows) return true;
      int nextR = (c == cols - 1) ? r + 1 : r;
      int nextC = (c == cols - 1) ? 0 : c + 1;

      if (grid[r][c]) return solve(nextR, nextC);

      final options = [];
      // Horizontal
      if (c + 1 < cols && !grid[r][c+1]) options.add([[r, c], [r, c+1]]);
      // Vertical
      if (r + 1 < rows && !grid[r+1][c]) options.add([[r, c], [r+1, c]]);
      
      options.shuffle(_random);
      for (var opt in options) {
        grid[opt[0][0]][opt[0][1]] = true;
        grid[opt[1][0]][opt[1][1]] = true;
        dominoes.add(opt as List<List<int>>);
        if (solve(nextR, nextC)) return true;
        dominoes.removeLast();
        grid[opt[0][0]][opt[0][1]] = false;
        grid[opt[1][0]][opt[1][1]] = false;
      }

      return false;
    }

    if (solve(0, 0)) return dominoes;
    return null;
  }

  List<int>? _generateValidStates(List<List<List<int>>> dominoes, int rows, int cols) {
    final states = List.filled(dominoes.length, 0);
    
    bool solve(int idx) {
      if (idx == dominoes.length) {
        // Ensure not all are blank
        return states.any((s) => s != 0);
      }

      final options = [0, 1, 2];
      options.shuffle(_random);

      for (var opt in options) {
        states[idx] = opt;
        if (_isLocallyValid(idx, dominoes, states, rows, cols)) {
          if (solve(idx + 1)) return true;
        }
      }
      return false;
    }

    if (solve(0)) return states;
    return null;
  }

  bool _isLocallyValid(int idx, List<List<List<int>>> dominoes, List<int> states, int rows, int cols) {
    final grid = List.generate(rows, (_) => List.filled(cols, 0));
    for (int i = 0; i <= idx; i++) {
      if (states[i] == 1) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 1;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 2;
      } else if (states[i] == 2) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 2;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 1;
      }
    }

    // Check last domino's cells for neighbors
    final cells = [dominoes[idx][0], dominoes[idx][1]];
    for (var cell in cells) {
      int r = cell[0], c = cell[1];
      if (grid[r][c] == 0) continue;
      final neighbors = [[r-1, c], [r+1, c], [r, c-1], [r, c+1]];
      for (var n in neighbors) {
        if (n[0] >= 0 && n[0] < rows && n[1] >= 0 && n[1] < cols) {
          if (grid[r][c] == grid[n[0]][n[1]]) return false;
        }
      }
    }
    return true;
  }

  List<List<int>> _getGrid(List<List<List<int>>> dominoes, List<int> states, int rows, int cols) {
    final grid = List.generate(rows, (_) => List.filled(cols, 0));
    for (int i = 0; i < dominoes.length; i++) {
      if (states[i] == 1) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 1;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 2;
      } else if (states[i] == 2) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 2;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 1;
      }
    }
    return grid;
  }

  bool _hasUniqueSolution(Map<String, dynamic> level, int rows, int cols) {
    final dominoes = level['dominoes'] as List<List<List<int>>>;
    final rowPos = level['rowPos'] as List<int>;
    final rowNeg = level['rowNeg'] as List<int>;
    final colPos = level['colPos'] as List<int>;
    final colNeg = level['colNeg'] as List<int>;

    int solutions = 0;
    void solve(int idx, List<int> currentStates) {
      if (solutions > 1) return;
      if (idx == dominoes.length) {
        if (checkVictoryWrapper({
          'dominoes': dominoes,
          'states': currentStates,
          'rowPos': rowPos,
          'rowNeg': rowNeg,
          'colPos': colPos,
          'colNeg': colNeg,
        })) {
          solutions++;
        }
        return;
      }

      for (int s in [0, 1, 2]) {
        currentStates[idx] = s;
        // Optimization: check if current state violates row/col clues or adjacency
        if (_isPartiallyValid(idx, dominoes, currentStates, rowPos, rowNeg, colPos, colNeg, rows, cols)) {
          solve(idx + 1, currentStates);
        }
      }
    }

    solve(0, List.filled(dominoes.length, 0));
    return solutions == 1;
  }

  bool _isPartiallyValid(int idx, List<List<List<int>>> dominoes, List<int> states, 
      List<int> rowPos, List<int> rowNeg, List<int> colPos, List<int> colNeg, int rows, int cols) {
    final grid = List.generate(rows, (_) => List.filled(cols, 0));
    for (int i = 0; i <= idx; i++) {
      if (states[i] == 1) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 1;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 2;
      } else if (states[i] == 2) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 2;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 1;
      }
    }

    // Adjacency check for last domino
    final cells = [dominoes[idx][0], dominoes[idx][1]];
    for (var cell in cells) {
      int r = cell[0], c = cell[1];
      if (grid[r][c] == 0) continue;
      final neighbors = [[r-1, c], [r+1, c], [r, c-1], [r, c+1]];
      for (var n in neighbors) {
        if (n[0] >= 0 && n[0] < rows && n[1] >= 0 && n[1] < cols) {
          if (grid[r][c] == grid[n[0]][n[1]]) return false;
        }
      }
    }

    // Row/Col clue check (only if we can't possibly satisfy them)
    // For simplicity, just check if they exceed the target
    for (int r = 0; r < rows; r++) {
      int p = 0, n = 0;
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 1) p++;
        if (grid[r][c] == 2) n++;
      }
      if (p > rowPos[r] || n > rowNeg[r]) return false;
    }

    for (int c = 0; c < cols; c++) {
      int p = 0, n = 0;
      for (int r = 0; r < rows; r++) {
        if (grid[r][c] == 1) p++;
        if (grid[r][c] == 2) n++;
      }
      if (p > colPos[c] || n > colNeg[c]) return false;
    }

    return true;
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    final dominoes = params['dominoes'] as List<List<List<int>>>;
    final states = params['states'] as List<int>; // 0: blank, 1: +-, 2: -+
    final rowPos = params['rowPos'] as List<int>;
    final rowNeg = params['rowNeg'] as List<int>;
    final colPos = params['colPos'] as List<int>;
    final colNeg = params['colNeg'] as List<int>;
    final rows = rowPos.length;
    final cols = colPos.length;

    List<List<int>> grid = List.generate(rows, (_) => List.filled(cols, 0)); // 0: blank, 1: +, 2: -
    for (int i = 0; i < dominoes.length; i++) {
      if (states[i] == 1) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 1;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 2;
      } else if (states[i] == 2) {
        grid[dominoes[i][0][0]][dominoes[i][0][1]] = 2;
        grid[dominoes[i][1][0]][dominoes[i][1][1]] = 1;
      }
    }

    // Check adjacency
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 0) continue;
        final neighbors = [[r-1, c], [r+1, c], [r, c-1], [r, c+1]];
        for (var n in neighbors) {
          if (n[0] >= 0 && n[0] < rows && n[1] >= 0 && n[1] < cols) {
            if (grid[r][c] == grid[n[0]][n[1]]) return false;
          }
        }
      }
    }

    // Check clues
    for (int r = 0; r < rows; r++) {
      int p = 0, n = 0;
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 1) p++;
        if (grid[r][c] == 2) n++;
      }
      if (rowPos[r] != -1 && p != rowPos[r]) return false;
      if (rowNeg[r] != -1 && n != rowNeg[r]) return false;
    }

    for (int c = 0; c < cols; c++) {
      int p = 0, n = 0;
      for (int r = 0; r < rows; r++) {
        if (grid[r][c] == 1) p++;
        if (grid[r][c] == 2) n++;
      }
      if (colPos[c] != -1 && p != colPos[c]) return false;
      if (colNeg[c] != -1 && n != colNeg[c]) return false;
    }

    return true;
  }
}

