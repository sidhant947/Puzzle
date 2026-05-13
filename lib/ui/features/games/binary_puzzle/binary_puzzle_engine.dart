import 'dart:math';

class BinaryPuzzleBoard {
  final int size;
  final List<List<int?>> grid; // null for empty, 0 or 1
  final List<List<int>> solution;

  BinaryPuzzleBoard({
    required this.size,
    required this.grid,
    required this.solution,
  });
}

class BinaryPuzzleEngine {
  final Random _random = Random();

  BinaryPuzzleBoard generateBoard({int size = 6}) {
    List<List<int>> solution = _generateFullGrid(size);
    List<List<int?>> grid = _createPuzzle(solution, size);

    return BinaryPuzzleBoard(
      size: size,
      grid: grid,
      solution: solution,
    );
  }

  List<List<int>> _generateFullGrid(int size) {
    while (true) {
      List<List<int>> grid = List.generate(size, (_) => List.filled(size, -1));
      if (_fillGrid(grid, 0, 0, size)) {
        return grid;
      }
    }
  }

  bool _fillGrid(List<List<int>> grid, int row, int col, int size) {
    if (row == size) return true;

    int nextRow = col == size - 1 ? row + 1 : row;
    int nextCol = col == size - 1 ? 0 : col + 1;

    List<int> values = [0, 1]..shuffle(_random);

    for (int val in values) {
      if (_isValidPlacement(grid, row, col, val, size)) {
        grid[row][col] = val;
        if (_fillGrid(grid, nextRow, nextCol, size)) return true;
        grid[row][col] = -1;
      }
    }

    return false;
  }

  bool _isValidPlacement(List<List<int>> grid, int row, int col, int val, int size) {
    // Rule 1: No more than two same adjacent
    if (col >= 2 && grid[row][col - 1] == val && grid[row][col - 2] == val) return false;
    if (row >= 2 && grid[row - 1][col] == val && grid[row - 2][col] == val) return false;
    // Also check ahead if we are validating a full grid (though in fillGrid we only check behind)
    if (col < size - 2 && grid[row][col + 1] == val && grid[row][col + 2] == val) return false;
    if (row < size - 2 && grid[row + 1][col] == val && grid[row + 2][col] == val) return false;
    // Check sandwich
    if (col > 0 && col < size - 1 && grid[row][col - 1] == val && grid[row][col + 1] == val) return false;
    if (row > 0 && row < size - 1 && grid[row - 1][col] == val && grid[row + 1][col] == val) return false;

    // Rule 2: Equal number of 0s and 1s
    int count0 = 0;
    int count1 = 0;
    for (int c = 0; c < size; c++) {
      if (grid[row][c] == 0) count0++;
      if (grid[row][c] == 1) count1++;
    }
    if (val == 0 && count0 >= size / 2) return false;
    if (val == 1 && count1 >= size / 2) return false;

    count0 = 0;
    count1 = 0;
    for (int r = 0; r < size; r++) {
      if (grid[r][col] == 0) count0++;
      if (grid[r][col] == 1) count1++;
    }
    if (val == 0 && count0 >= size / 2) return false;
    if (val == 1 && count1 >= size / 2) return false;

    // Rule 3: Uniqueness of rows and columns (only when nearly complete)
    // This is actually better checked after a row/col is finished.
    return true;
  }

  List<List<int?>> _createPuzzle(List<List<int>> solution, int size) {
    List<List<int?>> puzzle = List.generate(size, (r) => List.generate(size, (c) => solution[r][c]));
    
    List<Point<int>> cells = [];
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        cells.add(Point(c, r));
      }
    }
    cells.shuffle(_random);

    // Try to remove as many cells as possible while maintaining uniqueness
    // For a 6x6, we usually want about 14-18 clues.
    int minClues = size * 2 + 2; 
    int removed = 0;
    for (var cell in cells) {
      if ((size * size - removed) <= minClues) break;

      int? originalVal = puzzle[cell.y][cell.x];
      puzzle[cell.y][cell.x] = null;
      
      if (_countSolutions(puzzle, size) != 1) {
        puzzle[cell.y][cell.x] = originalVal;
      } else {
        removed++;
      }
    }

    return puzzle;
  }

  int _countSolutions(List<List<int?>> puzzle, int size) {
    int count = 0;
    List<List<int>> grid = List.generate(size, (r) => List.generate(size, (c) => puzzle[r][c] ?? -1));
    
    void solve(int row, int col) {
      if (count > 1) return;
      if (row == size) {
        if (_isFinalValid(grid, size)) {
          count++;
        }
        return;
      }

      int nextRow = col == size - 1 ? row + 1 : row;
      int nextCol = col == size - 1 ? 0 : col + 1;

      if (grid[row][col] != -1) {
        solve(nextRow, nextCol);
      } else {
        for (int val in [0, 1]) {
          if (_isValidPlacement(grid, row, col, val, size)) {
            grid[row][col] = val;
            solve(nextRow, nextCol);
            grid[row][col] = -1;
          }
        }
      }
    }

    solve(0, 0);
    return count;
  }

  bool _isFinalValid(List<List<int>> grid, int size) {
    // Check all rows and columns are unique
    for (int i = 0; i < size; i++) {
      for (int j = i + 1; j < size; j++) {
        // Rows
        bool rowSame = true;
        for (int k = 0; k < size; k++) {
          if (grid[i][k] != grid[j][k]) {
            rowSame = false;
            break;
          }
        }
        if (rowSame) return false;

        // Cols
        bool colSame = true;
        for (int k = 0; k < size; k++) {
          if (grid[k][i] != grid[k][j]) {
            colSame = false;
            break;
          }
        }
        if (colSame) return false;
      }
    }
    return true;
  }
}
