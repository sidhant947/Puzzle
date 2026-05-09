import 'dart:math';

class HitoriEngine {
  final int size = 5;

  Map<String, dynamic> generatePuzzle() {
    // Fixed simple puzzle for now
    final grid = [
      [2, 2, 1, 5, 3],
      [2, 3, 1, 4, 5],
      [1, 1, 1, 3, 5],
      [1, 3, 5, 4, 2],
      [5, 4, 3, 2, 1],
    ];

    return {
      'grid': grid,
    };
  }

  bool checkWin(List<List<int>> grid, List<List<bool>> painted) {
    // 1. No number appears twice in any row/column among unpainted cells
    for (int i = 0; i < size; i++) {
      Map<int, int> rowCounts = {};
      Map<int, int> colCounts = {};
      for (int j = 0; j < size; j++) {
        if (!painted[i][j]) {
          rowCounts[grid[i][j]] = (rowCounts[grid[i][j]] ?? 0) + 1;
        }
        if (!painted[j][i]) {
          colCounts[grid[j][i]] = (colCounts[grid[j][i]] ?? 0) + 1;
        }
      }
      if (rowCounts.values.any((c) => c > 1)) return false;
      if (colCounts.values.any((c) => c > 1)) return false;
    }

    // 2. No two painted cells are adjacent (horizontally or vertically)
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (painted[r][c]) {
          if (r > 0 && painted[r - 1][c]) return false;
          if (r < size - 1 && painted[r + 1][c]) return false;
          if (c > 0 && painted[r][c - 1]) return false;
          if (c < size - 1 && painted[r][c + 1]) return false;
        }
      }
    }

    // 3. All unpainted cells must be connected
    return _checkConnectivity(painted);
  }

  bool _checkConnectivity(List<List<bool>> painted) {
    Point<int>? start;
    int unpaintedCount = 0;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (!painted[r][c]) {
          start ??= Point(c, r);
          unpaintedCount++;
        }
      }
    }

    if (start == null) return false;

    Set<Point<int>> visited = {start};
    List<Point<int>> stack = [start];

    while (stack.isNotEmpty) {
      Point<int> current = stack.removeLast();
      List<Point<int>> neighbors = [
        Point(current.x + 1, current.y),
        Point(current.x - 1, current.y),
        Point(current.x, current.y + 1),
        Point(current.x, current.y - 1),
      ];

      for (var n in neighbors) {
        if (n.x >= 0 && n.x < size && n.y >= 0 && n.y < size) {
          if (!painted[n.y][n.x] && !visited.contains(n)) {
            visited.add(n);
            stack.add(n);
          }
        }
      }
    }

    return visited.length == unpaintedCount;
  }
}
