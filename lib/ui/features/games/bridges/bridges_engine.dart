import 'dart:math';

class BridgesIsland {
  final int x;
  final int y;
  final int count;
  final int id;

  BridgesIsland({required this.x, required this.y, required this.count, required this.id});
}

class BridgesConnection {
  final int island1Id;
  final int island2Id;
  final int count; // 1 or 2

  BridgesConnection({required this.island1Id, required this.island2Id, required this.count});
}

class BridgesBoard {
  final int size;
  final List<BridgesIsland> islands;
  final List<BridgesConnection> solution;

  BridgesBoard({required this.size, required this.islands, required this.solution});
}

class BridgesEngine {
  final Random _random = Random();

  BridgesBoard generateBoard({int size = 7}) {
    while (true) {
      List<BridgesConnection> solution = [];
      
      // 1. Place random islands
      List<List<int>> grid = List.generate(size, (_) => List.filled(size, -1));
      int islandId = 0;
      for (int i = 0; i < 8 + _random.nextInt(4); i++) {
        int r = _random.nextInt(size);
        int c = _random.nextInt(size);
        if (grid[r][c] == -1 && !_isAdjacentToIsland(c, r, grid, size)) {
          grid[r][c] = islandId++;
        }
      }

      // 2. Try to connect them
      List<int> islandBridges = List.filled(islandId, 0);
      List<Point<int>> pos = [];
      for (int r = 0; r < size; r++) {
        for (int c = 0; c < size; c++) {
          if (grid[r][c] != -1) pos.add(Point(c, r));
        }
      }

      // Connect islands greedily
      for (int i = 0; i < pos.length; i++) {
        for (int j = i + 1; j < pos.length; j++) {
          if (pos[i].x == pos[j].x || pos[i].y == pos[j].y) {
            if (_canConnect(pos[i], pos[j], grid, solution)) {
              if (_random.nextDouble() < 0.3) {
                int count = _random.nextBool() ? 1 : 2;
                int id1 = grid[pos[i].y][pos[i].x];
                int id2 = grid[pos[j].y][pos[j].x];
                solution.add(BridgesConnection(island1Id: id1, island2Id: id2, count: count));
                islandBridges[id1] += count;
                islandBridges[id2] += count;
              }
            }
          }
        }
      }

      // 3. Finalize islands
      List<BridgesIsland> finalIslands = [];
      for (int i = 0; i < pos.length; i++) {
        int id = grid[pos[i].y][pos[i].x];
        if (islandBridges[id] > 0) {
          finalIslands.add(BridgesIsland(x: pos[i].x, y: pos[i].y, count: islandBridges[id], id: id));
        }
      }

      // 4. Check connectivity
      if (finalIslands.length >= 6 && _isConnected(finalIslands, solution)) {
        return BridgesBoard(size: size, islands: finalIslands, solution: solution);
      }
    }
  }

  bool _isAdjacentToIsland(int x, int y, List<List<int>> grid, int size) {
    for (var d in [Point(0, 1), Point(0, -1), Point(1, 0), Point(-1, 0)]) {
      int nx = x + d.x;
      int ny = y + d.y;
      if (nx >= 0 && nx < size && ny >= 0 && ny < size && grid[ny][nx] != -1) return true;
    }
    return false;
  }

  bool _canConnect(Point<int> p1, Point<int> p2, List<List<int>> grid, List<BridgesConnection> current) {
    // Check if path is clear of other islands
    int x1 = min(p1.x, p2.x), x2 = max(p1.x, p2.x);
    int y1 = min(p1.y, p2.y), y2 = max(p1.y, p2.y);

    if (p1.y == p2.y) {
      for (int c = x1 + 1; c < x2; c++) {
        if (grid[p1.y][c] != -1) return false;
      }
    } else {
      for (int r = y1 + 1; r < y2; r++) {
        if (grid[r][p1.x] != -1) return false;
      }
    }
    return true;
  }

  bool _isConnected(List<BridgesIsland> islands, List<BridgesConnection> solution) {
    if (islands.isEmpty) return false;
    Set<int> visited = {islands[0].id};
    List<int> queue = [islands[0].id];

    while (queue.isNotEmpty) {
      int id = queue.removeAt(0);
      for (var conn in solution) {
        int other = -1;
        if (conn.island1Id == id) {
          other = conn.island2Id;
        } else if (conn.island2Id == id) {
          other = conn.island1Id;
        }
        
        if (other != -1 && !visited.contains(other)) {
          visited.add(other);
          queue.add(other);
        }
      }
    }
    return visited.length == islands.length;
  }

  bool isSolved(BridgesBoard board, List<BridgesConnection> connections) {
    // 1. Check each island's bridge count
    for (var island in board.islands) {
      int count = 0;
      for (var conn in connections) {
        if (conn.island1Id == island.id || conn.island2Id == island.id) {
          count += conn.count;
        }
      }
      if (count != island.count) return false;
    }

    // 2. Check connectivity
    return _isConnected(board.islands, connections);
  }
}
