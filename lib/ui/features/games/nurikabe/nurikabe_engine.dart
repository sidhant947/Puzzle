import 'dart:math';

class NurikabeEngine {
  final Random _random = Random();

  Map<String, dynamic> generateLevel({int size = 5}) {
    int attempts = 0;
    while (attempts < 200) {
      attempts++;
      final solution = _generateValidPattern(size);
      if (solution == null) continue;

      final clues = _generateClues(solution, size);
      if (_hasUniqueSolution(clues, size)) {
        return {'grid': clues};
      }
    }

    // Fallback
    return {
      'grid': [
        [2, 0, -1, 3, 0],
        [-1, -1, -1, 0, -1],
        [1, -1, 2, -1, 2],
        [-1, -1, 0, -1, 0],
        [3, 0, 0, -1, -1],
      ],
    };
  }

  List<List<int>>? _generateValidPattern(int size) {
    // Start with all sea (-1) and try to place islands
    final grid = List.generate(size, (_) => List.filled(size, -1));
    int islandCount = size + _random.nextInt(2); // 5-6 islands for 5x5
    
    int placed = 0;
    int attempts = 0;
    while (placed < islandCount && attempts < 100) {
      attempts++;
      int r = _random.nextInt(size);
      int c = _random.nextInt(size);
      
      if (grid[r][c] != -1) continue;
      
      // Check if new island touches existing islands
      bool touches = false;
      for (var n in [[r-1, c], [r+1, c], [r, c-1], [r, c+1]]) {
        if (n[0] >= 0 && n[0] < size && n[1] >= 0 && n[1] < size) {
          if (grid[n[0]][n[1]] >= 0) {
            touches = true;
            break;
          }
        }
      }
      if (touches) continue;

      // Expand island to size 1-4
      int targetArea = 1 + _random.nextInt(4);
      final islandCells = [[r, c]];
      grid[r][c] = 0; // Temp island marker
      
      int currentArea = 1;
      int expandAttempts = 0;
      while (currentArea < targetArea && expandAttempts < 20) {
        expandAttempts++;
        var base = islandCells[_random.nextInt(islandCells.length)];
        final adj = [[base[0]-1, base[1]], [base[0]+1, base[1]], [base[0], base[1]-1], [base[0], base[1]+1]];
        adj.shuffle(_random);
        for (var n in adj) {
          int nr = n[0], nc = n[1];
          if (nr >= 0 && nr < size && nc >= 0 && nc < size && grid[nr][nc] == -1) {
            // Check if this expansion touches other islands
            bool touchesOther = false;
            for (var nn in [[nr-1, nc], [nr+1, nc], [nr, nc-1], [nr, nc+1]]) {
              if (nn[0] >= 0 && nn[0] < size && nn[1] >= 0 && nn[1] < size) {
                if (grid[nn[0]][nn[1]] >= 0 && !_isSameIsland(islandCells, nn)) {
                  touchesOther = true;
                  break;
                }
              }
            }
            if (!touchesOther) {
              grid[nr][nc] = 0;
              islandCells.add(n);
              currentArea++;
              break;
            }
          }
        }
      }
      placed++;
    }

    // Final checks
    if (!_isSeaConnected(grid, size)) return null;
    if (_has2x2Sea(grid, size)) return null;
    
    return grid;
  }

  bool _isSameIsland(List<List<int>> islandCells, List<int> pos) {
    for (var cell in islandCells) {
      if (cell[0] == pos[0] && cell[1] == pos[1]) return true;
    }
    return false;
  }

  bool _isSeaConnected(List<List<int>> grid, int size) {
    int startR = -1, startC = -1;
    int seaCount = 0;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == -1) {
          if (startR == -1) {
            startR = r;
            startC = c;
          }
          seaCount++;
        }
      }
    }
    if (seaCount == 0) return false;

    int found = 0;
    final visited = List.generate(size, (_) => List.filled(size, false));
    final stack = [[startR, startC]];
    visited[startR][startC] = true;
    while (stack.isNotEmpty) {
      var curr = stack.removeLast();
      found++;
      for (var n in [[curr[0]-1, curr[1]], [curr[0]+1, curr[1]], [curr[0], curr[1]-1], [curr[0], curr[1]+1]]) {
        if (n[0] >= 0 && n[0] < size && n[1] >= 0 && n[1] < size && !visited[n[0]][n[1]] && grid[n[0]][n[1]] == -1) {
          visited[n[0]][n[1]] = true;
          stack.add(n);
        }
      }
    }
    return found == seaCount;
  }

  bool _has2x2Sea(List<List<int>> grid, int size) {
    for (int r = 0; r < size - 1; r++) {
      for (int c = 0; c < size - 1; c++) {
        if (grid[r][c] == -1 && grid[r+1][c] == -1 && grid[r][c+1] == -1 && grid[r+1][c+1] == -1) return true;
      }
    }
    return false;
  }

  List<List<int>> _generateClues(List<List<int>> solution, int size) {
    final clues = List.generate(size, (r) => List<int>.from(solution[r]));
    final visited = List.generate(size, (_) => List.filled(size, false));
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (clues[r][c] == 0 && !visited[r][c]) {
          final islandCells = <Point<int>>[];
          final stack = [Point(r, c)];
          visited[r][c] = true;
          while (stack.isNotEmpty) {
            var curr = stack.removeLast();
            islandCells.add(curr);
            for (var n in [Point(curr.x-1, curr.y), Point(curr.x+1, curr.y), Point(curr.x, curr.y-1), Point(curr.x, curr.y+1)]) {
              if (n.x >= 0 && n.x < size && n.y >= 0 && n.y < size && !visited[n.x][n.y] && clues[n.x][n.y] == 0) {
                visited[n.x][n.y] = true;
                stack.add(n);
              }
            }
          }
          // Place clue in one of the cells
          var clueCell = islandCells[_random.nextInt(islandCells.length)];
          for (var cell in islandCells) {
            clues[cell.x][cell.y] = (cell == clueCell) ? islandCells.length : 0;
          }
        }
      }
    }
    return clues;
  }

  bool _hasUniqueSolution(List<List<int>> clues, int size) {
    int solutions = 0;
    
    void solve(int r, int c, List<List<int>> currentGrid) {
      if (solutions > 1) return;
      if (r == size) {
        if (checkVictoryWrapper({'grid': currentGrid})) solutions++;
        return;
      }
      
      int nextR = (c == size - 1) ? r + 1 : r;
      int nextC = (c == size - 1) ? 0 : c + 1;

      if (clues[r][c] > 0) {
        currentGrid[r][c] = clues[r][c];
        solve(nextR, nextC, currentGrid);
      } else {
        // Option 1: Sea
        currentGrid[r][c] = -1;
        if (_isPrunable(currentGrid, clues, size)) {
          // Pruned
        } else {
          solve(nextR, nextC, currentGrid);
        }

        // Option 2: Island (white)
        currentGrid[r][c] = 0;
        if (_isPrunable(currentGrid, clues, size)) {
          // Pruned
        } else {
          solve(nextR, nextC, currentGrid);
        }
      }
    }

    solve(0, 0, List.generate(size, (_) => List.filled(size, 0)));
    return solutions == 1;
  }

  bool _isPrunable(List<List<int>> grid, List<List<int>> clues, int size) {
    // 1. Check for 2x2 sea
    for (int r = 0; r < size - 1; r++) {
      for (int c = 0; c < size - 1; c++) {
        if (grid[r][c] == -1 && grid[r+1][c] == -1 && grid[r][c+1] == -1 && grid[r+1][c+1] == -1) return true;
      }
    }
    
    // 2. Check if any island area exceeds its clue
    // (This is hard because we don't know the final islands yet)
    
    return false;
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    final grid = params['grid'] as List<List<int>>; // -1: sea, 0+: island (0 is white, >0 is clue)
    final size = grid.length;

    // 1. All clues are in different islands
    // 2. Island area matches clue
    // 3. Sea is connected
    // 4. No 2x2 sea
    
    // Check 2x2 sea
    for (int r = 0; r < size - 1; r++) {
      for (int c = 0; c < size - 1; c++) {
        if (grid[r][c] == -1 && grid[r+1][c] == -1 && grid[r][c+1] == -1 && grid[r+1][c+1] == -1) {
          return false;
        }
      }
    }

    // Check islands
    List<List<bool>> visited = List.generate(size, (_) => List.filled(size, false));
    int totalIslandCells = 0;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] >= 0 && !visited[r][c]) {
          // New island
          List<List<int>> stack = [[r, c]];
          visited[r][c] = true;
          int area = 0;
          int clueCount = 0;
          int clueValue = -1;

          while (stack.isNotEmpty) {
            var curr = stack.removeLast();
            area++;
            int cr = curr[0], cc = curr[1];
            if (grid[cr][cc] > 0) {
              clueCount++;
              clueValue = grid[cr][cc];
            }
            
            final neighbors = [[cr-1, cc], [cr+1, cc], [cr, cc-1], [cr, cc+1]];
            for (var neighbor in neighbors) {
              int nr = neighbor[0], nc = neighbor[1];
              if (nr >= 0 && nr < size && nc >= 0 && nc < size && !visited[nr][nc] && grid[nr][nc] >= 0) {
                visited[nr][nc] = true;
                stack.add(neighbor);
              }
            }
          }
          
          if (clueCount != 1 || area != clueValue) return false;
          totalIslandCells += area;
        }
      }
    }

    // Check sea connectivity
    int startR = -1, startC = -1;
    int seaCount = 0;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == -1) {
          if (startR == -1) {
            startR = r;
            startC = c;
          }
          seaCount++;
        }
      }
    }
    
    if (seaCount + totalIslandCells != size * size) return false;
    if (seaCount == 0) return false;

    List<List<bool>> seaVisited = List.generate(size, (_) => List.filled(size, false));
    int foundSea = 0;
    List<List<int>> stack = [[startR, startC]];
    seaVisited[startR][startC] = true;
    while (stack.isNotEmpty) {
      var curr = stack.removeLast();
      foundSea++;
      int cr = curr[0], cc = curr[1];
      final neighbors = [[cr-1, cc], [cr+1, cc], [cr, cc-1], [cr, cc+1]];
      for (var n in neighbors) {
        if (n[0] >= 0 && n[0] < size && n[1] >= 0 && n[1] < size && !seaVisited[n[0]][n[1]] && grid[n[0]][n[1]] == -1) {
          seaVisited[n[0]][n[1]] = true;
          stack.add(n);
        }
      }
    }

    return foundSea == seaCount;
  }
}

