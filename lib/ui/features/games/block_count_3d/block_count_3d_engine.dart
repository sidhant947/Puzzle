import 'dart:math';

class BlockCount3DLevel {
  final List<List<int>> grid;
  final int totalBlocks;

  BlockCount3DLevel({
    required this.grid,
    required this.totalBlocks,
  });
}

class BlockCount3DEngine {
  final Random _random = Random();

  BlockCount3DLevel generateLevel({int size = 3, int maxHeight = 3}) {
    List<List<int>> grid = List.generate(size, (_) => List.filled(size, 0));
    int total = 0;
    
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        // Keep a high chance of having blocks (70%)
        if (_random.nextDouble() < 0.75) {
          int height = _random.nextInt(maxHeight) + 1; // 1 to maxHeight
          grid[i][j] = height;
          total += height;
        } else {
          grid[i][j] = 0;
        }
      }
    }
    
    // Ensure we have at least 3 blocks
    if (total < 3) {
      grid[1][1] = 3;
      total = 3;
    }

    return BlockCount3DLevel(grid: grid, totalBlocks: total);
  }
}
