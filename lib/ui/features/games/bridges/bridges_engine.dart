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
    int attempts = 0;
    while (attempts < 100) {
      attempts++;
      final board = _tryGenerate(size);
      if (board != null) {
        // Optional: Check for unique solution here if desired, 
        // but growth algorithm usually produces good puzzles.
        return board;
      }
    }
    // Final fallback to a very simple known level
    return _fallbackLevel();
  }

  BridgesBoard? _tryGenerate(int size) {
    List<BridgesIsland> islands = [];
    List<BridgesConnection> solution = [];
    List<List<int>> grid = List.generate(size, (_) => List.filled(size, -1));
    List<List<int>> bridgeGrid = List.generate(size, (_) => List.filled(size, 0));

    // 1. Start with a single island
    int startX = _random.nextInt(size);
    int startY = _random.nextInt(size);
    int islandId = 0;
    
    BridgesIsland first = BridgesIsland(x: startX, y: startY, count: 0, id: islandId++);
    islands.add(first);
    grid[startY][startX] = first.id;

    // 2. Growth phase
    int targetIslands = 6 + _random.nextInt(4);
    int growthAttempts = 0;
    
    while (islands.length < targetIslands && growthAttempts < 200) {
      growthAttempts++;
      BridgesIsland source = islands[_random.nextInt(islands.length)];
      var directions = [Point(0, 1), Point(0, -1), Point(1, 0), Point(-1, 0)]..shuffle(_random);
      
      for (var d in directions) {
        // Distance 2 means one empty cell between islands
        int dist = 2 + _random.nextInt(max(1, size - 3));
        int nx = source.x + d.x * dist;
        int ny = source.y + d.y * dist;

        if (nx >= 0 && nx < size && ny >= 0 && ny < size) {
          if (_canPlaceBridge(source.x, source.y, nx, ny, grid, bridgeGrid, size)) {
            int newId = islandId++;
            BridgesIsland newIsland = BridgesIsland(x: nx, y: ny, count: 0, id: newId);
            
            grid[ny][nx] = newId;
            islands.add(newIsland);
            
            int bridgeCount = _random.nextBool() ? 1 : 2;
            solution.add(BridgesConnection(island1Id: source.id, island2Id: newId, count: bridgeCount));
            _markBridge(source.x, source.y, nx, ny, bridgeGrid);
            break; 
          }
        }
      }
    }

    if (islands.length < 6) return null;

    // 3. Extra connections
    int extraConnAttempts = 0;
    while (extraConnAttempts < 20) {
      extraConnAttempts++;
      int idx1 = _random.nextInt(islands.length);
      int idx2 = _random.nextInt(islands.length);
      if (idx1 == idx2) continue;
      BridgesIsland i1 = islands[idx1];
      BridgesIsland i2 = islands[idx2];
      
      if ((i1.x == i2.x || i1.y == i2.y) && _canPlaceBridge(i1.x, i1.y, i2.x, i2.y, grid, bridgeGrid, size, ignoreEndpoints: true)) {
        bool exists = solution.any((c) => (c.island1Id == i1.id && c.island2Id == i2.id) || (c.island1Id == i2.id && c.island2Id == i1.id));
        if (!exists) {
          int bridgeCount = _random.nextBool() ? 1 : 2;
          solution.add(BridgesConnection(island1Id: i1.id, island2Id: i2.id, count: bridgeCount));
          _markBridge(i1.x, i1.y, i2.x, i2.y, bridgeGrid);
        }
      }
    }

    // 4. Finalize
    List<int> bridgeCounts = List.filled(islandId, 0);
    for (var conn in solution) {
      bridgeCounts[conn.island1Id] += conn.count;
      bridgeCounts[conn.island2Id] += conn.count;
    }

    return BridgesBoard(
      size: size,
      islands: islands.map((island) => BridgesIsland(x: island.x, y: island.y, count: bridgeCounts[island.id], id: island.id)).toList(),
      solution: solution,
    );
  }

  bool _canPlaceBridge(int x1, int y1, int x2, int y2, List<List<int>> grid, List<List<int>> bridgeGrid, int size, {bool ignoreEndpoints = false}) {
    if (x1 != x2 && y1 != y2) return false;

    int minX = min(x1, x2), maxX = max(x1, x2);
    int minY = min(y1, y2), maxY = max(y1, y2);

    for (int r = minY; r <= maxY; r++) {
      for (int c = minX; c <= maxX; c++) {
        bool isEndpoint = (c == x1 && r == y1) || (c == x2 && r == y2);
        
        if (isEndpoint) {
          if (!ignoreEndpoints && (c == x2 && r == y2)) {
            if (grid[r][c] != -1) return false;
            // Ensure not immediately adjacent to any island
            for (var d in [Point(0, 1), Point(0, -1), Point(1, 0), Point(-1, 0)]) {
              int nr = r + d.y, nc = c + d.x;
              if (nr >= 0 && nr < size && nc >= 0 && nc < size && grid[nr][nc] != -1) return false;
            }
          }
          continue;
        }

        if (grid[r][c] != -1) return false;
        if (bridgeGrid[r][c] != 0) return false;
      }
    }
    return true;
  }

  void _markBridge(int x1, int y1, int x2, int y2, List<List<int>> bridgeGrid) {
    int minX = min(x1, x2), maxX = max(x1, x2);
    int minY = min(y1, y2), maxY = max(y1, y2);
    int type = (x1 == x2) ? 2 : 1; // 1 for horizontal, 2 for vertical

    for (int r = minY; r <= maxY; r++) {
      for (int c = minX; c <= maxX; c++) {
        if ((c == x1 && r == y1) || (c == x2 && r == y2)) continue;
        bridgeGrid[r][c] = type;
      }
    }
  }

  BridgesBoard _fallbackLevel() {
    return BridgesBoard(
      size: 5,
      islands: [
        BridgesIsland(x: 0, y: 0, count: 2, id: 0),
        BridgesIsland(x: 4, y: 0, count: 2, id: 1),
        BridgesIsland(x: 0, y: 4, count: 2, id: 2),
        BridgesIsland(x: 4, y: 4, count: 2, id: 3),
      ],
      solution: [
        BridgesConnection(island1Id: 0, island2Id: 1, count: 1),
        BridgesConnection(island1Id: 1, island2Id: 3, count: 1),
        BridgesConnection(island1Id: 3, island2Id: 2, count: 1),
        BridgesConnection(island1Id: 2, island2Id: 0, count: 1),
      ],
    );
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
