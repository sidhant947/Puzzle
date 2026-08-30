import 'dart:math' as math;

enum ArrowDirection { up, down, left, right }

class YajilinClue {
  final ArrowDirection dir;
  final int count;

  YajilinClue(this.dir, this.count);
}

enum YajilinCellState { empty, black, dot }

class YajilinCell {
  final int r;
  final int c;
  final YajilinClue? clue;
  YajilinCellState state;

  YajilinCell({
    required this.r,
    required this.c,
    this.clue,
    this.state = YajilinCellState.empty,
  });

  bool get isClue => clue != null;
}

class YajilinEdge {
  final int r1, c1, r2, c2;

  YajilinEdge(this.r1, this.c1, this.r2, this.c2);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! YajilinEdge) return false;
    return (r1 == other.r1 && c1 == other.c1 && r2 == other.r2 && c2 == other.c2) ||
        (r1 == other.r2 && c1 == other.c2 && r2 == other.r1 && c2 == other.c1);
  }

  @override
  int get hashCode => (r1 + r2) * 31 + (c1 + c2);
}

class YajilinPuzzle {
  final int size;
  final List<List<YajilinCell>> grid;
  final Set<YajilinEdge> edges;

  YajilinPuzzle({
    required this.size,
    required this.grid,
    required this.edges,
  });
}

class YajilinEngine {
  static const int defaultSize = 5;

  static YajilinPuzzle generatePuzzle({int size = defaultSize, math.Random? random}) {
    // Standard 5x5 Yajilin setup
    final grid = List.generate(size, (r) {
      return List.generate(size, (c) {
        YajilinClue? clue;
        if (r == 0 && c == 0) clue = YajilinClue(ArrowDirection.right, 1);
        if (r == 4 && c == 4) clue = YajilinClue(ArrowDirection.up, 1);
        return YajilinCell(r: r, c: c, clue: clue);
      });
    });

    return YajilinPuzzle(
      size: size,
      grid: grid,
      edges: {},
    );
  }

  static bool isSolved(List<List<YajilinCell>> grid, Set<YajilinEdge> edges, int size) {
    if (edges.isEmpty) return false;

    // Rule 1: Black cells cannot be orthogonally adjacent
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c].state == YajilinCellState.black) {
          if (r > 0 && grid[r - 1][c].state == YajilinCellState.black) return false;
          if (r < size - 1 && grid[r + 1][c].state == YajilinCellState.black) return false;
          if (c > 0 && grid[r][c - 1].state == YajilinCellState.black) return false;
          if (c < size - 1 && grid[r][c + 1].state == YajilinCellState.black) return false;
        }
      }
    }

    // Rule 2: Clues must match black cell count along ray
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final clue = grid[r][c].clue;
        if (clue != null) {
          int count = 0;
          if (clue.dir == ArrowDirection.right) {
            for (int nc = c + 1; nc < size; nc++) {
              if (grid[r][nc].state == YajilinCellState.black) count++;
            }
          } else if (clue.dir == ArrowDirection.left) {
            for (int nc = c - 1; nc >= 0; nc--) {
              if (grid[r][nc].state == YajilinCellState.black) count++;
            }
          } else if (clue.dir == ArrowDirection.up) {
            for (int nr = r - 1; nr >= 0; nr--) {
              if (grid[nr][c].state == YajilinCellState.black) count++;
            }
          } else if (clue.dir == ArrowDirection.down) {
            for (int nr = r + 1; nr < size; nr++) {
              if (grid[nr][c].state == YajilinCellState.black) count++;
            }
          }
          if (count != clue.count) return false;
        }
      }
    }

    // Rule 3: Single continuous loop through all non-black, non-clue cells
    final degreeMap = <String, int>{};
    for (final e in edges) {
      final k1 = '${e.r1},${e.c1}';
      final k2 = '${e.r2},${e.c2}';
      degreeMap[k1] = (degreeMap[k1] ?? 0) + 1;
      degreeMap[k2] = (degreeMap[k2] ?? 0) + 1;
    }

    for (final deg in degreeMap.values) {
      if (deg != 2) return false;
    }

    // Verify non-black non-clue cells are on loop
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final cell = grid[r][c];
        if (!cell.isClue && cell.state != YajilinCellState.black) {
          if (!degreeMap.containsKey('$r,$c')) return false;
        }
      }
    }

    return true;
  }
}
