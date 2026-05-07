import 'dart:math';

class MathPathLevel {
  final int size;
  final List<List<int>> grid;
  final int targetSum;
  final List<Point<int>> solutionPath;

  MathPathLevel({
    required this.size,
    required this.grid,
    required this.targetSum,
    required this.solutionPath,
  });
}

class MathPathEngine {
  final Random _random = Random();

  MathPathLevel generateLevel({int size = 5}) {
    List<List<int>> grid = List.generate(size, (_) => List.generate(size, (_) => _random.nextInt(9) + 1));
    
    // Generate a random path from top-left to bottom-right
    List<Point<int>> path = [const Point(0, 0)];
    Point<int> current = const Point(0, 0);
    
    while (current.x < size - 1 || current.y < size - 1) {
      bool moveRight = _random.nextBool();
      if (current.x == size - 1) {
        moveRight = false;
      } else if (current.y == size - 1) {
        moveRight = true;
      }
      
      if (moveRight) {
        current = Point(current.x + 1, current.y);
      } else {
        current = Point(current.x, current.y + 1);
      }
      path.add(current);
    }
    
    int targetSum = 0;
    for (var p in path) {
      targetSum += grid[p.y][p.x];
    }
    
    return MathPathLevel(
      size: size,
      grid: grid,
      targetSum: targetSum,
      solutionPath: path,
    );
  }
}
