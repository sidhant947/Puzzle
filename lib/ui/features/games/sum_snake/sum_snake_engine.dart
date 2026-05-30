import 'dart:math';

class SumSnakeEngine {
  final Random _random = Random();
  static const int gridSize = 4;

  List<List<int>> generateGrid() {
    return List.generate(
      gridSize,
      (_) => List.generate(gridSize, (_) => _random.nextInt(9) + 1),
    );
  }

  Map<String, dynamic> generateLevel() {
    final grid = generateGrid();
    
    // Find a random path of length 3-5 to set as target
    int startX = _random.nextInt(gridSize);
    int startY = _random.nextInt(gridSize);
    
    List<Point<int>> path = [Point(startX, startY)];
    int targetSum = grid[startY][startX];
    
    int pathLength = _random.nextInt(3) + 3; // 3 to 5 cells
    
    for (int i = 0; i < pathLength - 1; i++) {
      final current = path.last;
      final neighbors = _getNeighbors(current, path);
      if (neighbors.isEmpty) break;
      
      final next = neighbors[_random.nextInt(neighbors.length)];
      path.add(next);
      targetSum += grid[next.y][next.x];
    }

    return {
      'grid': grid,
      'targetSum': targetSum,
    };
  }

  List<Point<int>> _getNeighbors(Point<int> p, List<Point<int>> currentPath) {
    final List<Point<int>> neighbors = [];
    final directions = [
      const Point(0, 1),
      const Point(0, -1),
      const Point(1, 0),
      const Point(-1, 0),
    ];

    for (final d in directions) {
      final next = Point(p.x + d.x, p.y + d.y);
      if (next.x >= 0 && next.x < gridSize && next.y >= 0 && next.y < gridSize) {
        if (!currentPath.contains(next)) {
          neighbors.add(next);
        }
      }
    }
    return neighbors;
  }
}
