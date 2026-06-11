import 'dart:math';

class PathIntersectEngine {
  final int gridSize;

  PathIntersectEngine({this.gridSize = 8});

  Map<String, dynamic> generateLevel() {
    final random = Random();
    
    // Choose intersection point
    int interX = 2 + random.nextInt(gridSize - 4);
    int interY = 2 + random.nextInt(gridSize - 4);
    Point<int> intersection = Point(interX, interY);

    // Generate Path 1 (Horizontal-ish)
    List<Point<int>> path1 = _generatePath(Point(0, random.nextInt(gridSize)), intersection, Point(gridSize - 1, random.nextInt(gridSize)));
    
    // Generate Path 2 (Vertical-ish)
    List<Point<int>> path2 = _generatePath(Point(random.nextInt(gridSize), 0), intersection, Point(random.nextInt(gridSize), gridSize - 1));

    // Ensure they don't overlap too much
    // For simplicity, we just need them to cross.

    return {
      'path1': path1,
      'path2': path2,
      'intersection': intersection,
      'gridSize': gridSize,
    };
  }

  List<Point<int>> _generatePath(Point<int> start, Point<int> mid, Point<int> end) {
    List<Point<int>> path = [];
    
    // Simple path: start -> mid -> end
    // To make it look like a "path", we can add some random steps but must pass through mid.
    
    path.addAll(_getPointsBetween(start, mid));
    path.addAll(_getPointsBetween(mid, end).skip(1));
    
    return path;
  }

  List<Point<int>> _getPointsBetween(Point<int> p1, Point<int> p2) {
    List<Point<int>> points = [];
    int x = p1.x;
    int y = p1.y;
    points.add(Point(x, y));
    
    while (x != p2.x || y != p2.y) {
      if (x != p2.x && y != p2.y) {
        if (Random().nextBool()) {
          x += (p2.x > x) ? 1 : -1;
        } else {
          y += (p2.y > y) ? 1 : -1;
        }
      } else if (x != p2.x) {
        x += (p2.x > x) ? 1 : -1;
      } else {
        y += (p2.y > y) ? 1 : -1;
      }
      points.add(Point(x, y));
    }
    return points;
  }

  static Map<String, dynamic> generateLevelWrapper(int size) {
    return PathIntersectEngine(gridSize: size).generateLevel();
  }
}
