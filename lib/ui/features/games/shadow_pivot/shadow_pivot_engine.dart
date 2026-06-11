import 'dart:math';

enum LightDirection {
  front,
  side,
  top,
}

class ShadowPivotLevel {
  final List<List<List<bool>>> grid3D;
  final LightDirection lightDirection;
  final List<List<List<bool>>> options;
  final int correctOptionIndex;

  ShadowPivotLevel({
    required this.grid3D,
    required this.lightDirection,
    required this.options,
    required this.correctOptionIndex,
  });
}

class ShadowPivotEngine {
  final Random _random = Random();

  List<List<List<bool>>> _generateRandom3DGrid({int size = 3}) {
    final grid = List.generate(
      size,
      (_) => List.generate(
        size,
        (_) => List.filled(size, false),
      ),
    );

    int count = 0;
    int targetBlocks = _random.nextInt(5) + 6; // 6 to 10 blocks

    // Initial foundation
    for (int i = 0; i < 4; i++) {
      int rx = _random.nextInt(size);
      int ry = _random.nextInt(size);
      if (!grid[rx][ry][0]) {
        grid[rx][ry][0] = true;
        count++;
      }
    }

    // Stack blocks
    int attempts = 0;
    while (count < targetBlocks && attempts < 100) {
      attempts++;
      int rx = _random.nextInt(size);
      int ry = _random.nextInt(size);
      int rz = _random.nextInt(size);

      if (rz == 0) {
        if (!grid[rx][ry][0]) {
          grid[rx][ry][0] = true;
          count++;
        }
      } else {
        if (grid[rx][ry][rz - 1] && !grid[rx][ry][rz]) {
          grid[rx][ry][rz] = true;
          count++;
        }
      }
    }

    return grid;
  }

  List<List<bool>> projectSilhouette(List<List<List<bool>>> grid3D, LightDirection direction) {
    final size = grid3D.length;
    final result = List.generate(size, (_) => List.filled(size, false));

    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        for (int z = 0; z < size; z++) {
          if (grid3D[x][y][z]) {
            switch (direction) {
              case LightDirection.top:
                result[y][x] = true;
                break;
              case LightDirection.front:
                result[size - 1 - z][x] = true;
                break;
              case LightDirection.side:
                result[size - 1 - z][y] = true;
                break;
            }
          }
        }
      }
    }
    return result;
  }

  List<List<bool>> _mutateGrid(List<List<bool>> original) {
    final size = original.length;
    final mutated = List.generate(size, (r) => List<bool>.from(original[r]));

    int attempts = 0;
    while (attempts < 10) {
      int rx = _random.nextInt(size);
      int ry = _random.nextInt(size);
      mutated[rx][ry] = !mutated[rx][ry];
      
      // Check if it's not empty and not same as original
      bool isEmpty = true;
      for (var r in mutated) {
        if (r.contains(true)) {
          isEmpty = false;
          break;
        }
      }
      
      if (!isEmpty && !_gridsEqual(mutated, original)) break;
      attempts++;
    }

    return mutated;
  }

  ShadowPivotLevel generateLevel() {
    final grid3D = _generateRandom3DGrid();
    final lightDirection = LightDirection.values[_random.nextInt(LightDirection.values.length)];
    final correctSilhouette = projectSilhouette(grid3D, lightDirection);

    List<List<List<bool>>> options = [correctSilhouette];

    // Generate distractors
    // Distractor 1: Another perspective
    LightDirection otherDir = LightDirection.values[(_random.nextInt(LightDirection.values.length))];
    while (otherDir == lightDirection) {
      otherDir = LightDirection.values[(_random.nextInt(LightDirection.values.length))];
    }
    List<List<bool>> dist1 = projectSilhouette(grid3D, otherDir);
    if (_gridsEqual(dist1, correctSilhouette)) {
      dist1 = _mutateGrid(correctSilhouette);
    }
    options.add(dist1);

    // Distractor 2 & 3: Mutated versions
    while (options.length < 4) {
      List<List<bool>> candidate = _mutateGrid(correctSilhouette);
      bool duplicate = false;
      for (var opt in options) {
        if (_gridsEqual(opt, candidate)) {
          duplicate = true;
          break;
        }
      }
      if (!duplicate) {
        options.add(candidate);
      }
    }

    options.shuffle(_random);
    final correctIndex = options.indexWhere((opt) => _gridsEqual(opt, correctSilhouette));

    return ShadowPivotLevel(
      grid3D: grid3D,
      lightDirection: lightDirection,
      options: options,
      correctOptionIndex: correctIndex,
    );
  }

  bool _gridsEqual(List<List<bool>> a, List<List<bool>> b) {
    if (a.length != b.length) return false;
    for (int r = 0; r < a.length; r++) {
      for (int c = 0; c < a[r].length; c++) {
        if (a[r][c] != b[r][c]) return false;
      }
    }
    return true;
  }
}
