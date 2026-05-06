import 'dart:math';

enum CellType { empty, tree, tent, grass }

class TentsLevel {
  final int size;
  final List<Point<int>> treePositions;
  final List<int> rowClues;
  final List<int> colClues;

  const TentsLevel({
    required this.size,
    required this.treePositions,
    required this.rowClues,
    required this.colClues,
  });
}

class TentsAndTreesEngine {
  final List<TentsLevel> _puzzles = [
    const TentsLevel(
      size: 5,
      treePositions: [
        Point(0, 0), Point(0, 3),
        Point(1, 1),
        Point(2, 4),
        Point(3, 0),
        Point(4, 2),
      ],
      rowClues: [2, 0, 1, 1, 2],
      colClues: [2, 1, 1, 1, 1],
    ),
    const TentsLevel(
      size: 5,
      treePositions: [
        Point(0, 1),
        Point(1, 4),
        Point(2, 0),
        Point(3, 2),
        Point(4, 4),
      ],
      rowClues: [1, 1, 1, 1, 1],
      colClues: [1, 1, 1, 1, 1],
    ),
  ];

  TentsLevel getRandomPuzzle() {
    return _puzzles[Random().nextInt(_puzzles.length)];
  }

  bool isSolved(TentsLevel level, List<List<CellType>> grid) {
    for (int r = 0; r < level.size; r++) {
      int count = 0;
      for (int c = 0; c < level.size; c++) {
        if (grid[r][c] == CellType.tent) count++;
      }
      if (count != level.rowClues[r]) return false;
    }

    for (int c = 0; c < level.size; c++) {
      int count = 0;
      for (int r = 0; r < level.size; r++) {
        if (grid[r][c] == CellType.tent) count++;
      }
      if (count != level.colClues[c]) return false;
    }

    for (int r = 0; r < level.size; r++) {
      for (int c = 0; c < level.size; c++) {
        if (grid[r][c] == CellType.tent) {
          for (int dr = -1; dr <= 1; dr++) {
            for (int dc = -1; dc <= 1; dc++) {
              if (dr == 0 && dc == 0) continue;
              int nr = r + dr;
              int nc = c + dc;
              if (nr >= 0 && nr < level.size && nc >= 0 && nc < level.size) {
                if (grid[nr][nc] == CellType.tent) return false;
              }
            }
          }
        }
      }
    }

    List<Point<int>> tents = [];
    for (int r = 0; r < level.size; r++) {
      for (int c = 0; c < level.size; c++) {
        if (grid[r][c] == CellType.tent) {
          bool nextToTree = false;
          final adj = [Point(r - 1, c), Point(r + 1, c), Point(r, c - 1), Point(r, c + 1)];
          for (var p in adj) {
            if (p.x >= 0 && p.x < level.size && p.y >= 0 && p.y < level.size) {
              if (grid[p.x][p.y] == CellType.tree) {
                nextToTree = true;
                break;
              }
            }
          }
          if (!nextToTree) return false;
          tents.add(Point(r, c));
        }
      }
    }

    if (tents.length != level.treePositions.length) return false;

    for (var tree in level.treePositions) {
      bool hasTent = false;
      final adj = [Point(tree.x - 1, tree.y), Point(tree.x + 1, tree.y), Point(tree.x, tree.y - 1), Point(tree.x, tree.y + 1)];
      for (var p in adj) {
        if (p.x >= 0 && p.x < level.size && p.y >= 0 && p.y < level.size) {
          if (grid[p.x][p.y] == CellType.tent) {
            hasTent = true;
            break;
          }
        }
      }
      if (!hasTent) return false;
    }

    return true;
  }
}
