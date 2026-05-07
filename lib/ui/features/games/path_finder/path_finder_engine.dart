import 'dart:math';

class PathFinderEngine {
  final int size = 5;
  final Random _random = Random();

  List<Point<int>> generateLevel() {
    // Generate a valid continuous path
    while (true) {
      final path = _generateRandomPath();
      // Require a minimum path length for challenge
      if (path.length >= 10) return path;
    }
  }

  List<Point<int>> _generateRandomPath() {
    Point<int> current = Point(_random.nextInt(size), _random.nextInt(size));
    List<Point<int>> path = [current];
    Set<Point<int>> visited = {current};

    while (true) {
      List<Point<int>> neighbors = _getNeighbors(current)
          .where((p) => !visited.contains(p))
          .toList();
      
      if (neighbors.isEmpty) break;

      // Move to a random unvisited neighbor
      current = neighbors[_random.nextInt(neighbors.length)];
      path.add(current);
      visited.add(current);
    }
    return path;
  }

  List<Point<int>> _getNeighbors(Point<int> p) {
    List<Point<int>> neighbors = [];
    if (p.x > 0) neighbors.add(Point(p.x - 1, p.y));
    if (p.x < size - 1) neighbors.add(Point(p.x + 1, p.y));
    if (p.y > 0) neighbors.add(Point(p.x, p.y - 1));
    if (p.y < size - 1) neighbors.add(Point(p.x, p.y + 1));
    return neighbors;
  }

  bool isLevelComplete(List<Point<int>> path, List<Point<int>> requiredNodes) {
    if (path.length != requiredNodes.length) return false;
    for (int i = 0; i < path.length; i++) {
      if (path[i] != requiredNodes[i]) return false;
    }
    return true;
  }
}
