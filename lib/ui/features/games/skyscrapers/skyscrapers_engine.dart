import 'dart:math';

class SkyscrapersEngine {
  final Random _random = Random();

  Map<String, dynamic> generateLevel({int size = 4}) {
    // 1. Generate a Latin Square of size N
    // 2. Calculate clues for the edges
    
    List<List<int>> solution = List.generate(size, (r) => List.generate(size, (c) => ((r + c) % size) + 1));
    
    // Shuffle rows and cols
    solution.shuffle();
    solution = _transpose(solution);
    solution.shuffle();
    solution = _transpose(solution);

    // Calculate clues
    List<int> top = List.filled(size, 0);
    List<int> bottom = List.filled(size, 0);
    List<int> left = List.filled(size, 0);
    List<int> right = List.filled(size, 0);

    for (int i = 0; i < size; i++) {
      left[i] = _countVisible(solution[i]);
      right[i] = _countVisible(solution[i].reversed.toList());
    }

    for (int j = 0; j < size; j++) {
      List<int> col = List.generate(size, (i) => solution[i][j]);
      top[j] = _countVisible(col);
      bottom[j] = _countVisible(col.reversed.toList());
    }

    return {
      'solution': solution,
      'top': top,
      'bottom': bottom,
      'left': left,
      'right': right,
    };
  }

  int _countVisible(List<int> heights) {
    int count = 0;
    int maxSoFar = 0;
    for (int h in heights) {
      if (h > maxSoFar) {
        count++;
        maxSoFar = h;
      }
    }
    return count;
  }

  List<List<int>> _transpose(List<List<int>> grid) {
    int size = grid.length;
    return List.generate(size, (r) => List.generate(size, (c) => grid[c][r]));
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    final grid = params['grid'] as List<List<int>>;
    final top = params['top'] as List<int>;
    final bottom = params['bottom'] as List<int>;
    final left = params['left'] as List<int>;
    final right = params['right'] as List<int>;
    final size = grid.length;

    // Check Latin Square property
    for (int r = 0; r < size; r++) {
      Set<int> s = {};
      for (int c = 0; c < size; c++) {
        if (grid[r][c] < 1 || grid[r][c] > size || s.contains(grid[r][c])) return false;
        s.add(grid[r][c]);
      }
    }
    for (int c = 0; c < size; c++) {
      Set<int> s = {};
      for (int r = 0; r < size; r++) {
        if (grid[r][c] < 1 || grid[r][c] > size || s.contains(grid[r][c])) return false;
        s.add(grid[r][c]);
      }
    }

    // Check clues
    final engine = SkyscrapersEngine();
    for (int i = 0; i < size; i++) {
      if (left[i] != 0 && engine._countVisible(grid[i]) != left[i]) return false;
      if (right[i] != 0 && engine._countVisible(grid[i].reversed.toList()) != right[i]) return false;
    }
    for (int j = 0; j < size; j++) {
      List<int> col = List.generate(size, (i) => grid[i][j]);
      if (top[j] != 0 && engine._countVisible(col) != top[j]) return false;
      if (bottom[j] != 0 && engine._countVisible(col.reversed.toList()) != bottom[j]) return false;
    }

    return true;
  }
}
