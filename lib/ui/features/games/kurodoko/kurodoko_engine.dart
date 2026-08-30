import 'dart:math' as math;

enum KurodokoCellState { empty, white, black }

class KurodokoCell {
  final int row;
  final int col;
  final int? clue;
  KurodokoCellState state;

  KurodokoCell({
    required this.row,
    required this.col,
    this.clue,
    this.state = KurodokoCellState.empty,
  });

  bool get isClue => clue != null;
}

class KurodokoPuzzle {
  final int size;
  final List<List<KurodokoCell>> grid;
  final List<List<bool>> solutionBlack;

  KurodokoPuzzle({
    required this.size,
    required this.grid,
    required this.solutionBlack,
  });
}

class KurodokoEngine {
  static const int defaultSize = 6;

  static KurodokoPuzzle generatePuzzle({int size = defaultSize, math.Random? random}) {
    final rng = random ?? math.Random();
    
    while (true) {
      final isBlack = List.generate(size, (_) => List.generate(size, (_) => false));
      
      final numBlacks = (size * size * 0.22).round() + rng.nextInt(3);
      int placed = 0;
      int attempts = 0;
      
      while (placed < numBlacks && attempts < 200) {
        attempts++;
        final r = rng.nextInt(size);
        final c = rng.nextInt(size);
        if (isBlack[r][c]) continue;
        
        bool hasAdjacentBlack = false;
        if (r > 0 && isBlack[r - 1][c]) hasAdjacentBlack = true;
        if (r < size - 1 && isBlack[r + 1][c]) hasAdjacentBlack = true;
        if (c > 0 && isBlack[r][c - 1]) hasAdjacentBlack = true;
        if (c < size - 1 && isBlack[r][c + 1]) hasAdjacentBlack = true;
        
        if (hasAdjacentBlack) continue;
        
        isBlack[r][c] = true;
        
        if (!_allWhiteConnected(isBlack, size)) {
          isBlack[r][c] = false;
          continue;
        }
        
        placed++;
      }
      
      if (placed < (size * size * 0.18).round()) continue;
      
      final whiteCells = <List<int>>[];
      for (int r = 0; r < size; r++) {
        for (int c = 0; c < size; c++) {
          if (!isBlack[r][c]) {
            whiteCells.add([r, c]);
          }
        }
      }
      
      whiteCells.shuffle(rng);
      final numClues = math.min(whiteCells.length, (size * 1.5).round() + rng.nextInt(2));
      final clueCoords = whiteCells.take(numClues).toSet();
      
      final grid = List.generate(size, (r) {
        return List.generate(size, (c) {
          int? clue;
          final isClueCell = clueCoords.any((coord) => coord[0] == r && coord[1] == c);
          if (isClueCell) {
            clue = _calculateVisibleCount(isBlack, size, r, c);
          }
          return KurodokoCell(
            row: r,
            col: c,
            clue: clue,
            state: clue != null ? KurodokoCellState.white : KurodokoCellState.empty,
          );
        });
      });
      
      return KurodokoPuzzle(
        size: size,
        grid: grid,
        solutionBlack: isBlack,
      );
    }
  }

  static int _calculateVisibleCount(List<List<bool>> isBlack, int size, int r, int c) {
    if (isBlack[r][c]) return 0;
    int count = 1;
    for (int nr = r - 1; nr >= 0; nr--) {
      if (isBlack[nr][c]) break;
      count++;
    }
    for (int nr = r + 1; nr < size; nr++) {
      if (isBlack[nr][c]) break;
      count++;
    }
    for (int nc = c - 1; nc >= 0; nc--) {
      if (isBlack[r][nc]) break;
      count++;
    }
    for (int nc = c + 1; nc < size; nc++) {
      if (isBlack[r][nc]) break;
      count++;
    }
    return count;
  }

  static bool _allWhiteConnected(List<List<bool>> isBlack, int size) {
    int startR = -1;
    int startC = -1;
    int whiteCount = 0;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (!isBlack[r][c]) {
          whiteCount++;
          if (startR == -1) {
            startR = r;
            startC = c;
          }
        }
      }
    }
    if (whiteCount == 0) return true;

    final visited = List.generate(size, (_) => List.generate(size, (_) => false));
    final queue = <List<int>>[[startR, startC]];
    visited[startR][startC] = true;
    int reachable = 0;

    while (queue.isNotEmpty) {
      final curr = queue.removeAt(0);
      reachable++;
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
          if (!isBlack[nr][nc] && !visited[nr][nc]) {
            visited[nr][nc] = true;
            queue.add([nr, nc]);
          }
        }
      }
    }

    return reachable == whiteCount;
  }

  static bool isSolved(List<List<KurodokoCell>> grid, int size) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c].state == KurodokoCellState.empty) return false;
      }
    }

    final isBlack = List.generate(size, (r) => List.generate(size, (c) => grid[r][c].state == KurodokoCellState.black));

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (isBlack[r][c]) {
          if (r > 0 && isBlack[r - 1][c]) return false;
          if (r < size - 1 && isBlack[r + 1][c]) return false;
          if (c > 0 && isBlack[r][c - 1]) return false;
          if (c < size - 1 && isBlack[r][c + 1]) return false;
        }
      }
    }

    if (!_allWhiteConnected(isBlack, size)) return false;

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final clue = grid[r][c].clue;
        if (clue != null) {
          if (grid[r][c].state == KurodokoCellState.black) return false;
          final visible = _calculateVisibleCount(isBlack, size, r, c);
          if (visible != clue) return false;
        }
      }
    }

    return true;
  }
}
