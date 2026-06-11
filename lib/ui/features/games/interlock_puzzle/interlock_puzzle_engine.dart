import 'dart:math';

class InterlockPuzzleEngine {
  static const int size = 3;

  Map<String, dynamic> generateLevel() {
    final random = Random();
    bool shouldFit = random.nextBool();

    // Generate Shape A
    List<int> shapeA = List.generate(size * size * size, (_) => 0);
    // Fill roughly half
    int targetCount = (size * size * size) ~/ 2;
    int currentCount = 0;
    while (currentCount < targetCount) {
      int idx = random.nextInt(size * size * size);
      if (shapeA[idx] == 0) {
        shapeA[idx] = 1;
        currentCount++;
      }
    }

    List<int> shapeB = List.generate(size * size * size, (_) => 0);
    if (shouldFit) {
      // Shape B is the complement of Shape A
      for (int i = 0; i < shapeA.length; i++) {
        if (shapeA[i] == 0) {
          shapeB[i] = 1;
        }
      }
    } else {
      // Shape B is almost the complement, but with one overlap or one gap
      for (int i = 0; i < shapeA.length; i++) {
        if (shapeA[i] == 0) {
          shapeB[i] = 1;
        }
      }
      
      if (random.nextBool()) {
        // Add an overlap
        int idx = random.nextInt(size * size * size);
        while (shapeA[idx] == 0) {
          idx = random.nextInt(size * size * size);
        }
        shapeB[idx] = 1;
      } else {
        // Remove a piece from B creating a gap
        int idx = random.nextInt(size * size * size);
        while (shapeB[idx] == 0) {
          idx = random.nextInt(size * size * size);
        }
        shapeB[idx] = 0;
      }
    }

    return {
      'shapeA': shapeA,
      'shapeB': shapeB,
      'shouldFit': shouldFit,
    };
  }

  static Map<String, dynamic> generateLevelWrapper(dynamic _) {
    return InterlockPuzzleEngine().generateLevel();
  }
}
