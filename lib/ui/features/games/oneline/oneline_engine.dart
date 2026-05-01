import 'dart:math';

class OnelineEngine {
  final int size = 4;

  List<Point<int>> generateLevel() {
    // For a 4x4 grid, find a Hamiltonian path
    // Simple approach for 4x4: predefined paths or random walk with backtracking
    // Let's use a predefined path for now to ensure it's solvable
    final List<Point<int>> path = [
      const Point(0, 0), const Point(1, 0), const Point(2, 0), const Point(3, 0),
      const Point(3, 1), const Point(2, 1), const Point(1, 1), const Point(0, 1),
      const Point(0, 2), const Point(1, 2), const Point(2, 2), const Point(3, 2),
      const Point(3, 3), const Point(2, 3), const Point(1, 3), const Point(0, 3),
    ];
    
    // Randomly shuffle/rotate the path for variety? 
    // For a prototype, this works.
    return path;
  }

  bool isComplete(List<Point<int>> currentPath, int totalDots) {
    return currentPath.length == totalDots;
  }
}
