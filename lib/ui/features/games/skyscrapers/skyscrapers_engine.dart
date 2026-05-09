class SkyscrapersEngine {
  final int size = 4;

  Map<String, dynamic> generatePuzzle() {
    // Generate a valid 4x4 Latin Square
    List<List<int>> grid = List.generate(size, (r) => List.generate(size, (c) => (r + c) % size + 1));
    grid.shuffle();
    // Transpose and shuffle columns
    for (int i = 0; i < size; i++) {
      List<int> col = List.generate(size, (r) => grid[r][i]);
      col.shuffle();
      for (int r = 0; r < size; r++) {
        grid[r][i] = col[r];
      }
    }

    // Edge clues
    List<int> top = [];
    List<int> bottom = [];
    List<int> left = [];
    List<int> right = [];

    for (int i = 0; i < size; i++) {
      // Top/Bottom (Column i)
      List<int> col = List.generate(size, (r) => grid[r][i]);
      top.add(_countVisible(col));
      bottom.add(_countVisible(col.reversed.toList()));

      // Left/Right (Row i)
      List<int> row = grid[i];
      left.add(_countVisible(row));
      right.add(_countVisible(row.reversed.toList()));
    }

    return {
      'solution': grid,
      'top': top,
      'bottom': bottom,
      'left': left,
      'right': right,
    };
  }

  int _countVisible(List<int> heights) {
    int count = 0;
    int maxSoFar = 0;
    for (var h in heights) {
      if (h > maxSoFar) {
        count++;
        maxSoFar = h;
      }
    }
    return count;
  }

  bool checkWin(List<List<int>> userGrid, Map<String, List<int>> clues) {
    // Check if valid Latin Square
    for (int i = 0; i < size; i++) {
      Set<int> rowSet = Set.from(userGrid[i]);
      Set<int> colSet = Set.from(List.generate(size, (r) => userGrid[r][i]));
      if (rowSet.length != size || rowSet.contains(0)) return false;
      if (colSet.length != size || colSet.contains(0)) return false;
    }

    // Check clues
    for (int i = 0; i < size; i++) {
      List<int> row = userGrid[i];
      List<int> col = List.generate(size, (r) => userGrid[r][i]);
      
      if (_countVisible(row) != clues['left']![i]) return false;
      if (_countVisible(row.reversed.toList()) != clues['right']![i]) return false;
      if (_countVisible(col) != clues['top']![i]) return false;
      if (_countVisible(col.reversed.toList()) != clues['bottom']![i]) return false;
    }

    return true;
  }
}
