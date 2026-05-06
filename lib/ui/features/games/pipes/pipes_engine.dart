import 'dart:math';

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => '($x, $y)';
}

class PipesLevel {
  final int size;
  final List<List<Point>> pairs;

  const PipesLevel({required this.size, required this.pairs});
}

class PipesEngine {
  static const int boardSize = 4;
  static const int numColors = 4;
  final Random _random = Random();

  /// Generates a random solvable 4x4 puzzle using a path-growth algorithm.
  PipesLevel generateRandomLevel() {
    while (true) {
      final level = _tryGenerate();
      if (level != null) return level;
    }
  }

  PipesLevel? _tryGenerate() {
    // 1. Initialize grid with -1 (empty)
    List<List<int>> grid = List.generate(boardSize, (_) => List.filled(boardSize, -1));
    
    // 2. Pick 4 random distinct starting points
    List<Point> starts = [];
    while (starts.length < numColors) {
      Point p = Point(_random.nextInt(boardSize), _random.nextInt(boardSize));
      if (!starts.contains(p)) {
        starts.add(p);
        grid[p.y][p.x] = starts.length - 1;
      }
    }

    // 3. Maintain the "tip" of each path
    List<Point> tips = List.from(starts);
    List<bool> finished = List.filled(numColors, false);
    
    // Track cells for each color to extract endpoints later
    List<List<Point>> pathCells = List.generate(numColors, (i) => [starts[i]]);

    // 4. Randomly grow paths until the grid is full
    int attempts = 0;
    while (finished.contains(false) && attempts < 100) {
      attempts++;
      int colorIdx = _random.nextInt(numColors);
      if (finished[colorIdx]) continue;

      Point tip = tips[colorIdx];
      List<Point> neighbors = _getEmptyNeighbors(tip, grid);

      if (neighbors.isEmpty) {
        finished[colorIdx] = true;
        continue;
      }

      // Pick a random neighbor and grow
      Point next = neighbors[_random.nextInt(neighbors.length)];
      grid[next.y][next.x] = colorIdx;
      tips[colorIdx] = next;
      pathCells[colorIdx].add(next);
    }

    // 5. Validation: Is the grid full?
    bool full = true;
    for (var row in grid) {
      if (row.contains(-1)) {
        full = false;
        break;
      }
    }

    if (!full) return null;

    // 6. Validation: Every path must have at least 2 cells
    for (var path in pathCells) {
      if (path.length < 2) return null;
    }

    // 7. Success! Extract pairs (start and final tip)
    List<List<Point>> pairs = [];
    for (int i = 0; i < numColors; i++) {
      pairs.add([pathCells[i].first, pathCells[i].last]);
    }

    return PipesLevel(size: boardSize, pairs: pairs);
  }

  List<Point> _getEmptyNeighbors(Point p, List<List<int>> grid) {
    List<Point> neighbors = [];
    final dx = [0, 0, 1, -1];
    final dy = [1, -1, 0, 0];

    for (int i = 0; i < 4; i++) {
      int nx = p.x + dx[i];
      int ny = p.y + dy[i];

      if (nx >= 0 && nx < boardSize && ny >= 0 && ny < boardSize) {
        if (grid[ny][nx] == -1) {
          neighbors.add(Point(nx, ny));
        }
      }
    }
    return neighbors;
  }

  bool isSolved(int size, List<List<Point>> pairs, List<List<Point>> paths) {
    if (paths.length != pairs.length) return false;

    for (int i = 0; i < pairs.length; i++) {
      final pair = pairs[i];
      final path = paths[i];
      if (path.isEmpty) return false;
      
      bool connected = (path.first == pair[0] && path.last == pair[1]) ||
                       (path.first == pair[1] && path.last == pair[0]);
      if (!connected) return false;

      // Validate path continuity
      for (int j = 0; j < path.length - 1; j++) {
        final p1 = path[j];
        final p2 = path[j+1];
        if ((p1.x - p2.x).abs() + (p1.y - p2.y).abs() != 1) return false;
      }
    }

    // Validate coverage
    Set<Point> allPointsInPaths = {};
    for (var path in paths) {
      for (var p in path) {
        if (p.x < 0 || p.x >= size || p.y < 0 || p.y >= size) return false;
        allPointsInPaths.add(p);
      }
    }

    return allPointsInPaths.length == size * size;
  }
}
