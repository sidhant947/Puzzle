import 'dart:math';

enum MirrorType {
  none,
  forwardSlash, // /
  backSlash,    // \
}

enum Direction {
  up,
  down,
  left,
  right,
}

class LaserLinkEngine {
  final int size;
  final Random _random = Random();

  LaserLinkEngine({this.size = 5});

  Map<String, dynamic> generateLevel() {
    // 1. Randomly place a laser source on the edge
    final sourcePos = _getRandomEdgePos();
    final sourceDir = _getInwardDirection(sourcePos);

    // 2. Generate a path with some mirrors
    List<Point<int>> mirrorsPos = [];
    List<MirrorType> mirrorsType = [];
    List<Point<int>> targets = [];

    Point<int> currentPos = sourcePos;
    Direction currentDir = sourceDir;
    Set<Point<int>> path = {currentPos};

    int mirrorCount = 3 + _random.nextInt(3);
    
    for (int i = 0; i < 20 && mirrorsPos.length < mirrorCount; i++) {
      // Move in current direction
      Point<int> nextPos = _move(currentPos, currentDir);
      
      if (!_isInBounds(nextPos)) {
        // If we hit the edge, place a target if we have enough mirrors, or try again
        if (mirrorsPos.length >= mirrorCount - 1 && !targets.contains(currentPos)) {
          targets.add(currentPos);
          break;
        } else {
          // Re-generate if too short
          return generateLevel();
        }
      }

      currentPos = nextPos;
      path.add(currentPos);

      // Randomly decide to place a mirror
      if (_random.nextDouble() < 0.3 && !mirrorsPos.contains(currentPos)) {
        MirrorType type = _random.nextBool() ? MirrorType.forwardSlash : MirrorType.backSlash;
        mirrorsPos.add(currentPos);
        mirrorsType.add(type);
        currentDir = _reflect(currentDir, type);
      }
    }

    if (targets.isEmpty) {
        targets.add(currentPos);
    }

    // Level description:
    // sourcePos, sourceDir
    // targets: where the laser MUST reach
    // mirrors: initial mirrors (some might be fixed, but for now let's say user places them)
    // The challenge is to place mirrors to hit all targets.
    // Let's simplify: we provide some mirrors that the user can ROTATE or MOVE.
    // Easier: User clicks empty cells to cycle through mirror types.

    return {
      'size': size,
      'sourcePos': sourcePos,
      'sourceDir': sourceDir,
      'targets': targets,
      'solutionMirrors': Map.fromIterables(mirrorsPos, mirrorsType),
    };
  }

  Point<int> _getRandomEdgePos() {
    int edge = _random.nextInt(4);
    int pos = _random.nextInt(size);
    switch (edge) {
      case 0: return Point(pos, 0); // Top
      case 1: return Point(pos, size - 1); // Bottom
      case 2: return Point(0, pos); // Left
      case 3: return Point(size - 1, pos); // Right
      default: return Point(0, 0);
    }
  }

  Direction _getInwardDirection(Point<int> pos) {
    if (pos.y == 0) return Direction.down;
    if (pos.y == size - 1) return Direction.up;
    if (pos.x == 0) return Direction.right;
    if (pos.x == size - 1) return Direction.left;
    return Direction.down;
  }

  Point<int> _move(Point<int> pos, Direction dir) {
    switch (dir) {
      case Direction.up: return Point(pos.x, pos.y - 1);
      case Direction.down: return Point(pos.x, pos.y + 1);
      case Direction.left: return Point(pos.x - 1, pos.y);
      case Direction.right: return Point(pos.x + 1, pos.y);
    }
  }

  Direction _reflect(Direction dir, MirrorType type) {
    if (type == MirrorType.forwardSlash) { // /
      switch (dir) {
        case Direction.up: return Direction.right;
        case Direction.down: return Direction.left;
        case Direction.left: return Direction.down;
        case Direction.right: return Direction.up;
      }
    } else if (type == MirrorType.backSlash) { // \
      switch (dir) {
        case Direction.up: return Direction.left;
        case Direction.down: return Direction.right;
        case Direction.left: return Direction.up;
        case Direction.right: return Direction.down;
      }
    }
    return dir;
  }

  bool _isInBounds(Point<int> pos) {
    return pos.x >= 0 && pos.x < size && pos.y >= 0 && pos.y < size;
  }

  List<Point<int>> tracePath(Point<int> sourcePos, Direction sourceDir, Map<Point<int>, MirrorType> mirrors) {
    List<Point<int>> path = [sourcePos];
    Point<int> currentPos = sourcePos;
    Direction currentDir = sourceDir;

    for (int i = 0; i < 100; i++) {
      if (mirrors.containsKey(currentPos)) {
        currentDir = _reflect(currentDir, mirrors[currentPos]!);
      }

      Point<int> nextPos = _move(currentPos, currentDir);
      if (!_isInBounds(nextPos)) break;

      currentPos = nextPos;
      path.add(currentPos);
      
      // Prevent infinite loops if we hit the same pos with same dir
      if (path.length > size * size * 2) break;
    }

    return path;
  }

  static Map<String, dynamic> generateLevelWrapper(int size) {
    return LaserLinkEngine(size: size).generateLevel();
  }
}
