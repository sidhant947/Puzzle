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
    // Basic moves (0 rotation)
    // North: [-1, 0]
    // East: [0, 1]
    // South: [1, 0]
    // West: [0, -1]
    
    int index = 0;
    switch (direction) {
      case CompassDirection.north: index = 0; break;
      case CompassDirection.east: index = 1; break;
      case CompassDirection.south: index = 2; break;
      case CompassDirection.west: index = 3; break;
    }
    
    // Add rotation
    // 90 deg clockwise: N->E, E->S, S->W, W->N
    // We want the INVERSE: If screen says "North" and it's rotated 90, 
    // it actually means move in the direction that was North before rotation?
    // User sees North button. If rotation is 90 deg clockwise, North is now East.
    // So North button should move the player North in the VISUAL representation.
    // But the grid is fixed. If the VIEW is rotated 90 deg clockwise, 
    // North button (UP) should move player in the direction that is currently "UP".
    
    // Let's keep it simple: The BUTTONS North/South/East/West are relative to the WORLD.
    // But the COMPASS/MAZE might be rotated.
    // If the Maze is rotated 90 deg clockwise, "North" on the grid is now "East" visually.
    
    // Actually, the prompt says "A simple maze where you move using North, South, East, West buttons."
    // "Challenge: The maze rotates or the player's orientation changes."
    
    // Let's say: 
    // 0 rotation: North = [-1, 0], East = [0, 1], South = [1, 0], West = [0, -1]
    // 90 clockwise: North = [0, -1], East = [-1, 0], South = [0, 1], West = [1, 0]
    // (Essentially rotating the vector counter-clockwise?)
    
    final baseMoves = [[-1, 0], [0, 1], [1, 0], [0, -1]];
    int rotationOffset = (rotation ~/ 90);
    int moveIndex = (index - rotationOffset) % 4;
    if (moveIndex < 0) moveIndex += 4;
    
    return baseMoves[moveIndex];
  }
}
