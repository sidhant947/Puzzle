import 'dart:math';

class DualMirrorLevel {
  final List<List<bool>> maze1;
  final List<List<bool>> maze2;
  final Point<int> start1;
  final Point<int> start2;
  final Point<int> target1;
  final Point<int> target2;

  DualMirrorLevel({
    required this.maze1,
    required this.maze2,
    required this.start1,
    required this.start2,
    required this.target1,
    required this.target2,
  });
}
class DualMirrorEngine {
  final Random _random = Random();

  DualMirrorLevel generateLevel() {
    const size = 5;
    while (true) {
      final maze1 = List.generate(size, (_) => List.generate(size, (_) => false));
      final maze2 = List.generate(size, (_) => List.generate(size, (_) => false));

      // Add random obstacles (20% density)
      for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
          if (_random.nextDouble() < 0.2) {
            maze1[i][j] = true;
          }
          if (_random.nextDouble() < 0.2) {
            maze2[i][j] = true;
          }
        }
      }

      // Ensure start and target are not blocked
      final start1 = Point(_random.nextInt(2), _random.nextInt(2));
      final target1 = Point(size - 1 - _random.nextInt(2), size - 1 - _random.nextInt(2));

      final start2 = Point(_random.nextInt(2), _random.nextInt(2));
      final target2 = Point(size - 1 - _random.nextInt(2), size - 1 - _random.nextInt(2));

      maze1[start1.y][start1.x] = false;
      maze1[target1.y][target1.x] = false;
      maze2[start2.y][start2.x] = false;
      maze2[target2.y][target2.x] = false;

      if (_isReachable(start1, target1, maze1) && _isReachable(start2, target2, maze2)) {
        return DualMirrorLevel(
          maze1: maze1,
          maze2: maze2,
          start1: start1,
          start2: start2,
          target1: target1,
          target2: target2,
        );
      }
    }
  }

  bool _isReachable(Point<int> start, Point<int> target, List<List<bool>> maze) {
    final size = maze.length;
    final queue = <Point<int>>[start];
    final visited = <Point<int>>{start};

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      if (current == target) return true;

      for (final dir in [const Point(0, 1), const Point(0, -1), const Point(1, 0), const Point(-1, 0)]) {
        final next = Point(current.x + dir.x, current.y + dir.y);
        if (next.x >= 0 && next.x < size && next.y >= 0 && next.y < size &&
            !maze[next.y][next.x] && !visited.contains(next)) {
          visited.add(next);
          queue.add(next);
        }
      }
    }
    return false;
  }
  Point<int> move(Point<int> current, String direction, List<List<bool>> maze, bool isMirrored) {
    int dx = 0, dy = 0;
    switch (direction) {
      case 'UP': dy = -1; break;
      case 'DOWN': dy = 1; break;
      case 'LEFT': dx = -1; break;
      case 'RIGHT': dx = 1; break;
    }

    if (isMirrored) {
      dx = -dx;
      dy = -dy;
    }

    int nx = current.x + dx;
    int ny = current.y + dy;

    if (nx >= 0 && nx < maze.length && ny >= 0 && ny < maze.length && !maze[ny][nx]) {
      return Point(nx, ny);
    }
    return current;
  }
}
