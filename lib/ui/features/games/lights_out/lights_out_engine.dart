import 'dart:math';

class LightsOutEngine {
  static const int size = 5;
  final Random _random = Random();

  List<List<bool>> generateLevel() {
    // Start with all lights off (false)
    List<List<bool>> grid = List.generate(size, (_) => List.filled(size, false));

    // Randomly toggle cells to ensure the puzzle is solvable
    // Toggling from a solved state always results in a solvable puzzle
    int scrambles = 15 + _random.nextInt(10);
    for (int i = 0; i < scrambles; i++) {
      int r = _random.nextInt(size);
      int c = _random.nextInt(size);
      toggle(grid, r, c);
    }

    // Ensure it's not already solved
    if (isSolved(grid)) {
      return generateLevel();
    }

    return grid;
  }

  void toggle(List<List<bool>> grid, int r, int c) {
    _flip(grid, r, c);
    _flip(grid, r - 1, c);
    _flip(grid, r + 1, c);
    _flip(grid, r, c - 1);
    _flip(grid, r, c + 1);
  }

  void _flip(List<List<bool>> grid, int r, int c) {
    if (r >= 0 && r < size && c >= 0 && c < size) {
      grid[r][c] = !grid[r][c];
    }
  }

  bool isSolved(List<List<bool>> grid) {
    for (var row in grid) {
      if (row.any((cell) => cell)) return false;
    }
    return true;
  }
}
