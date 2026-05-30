import 'dart:math';

class Tile {
  final int id;
  final int value;
  final int x;
  final int y;
  final int? oldX;
  final int? oldY;
  final bool merged;

  Tile({
    required this.id,
    required this.value,
    required this.x,
    required this.y,
    this.oldX,
    this.oldY,
    this.merged = false,
  });

  Tile copyWith({int? value, int? x, int? y, int? oldX, int? oldY, bool? merged}) {
    return Tile(
      id: id,
      value: value ?? this.value,
      x: x ?? this.x,
      y: y ?? this.y,
      oldX: oldX ?? this.oldX,
      oldY: oldY ?? this.oldY,
      merged: merged ?? this.merged,
    );
  }
}

class FibonacciMergeEngine {
  static const int size = 4;
  static const List<int> fibonacci = [
    1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765
  ];

  final Random _random = Random();
  int _nextId = 0;

  List<Tile> initBoard() {
    _nextId = 0;
    List<Tile> tiles = [];
    tiles = _addRandomTile(tiles);
    tiles = _addRandomTile(tiles);
    return tiles;
  }

  List<Tile> _addRandomTile(List<Tile> tiles) {
    List<Point<int>> emptyCells = [];
    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        bool occupied = tiles.any((t) => t.x == x && t.y == y && !t.merged);
        if (!occupied) {
          emptyCells.add(Point(x, y));
        }
      }
    }

    if (emptyCells.isNotEmpty) {
      Point<int> cell = emptyCells[_random.nextInt(emptyCells.length)];
      // Start with 1 (more likely) or 2
      int value = _random.nextDouble() < 0.8 ? 1 : 2;
      return [...tiles, Tile(id: _nextId++, value: value, x: cell.x, y: cell.y)];
    }
    return tiles;
  }

  bool canMerge(int a, int b) {
    if (a <= 0 || b <= 0) return false;
    if (a == 1 && b == 1) return true;
    
    // Check if they are consecutive in Fibonacci sequence
    int idxA = -1;
    int idxB = -1;
    
    // For values > 1, find their indices in the unique part of the sequence (from index 1)
    for (int i = 1; i < fibonacci.length; i++) {
      if (fibonacci[i] == a && idxA == -1) idxA = i;
      if (fibonacci[i] == b && idxB == -1) idxB = i;
    }
    
    // Also handle a=1, b=2 or a=2, b=1
    if (a == 1 && b == 2) return true;
    if (a == 2 && b == 1) return true;

    if (idxA != -1 && idxB != -1) {
      return (idxA - idxB).abs() == 1;
    }
    
    return false;
  }

  Map<String, dynamic> move(List<Tile> currentTiles, int dx, int dy) {
    List<Tile> tiles = currentTiles.where((t) => !t.merged).map((t) => t.copyWith(oldX: t.x, oldY: t.y, merged: false)).toList();
    
    int scoreGained = 0;
    bool moved = false;

    if (dx != 0) {
      tiles.sort((a, b) => dx < 0 ? a.x.compareTo(b.x) : b.x.compareTo(a.x));
    } else {
      tiles.sort((a, b) => dy < 0 ? a.y.compareTo(b.y) : b.y.compareTo(a.y));
    }

    List<Tile> processed = [];

    for (var tile in tiles) {
      int nx = tile.x;
      int ny = tile.y;

      while (true) {
        int tx = nx + dx;
        int ty = ny + dy;

        if (tx < 0 || tx >= size || ty < 0 || ty >= size) break;

        var blocker = processed.firstWhere(
          (t) => t.x == tx && t.y == ty && !t.merged,
          orElse: () => Tile(id: -1, value: -1, x: -1, y: -1),
        );

        if (blocker.id == -1) {
          nx = tx;
          ny = ty;
          continue;
        } else if (canMerge(blocker.value, tile.value)) {
          moved = true;
          int newValue = blocker.value + tile.value;
          scoreGained += newValue;
          
          processed.remove(blocker);
          processed.add(blocker.copyWith(merged: true));
          
          processed.add(Tile(
            id: _nextId++,
            value: newValue,
            x: tx,
            y: ty,
            oldX: tile.x,
            oldY: tile.y,
          ));
          nx = -1;
          break;
        } else {
          break;
        }
      }

      if (nx != -1) {
        if (nx != tile.x || ny != tile.y) moved = true;
        processed.add(tile.copyWith(x: nx, y: ny, oldX: tile.x, oldY: tile.y));
      }
    }

    if (moved) {
      processed = _addRandomTile(processed);
    }

    return {
      'tiles': processed,
      'score': scoreGained,
      'moved': moved,
    };
  }

  bool isGameOver(List<Tile> tiles) {
    if (tiles.where((t) => !t.merged).length < size * size) return false;

    List<List<int>> grid = List.generate(size, (_) => List.filled(size, 0));
    for (var t in tiles) {
      if (!t.merged) grid[t.y][t.x] = t.value;
    }

    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        if (grid[y][x] == 0) return false;
        if (x < size - 1 && canMerge(grid[y][x], grid[y][x + 1])) return false;
        if (y < size - 1 && canMerge(grid[y][x], grid[y + 1][x])) return false;
      }
    }
    return true;
  }
}
