import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'minesweeper_engine.dart';

part 'minesweeper_provider.g.dart';

enum GameStatus { playing, won, lost }

class MinesweeperState {
  final List<List<MinesweeperCell>> board;
  final GameStatus status;
  final int rows;
  final int cols;
  final int mines;

  MinesweeperState({
    required this.board,
    required this.status,
    required this.rows,
    required this.cols,
    required this.mines,
  });

  MinesweeperState copyWith({
    List<List<MinesweeperCell>>? board,
    GameStatus? status,
  }) {
    return MinesweeperState(
      board: board ?? this.board,
      status: status ?? this.status,
      rows: rows,
      cols: cols,
      mines: mines,
    );
  }
}

@riverpod
class MinesweeperNotifier extends _$MinesweeperNotifier {
  @override
  MinesweeperState build() {
    const rows = 9;
    const cols = 9;
    const mines = 10;
    final engine = MinesweeperEngine(rows: rows, cols: cols, mines: mines);
    return MinesweeperState(
      board: engine.generateBoard(),
      status: GameStatus.playing,
      rows: rows,
      cols: cols,
      mines: mines,
    );
  }

  void revealCell(int r, int c) {
    if (state.status != GameStatus.playing) return;
    if (state.board[r][c].isRevealed || state.board[r][c].isFlagged) return;

    final newBoard = List.generate(state.rows, (row) => List<MinesweeperCell>.from(state.board[row]));
    
    if (newBoard[r][c].isMine) {
      _revealAll(newBoard);
      state = state.copyWith(board: newBoard, status: GameStatus.lost);
      return;
    }

    _recursiveReveal(newBoard, r, c);
    
    GameStatus newStatus = _checkWin(newBoard) ? GameStatus.won : GameStatus.playing;
    state = state.copyWith(board: newBoard, status: newStatus);
  }

  void toggleFlag(int r, int c) {
    if (state.status != GameStatus.playing) return;
    if (state.board[r][c].isRevealed) return;

    final newBoard = List.generate(state.rows, (row) => List<MinesweeperCell>.from(state.board[row]));
    final cell = newBoard[r][c];
    newBoard[r][c] = MinesweeperCell(
      row: cell.row,
      col: cell.col,
      isMine: cell.isMine,
      isRevealed: cell.isRevealed,
      isFlagged: !cell.isFlagged,
      neighborMines: cell.neighborMines,
    );
    state = state.copyWith(board: newBoard);
  }

  void _recursiveReveal(List<List<MinesweeperCell>> board, int r, int c) {
    if (r < 0 || r >= state.rows || c < 0 || c >= state.cols) return;
    if (board[r][c].isRevealed || board[r][c].isMine || board[r][c].isFlagged) return;

    final cell = board[r][c];
    board[r][c] = MinesweeperCell(
      row: cell.row,
      col: cell.col,
      isMine: cell.isMine,
      isRevealed: true,
      isFlagged: false,
      neighborMines: cell.neighborMines,
    );

    if (board[r][c].neighborMines == 0) {
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          if (i == 0 && j == 0) continue;
          _recursiveReveal(board, r + i, c + j);
        }
      }
    }
  }

  void _revealAll(List<List<MinesweeperCell>> board) {
    for (int r = 0; r < state.rows; r++) {
      for (int c = 0; c < state.cols; c++) {
        final cell = board[r][c];
        board[r][c] = MinesweeperCell(
          row: cell.row,
          col: cell.col,
          isMine: cell.isMine,
          isRevealed: true,
          isFlagged: cell.isFlagged,
          neighborMines: cell.neighborMines,
        );
      }
    }
  }

  bool _checkWin(List<List<MinesweeperCell>> board) {
    for (int r = 0; r < state.rows; r++) {
      for (int c = 0; c < state.cols; c++) {
        if (!board[r][c].isMine && !board[r][c].isRevealed) return false;
      }
    }
    return true;
  }
}
