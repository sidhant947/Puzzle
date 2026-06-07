import 'dart:math';

class LighthousesEngine {
  final Random _random = Random();

  Map<String, dynamic> generateLevel({int size = 5}) {
    int attempts = 0;
    while (attempts < 200) {
      attempts++;
      final clues = List.generate(size, (_) => List<int?>.filled(size, null));
      final ships = List.generate(size, (_) => List<bool>.filled(size, false));

      // 1. Place lighthouses
      int targetLighthouses = size;
      int lighthouseCount = 0;
      int lhAttempts = 0;
      while (lighthouseCount < targetLighthouses && lhAttempts < 100) {
        lhAttempts++;
        int r = _random.nextInt(size);
        int c = _random.nextInt(size);
        if (clues[r][c] == null) {
          clues[r][c] = 0; // Placeholder
          lighthouseCount++;
        }
      }

      // 2. Place ships
      int targetShips = size;
      int shipCount = 0;
      int sAttempts = 0;
      while (shipCount < targetShips && sAttempts < 200) {
        sAttempts++;
        int r = _random.nextInt(size);
        int c = _random.nextInt(size);

        if (clues[r][c] != null || ships[r][c]) continue;

        if (_canPlaceShip(r, c, clues, ships, size)) {
          // Ship must be seen by at least one lighthouse
          bool seen = false;
          for (int i = 0; i < size; i++) {
            if (clues[r][i] != null || clues[i][c] != null) {
              seen = true;
              break;
            }
          }
          if (!seen) continue;

          ships[r][c] = true;
          shipCount++;
        }
      }

      if (shipCount < size - 1) continue;

      // 3. Calculate clues
      for (int r = 0; r < size; r++) {
        for (int c = 0; c < size; c++) {
          if (clues[r][c] == null) continue;
          int count = 0;
          for (int j = 0; j < size; j++) {
            if (ships[r][j]) count++;
          }
          for (int i = 0; i < size; i++) {
            if (ships[i][c]) count++;
          }
          clues[r][c] = count;
        }
      }

      // 4. Verify uniqueness
      if (_hasUniqueSolution(clues, size)) {
        return {'clues': clues};
      }
    }

    // Fallback
    return {
      'clues': [
        [null, null, null, null, 1],
        [null, 2, null, null, null],
        [null, null, null, 1, null],
        [2, null, null, null, null],
        [null, null, 2, null, null],
      ],
    };
  }

  bool _canPlaceShip(int r, int c, List<List<int?>> clues, List<List<bool>> ships, int size) {
    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        int nr = r + dr, nc = c + dc;
        if (nr >= 0 && nr < size && nc >= 0 && nc < size) {
          if (ships[nr][nc] || clues[nr][nc] != null) return false;
        }
      }
    }
    return true;
  }

  bool _hasUniqueSolution(List<List<int?>> clues, int size) {
    final possiblePositions = <Point<int>>[];
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (clues[r][c] != null) continue;
        
        bool touchesLighthouse = false;
        for (int dr = -1; dr <= 1; dr++) {
          for (int dc = -1; dc <= 1; dc++) {
            int nr = r + dr, nc = c + dc;
            if (nr >= 0 && nr < size && nc >= 0 && nc < size && clues[nr][nc] != null) {
              touchesLighthouse = true;
              break;
            }
          }
          if (touchesLighthouse) break;
        }
        if (touchesLighthouse) continue;

        bool seen = false;
        for (int i = 0; i < size; i++) {
          if (clues[r][i] != null || clues[i][c] != null) {
            seen = true;
            break;
          }
        }
        if (!seen) continue;

        possiblePositions.add(Point(r, c));
      }
    }

    int solutions = 0;
    void solve(int idx, List<List<bool>> currentShips) {
      if (solutions > 1) return;
      if (idx == possiblePositions.length) {
        if (_isValid(clues, currentShips, size)) {
          solutions++;
        }
        return;
      }

      final p = possiblePositions[idx];

      // Option 1: Place ship
      if (_canPlaceShip(p.x, p.y, clues, currentShips, size)) {
        currentShips[p.x][p.y] = true;
        if (!_isPrunable(clues, currentShips, size)) {
          solve(idx + 1, currentShips);
        }
        currentShips[p.x][p.y] = false;
      }

      // Option 2: No ship
      solve(idx + 1, currentShips);
    }

    solve(0, List.generate(size, (_) => List.filled(size, false)));
    return solutions == 1;
  }

  bool _isValid(List<List<int?>> clues, List<List<bool>> ships, int size) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (clues[r][c] == null) continue;
        int count = 0;
        for (int j = 0; j < size; j++) {
          if (ships[r][j]) count++;
        }
        for (int i = 0; i < size; i++) {
          if (ships[i][c]) count++;
        }
        if (count != clues[r][c]) return false;
      }
    }
    return true;
  }

  bool _isPrunable(List<List<int?>> clues, List<List<bool>> ships, int size) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (clues[r][c] == null) continue;
        int count = 0;
        for (int j = 0; j < size; j++) {
          if (ships[r][j]) count++;
        }
        for (int i = 0; i < size; i++) {
          if (ships[i][c]) count++;
        }
        if (count > clues[r][c]!) return true;
      }
    }
    return false;
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    final clues = params['clues'] as List<List<int?>>;
    final ships = params['ships'] as List<List<bool>>;
    final size = ships.length;

    // 1. Ships cannot touch lighthouses or each other (including diagonally)
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (ships[r][c]) {
          if (clues[r][c] != null) return false;
          // Check 8 neighbors for other ships or lighthouses
          for (int dr = -1; dr <= 1; dr++) {
            for (int dc = -1; dc <= 1; dc++) {
              if (dr == 0 && dc == 0) continue;
              int nr = r + dr, nc = c + dc;
              if (nr >= 0 && nr < size && nc >= 0 && nc < size) {
                if (ships[nr][nc] || clues[nr][nc] != null) return false;
              }
            }
          }
        }
      }
    }

    // 2. Clues satisfied
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (clues[r][c] == null) continue;
        
        int count = 0;
        // Horizontal
        for (int j = 0; j < size; j++) {
          if (ships[r][j]) count++;
        }
        // Vertical
        for (int i = 0; i < size; i++) {
          if (ships[i][c]) count++;
        }
        
        if (count != clues[r][c]) return false;
      }
    }

    return true;
  }
}
