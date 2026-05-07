import 'dart:math';

class SymmetryEngine {
  final int size = 6;
  final Random _random = Random();

  List<List<bool>> generatePattern() {
    // Generate patterns for the left half (size/2)
    List<List<bool>> grid = List.generate(size, (_) => List.filled(size, false));
    int half = size ~/ 2;
    
    for (int y = 0; y < size; y++) {
      for (int x = 0; x < half; x++) {
        grid[y][x] = _random.nextBool();
      }
    }
    return grid;
  }

  bool checkSymmetry(List<List<bool>> grid) {
    int half = size ~/ 2;
    for (int y = 0; y < size; y++) {
      for (int x = 0; x < half; x++) {
        // Right side should be mirror of left side
        if (grid[y][x] != grid[y][size - 1 - x]) {
          return false;
        }
      }
    }
    return true;
  }
}
