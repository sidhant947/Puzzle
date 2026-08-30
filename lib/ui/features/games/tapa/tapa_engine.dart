import 'dart:math' as math;

enum TapaCellState { empty, white, black }

class TapaCell {
  final int row;
  final int col;
  final List<int>? clues; // e.g. [1, 3] or [2]
  TapaCellState state;

  TapaCell({
    required this.row,
    required this.col,
    this.clues,
    this.state = TapaCellState.empty,
  });

  bool get isClue => clues != null && clues!.isNotEmpty;
}

class TapaPuzzle {
  final int size;
  final List<List<TapaCell>> grid;
  final List<List<bool>> solutionBlack;

  TapaPuzzle({
    required this.size,
    required this.grid,
    required this.solutionBlack,
  });
}

class TapaEngine {
  static const int defaultSize = 5;

  static TapaPuzzle generatePuzzle({int size = defaultSize, math.Random? random}) {
    final rng = random ?? math.Random();
    
    // Create valid continuous wall without 2x2 blocks
    while (true) {
      final isBlack = List.generate(size, (_) => List.generate(size, (_) => false));
      
      // Start a random path wall
      int startR = rng.nextInt(size);
      int startC = rng.nextInt(size);
      isBlack[startR][startC] = true;
      int wallSize = 1;
      final targetWallSize = (size * size * 0.45).round();

      int attempts = 0;
      while (wallSize < targetWallSize && attempts < 300) {
        attempts++;
        final r = rng.nextInt(size);
        final c = rng.nextInt(size);
        if (isBlack[r][c]) continue;

        // Must connect to existing wall
        bool adjacentToWall = false;
        if (r > 0 && isBlack[r - 1][c]) adjacentToWall = true;
        if (r < size - 1 && isBlack[r + 1][c]) adjacentToWall = true;
        if (c > 0 && isBlack[r][c - 1]) adjacentToWall = true;
        if (c < size - 1 && isBlack[r][c + 1]) adjacentToWall = true;
        if (!adjacentToWall) continue;

        // Check if adding this creates a 2x2
        isBlack[r][c] = true;
        if (_has2x2(isBlack, size)) {
          isBlack[r][c] = false;
          continue;
        }

        wallSize++;
      }

      if (wallSize < (size * size * 0.40).round()) continue;
      if (!_isSingleConnectedWall(isBlack, size, wallSize)) continue;

      // Extract clues for non-wall cells
      final nonWallCells = <List<int>>[];
      for (int r = 0; r < size; r++) {
        for (int c = 0; c < size; c++) {
          if (!isBlack[r][c]) {
            nonWallCells.add([r, c]);
          }
        }
      }

      nonWallCells.shuffle(rng);
      final numClues = (size * 1.6).round();
      final clueCoords = nonWallCells.take(numClues).toSet();

      final grid = List.generate(size, (r) {
        return List.generate(size, (c) {
          List<int>? clues;
          final isClueCell = clueCoords.any((coord) => coord[0] == r && coord[1] == c);
          if (isClueCell) {
            clues = _calculateTapaClues(isBlack, size, r, c);
          }
          return TapaCell(
            row: r,
            col: c,
            clues: clues,
            state: clues != null ? TapaCellState.white : TapaCellState.empty,
          );
        });
      });

      return TapaPuzzle(
        size: size,
        grid: grid,
        solutionBlack: isBlack,
      );
    }
  }

  static bool _has2x2(List<List<bool>> isBlack, int size) {
    for (int r = 0; r < size - 1; r++) {
      for (int c = 0; c < size - 1; c++) {
        if (isBlack[r][c] && isBlack[r + 1][c] && isBlack[r][c + 1] && isBlack[r + 1][c + 1]) {
          return true;
        }
      }
    }
    return false;
  }

  static bool _isSingleConnectedWall(List<List<bool>> isBlack, int size, int totalBlack) {
    int startR = -1;
    int startC = -1;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (isBlack[r][c]) {
          startR = r;
          startC = c;
          break;
        }
      }
      if (startR != -1) break;
    }
    if (startR == -1) return false;

    final visited = List.generate(size, (_) => List.generate(size, (_) => false));
    final queue = <List<int>>[[startR, startC]];
    visited[startR][startC] = true;
    int count = 0;

    while (queue.isNotEmpty) {
      final curr = queue.removeAt(0);
      count++;
      final cr = curr[0];
      final cc = curr[1];

      final neighbors = [
        [cr - 1, cc],
        [cr + 1, cc],
        [cr, cc - 1],
        [cr, cc + 1],
      ];

      for (final n in neighbors) {
        final nr = n[0];
        final nc = n[1];
        if (nr >= 0 && nr < size && nc >= 0 && nc < size) {
          if (isBlack[nr][nc] && !visited[nr][nc]) {
            visited[nr][nc] = true;
            queue.add([nr, nc]);
          }
        }
      }
    }

    return count == totalBlack;
  }

  static List<int> _calculateTapaClues(List<List<bool>> isBlack, int size, int r, int c) {
    // 8 neighbors in clockwise order starting from top-left
    final neighborOffsets = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, 1],
      [1, 1], [1, 0], [1, -1],
      [0, -1]
    ];

    final neighborBits = <bool>[];
    for (final offset in neighborOffsets) {
      final nr = r + offset[0];
      final nc = c + offset[1];
      if (nr >= 0 && nr < size && nc >= 0 && nc < size) {
        neighborBits.add(isBlack[nr][nc]);
      } else {
        neighborBits.add(false);
      }
    }

    // Count consecutive true blocks around the loop
    final blocks = <int>[];
    int currentRun = 0;
    for (int i = 0; i < neighborBits.length; i++) {
      if (neighborBits[i]) {
        currentRun++;
      } else {
        if (currentRun > 0) {
          blocks.add(currentRun);
          currentRun = 0;
        }
      }
    }
    if (currentRun > 0) {
      // Connect wrap around if first and last are true
      if (blocks.isNotEmpty && neighborBits[0]) {
        blocks[0] += currentRun;
      } else {
        blocks.add(currentRun);
      }
    }

    if (blocks.isEmpty) return [0];
    blocks.sort();
    return blocks;
  }

  static bool isSolved(List<List<TapaCell>> grid, int size) {
    int blackCount = 0;
    final isBlack = List.generate(size, (r) => List.generate(size, (c) => false));

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c].state == TapaCellState.black) {
          if (grid[r][c].isClue) return false;
          isBlack[r][c] = true;
          blackCount++;
        }
      }
    }

    if (blackCount == 0) return false;
    if (_has2x2(isBlack, size)) return false;
    if (!_isSingleConnectedWall(isBlack, size, blackCount)) return false;

    // Check all clues
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final clues = grid[r][c].clues;
        if (clues != null && clues.isNotEmpty) {
          final actualClues = _calculateTapaClues(isBlack, size, r, c);
          if (actualClues.length != clues.length) return false;
          for (int i = 0; i < clues.length; i++) {
            if (actualClues[i] != clues[i]) return false;
          }
        }
      }
    }

    return true;
  }
}
