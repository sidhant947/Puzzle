import 'dart:math';

class CrownBoard {
  final int size;
  final List<List<int>> regions; // Region ID for each cell
  final List<Point<int>> solution;

  CrownBoard({
    required this.size,
    required this.regions,
    required this.solution,
  });
}

class CrownEngine {
  static const int boardSize = 5;
  final Random _random = Random();

  CrownBoard generateBoard() {
    while (true) {
      // 1. Generate a valid crown placement solution (1 per row, 1 per col, no adjacency)
      List<Point<int>>? solution = _findValidCrownPlacement();
      if (solution == null) continue;

      // 2. Generate regions around each solution point
      List<List<int>> regions = List.generate(boardSize, (_) => List.filled(boardSize, -1));
      for (int i = 0; i < boardSize; i++) {
        regions[solution[i].y][solution[i].x] = i;
      }

      // Expand regions randomly
      List<Point<int>> frontier = [];
      for (int i = 0; i < boardSize; i++) {
        _addNeighbors(solution[i].x, solution[i].y, frontier);
      }

      while (frontier.isNotEmpty) {
        frontier.shuffle(_random);
        Point<int> cell = frontier.removeLast();
        if (regions[cell.y][cell.x] != -1) continue;

        List<int> neighbors = _getAdjacentRegionIds(cell.x, cell.y, regions);
        if (neighbors.isNotEmpty) {
          regions[cell.y][cell.x] = neighbors[_random.nextInt(neighbors.length)];
          _addNeighbors(cell.x, cell.y, frontier);
        }
      }

      final board = CrownBoard(size: boardSize, regions: regions, solution: solution);

      // 3. Verify unique solution
      if (_hasUniqueSolution(board)) {
        return board;
      }
    }
  }

  List<Point<int>>? _findValidCrownPlacement() {
    List<Point<int>> current = [];
    if (_solveCrownPlacement(current, 0)) {
      return current;
    }
    return null;
  }

  bool _solveCrownPlacement(List<Point<int>> current, int row) {
    if (row == boardSize) return true;

    List<int> cols = List.generate(boardSize, (i) => i)..shuffle(_random);
    for (int col in cols) {
      Point<int> p = Point(col, row);
      if (_canPlaceCrown(current, p)) {
        current.add(p);
        if (_solveCrownPlacement(current, row + 1)) return true;
        current.removeLast();
      }
    }
    return false;
  }

  bool _canPlaceCrown(List<Point<int>> current, Point<int> p) {
    for (var other in current) {
      // Row/Col check (row is already handled by recursion)
      if (other.x == p.x) return false;
      // Adjacency check
      if ((other.x - p.x).abs() <= 1 && (other.y - p.y).abs() <= 1) return false;
    }
    return true;
  }

  bool _hasUniqueSolution(CrownBoard board) {
    int solutions = 0;

    void solve(List<Point<int>> current, int row) {
      if (solutions > 1) return;
      if (row == boardSize) {
        solutions++;
        return;
      }

      for (int col = 0; col < boardSize; col++) {
        Point<int> p = Point(col, row);
        // Check row/col/adjacency
        if (_canPlaceCrown(current, p)) {
          // Check region
          int rid = board.regions[p.y][p.x];
          bool regionUsed = current.any((cp) => board.regions[cp.y][cp.x] == rid);
          if (!regionUsed) {
            current.add(p);
            solve(current, row + 1);
            current.removeLast();
          }
        }
      }
    }

    solve([], 0);
    return solutions == 1;
  }

  void _addNeighbors(int x, int y, List<Point<int>> frontier) {
    final dx = [1, -1, 0, 0];
    final dy = [0, 0, 1, -1];
    for (int i = 0; i < 4; i++) {
      int nx = x + dx[i];
      int ny = y + dy[i];
      if (nx >= 0 && nx < boardSize && ny >= 0 && ny < boardSize) {
        frontier.add(Point(nx, ny));
      }
    }
  }

  List<int> _getAdjacentRegionIds(int x, int y, List<List<int>> regions) {
    Set<int> ids = {};
    final dx = [1, -1, 0, 0];
    final dy = [0, 0, 1, -1];
    for (int i = 0; i < 4; i++) {
      int nx = x + dx[i];
      int ny = y + dy[i];
      if (nx >= 0 && nx < boardSize && ny >= 0 && ny < boardSize) {
        if (regions[ny][nx] != -1) ids.add(regions[ny][nx]);
      }
    }
    return ids.toList();
  }

  bool isWin(int size, List<List<int>> regions, List<Point<int>> crowns) {
    if (crowns.length != size) return false;

    // Check rows and columns
    Set<int> rows = {};
    Set<int> cols = {};
    for (var p in crowns) {
      if (rows.contains(p.y) || cols.contains(p.x)) return false;
      rows.add(p.y);
      cols.add(p.x);
    }

    // Check regions
    Set<int> regionSet = {};
    for (var p in crowns) {
      int rid = regions[p.y][p.x];
      if (regionSet.contains(rid)) return false;
      regionSet.add(rid);
    }

    // Optional: Check adjacency (no two crowns touch, even diagonally)
    for (int i = 0; i < crowns.length; i++) {
      for (int j = i + 1; j < crowns.length; j++) {
        if ((crowns[i].x - crowns[j].x).abs() <= 1 && (crowns[i].y - crowns[j].y).abs() <= 1) {
          return false;
        }
      }
    }

    return true;
  }
}
