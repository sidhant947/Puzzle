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
    // 1. Generate a valid N-queens solution (1 per row, 1 per col)
    // For 5x5, we can just pick a random permutation
    List<int> cols = List.generate(boardSize, (i) => i)..shuffle();
    List<Point<int>> solution = [];
    for (int r = 0; r < boardSize; r++) {
      solution.add(Point(cols[r], r));
    }

    // 2. Generate regions around each solution point
    List<List<int>> regions = List.generate(boardSize, (_) => List.filled(boardSize, -1));
    
    // Initial seeds
    for (int i = 0; i < boardSize; i++) {
      regions[solution[i].y][solution[i].x] = i;
    }

    // Expand regions randomly
    List<Point<int>> frontier = [];
    for (int i = 0; i < boardSize; i++) {
      _addNeighbors(solution[i].x, solution[i].y, frontier);
    }

    while (frontier.isNotEmpty) {
      frontier.shuffle();
      Point<int> cell = frontier.removeLast();
      if (regions[cell.y][cell.x] != -1) continue;

      // Find adjacent region IDs
      List<int> neighbors = _getAdjacentRegionIds(cell.x, cell.y, regions);
      if (neighbors.isNotEmpty) {
        regions[cell.y][cell.x] = neighbors[_random.nextInt(neighbors.length)];
        _addNeighbors(cell.x, cell.y, frontier);
      }
    }

    return CrownBoard(size: boardSize, regions: regions, solution: solution);
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
