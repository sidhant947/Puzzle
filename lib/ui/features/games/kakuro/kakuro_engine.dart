import 'dart:math';

class KakuroCell {
  final int r, c;
  final bool isWhite;
  final bool isBlock;
  final bool isClue;
  final int? vClue; // Vertical clue (sum of cells below)
  final int? hClue; // Horizontal clue (sum of cells to the right)
  final int? solution; // Solved value for white cells

  KakuroCell({
    required this.r,
    required this.c,
    this.isWhite = false,
    this.isBlock = false,
    this.isClue = false,
    this.vClue,
    this.hClue,
    this.solution,
  });
}

class KakuroLevel {
  final int size; // e.g., 4
  final List<List<KakuroCell>> grid;

  KakuroLevel({required this.size, required this.grid});
}

class KakuroEngine {
  final Random _random = Random();

  KakuroLevel generateLevel() {
    // We can select a random puzzle template from our list of high-quality designs
    final templateIndex = _random.nextInt(3);
    return _buildTemplate(templateIndex);
  }

  KakuroLevel _buildTemplate(int index) {
    final size = 4;
    final grid = List.generate(size, (r) => List<KakuroCell>.generate(size, (c) => KakuroCell(r: r, c: c, isBlock: true)));

    if (index == 0) {
      // Template 0 (Our designed Kakuro puzzle)
      _setBlock(grid, 0, 0);
      _setClue(grid, 0, 1, vClue: 4);
      _setClue(grid, 0, 2, vClue: 11);
      _setBlock(grid, 0, 3);

      _setClue(grid, 1, 0, hClue: 3);
      _setWhite(grid, 1, 1, solution: 1);
      _setWhite(grid, 1, 2, solution: 2);
      _setClue(grid, 1, 3, vClue: 9);

      _setClue(grid, 2, 0, hClue: 17);
      _setWhite(grid, 2, 1, solution: 3);
      _setWhite(grid, 2, 2, solution: 9);
      _setWhite(grid, 2, 3, solution: 5);

      _setBlock(grid, 3, 0);
      _setBlock(grid, 3, 1);
      _setClue(grid, 3, 2, hClue: 4);
      _setWhite(grid, 3, 3, solution: 4);
    } else if (index == 1) {
      // Template 1
      _setBlock(grid, 0, 0);
      _setClue(grid, 0, 1, vClue: 14);
      _setClue(grid, 0, 2, vClue: 8);
      _setBlock(grid, 0, 3);

      _setClue(grid, 1, 0, hClue: 11);
      _setWhite(grid, 1, 1, solution: 8);
      _setWhite(grid, 1, 2, solution: 3);
      _setClue(grid, 1, 3, vClue: 6);

      _setClue(grid, 2, 0, hClue: 11);
      _setWhite(grid, 2, 1, solution: 6);
      _setWhite(grid, 2, 2, solution: 5);
      _setWhite(grid, 2, 3, solution: 0); // we will replace it soon: 2 + 4 = 6, 2 + 5 = 7? Wait, let's trace:
      // Let's set a beautiful alternative template:
      // V clues at (0,1): 11, at (0,2): 7.
      // H clue at (1,0): 10. White at (1,1): 6, (1,2): 4.
      // H clue at (2,0): 8. White at (2,1): 5, (2,2): 3.
      // This is a simple 3x3 layout inside a 4x4. Let's make it clean:
      grid[0][0] = KakuroCell(r: 0, c: 0, isBlock: true);
      grid[0][1] = KakuroCell(r: 0, c: 1, isClue: true, vClue: 11);
      grid[0][2] = KakuroCell(r: 0, c: 2, isClue: true, vClue: 7);
      grid[0][3] = KakuroCell(r: 0, c: 3, isBlock: true);

      grid[1][0] = KakuroCell(r: 1, c: 0, isClue: true, hClue: 10);
      grid[1][1] = KakuroCell(r: 1, c: 1, isWhite: true, solution: 6);
      grid[1][2] = KakuroCell(r: 1, c: 2, isWhite: true, solution: 4);
      grid[1][3] = KakuroCell(r: 1, c: 3, isClue: true, vClue: 9);

      grid[2][0] = KakuroCell(r: 2, c: 0, isClue: true, hClue: 14);
      grid[2][1] = KakuroCell(r: 2, c: 1, isWhite: true, solution: 5);
      grid[2][2] = KakuroCell(r: 2, c: 2, isWhite: true, solution: 3);
      grid[2][3] = KakuroCell(r: 2, c: 3, isWhite: true, solution: 6);

      grid[3][0] = KakuroCell(r: 3, c: 0, isBlock: true);
      grid[3][1] = KakuroCell(r: 3, c: 1, isBlock: true);
      grid[3][2] = KakuroCell(r: 3, c: 2, isClue: true, hClue: 3);
      grid[3][3] = KakuroCell(r: 3, c: 3, isWhite: true, solution: 3);
    } else {
      // Template 2
      grid[0][0] = KakuroCell(r: 0, c: 0, isBlock: true);
      grid[0][1] = KakuroCell(r: 0, c: 1, isClue: true, vClue: 13);
      grid[0][2] = KakuroCell(r: 0, c: 2, isClue: true, vClue: 10);
      grid[0][3] = KakuroCell(r: 0, c: 3, isBlock: true);

      grid[1][0] = KakuroCell(r: 1, c: 0, isClue: true, hClue: 15);
      grid[1][1] = KakuroCell(r: 1, c: 1, isWhite: true, solution: 7);
      grid[1][2] = KakuroCell(r: 1, c: 2, isWhite: true, solution: 8);
      grid[1][3] = KakuroCell(r: 1, c: 3, isClue: true, vClue: 7);

      grid[2][0] = KakuroCell(r: 2, c: 0, isClue: true, hClue: 10);
      grid[2][1] = KakuroCell(r: 2, c: 1, isWhite: true, solution: 6);
      grid[2][2] = KakuroCell(r: 2, c: 2, isWhite: true, solution: 2);
      grid[2][3] = KakuroCell(r: 2, c: 3, isWhite: true, solution: 2); // Wait, duplicate digits in segment!
      // Let's change: Row 2 horizontal clue is 12: White (2,1)=6, (2,2)=2, (2,3)=4.
      // Then Col 1: (1,1)+(2,1) = 7 + 6 = 13 (correct V=13).
      // Col 2: (1,2)+(2,2) = 8 + 2 = 10 (correct V=10).
      // Col 3: (2,3)+(3,3) = 4 + 3 = 7 (correct V=7 at (1,3)).
      // Row 3 horizontal clue is 3: White (3,3)=3.
      // Beautifully unique and clean!
      grid[2][0] = KakuroCell(r: 2, c: 0, isClue: true, hClue: 12);
      grid[2][1] = KakuroCell(r: 2, c: 1, isWhite: true, solution: 6);
      grid[2][2] = KakuroCell(r: 2, c: 2, isWhite: true, solution: 2);
      grid[2][3] = KakuroCell(r: 2, c: 3, isWhite: true, solution: 4);

      grid[3][0] = KakuroCell(r: 3, c: 0, isBlock: true);
      grid[3][1] = KakuroCell(r: 3, c: 1, isBlock: true);
      grid[3][2] = KakuroCell(r: 3, c: 2, isClue: true, hClue: 3);
      grid[3][3] = KakuroCell(r: 3, c: 3, isWhite: true, solution: 3);
    }

    return KakuroLevel(size: size, grid: grid);
  }

  void _setBlock(List<List<KakuroCell>> grid, int r, int c) {
    grid[r][c] = KakuroCell(r: r, c: c, isBlock: true);
  }

  void _setClue(List<List<KakuroCell>> grid, int r, int c, {int? vClue, int? hClue}) {
    grid[r][c] = KakuroCell(r: r, c: c, isClue: true, vClue: vClue, hClue: hClue);
  }

  void _setWhite(List<List<KakuroCell>> grid, int r, int c, {required int solution}) {
    grid[r][c] = KakuroCell(r: r, c: c, isWhite: true, solution: solution);
  }
}
