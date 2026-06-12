import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/slide_puzzle/slide_puzzle_engine.dart';

void main() {
  group('SlidePuzzleEngine', () {
    late SlidePuzzleEngine engine;

    setUp(() {
      engine = SlidePuzzleEngine();
    });

    group('generateSolvableBoard', () {
      test('returns a board of correct size (16 elements)', () {
        final board = engine.generateSolvableBoard();
        expect(board.length, 16);
      });

      test('board contains values 0-15 exactly once', () {
        final board = engine.generateSolvableBoard();
        final sorted = List<int>.from(board)..sort();
        expect(sorted, List<int>.generate(16, (i) => i));
      });

      test('board is not already solved', () {
        final board = engine.generateSolvableBoard();
        final solved = List<int>.generate(15, (i) => i + 1)..add(0);
        expect(board, isNot(equals(solved)));
      });

      test('generates different boards on multiple calls', () {
        final b1 = engine.generateSolvableBoard();
        final b2 = engine.generateSolvableBoard();
        expect(b1, isNot(equals(b2)));
      });
    });

    group('isSolved', () {
      test('returns true for solved board', () {
        final solved = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];
        expect(engine.isSolved(solved), isTrue);
      });

      test('returns false for unsolved board', () {
        final unsolved = [2, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];
        expect(engine.isSolved(unsolved), isFalse);
      });

      test('returns false when 0 is not at the end', () {
        final board = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 0, 15];
        expect(engine.isSolved(board), isFalse);
      });

      test('returns false for empty trailing zero with wrong order', () {
        final board = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0, 15, 14];
        expect(engine.isSolved(board), isFalse);
      });
    });

    group('canMove', () {
      test('returns true for adjacent position in same row (left)', () {
        // pos=1 (row 0, col 1), emptyPos=0 (row 0, col 0)
        expect(engine.canMove(1, 0), isTrue);
      });

      test('returns true for adjacent position in same row (right)', () {
        expect(engine.canMove(0, 1), isTrue);
      });

      test('returns true for adjacent position in same column (up)', () {
        // pos=4 (row 1, col 0), emptyPos=0 (row 0, col 0)
        expect(engine.canMove(4, 0), isTrue);
      });

      test('returns true for adjacent position in same column (down)', () {
        expect(engine.canMove(0, 4), isTrue);
      });

      test('returns false for diagonal position', () {
        // pos=5 (row 1, col 1), emptyPos=0 (row 0, col 0)
        expect(engine.canMove(5, 0), isFalse);
      });

      test('returns false for non-adjacent in same row', () {
        expect(engine.canMove(0, 2), isFalse);
      });

      test('returns false for non-adjacent in same column', () {
        expect(engine.canMove(0, 8), isFalse);
      });

      test('returns true for right edge adjacency', () {
        // pos=3 (row 0, col 3), emptyPos=4 (row 1, col 0) - not adjacent
        expect(engine.canMove(3, 4), isFalse);
        // pos=3 (row 0, col 3), emptyPos=2 (row 0, col 2) - adjacent
        expect(engine.canMove(3, 2), isTrue);
      });
    });
  });
}
