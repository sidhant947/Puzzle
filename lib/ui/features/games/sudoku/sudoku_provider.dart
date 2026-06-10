import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'sudoku_engine.dart';

part 'sudoku_provider.g.dart';

class SudokuState {
  final IList<IList<int>> initialBoard;
  final IList<IList<int>> currentBoard;
  final IList<IList<int>> solvedBoard;
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
    IList<IList<int>>? currentBoard,
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
  static const int boardSize = 9;

  @override
  Future<SudokuState> build() async {
    return _generateNewGame();
  }

  Future<SudokuState> _generateNewGame() async {
    final solved = await compute(SudokuEngine.generateFullBoard, null);
    final puzzle = await compute(SudokuEngine.generateInitialPuzzle, {
      'solved': solved,
      'clues': 35,
    });
    
    return SudokuState(
      initialBoard: puzzle.map((r) => r.lock).toIList(),
      currentBoard: puzzle.map((r) => r.lock).toIList(),
      solvedBoard: solved.map((r) => r.lock).toIList(),
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

  Future<void> setNumber(int num) async {
    if (!state.hasValue) return;
    final currentState = state.value!;
    if (currentState.selectedRow == null || currentState.selectedCol == null) return;
    if (currentState.isSolved) return;

    final r = currentState.selectedRow!;
    final c = currentState.selectedCol!;

    // Prevent modifying fixed (initial) numbers
    if (currentState.initialBoard[r][c] != 0) return;

    final newBoardList = currentState.currentBoard.map((row) => row.toList()).toList();

    if (newBoardList[r][c] == num) {
      newBoardList[r][c] = 0; // Erase if same number is tapped
    } else {
      newBoardList[r][c] = num;
    }

    final newBoard = newBoardList.map((row) => row.lock).toIList();

    // Check completion and correctness in background if board is full
    bool isComplete = true;
    for (var row in newBoardList) {
      if (row.contains(0)) {
        isComplete = false;
        break;
      }
    }

    bool solved = false;
    if (isComplete) {
      solved = await compute(SudokuEngine.isCorrectWrapper, {
        'board': newBoardList,
        'solvedBoard': currentState.solvedBoard.map((row) => row.toList()).toList(),
      });
    }

    state = AsyncValue.data(currentState.copyWith(currentBoard: newBoard, isSolved: solved));
  }
}
