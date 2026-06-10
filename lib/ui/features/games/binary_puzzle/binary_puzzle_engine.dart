import 'dart:math';

class BinaryPuzzleBoard {
  final int size;
  final List<List<int?>> grid; // null for empty, 0 or 1

  BinaryPuzzleBoard({
    required this.size,
    required this.grid,
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
    );
  }

  List<List<int>> _generateFullGrid(int size) {
    for (int attempt = 0; attempt < 1000; attempt++) {
      List<List<int>> grid = List.generate(size, (_) => List.filled(size, -1));
      if (_fillGrid(grid, 0, 0, size)) {
        if (_isFinalValid(grid, size)) {
          return grid;
        }
      }
    }
    // Fallback or throw if it fails too many times, 
    // but for 6x6 it should find one very quickly.
    return List.generate(size, (r) => List.generate(size, (c) => (r + c) % 2));
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

    // Remove cells until we reach the target number of clues.
    // For binary puzzles, we want enough clues to make it interesting but allow multiple solutions.
    int targetClues = (size * size * 0.4).toInt() + _random.nextInt(size); 
    int removed = 0;
    for (var cell in cells) {
      if ((size * size - removed) <= targetClues) break;
      puzzle[cell.y][cell.x] = null;
      removed++;
    }

    return puzzle;
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

  bool isCompleteAndValid(List<List<int?>> grid, int size) {
    // 1. Check all cells are filled
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == null) return false;
      }
    }

    // Convert to List<List<int>> for internal checks
    List<List<int>> fullGrid = grid.map((row) => row.map((e) => e!).toList()).toList();

    // 2. Check no more than two same adjacent (Rule 1)
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        int val = fullGrid[r][c];
        // Horizontal
        if (c < size - 2 && fullGrid[r][c + 1] == val && fullGrid[r][c + 2] == val) return false;
        // Vertical
        if (r < size - 2 && fullGrid[r + 1][c] == val && fullGrid[r + 2][c] == val) return false;
      }
    }

    // 3. Equal number of 0s and 1s (Rule 2)
    int half = size ~/ 2;
    for (int i = 0; i < size; i++) {
      int row0 = 0, row1 = 0, col0 = 0, col1 = 0;
      for (int j = 0; j < size; j++) {
        if (fullGrid[i][j] == 0) {
          row0++;
        } else {
          row1++;
        }
        if (fullGrid[j][i] == 0) {
          col0++;
        } else {
          col1++;
        }
      }
      if (row0 != half || row1 != half) return false;
      if (col0 != half || col1 != half) return false;
    }

    // 4. Uniqueness of rows and columns (Rule 3)
    return _isFinalValid(fullGrid, size);
  }
}
