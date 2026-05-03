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

class Game2048Engine {
  static const int size = 4;
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
      int value = _random.nextDouble() < 0.9 ? 2 : 4;
      return [...tiles, Tile(id: _nextId++, value: value, x: cell.x, y: cell.y)];
    }
    return tiles;
  }

  Map<String, dynamic> move(List<Tile> currentTiles, int dx, int dy) {
    // 1. Remove previously merged tiles and reset status
    List<Tile> tiles = currentTiles.where((t) => !t.merged).map((t) => t.copyWith(oldX: t.x, oldY: t.y, merged: false)).toList();
    
    int scoreGained = 0;
    bool moved = false;

    // Sort tiles based on direction to process from the edge
    if (dx != 0) {
      tiles.sort((a, b) => dx < 0 ? a.x.compareTo(b.x) : b.x.compareTo(a.x));
    } else {
      tiles.sort((a, b) => dy < 0 ? a.y.compareTo(b.y) : b.y.compareTo(a.y));
    }

    List<Tile> processed = [];

    for (var tile in tiles) {
      int nx = tile.x;
      int ny = tile.y;

      // Slide as far as possible
      while (true) {
        int tx = nx + dx;
        int ty = ny + dy;

        if (tx < 0 || tx >= size || ty < 0 || ty >= size) break;

        var blocker = processed.firstWhere(
          (t) => t.x == tx && t.y == ty,
          orElse: () => Tile(id: -1, value: -1, x: -1, y: -1),
        );

        if (blocker.id == -1) {
          nx = tx;
          ny = ty;
          continue;
        } else if (blocker.value == tile.value && !blocker.merged) {
          // Merge!
          moved = true;
          scoreGained += tile.value * 2;
          
          // Remove blocker from processed, add as merged
          processed.remove(blocker);
          processed.add(blocker.copyWith(merged: true)); // The old tile stays at tx, ty but is marked merged
          
          // Add the new merged tile
          processed.add(Tile(
            id: _nextId++,
            value: tile.value * 2,
            x: tx,
            y: ty,
            oldX: tile.x,
            oldY: tile.y,
          ));
          nx = -1; // Mark as handled
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
    if (tiles.length < size * size) return false;

    // Create a virtual grid for easier neighbor checking
    List<List<int>> grid = List.generate(size, (_) => List.filled(size, 0));
    for (var t in tiles) {
      if (!t.merged) grid[t.y][t.x] = t.value;
    }

    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        if (grid[y][x] == 0) return false;
        if (x < size - 1 && grid[y][x] == grid[y][x + 1]) return false;
        if (y < size - 1 && grid[y][x] == grid[y + 1][x]) return false;
      }
    }
    return true;
  }
}
