import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'minesweeper_engine.dart';

part 'minesweeper_provider.g.dart';

class MinesweeperState {
  final List<List<MinesweeperCell>> board;
  final bool isGameOver;
  final bool isWon;
  final int minesRemaining;
  final bool firstMove;

  MinesweeperState({
    required this.board,
    this.isGameOver = false,
    this.isWon = false,
    this.minesRemaining = 12,
    this.firstMove = true,
  });

  MinesweeperState copyWith({
    List<List<MinesweeperCell>>? board,
    bool? isGameOver,
    bool? isWon,
    int? minesRemaining,
    bool? firstMove,
  }) {
    return MinesweeperState(
      board: board ?? this.board,
      isGameOver: isGameOver ?? this.isGameOver,
      isWon: isWon ?? this.isWon,
      minesRemaining: minesRemaining ?? this.minesRemaining,
      firstMove: firstMove ?? this.firstMove,
    );
  }
}

@riverpod
class MinesweeperNotifier extends _$MinesweeperNotifier {
  late final MinesweeperEngine _engine;
  static const int rows = 10;
  static const int cols = 8;
  static const int totalMines = 12;

  @override
  MinesweeperState build() {
    _engine = MinesweeperEngine(rows: rows, cols: cols, mineCount: totalMines);
    return MinesweeperState(
      board: _engine.generateBoard(),
      minesRemaining: totalMines,
    );
  }

  void reset() {
    state = MinesweeperState(
      board: _engine.generateBoard(),
      minesRemaining: totalMines,
    );
  }

  void revealCell(int r, int c) {
    if (state.isGameOver || state.isWon) return;
    if (state.board[r][c].state != CellState.hidden) return;

    List<List<MinesweeperCell>> newBoard = List.generate(
      rows,
      (i) => List.generate(cols, (j) => state.board[i][j].copyWith()),
    );

    if (state.firstMove) {
      // Regenerate board to ensure first click is never a mine and has 0 neighbors if possible
      newBoard = _engine.generateBoard(startRow: r, startCol: c);
      state = state.copyWith(firstMove: false);
    }

    if (newBoard[r][c].isMine) {
      // Game Over
      for (var row in newBoard) {
        for (var cell in row) {
          if (cell.isMine) cell.state = CellState.revealed;
        }
      }
      state = state.copyWith(board: newBoard, isGameOver: true);
      return;
    }

    _engine.revealEmptyCells(newBoard, r, c);
    
    final isWon = _engine.checkWin(newBoard);
    state = state.copyWith(board: newBoard, isWon: isWon);

    if (isWon) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('minesweeper', xpAmount: 30);
    }
  }

  void toggleFlag(int r, int c) {
    if (state.isGameOver || state.isWon) return;
    if (state.board[r][c].state == CellState.revealed) return;

    final newBoard = List.generate(
      rows,
      (i) => List.generate(cols, (j) => state.board[i][j].copyWith()),
    );

    final currentCell = newBoard[r][c];
    int mineAdjustment = 0;

    if (currentCell.state == CellState.hidden) {
      currentCell.state = CellState.flagged;
      mineAdjustment = -1;
    } else if (currentCell.state == CellState.flagged) {
      currentCell.state = CellState.hidden;
      mineAdjustment = 1;
    }

    state = state.copyWith(
      board: newBoard,
      minesRemaining: state.minesRemaining + mineAdjustment,
    );
  }
}
