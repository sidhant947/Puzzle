import 'dart:math';

class LetterCancellationEngine {
  final Random _random = Random();
  final String letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  Map<String, dynamic> generateGrid({int rows = 8, int cols = 6}) {
    String target = letters[_random.nextInt(letters.length)];
    List<String> grid = [];
    int targetCount = 0;

    for (int i = 0; i < rows * cols; i++) {
      if (_random.nextDouble() < 0.15) {
        grid.add(target);
        targetCount++;
      } else {
        String other;
        do {
          other = letters[_random.nextInt(letters.length)];
        } while (other == target);
        grid.add(other);
      }
    }

    // Ensure at least some targets
    if (targetCount == 0) {
      int idx = _random.nextInt(rows * cols);
      grid[idx] = target;
      targetCount = 1;
    }

    return {
      'target': target,
      'grid': grid,
      'targetCount': targetCount,
      'rows': rows,
      'cols': cols,
    };
  }
}
