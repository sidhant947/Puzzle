import 'dart:math';

class PixelMimicEngine {
  final int size = 4;

  List<List<int>> generatePattern() {
    final random = Random();
    // 0: empty, 1-4: color IDs
    List<List<int>> grid = List.generate(size, (_) => List.filled(size, 0));
    
    int cellsToFill = random.nextInt(4) + 4; // 4-7 cells
    for (int i = 0; i < cellsToFill; i++) {
      int r, c;
      do {
        r = random.nextInt(size);
        c = random.nextInt(size);
      } while (grid[r][c] != 0);
      grid[r][c] = random.nextInt(4) + 1;
    }
    
    return grid;
  }

  bool checkMatch(List<List<int>> target, List<List<int>> user) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (target[r][c] != user[r][c]) return false;
      }
    }
    return true;
  }
}
