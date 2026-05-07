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
    List<List<int>> solution = _generateSolution(size);
    List<List<int?>> grid = _createPuzzle(solution, size);

    return BinaryPuzzleBoard(
      size: size,
      grid: grid,
      solution: solution,
    );
  }

  List<List<int>> _generateSolution(int size) {
    while (true) {
      List<List<int>> grid = List.generate(size, (_) => List.filled(size, -1));
      if (_solve(grid, 0, 0, size)) {
        return grid;
      }
    }
  }

  bool _solve(List<List<int>> grid, int row, int col, int size) {
    if (row == size) return true;

    int nextRow = col == size - 1 ? row + 1 : row;
    int nextCol = col == size - 1 ? 0 : col + 1;

    List<int> values = [0, 1]..shuffle(_random);

    for (int val in values) {
      if (_isValid(grid, row, col, val, size)) {
        grid[row][col] = val;
        if (_solve(grid, nextRow, nextCol, size)) return true;
        grid[row][col] = -1;
      }
    }

    return false;
  }

  bool _isValid(List<List<int>> grid, int row, int col, int val, int size) {
    // Rule 1: No more than two same adjacent
    // Horizontal
    if (col >= 2 && grid[row][col - 1] == val && grid[row][col - 2] == val) return false;
    // Vertical
    if (row >= 2 && grid[row - 1][col] == val && grid[row - 2][col] == val) return false;

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

    // Rule 3: Uniqueness (only check when row/col is complete)
    if (col == size - 1) {
      List<int> currentRow = List.from(grid[row]);
      currentRow[col] = val;
      for (int r = 0; r < row; r++) {
        bool identical = true;
        for (int c = 0; c < size; c++) {
          if (grid[r][c] != currentRow[c]) {
            identical = false;
            break;
          }
        }
        if (identical) return false;
      }
    }

    if (row == size - 1) {
      List<int> currentCol = [];
      for (int r = 0; r < size - 1; r++) {
        currentCol.add(grid[r][col]);
      }
      currentCol.add(val);
      for (int c = 0; c < col; c++) {
        bool identical = true;
        for (int r = 0; r < size; r++) {
          if (grid[r][c] != currentCol[r]) {
            identical = false;
            break;
          }
        }
        if (identical) return false;
      }
    }

    return true;
  }

  List<List<int?>> _createPuzzle(List<List<int>> solution, int size) {
    List<List<int?>> puzzle = List.generate(size, (r) => List.generate(size, (c) => solution[r][c]));
    
    // Remove cells while keeping it solvable (simplification: just remove a fixed percentage for now)
    // A better approach would be to check for unique solvability, but for a mini-game this is usually fine.
    int cellsToRemove = (size * size * 0.5).toInt();
    List<Point<int>> cells = [];
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        cells.add(Point(c, r));
      }
    }
    cells.shuffle(_random);

    for (int i = 0; i < cellsToRemove; i++) {
      puzzle[cells[i].y][cells[i].x] = null;
    }

    return puzzle;
  }
}
