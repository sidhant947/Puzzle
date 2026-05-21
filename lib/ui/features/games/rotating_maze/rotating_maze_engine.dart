import 'dart:math';

class RotatingMazeLevel {
  final List<List<int>> grid; // 0: empty, 1: wall
  final int size;
  final int startR;
  final int startC;
  final int exitR;
  final int exitC;
  
  RotatingMazeLevel({
    required this.grid,
    required this.size,
    required this.startR,
    required this.startC,
    required this.exitR,
    required this.exitC,
  });
}

class RotatingMazeEngine {
  final Random _random = Random();

  RotatingMazeLevel generateLevel() {
    const size = 6;
    final grid = List.generate(size, (_) => List.filled(size, 1));
    final visited = List.generate(size, (_) => List.filled(size, false));
    
    void carve(int r, int c) {
      visited[r][c] = true;
      grid[r][c] = 0;
      
      final dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]];
      dirs.shuffle(_random);
      
      for (final d in dirs) {
        final nr = r + d[0];
        final nc = c + d[1];
        
        if (nr >= 0 && nr < size && nc >= 0 && nc < size && !visited[nr][nc]) {
          // Count visited neighbors to maintain maze structure
          int visitedNeighbors = 0;
          for (final d2 in dirs) {
            final checkR = nr + d2[0];
            final checkC = nc + d2[1];
            if (checkR >= 0 && checkR < size && checkC >= 0 && checkC < size && visited[checkR][checkC]) {
              visitedNeighbors++;
            }
          }
          
          if (visitedNeighbors <= 1 || (_random.nextDouble() < 0.2)) {
            carve(nr, nc);
          }
        }
      }
    }

    carve(0, 0);

    // Ensure start and end are open
    grid[0][0] = 0;
    grid[size - 1][size - 1] = 0;
    
    // Ensure exit is reachable by clearing at least one neighbor
    if (grid[size - 2][size - 1] == 1 && grid[size - 1][size - 2] == 1) {
      if (_random.nextBool()) {
        grid[size - 2][size - 1] = 0;
      } else {
        grid[size - 1][size - 2] = 0;
      }
    }

    return RotatingMazeLevel(
      grid: grid,
      size: size,
      startR: 0,
      startC: 0,
      exitR: size - 1,
      exitC: size - 1,
    );
  }

  // Rotates a grid and a coordinate 90 degrees clockwise
  Map<String, dynamic> rotate90Clockwise(List<List<int>> grid, int marbleR, int marbleC, int exitR, int exitC) {
    final n = grid.length;
    final newGrid = List.generate(n, (_) => List.filled(n, 0));
    
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        newGrid[c][n - 1 - r] = grid[r][c];
      }
    }

    final newMarbleR = marbleC;
    final newMarbleC = n - 1 - marbleR;

    final newExitR = exitC;
    final newExitC = n - 1 - exitR;

    return {
      'grid': newGrid,
      'marbleR': newMarbleR,
      'marbleC': newMarbleC,
      'exitR': newExitR,
      'exitC': newExitC,
    };
  }

  // Rotates a grid and a coordinate 180 degrees
  Map<String, dynamic> rotate180(List<List<int>> grid, int marbleR, int marbleC, int exitR, int exitC) {
    final n = grid.length;
    final newGrid = List.generate(n, (_) => List.filled(n, 0));
    
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        newGrid[n - 1 - r][n - 1 - c] = grid[r][c];
      }
    }

    final newMarbleR = n - 1 - marbleR;
    final newMarbleC = n - 1 - marbleC;

    final newExitR = n - 1 - exitR;
    final newExitC = n - 1 - exitC;

    return {
      'grid': newGrid,
      'marbleR': newMarbleR,
      'marbleC': newMarbleC,
      'exitR': newExitR,
      'exitC': newExitC,
    };
  }
}
