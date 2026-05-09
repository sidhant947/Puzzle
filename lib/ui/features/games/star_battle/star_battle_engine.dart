class StarBattleEngine {
  final int size = 6;
  final int starsPerRegion = 1;

  Map<String, dynamic> generatePuzzle() {
    // Simplified 6x6 puzzle with fixed regions
    final regions = [
      [0, 0, 1, 1, 1, 1],
      [0, 0, 1, 2, 2, 2],
      [0, 3, 1, 4, 4, 2],
      [3, 3, 3, 4, 4, 4],
      [5, 5, 5, 5, 4, 4],
      [5, 5, 5, 5, 5, 4],
    ];

    return {
      'regions': regions,
      'starCount': 6, // 1 star per row, column, and region in this easy version
    };
  }

  bool checkWin(List<List<int>> userStars, List<List<int>> regions) {
    // 1. One star per row
    for (int r = 0; r < size; r++) {
      if (userStars[r].where((s) => s == 1).length != 1) return false;
    }

    // 2. One star per column
    for (int c = 0; c < size; c++) {
      if (List.generate(size, (r) => userStars[r][c]).where((s) => s == 1).length != 1) return false;
    }

    // 3. One star per region
    Map<int, int> regionStars = {};
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (userStars[r][c] == 1) {
          int regionId = regions[r][c];
          regionStars[regionId] = (regionStars[regionId] ?? 0) + 1;
        }
      }
    }
    if (regionStars.length != 6 || regionStars.values.any((v) => v != 1)) return false;

    // 4. Stars cannot touch (even diagonally)
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (userStars[r][c] == 1) {
          for (int dr = -1; dr <= 1; dr++) {
            for (int dc = -1; dc <= 1; dc++) {
              if (dr == 0 && dc == 0) continue;
              int nr = r + dr;
              int nc = c + dc;
              if (nr >= 0 && nr < size && nc >= 0 && nc < size) {
                if (userStars[nr][nc] == 1) return false;
              }
            }
          }
        }
      }
    }

    return true;
  }
}
