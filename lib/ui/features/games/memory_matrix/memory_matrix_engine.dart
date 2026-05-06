import 'dart:math';

class MemoryMatrixLevel {
  final int size;
  final int tileCount;
  final Duration showDuration;

  MemoryMatrixLevel({
    required this.size,
    required this.tileCount,
    required this.showDuration,
  });
}

class MemoryMatrixEngine {
  final Random _random = Random();

  static const List<MemoryMatrixLevel> levels = [
    // Level 1: 3x3, 3 tiles
    // Level 2: 3x3, 4 tiles
    // Level 3: 4x4, 5 tiles
    // Level 4: 4x4, 6 tiles
    // Level 5: 5x5, 7 tiles
  ];

  MemoryMatrixLevel getLevel(int levelIndex) {
    if (levelIndex < 1) levelIndex = 1;
    
    int size;
    int tileCount;
    
    if (levelIndex <= 2) {
      size = 3;
      tileCount = 2 + levelIndex;
    } else if (levelIndex <= 4) {
      size = 4;
      tileCount = 2 + levelIndex;
    } else {
      size = 5;
      tileCount = 2 + levelIndex;
    }

    // Cap size at 6 and tiles at 15 for extreme levels
    size = min(size, 6);
    tileCount = min(tileCount, 15);

    return MemoryMatrixLevel(
      size: size,
      tileCount: tileCount,
      showDuration: Duration(milliseconds: 1000 + (levelIndex * 100)),
    );
  }

  Set<int> generatePattern(int size, int tileCount) {
    final Set<int> pattern = {};
    final int maxIndex = size * size;
    
    while (pattern.length < tileCount) {
      pattern.add(_random.nextInt(maxIndex));
    }
    
    return pattern;
  }
}
