import 'dart:math';

enum CompassDirection { north, east, south, west }

class CompassMazeLevel {
  final List<List<int>> grid; // 0: path, 1: wall
  final int size;
  final int startR;
  final int startC;
  final int exitR;
  final int exitC;
  final int orientationRotation; // 0, 90, 180, 270 degrees clockwise

  CompassMazeLevel({
    required this.grid,
    required this.size,
    required this.startR,
    required this.startC,
    required this.exitR,
    required this.exitC,
    required this.orientationRotation,
  });
}

class CompassMazeEngine {
  final Random _random = Random();

  CompassMazeLevel generateLevel() {
    const size = 7;
    final grid = List.generate(size, (_) => List.filled(size, 1));
    
    // Simple maze generation (DFS)
    final visited = List.generate(size, (_) => List.filled(size, false));
    final List<List<int>> stack = [];
    
    int currR = 0;
    int currC = 0;
    visited[currR][currC] = true;
    grid[currR][currC] = 0;
    stack.add([currR, currC]);
    
    while (stack.isNotEmpty) {
      final curr = stack.last;
      final r = curr[0];
      final c = curr[1];
      
      final neighbors = <List<int>>[];
      final dirs = [[0, 2], [0, -2], [2, 0], [-2, 0]];
      
      for (final d in dirs) {
        final nr = r + d[0];
        final nc = c + d[1];
        if (nr >= 0 && nr < size && nc >= 0 && nc < size && !visited[nr][nc]) {
          neighbors.add([nr, nc]);
        }
      }
      
      if (neighbors.isNotEmpty) {
        final next = neighbors[_random.nextInt(neighbors.length)];
        final nr = next[0];
        final nc = next[1];
        
        // Remove wall between
        grid[(r + nr) ~/ 2][(c + nc) ~/ 2] = 0;
        grid[nr][nc] = 0;
        visited[nr][nc] = true;
        stack.add([nr, nc]);
      } else {
        stack.removeLast();
      }
    }

    // Ensure start and exit are reachable
    const startR = 0;
    const startC = 0;
    const exitR = size - 1;
    const exitC = size - 1;
    grid[startR][startC] = 0;
    grid[exitR][exitC] = 0;
    
    // Random orientation rotation (0, 90, 180, 270)
    final rotation = _random.nextInt(4) * 90;

    return CompassMazeLevel(
      grid: grid,
      size: size,
      startR: startR,
      startC: startC,
      exitR: exitR,
      exitC: exitC,
      orientationRotation: rotation,
    );
  }

  // Translates a compass direction to a grid move based on current rotation
  List<int> getMove(CompassDirection direction, int rotation) {
    switch (direction) {
      case CompassDirection.north: return [-1, 0];
      case CompassDirection.east: return [0, 1];
      case CompassDirection.south: return [1, 0];
      case CompassDirection.west: return [0, -1];
    }
  }
}
