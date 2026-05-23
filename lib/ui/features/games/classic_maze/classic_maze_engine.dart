import 'dart:math';

class ClassicMazeLevel {
  final List<List<int>> grid; // 0: path, 1: wall
  final int size;
  final int startR;
  final int startC;
  final int exitR;
  final int exitC;

  ClassicMazeLevel({
    required this.grid,
    required this.size,
    required this.startR,
    required this.startC,
    required this.exitR,
    required this.exitC,
  });
}

class ClassicMazeEngine {
  final Random _random = Random();

  ClassicMazeLevel generateLevel(int size) {
    // Ensure size is odd to have clean corridors and walls
    if (size % 2 == 0) {
      size++;
    }

    final grid = List.generate(size, (_) => List.filled(size, 1));
    final visited = List.generate(size, (_) => List.filled(size, false));

    // Carve the maze using DFS Backtracking
    final List<List<int>> stack = [];
    int curR = 1;
    int curC = 1;
    grid[curR][curC] = 0;
    visited[curR][curC] = true;

    while (true) {
      final neighbors = <List<int>>[];
      
      // Neighbors are 2 steps away
      final dirs = [
        [-2, 0], // Up
        [2, 0],  // Down
        [0, -2], // Left
        [0, 2],  // Right
      ];

      for (final d in dirs) {
        final nr = curR + d[0];
        final nc = curC + d[1];
        if (nr > 0 && nr < size - 1 && nc > 0 && nc < size - 1 && !visited[nr][nc]) {
          neighbors.add([nr, nc]);
        }
      }

      if (neighbors.isNotEmpty) {
        // Choose a random neighbor
        final next = neighbors[_random.nextInt(neighbors.length)];
        final nr = next[0];
        final nc = next[1];

        // Carve the cell in between and the neighbor
        final wallR = curR + (nr - curR) ~/ 2;
        final wallC = curC + (nc - curC) ~/ 2;
        grid[wallR][wallC] = 0;
        grid[nr][nc] = 0;

        visited[nr][nc] = true;
        stack.add([curR, curC]);

        curR = nr;
        curC = nc;
      } else if (stack.isNotEmpty) {
        // Backtrack
        final prev = stack.removeLast();
        curR = prev[0];
        curC = prev[1];
      } else {
        break;
      }
    }

    // Set standard start and exit points
    const startR = 1;
    const startC = 1;
    final exitR = size - 2;
    final exitC = size - 2;

    grid[startR][startC] = 0;
    grid[exitR][exitC] = 0;

    return ClassicMazeLevel(
      grid: grid,
      size: size,
      startR: startR,
      startC: startC,
      exitR: exitR,
      exitC: exitC,
    );
  }
}
