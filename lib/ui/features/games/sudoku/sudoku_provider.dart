import 'package:flutter/foundation.dart';
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
  static const int boardSize = 9;

  @override
  Future<SudokuState> build() async {
    return _generateNewGame();
  }

  Future<SudokuState> _generateNewGame() async {
    final solved = await compute((_) => SudokuEngine.generateFullBoard(), null);
    final puzzle = await compute(SudokuEngine.generateInitialPuzzle, {
      'solved': solved,
      'clues': 35,
    });
    
    return SudokuState(
      initialBoard: List.generate(boardSize, (r) => List.from(puzzle[r])),
      currentBoard: List.generate(boardSize, (r) => List.from(puzzle[r])),
      solvedBoard: solved,
    );
  }

  Future<void> initGame() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _generateNewGame());
  }

  void selectCell(int r, int c) {
    if (!state.hasValue) return;
    state = AsyncValue.data(state.value!.copyWith(selectedRow: r, selectedCol: c));
  }

  void setNumber(int num) {
    if (!state.hasValue) return;
    final currentState = state.value!;
    if (currentState.selectedRow == null || currentState.selectedCol == null) return;
    if (currentState.isSolved) return;

    final r = currentState.selectedRow!;
    final c = currentState.selectedCol!;

    // Prevent modifying fixed (initial) numbers
    if (currentState.initialBoard[r][c] != 0) return;

    final newBoard =
        List.generate(boardSize, (i) => List<int>.from(currentState.currentBoard[i]));

    if (newBoard[r][c] == num) {
      newBoard[r][c] = 0; // Erase if same number is tapped
    } else {
      newBoard[r][c] = num;
    }

    bool solved = _engine.isComplete(newBoard) &&
        _engine.isCorrect(newBoard, currentState.solvedBoard);

    state = AsyncValue.data(currentState.copyWith(currentBoard: newBoard, isSolved: solved));
  }
}
