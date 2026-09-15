import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/heyawake/heyawake_engine.dart';

void main() {
  group('HeyawakeEngine', () {
    test('generatePuzzle covers all grid cells in rooms', () {
      final puzzle = HeyawakeEngine.generatePuzzle();
      expect(puzzle.size, 5);
      for (int r = 0; r < puzzle.size; r++) {
        for (int c = 0; c < puzzle.size; c++) {
          final roomsContainingCell = puzzle.rooms.where((rm) => rm.contains(r, c));
          expect(roomsContainingCell.length, 1, reason: 'Cell ($r, $c) must be contained in exactly one room');
        }
      }
    });

    test('isSolved returns true for valid solved grid', () {
      final puzzle = HeyawakeEngine.generatePuzzle();
      final size = puzzle.size;
      final grid = List.generate(size, (_) => List.generate(size, (_) => HeyawakeCellState.white));

      grid[0][0] = HeyawakeCellState.black;
      grid[0][4] = HeyawakeCellState.black;
      grid[2][4] = HeyawakeCellState.black;
      grid[4][0] = HeyawakeCellState.black;
      grid[4][4] = HeyawakeCellState.black;

      expect(HeyawakeEngine.isSolved(grid, puzzle.rooms, size), isTrue);
    });
  });
}
