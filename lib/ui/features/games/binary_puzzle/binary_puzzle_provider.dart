import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'binary_puzzle_engine.dart';

part 'binary_puzzle_provider.g.dart';

class BinaryPuzzleState {
  final BinaryPuzzleBoard board;
  final List<List<int?>> currentGrid;
  final List<List<bool>> fixedCells;
  final List<List<bool>> invalidCells;
  final bool isSolved;

  BinaryPuzzleState({
    required this.board,
    required this.currentGrid,
    required this.fixedCells,
    required this.invalidCells,
    this.isSolved = false,
  });

  BinaryPuzzleState copyWith({
    BinaryPuzzleBoard? board,
    List<List<int?>>? currentGrid,
    List<List<bool>>? fixedCells,
    List<List<bool>>? invalidCells,
    bool? isSolved,
  }) {
    return BinaryPuzzleState(
      board: board ?? this.board,
      currentGrid: currentGrid ?? this.currentGrid,
      fixedCells: fixedCells ?? this.fixedCells,
      invalidCells: invalidCells ?? this.invalidCells,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class BinaryPuzzleNotifier extends _$BinaryPuzzleNotifier {
  final _engine = BinaryPuzzleEngine();

  @override
  BinaryPuzzleState build() {
    final board = _engine.generateBoard();
    final grid = _copyGrid(board.grid);
    return BinaryPuzzleState(
      board: board,
      currentGrid: grid,
      fixedCells: _identifyFixed(board.grid),
      invalidCells: _engine.getInvalidCells(grid, board.size),
    );
  }

  List<List<int?>> _copyGrid(List<List<int?>> grid) {
    return grid.map((row) => List<int?>.from(row)).toList();
  }

  List<List<bool>> _identifyFixed(List<List<int?>> grid) {
    return grid.map((row) => row.map((cell) => cell != null).toList()).toList();
  }

  void newGame() {
    final board = _engine.generateBoard();
    final grid = _copyGrid(board.grid);
    state = BinaryPuzzleState(
      board: board,
      currentGrid: grid,
      fixedCells: _identifyFixed(board.grid),
      invalidCells: _engine.getInvalidCells(grid, board.size),
      isSolved: false,
    );
  }

  void toggleCell(int r, int c) {
    if (state.isSolved) return;
    if (state.fixedCells[r][c]) return;

    final newGrid = _copyGrid(state.currentGrid);
    final current = newGrid[r][c];

    if (current == null) {
      newGrid[r][c] = 0;
    } else if (current == 0) {
      newGrid[r][c] = 1;
    } else {
      newGrid[r][c] = null;
    }

    final invalidCells = _engine.getInvalidCells(newGrid, state.board.size);
    bool solved = _checkSolved(newGrid);
    state = state.copyWith(
      currentGrid: newGrid,
      invalidCells: invalidCells,
      isSolved: solved,
    );
  }

  bool _checkSolved(List<List<int?>> grid) {
    return _engine.isCompleteAndValid(grid, state.board.size);
  }
}
