import 'dart:math' as math;

class TileBlock {
  final int id;
  final List<List<int>> coords; // relative 2D offsets
  final int colorIndex;

  TileBlock(this.id, this.coords, this.colorIndex);
}

class PolyominoPuzzle {
  final int rows;
  final int cols;
  final List<TileBlock> pieces;

  PolyominoPuzzle({
    required this.rows,
    required this.cols,
    required this.pieces,
  });
}

class PolyominoTilingEngine {
  static const int boardRows = 4;
  static const int boardCols = 4;
  static const int totalCells = boardRows * boardCols;

  static PolyominoPuzzle generatePuzzle({math.Random? random}) {
    final rng = random ?? math.Random();
    
    for (int attempt = 0; attempt < 500; attempt++) {
      final puzzle = _tryGenerate(rng);
      if (puzzle != null) {
        return puzzle;
      }
    }

    return PolyominoPuzzle(
      rows: boardRows,
      cols: boardCols,
      pieces: [
        TileBlock(0, [[0, 0], [0, 1], [1, 0], [1, 1]], 0),
        TileBlock(1, [[0, 0], [0, 1], [0, 2], [0, 3]], 1),
        TileBlock(2, [[0, 0], [1, 0], [2, 0], [2, 1]], 2),
        TileBlock(3, [[0, 1], [1, 1], [2, 1], [2, 0]], 3),
      ],
    );
  }

  static PolyominoPuzzle? _tryGenerate(math.Random rng) {
    final grid = List.filled(totalCells, -1);
    final List<List<List<int>>> rawPieces = [];

    final targetSizes = [3, 4, 4, 5]..shuffle(rng);
    int pieceId = 0;

    for (int r = 0; r < boardRows; r++) {
      for (int c = 0; c < boardCols; c++) {
        final startIdx = r * boardCols + c;
        if (grid[startIdx] != -1) continue;

        int desiredSize = (pieceId < targetSizes.length)
            ? targetSizes[pieceId]
            : (totalCells - rawPieces.fold<int>(0, (sum, p) => sum + p.length));
        
        final remainingCells = grid.where((v) => v == -1).length;
        if (desiredSize > remainingCells) {
          desiredSize = remainingCells;
        }
        if (desiredSize < 2) return null;

        final pieceCells = <int>[startIdx];
        grid[startIdx] = pieceId;

        while (pieceCells.length < desiredSize) {
          final neighbors = <int>{};
          for (final cell in pieceCells) {
            final cr = cell ~/ boardCols;
            final cc = cell % boardCols;
            if (cr > 0 && grid[(cr - 1) * boardCols + cc] == -1) {
              neighbors.add((cr - 1) * boardCols + cc);
            }
            if (cr < boardRows - 1 && grid[(cr + 1) * boardCols + cc] == -1) {
              neighbors.add((cr + 1) * boardCols + cc);
            }
            if (cc > 0 && grid[cr * boardCols + (cc - 1)] == -1) {
              neighbors.add(cr * boardCols + (cc - 1));
            }
            if (cc < boardCols - 1 && grid[cr * boardCols + (cc + 1)] == -1) {
              neighbors.add(cr * boardCols + (cc + 1));
            }
          }

          if (neighbors.isEmpty) break;
          final nextCell = neighbors.elementAt(rng.nextInt(neighbors.length));
          grid[nextCell] = pieceId;
          pieceCells.add(nextCell);
        }

        if (pieceCells.length < 2) return null;

        final coords = pieceCells.map((idx) => [idx ~/ boardCols, idx % boardCols]).toList();
        rawPieces.add(coords);
        pieceId++;
      }
    }

    if (rawPieces.length < 3 || rawPieces.length > 5) return null;
    if (grid.contains(-1)) return null;

    final normalizedPieces = <TileBlock>[];
    for (int i = 0; i < rawPieces.length; i++) {
      var coords = rawPieces[i];
      int minR = coords.map((pt) => pt[0]).reduce(math.min);
      int minC = coords.map((pt) => pt[1]).reduce(math.min);
      var normalized = coords.map((pt) => [pt[0] - minR, pt[1] - minC]).toList();

      final rotations = rng.nextInt(4);
      for (int rot = 0; rot < rotations; rot++) {
        normalized = normalized.map((pt) => [pt[1], -pt[0]]).toList();
        int nr = normalized.map((pt) => pt[0]).reduce(math.min);
        int nc = normalized.map((pt) => pt[1]).reduce(math.min);
        normalized = normalized.map((pt) => [pt[0] - nr, pt[1] - nc]).toList();
      }

      normalizedPieces.add(TileBlock(i, normalized, i));
    }

    normalizedPieces.shuffle(rng);
    final reindexedPieces = <TileBlock>[];
    for (int i = 0; i < normalizedPieces.length; i++) {
      reindexedPieces.add(TileBlock(i, normalizedPieces[i].coords, i));
    }

    return PolyominoPuzzle(
      rows: boardRows,
      cols: boardCols,
      pieces: reindexedPieces,
    );
  }

  static bool isSolved(List<List<int?>> grid, int rows, int cols) {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == null) return false;
      }
    }
    return true;
  }
}
