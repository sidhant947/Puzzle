import 'dart:math';

class PathRecallEngine {
  final Random _random = Random();

  /// Generates a random path of specific length on a grid.
  List<int> generatePath(int length, int gridSize) {
    List<int> path = [];
    int current = _random.nextInt(gridSize * gridSize);
    path.add(current);

    while (path.length < length) {
      List<int> neighbors = _getNeighbors(current, gridSize);
      neighbors.removeWhere((n) => path.contains(n)); // Optional: allow cross?
      
      if (neighbors.isEmpty) {
        // Backtrack or restart if stuck
        return generatePath(length, gridSize);
      }
      
      current = neighbors[_random.nextInt(neighbors.length)];
      path.add(current);
    }

    return path;
  }

  List<int> _getNeighbors(int index, int size) {
    List<int> neighbors = [];
    int r = index ~/ size;
    int c = index % size;

    if (r > 0) neighbors.add((r - 1) * size + c);
    if (r < size - 1) neighbors.add((r + 1) * size + c);
    if (c > 0) neighbors.add(r * size + (c - 1));
    if (c < size - 1) neighbors.add(r * size + (c + 1));

    return neighbors;
  }
}
