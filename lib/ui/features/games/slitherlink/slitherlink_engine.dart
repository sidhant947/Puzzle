import 'dart:math';

class SlitherlinkLevel {
  final int size;
  final List<List<int?>> clues;
  final List<List<bool>> solutionHEdges;
  final List<List<bool>> solutionVEdges;

  SlitherlinkLevel({
    required this.size,
    required this.clues,
    required this.solutionHEdges,
    required this.solutionVEdges,
  });
}

class SlitherlinkEngine {
  final Random _random = Random();

  SlitherlinkLevel generateLevel({int size = 3}) {
    while (true) {
      final result = _tryGenerate(size);
      if (result != null) return result;
    }
  }

  SlitherlinkLevel? _tryGenerate(int size) {
    final cells = List.generate(size, (_) => List.filled(size, false));
    _generateConnectedCellSubset(cells, size);

    final hEdges = List.generate(size + 1, (_) => List.filled(size, false));
    final vEdges = List.generate(size, (_) => List.filled(size + 1, false));

    for (int r = 0; r <= size; r++) {
      for (int c = 0; c < size; c++) {
        if ((r > 0 ? cells[r - 1][c] : false) != (r < size ? cells[r][c] : false)) {
          hEdges[r][c] = true;
        }
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c <= size; c++) {
        if ((c > 0 ? cells[r][c - 1] : false) != (c < size ? cells[r][c] : false)) {
          vEdges[r][c] = true;
        }
      }
    }

    if (!isValidSingleLoop(size, hEdges, vEdges)) return null;

    final clues = List.generate(size, (r) => List<int?>.filled(size, null));
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        int count = 0;
        if (hEdges[r][c]) count++;
        if (hEdges[r + 1][c]) count++;
        if (vEdges[r][c]) count++;
        if (vEdges[r][c + 1]) count++;
        clues[r][c] = count;
      }
    }

    final positions = [
      for (int r = 0; r < size; r++)
        for (int c = 0; c < size; c++) [r, c]
    ]..shuffle(_random);

    for (final pos in positions) {
      final r = pos[0], c = pos[1];
      if (clues[r][c] == null || clues[r][c] == 0) continue;

      final backup = clues[r][c];
      clues[r][c] = null;

      if (_countSolutions(size, clues) != 1) {
        clues[r][c] = backup;
      }
    }

    return SlitherlinkLevel(
      size: size,
      clues: clues,
      solutionHEdges: hEdges,
      solutionVEdges: vEdges,
    );
  }

  int _countSolutions(int size, List<List<int?>> clues) {
    final numH = (size + 1) * size;
    final numV = size * (size + 1);
    final totalEdges = numH + numV;
    final hEdges = List.filled(numH, -1);
    final vEdges = List.filled(numV, -1);

    int getH(int r, int c) => hEdges[r * size + c];
    void setH(int r, int c, int val) => hEdges[r * size + c] = val;
    int getV(int r, int c) => vEdges[r * (size + 1) + c];
    void setV(int r, int c, int val) => vEdges[r * (size + 1) + c] = val;

    bool isVertexValid(int r, int c) {
      int on = 0;
      int unset = 0;
      void tally(int val) {
        if (val == 1) {
          on++;
        } else if (val == -1) {
          unset++;
        }
      }

      if (r > 0) {
        tally(getV(r - 1, c));
      }
      if (r < size) {
        tally(getV(r, c));
      }
      if (c > 0) {
        tally(getH(r, c - 1));
      }
      if (c < size) {
        tally(getH(r, c));
      }

      if (on > 2) {
        return false;
      }
      if (on == 1 && unset == 0) {
        return false;
      }
      return true;
    }

    bool isCellValid(int r, int c) {
      final clue = clues[r][c];
      if (clue == null) {
        return true;
      }
      int on = 0;
      int unset = 0;
      void tally(int val) {
        if (val == 1) {
          on++;
        } else if (val == -1) {
          unset++;
        }
      }

      tally(getH(r, c));
      tally(getH(r + 1, c));
      tally(getV(r, c));
      tally(getV(r, c + 1));

      if (on > clue) {
        return false;
      }
      if (on + unset < clue) {
        return false;
      }
      return true;
    }

    bool isSolvedLoop() {
      int activeEdges = 0;
      for (var val in hEdges) {
        if (val == 1) activeEdges++;
      }
      for (var val in vEdges) {
        if (val == 1) activeEdges++;
      }
      if (activeEdges == 0) return false;

      int startR = -1;
      int startC = -1;
      for (int r = 0; r <= size; r++) {
        for (int c = 0; c <= size; c++) {
          int deg = 0;
          if (r > 0 && getV(r - 1, c) == 1) deg++;
          if (r < size && getV(r, c) == 1) deg++;
          if (c > 0 && getH(r, c - 1) == 1) deg++;
          if (c < size && getH(r, c) == 1) deg++;
          if (deg != 0 && deg != 2) return false;
          if (deg == 2 && startR == -1) {
            startR = r;
            startC = c;
          }
        }
      }

      if (startR == -1) return false;

      int visited = 0;
      int cr = startR;
      int cc = startC;
      int pr = -1;
      int pc = -1;

      do {
        int nr = -1;
        int nc = -1;
        if (cr > 0 && getV(cr - 1, cc) == 1 && !(cr - 1 == pr && cc == pc)) {
          nr = cr - 1;
          nc = cc;
        } else if (cr < size && getV(cr, cc) == 1 && !(cr + 1 == pr && cc == pc)) {
          nr = cr + 1;
          nc = cc;
        } else if (cc > 0 && getH(cr, cc - 1) == 1 && !(cr == pr && cc - 1 == pc)) {
          nr = cr;
          nc = cc - 1;
        } else if (cc < size && getH(cr, cc) == 1 && !(cr == pr && cc + 1 == pc)) {
          nr = cr;
          nc = cc + 1;
        }

        if (nr == -1) return false;
        visited++;
        pr = cr;
        pc = cc;
        cr = nr;
        cc = nc;
      } while (cr != startR || cc != startC);

      return visited == activeEdges;
    }

    int solve(int edgeIndex, int count) {
      if (count >= 2) return count;

      if (edgeIndex == totalEdges) {
        if (isSolvedLoop()) return count + 1;
        return count;
      }

      final isH = edgeIndex < numH;
      final idx = isH ? edgeIndex : edgeIndex - numH;
      final r = isH ? idx ~/ size : idx ~/ (size + 1);
      final c = isH ? idx % size : idx % (size + 1);

      final vr1 = r;
      final vc1 = c;
      final vr2 = isH ? r : r + 1;
      final vc2 = isH ? c + 1 : c;

      for (final val in [0, 1]) {
        if (isH) {
          setH(r, c, val);
        } else {
          setV(r, c, val);
        }

        if (!isVertexValid(vr1, vc1) || !isVertexValid(vr2, vc2)) {
          continue;
        }

        bool cellsValid = true;
        if (isH) {
          if (r > 0 && !isCellValid(r - 1, c)) cellsValid = false;
          if (cellsValid && r < size && !isCellValid(r, c)) cellsValid = false;
        } else {
          if (c > 0 && !isCellValid(r, c - 1)) cellsValid = false;
          if (cellsValid && c < size && !isCellValid(r, c)) cellsValid = false;
        }

        if (cellsValid) {
          count = solve(edgeIndex + 1, count);
          if (count >= 2) break;
        }
      }

      if (isH) {
        setH(r, c, -1);
      } else {
        setV(r, c, -1);
      }

      return count;
    }

    return solve(0, 0);
  }

  void _generateConnectedCellSubset(List<List<bool>> cells, int size) {
    final startR = _random.nextInt(size);
    final startC = _random.nextInt(size);
    cells[startR][startC] = true;

    final targetSize = 2 + _random.nextInt(size * size - 3);
    var currentSize = 1;

    final List<Point<int>> frontier = [];
    void addNeighbors(int r, int c) {
      for (var d in [Point(0, 1), Point(1, 0), Point(0, -1), Point(-1, 0)]) {
        final nr = r + d.y;
        final nc = c + d.x;
        if (nr >= 0 && nr < size && nc >= 0 && nc < size && !cells[nr][nc]) {
          final pt = Point(nc, nr);
          if (!frontier.contains(pt)) frontier.add(pt);
        }
      }
    }

    addNeighbors(startR, startC);

    while (currentSize < targetSize && frontier.isNotEmpty) {
      final index = _random.nextInt(frontier.length);
      final nextCell = frontier.removeAt(index);
      cells[nextCell.y][nextCell.x] = true;
      currentSize++;
      addNeighbors(nextCell.y, nextCell.x);
    }
  }

  bool isValidSingleLoop(int size, List<List<bool>> hEdges, List<List<bool>> vEdges) {
    final degrees = List.generate(size + 1, (_) => List.filled(size + 1, 0));
    int totalActiveEdges = 0;

    for (int r = 0; r <= size; r++) {
      for (int c = 0; c < size; c++) {
        if (hEdges[r][c]) {
          degrees[r][c]++;
          degrees[r][c + 1]++;
          totalActiveEdges++;
        }
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c <= size; c++) {
        if (vEdges[r][c]) {
          degrees[r][c]++;
          degrees[r + 1][c]++;
          totalActiveEdges++;
        }
      }
    }

    if (totalActiveEdges == 0) return false;

    Point<int>? startVertex;
    for (int r = 0; r <= size; r++) {
      for (int c = 0; c <= size; c++) {
        final deg = degrees[r][c];
        if (deg != 0 && deg != 2) return false;
        if (deg == 2 && startVertex == null) startVertex = Point(c, r);
      }
    }

    if (startVertex == null) return false;

    int visitedEdges = 0;
    var current = startVertex;
    Point<int>? prev;

    do {
      Point<int>? next;
      if (current.y > 0 && vEdges[current.y - 1][current.x]) {
        final candidate = Point(current.x, current.y - 1);
        if (candidate != prev) next = candidate;
      }
      if (current.y < size && vEdges[current.y][current.x]) {
        final candidate = Point(current.x, current.y + 1);
        if (candidate != prev && next == null) next = candidate;
      }
      if (current.x > 0 && hEdges[current.y][current.x - 1]) {
        final candidate = Point(current.x - 1, current.y);
        if (candidate != prev && next == null) next = candidate;
      }
      if (current.x < size && hEdges[current.y][current.x]) {
        final candidate = Point(current.x + 1, current.y);
        if (candidate != prev && next == null) next = candidate;
      }

      if (next == null) return false;
      visitedEdges++;
      prev = current;
      current = next;
    } while (current != startVertex);

    return visitedEdges == totalActiveEdges;
  }
}
