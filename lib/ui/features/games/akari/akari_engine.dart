import 'dart:math';

class AkariEngine {
  final Random _random = Random();

  // 0-4: Number of adjacent bulbs
  // -1: Wall without number
  // -2: White cell
  
  static const List<Map<String, dynamic>> _levels = [
    {
      'grid': [
        [-2, -2, -1, -2, -2],
        [-2, -2, -2, -2, -2],
        [ 1, -2, -1, -2,  1],
        [-2, -2, -2, -2, -2],
        [-2, -2, -1, -2, -2],
      ],
    },
    {
      'grid': [
        [-2, -1, -2, -2, -2],
        [-1, -2, -2, -2, -2],
        [-2, -2,  2, -2, -2],
        [-2, -2, -2, -2, -1],
        [-2, -2, -2, -1, -2],
      ],
    },
    {
      'grid': [
        [-2, -2, -2, -2, -2],
        [-2,  1, -2,  0, -2],
        [-2, -2, -1, -2, -2],
        [-2,  2, -2, -1, -2],
        [-2, -2, -2, -2, -2],
      ],
    },
  ];

  Map<String, dynamic> generateLevel() {
    final level = _levels[_random.nextInt(_levels.length)];
    return {
      'grid': (level['grid'] as List<List<int>>).map((r) => List<int>.from(r)).toList(),
    };
  }

  static List<List<bool>> calculateLit(List<List<int>> grid, List<List<bool>> bulbs) {
    final size = grid.length;
    final lit = List.generate(size, (_) => List.filled(size, false));

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (bulbs[r][c]) {
          lit[r][c] = true;
          // Up
          for (int i = r - 1; i >= 0 && grid[i][c] == -2; i--) {
            lit[i][c] = true;
          }
          // Down
          for (int i = r + 1; i < size && grid[i][c] == -2; i++) {
            lit[i][c] = true;
          }
          // Left
          for (int j = c - 1; j >= 0 && grid[r][j] == -2; j--) {
            lit[r][j] = true;
          }
          // Right
          for (int j = c + 1; j < size && grid[r][j] == -2; j++) {
            lit[r][j] = true;
          }
        }
      }
    }
    return lit;
  }

  static bool checkVictory(List<List<int>> grid, List<List<bool>> bulbs, List<List<bool>> lit) {
    final size = grid.length;

    // 1. All white cells must be lit
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == -2 && !lit[r][c]) return false;
      }
    }

    // 2. Bulbs can't see each other
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (bulbs[r][c]) {
          // Check horizontal
          for (int j = c + 1; j < size && grid[r][j] == -2; j++) {
            if (bulbs[r][j]) return false;
          }
          // Check vertical
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
