import 'dart:math';

class SlidePuzzleEngine {
  static const int size = 4; // 4x4 grid
  final Random _random = Random();

  List<int> generateSolvableBoard() {
    // Start with a solved board: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0]
    List<int> board = List.generate(size * size - 1, (i) => i + 1)..add(0);

    // Perform random valid moves to shuffle. 
    // This guaranteed the board is solvable.
    int emptyPos = size * size - 1;
    for (int i = 0; i < 200; i++) {
      List<int> moves = _getValidMoves(emptyPos);
      int move = moves[_random.nextInt(moves.length)];
      
      // Swap
      board[emptyPos] = board[move];
      board[move] = 0;
      emptyPos = move;
    }

    return board;
  }

  List<int> _getValidMoves(int emptyPos) {
    List<int> moves = [];
    int row = emptyPos ~/ size;
    int col = emptyPos % size;

    if (row > 0) moves.add(emptyPos - size); // Up
    if (row < size - 1) moves.add(emptyPos + size); // Down
    if (col > 0) moves.add(emptyPos - 1); // Left
    if (col < size - 1) moves.add(emptyPos + 1); // Right

    return moves;
  }

  bool isSolved(List<int> board) {
    for (int i = 0; i < board.length - 1; i++) {
      if (board[i] != i + 1) return false;
    }
    return board.last == 0;
  }

  bool canMove(int pos, int emptyPos) {
    int row = pos ~/ size;
    int col = pos % size;
    int eRow = emptyPos ~/ size;
    int eCol = emptyPos % size;

    return (row == eRow && (col - eCol).abs() == 1) ||
           (col == eCol && (row - eRow).abs() == 1);
  }
}
