import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'sudoku_engine.dart';

part 'sudoku_provider.g.dart';

class SudokuState {
  final List<List<int>> initialBoard;
  final List<List<int>> currentBoard;
  final List<List<int>> solvedBoard;
  final int? selectedRow;
  final int? selectedCol;
  final bool isSolved;

  SudokuState({
    required this.initialBoard,
    required this.currentBoard,
    required this.solvedBoard,
    this.selectedRow,
    this.selectedCol,
    this.isSolved = false,
  });

  SudokuState copyWith({
    List<List<int>>? currentBoard,
    int? selectedRow,
    int? selectedCol,
    bool? isSolved,
  }) {
    return SudokuState(
      initialBoard: initialBoard,
      currentBoard: currentBoard ?? this.currentBoard,
      solvedBoard: solvedBoard,
      selectedRow: selectedRow ?? this.selectedRow,
      selectedCol: selectedCol ?? this.selectedCol,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class SudokuNotifier extends _$SudokuNotifier {
  final _engine = SudokuEngine();

  @override
  SudokuState build() {
    final solved = _engine.generateBoard();
    final puzzle = _engine.createPuzzle(solved, 8); // 8 clues for 4x4
    return SudokuState(
      initialBoard: List.generate(4, (r) => List.from(puzzle[r])),
      currentBoard: List.generate(4, (r) => List.from(puzzle[r])),
      solvedBoard: solved,
    );
  }

  void selectCell(int r, int c) {
    if (state.initialBoard[r][c] != 0) return;
    state = state.copyWith(selectedRow: r, selectedCol: c);
  }

  void setNumber(int num) {
    if (state.selectedRow == null || state.selectedCol == null) return;
    if (state.isSolved) return;

    final r = state.selectedRow!;
    final c = state.selectedCol!;

    final newBoard =
        List.generate(4, (i) => List<int>.from(state.currentBoard[i]));

    if (newBoard[r][c] == num) {
      newBoard[r][c] = 0; // Erase if same number is tapped
    } else {
      newBoard[r][c] = num;
    }

    bool solved = _engine.isComplete(newBoard) &&
        _engine.isCorrect(newBoard, state.solvedBoard);

    state = state.copyWith(currentBoard: newBoard, isSolved: solved);
  }
}
