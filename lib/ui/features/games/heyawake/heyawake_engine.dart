import 'dart:math' as math;

enum HeyawakeCellState { empty, white, black }

class HeyawakeRoom {
  final int id;
  final int startR;
  final int startC;
  final int endR; // inclusive
  final int endC; // inclusive
  final int? clue; // number of black cells in this room

  HeyawakeRoom({
    required this.id,
    required this.startR,
    required this.startC,
    required this.endR,
    required this.endC,
    this.clue,
  });

  bool contains(int r, int c) => r >= startR && r <= endR && c >= startC && c <= endC;
}

class HeyawakePuzzle {
  final int size;
  final List<HeyawakeRoom> rooms;
  final List<List<HeyawakeCellState>> grid;

  HeyawakePuzzle({
    required this.size,
    required this.rooms,
    required this.grid,
  });
}

class HeyawakeEngine {
  static const int defaultSize = 5;

  static HeyawakePuzzle generatePuzzle({int size = defaultSize, math.Random? random}) {
    // Partition 5x5 into 5 rectangular rooms
    final rooms = [
      HeyawakeRoom(id: 0, startR: 0, startC: 0, endR: 1, endC: 2, clue: 1),
      HeyawakeRoom(id: 1, startR: 0, startC: 3, endR: 2, endC: 4, clue: 2),
      HeyawakeRoom(id: 2, startR: 2, startC: 0, endR: 4, endC: 1, clue: 1),
      HeyawakeRoom(id: 3, startR: 2, startC: 2, endR: 3, endC: 2, clue: 0),
      HeyawakeRoom(id: 4, startR: 3, startC: 3, endR: 4, endC: 4, clue: 1),
    ];

    final grid = List.generate(size, (_) => List.generate(size, (_) => HeyawakeCellState.empty));

    return HeyawakePuzzle(
      size: size,
      rooms: rooms,
      grid: grid,
    );
  }

  static bool isSolved(List<List<HeyawakeCellState>> grid, List<HeyawakeRoom> rooms, int size) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == HeyawakeCellState.empty) return false;
      }
    }

    final isBlack = List.generate(size, (r) => List.generate(size, (c) => grid[r][c] == HeyawakeCellState.black));

    // Rule 1: No adjacent black cells orthogonally
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

    // Rule 2: All white cells must be connected
    if (!_allWhiteConnected(isBlack, size)) return false;

    // Rule 3: Room clues must match exact black cell count
    for (final room in rooms) {
      if (room.clue != null) {
        int count = 0;
        for (int r = room.startR; r <= room.endR; r++) {
          for (int c = room.startC; c <= room.endC; c++) {
            if (isBlack[r][c]) count++;
          }
        }
        if (count != room.clue) return false;
      }
    }

    return true;
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
}
