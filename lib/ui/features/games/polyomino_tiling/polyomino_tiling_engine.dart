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
  static PolyominoPuzzle generatePuzzle({math.Random? random}) {
    // 4x4 board tiled with four 4-omino (tetromino) pieces
    final pieces = [
      TileBlock(0, [[0, 0], [0, 1], [1, 0], [1, 1]], 0), // O piece
      TileBlock(1, [[0, 0], [0, 1], [0, 2], [0, 3]], 1), // I piece
      TileBlock(2, [[0, 0], [1, 0], [2, 0], [2, 1]], 2), // L piece
      TileBlock(3, [[0, 0], [1, 0], [1, 1], [2, 1]], 3), // Z piece
    ];

    return PolyominoPuzzle(
      rows: 4,
      cols: 4,
      pieces: pieces,
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
