import 'dart:math';

enum PerspectiveType {
  top,
  front,
  side,
}

class OrthoLevel {
  final List<List<List<bool>>> grid3D; // 3x3x3 grid
  final PerspectiveType targetView;
  final List<List<List<bool>>> options; // Three 2D grids (3x3)
  final int correctOptionIndex;

  OrthoLevel({
    required this.grid3D,
    required this.targetView,
    required this.options,
    required this.correctOptionIndex,
  });
}

class SilhouetteMatchOrthoEngine {
  final Random _random = Random();

  // Generates a random 3D block stack containing 5 to 9 blocks
  List<List<List<bool>>> _generateRandom3DGrid() {
    final size = 3;
    final grid = List.generate(
      size,
      (_) => List.generate(
        size,
        (_) => List.filled(size, false),
      ),
    );

    int count = 0;
    // We want to add blocks in a physically realistic way: supported from below!
    // A block at (x, y, z) is supported if z == 0, or if grid[x][y][z-1] is true.
    // This makes the 3D block figure look beautiful and physically sound!
    int targetBlocks = _random.nextInt(4) + 5; // 5 to 8 blocks
    
    // Initial foundation
    for (int i = 0; i < 4; i++) {
      int rx = _random.nextInt(size);
      int ry = _random.nextInt(size);
      if (!grid[rx][ry][0]) {
        grid[rx][ry][0] = true;
        count++;
      }
    }

    // Stack blocks on top
    int attempts = 0;
    while (count < targetBlocks && attempts < 50) {
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

  // Projects the 3D grid into a 2D binary grid (3x3) based on perspective
  List<List<bool>> projectPerspective(List<List<List<bool>>> grid3D, PerspectiveType view) {
    final size = 3;
    final result = List.generate(size, (_) => List.filled(size, false));

    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        for (int z = 0; z < size; z++) {
          if (grid3D[x][y][z]) {
            switch (view) {
              case PerspectiveType.top:
                // Looking down Z axis. Row corresponds to Y, Col corresponds to X.
                result[y][x] = true;
                break;
              case PerspectiveType.front:
                // Looking along Y axis. Row corresponds to Z (inverted since high is top), Col corresponds to X.
                result[size - 1 - z][x] = true;
                break;
              case PerspectiveType.side:
                // Looking along X axis. Row corresponds to Z (inverted), Col corresponds to Y.
                result[size - 1 - z][y] = true;
                break;
            }
          }
        }
      }
    }
    return result;
  }

  // Mutates a 2D grid slightly to generate a distractor
  List<List<bool>> _mutateGrid(List<List<bool>> original) {
    final size = original.length;
    final mutated = List.generate(size, (r) => List<bool>.from(original[r]));

    // Pick a random block and flip it
    int rx = _random.nextInt(size);
    int ry = _random.nextInt(size);
    mutated[rx][ry] = !mutated[rx][ry];

    // Ensure we don't end up with a completely empty grid
    bool isEmpty = true;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (mutated[r][c]) {
          isEmpty = false;
          break;
        }
      }
    }
    if (isEmpty) {
      mutated[rx][ry] = true;
    }

    return mutated;
  }

  OrthoLevel generateLevel() {
    final grid3D = _generateRandom3DGrid();
    
    // Choose one target perspective view randomly
    final targetView = PerspectiveType.values[_random.nextInt(PerspectiveType.values.length)];

    // Calculate all projections
    final topProj = projectPerspective(grid3D, PerspectiveType.top);
    final frontProj = projectPerspective(grid3D, PerspectiveType.front);
    final sideProj = projectPerspective(grid3D, PerspectiveType.side);

    // The correct projected silhouette
    final correctSilhouette = projectPerspective(grid3D, targetView);

    // Get another correct perspective projection as Distractor 1 (Excellent cognitive distraction!)
    List<List<bool>> distractor1;
    if (targetView == PerspectiveType.front) {
      distractor1 = topProj;
    } else if (targetView == PerspectiveType.top) {
      distractor1 = sideProj;
    } else {
      distractor1 = frontProj;
    }

    // If distractor1 happens to be identical to correct projection, generate a mutated one
    if (_gridsEqual(distractor1, correctSilhouette)) {
      distractor1 = _mutateGrid(correctSilhouette);
    }

    // Generate a mutated version of correct as Distractor 2
    List<List<bool>> distractor2 = _mutateGrid(correctSilhouette);
    while (_gridsEqual(distractor2, correctSilhouette) || _gridsEqual(distractor2, distractor1)) {
      distractor2 = _mutateGrid(distractor2);
    }

    // Package options and shuffle
    final List<List<List<bool>>> options = [
      correctSilhouette,
      distractor1,
      distractor2,
    ]..shuffle(_random);

    final correctIndex = options.indexWhere((opt) => _gridsEqual(opt, correctSilhouette));

    return OrthoLevel(
      grid3D: grid3D,
      targetView: targetView,
      options: options,
      correctOptionIndex: correctIndex,
    );
  }

  bool _gridsEqual(List<List<bool>> a, List<List<bool>> b) {
    for (int r = 0; r < a.length; r++) {
      for (int c = 0; c < a[r].length; c++) {
        if (a[r][c] != b[r][c]) return false;
      }
    }
    return true;
  }
}
