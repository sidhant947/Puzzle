import 'dart:math' as math;
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/polyomino_tiling/polyomino_tiling_engine.dart';

void main() {
  group('PolyominoTilingEngine', () {
    test('generatePuzzle creates a valid 4x4 puzzle with 16 total cells', () {
      final puzzle = PolyominoTilingEngine.generatePuzzle();
      expect(puzzle.rows, 4);
      expect(puzzle.cols, 4);
      expect(puzzle.pieces.length, greaterThanOrEqualTo(3));
      expect(puzzle.pieces.length, lessThanOrEqualTo(5));

      int totalCells = 0;
      for (final piece in puzzle.pieces) {
        expect(piece.coords.length, greaterThanOrEqualTo(2));
        totalCells += piece.coords.length;
      }
      expect(totalCells, 16);
    });

    test('randomly generated puzzles are always solvable', () {
      List<List<int>> rotate(List<List<int>> c) {
        var res = c.map((pt) => [pt[1], -pt[0]]).toList();
        int minR = res.map((pt) => pt[0]).reduce((a, b) => a < b ? a : b);
        int minC = res.map((pt) => pt[1]).reduce((a, b) => a < b ? a : b);
        return res.map((pt) => [pt[0] - minR, pt[1] - minC]).toList();
      }

      List<List<List<int>>> getAllOrientations(List<List<int>> c) {
        Map<String, List<List<int>>> unique = {};
        var curr = c;
        for (int i = 0; i < 4; i++) {
          var sorted = curr.map((p) => [p[0], p[1]]).toList();
          sorted.sort((a, b) => a[0] != b[0] ? a[0].compareTo(b[0]) : a[1].compareTo(b[1]));
          var key = sorted.map((p) => "${p[0]},${p[1]}").join(";");
          unique[key] = sorted;
          curr = rotate(curr);
        }
        return unique.values.toList();
      }

      for (int seed = 0; seed < 20; seed++) {
        final puzzle = PolyominoTilingEngine.generatePuzzle(random: math.Random(seed));
        final pieceDefs = puzzle.pieces.map((p) => p.coords).toList();
        final orientations = pieceDefs.map((p) => getAllOrientations(p)).toList();
        final List<int> board = List.filled(16, -1);

        bool canTile(int pieceIdx) {
          if (pieceIdx == pieceDefs.length) {
            return !board.contains(-1);
          }

          for (final ori in orientations[pieceIdx]) {
            int maxR = ori.map((p) => p[0]).reduce(math.max);
            int maxC = ori.map((p) => p[1]).reduce(math.max);

            for (int r = 0; r <= 4 - 1 - maxR; r++) {
              for (int c = 0; c <= 4 - 1 - maxC; c++) {
                bool canPlace = true;
                for (final pt in ori) {
                  int br = r + pt[0];
                  int bc = c + pt[1];
                  if (board[br * 4 + bc] != -1) {
                    canPlace = false;
                    break;
                  }
                }
                if (canPlace) {
                  for (final pt in ori) {
                    board[(r + pt[0]) * 4 + (c + pt[1])] = pieceIdx;
                  }
                  if (canTile(pieceIdx + 1)) return true;
                  for (final pt in ori) {
                    board[(r + pt[0]) * 4 + (c + pt[1])] = -1;
                  }
                }
              }
            }
          }
          return false;
        }

        expect(canTile(0), isTrue, reason: 'Puzzle with seed $seed should be solvable');
      }
    });

    test('isSolved returns true only when full grid is filled', () {
      List<List<int?>> grid = List.generate(4, (_) => List.generate(4, (_) => 1));
      expect(PolyominoTilingEngine.isSolved(grid, 4, 4), isTrue);

      grid[3][3] = null;
      expect(PolyominoTilingEngine.isSolved(grid, 4, 4), isFalse);
    });
  });
}
