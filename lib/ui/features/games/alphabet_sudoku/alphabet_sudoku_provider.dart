import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'alphabet_sudoku_engine.dart';
import '../../../../providers/user_providers.dart';

part 'alphabet_sudoku_provider.g.dart';

class AlphabetSudokuState {
  final List<List<int>> initialBoard;
  final List<List<int>> currentBoard;
  final List<List<int>> solvedBoard;
  final int? selectedRow;
  final int? selectedCol;
  final bool isSolved;
  final int size;

  AlphabetSudokuState({
    required this.initialBoard,
    required this.currentBoard,
    required this.solvedBoard,
    required this.size,
    this.selectedRow,
    this.selectedCol,
    this.isSolved = false,
  });

  AlphabetSudokuState copyWith({
    List<List<int>>? currentBoard,
    int? selectedRow,
    int? selectedCol,
    bool? isSolved,
    int? size,
  }) {
    return AlphabetSudokuState(
      initialBoard: initialBoard,
      currentBoard: currentBoard ?? this.currentBoard,
      solvedBoard: solvedBoard,
      size: size ?? this.size,
      selectedRow: selectedRow ?? this.selectedRow,
      selectedCol: selectedCol ?? this.selectedCol,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class AlphabetSudokuNotifier extends _$AlphabetSudokuNotifier {
  late AlphabetSudokuEngine _engine;
  static const int defaultSize = 9;

  @override
  Future<AlphabetSudokuState> build() async {
    _engine = AlphabetSudokuEngine(size: defaultSize);
    return _generateNewGame();
  }

  Future<AlphabetSudokuState> _generateNewGame() async {
    final solved = await compute(
      AlphabetSudokuEngine.generateFullBoard,
      _engine.size,
    );
    final puzzle = await compute(
      AlphabetSudokuEngine.generateInitialPuzzle,
      {
        'size': _engine.size,
        'solved': solved,
        'clues': _engine.size == 9 ? 35 : (_engine.size == 4 ? 6 : 30),
      },
    );
    
    return AlphabetSudokuState(
      initialBoard: List.generate(_engine.size, (r) => List.from(puzzle[r])),
      currentBoard: List.generate(_engine.size, (r) => List.from(puzzle[r])),
      solvedBoard: solved,
      size: _engine.size,
    );
  }

  Future<void> newGame() async {
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

    if (currentState.initialBoard[r][c] != 0) return;

    final newBoard =
        List.generate(currentState.size, (i) => List<int>.from(currentState.currentBoard[i]));

    if (newBoard[r][c] == num) {
      newBoard[r][c] = 0;
    } else {
      newBoard[r][c] = num;
    }

    bool solved = _engine.isComplete(newBoard) && _engine.isCorrect(newBoard);

    state = AsyncValue.data(currentState.copyWith(currentBoard: newBoard, isSolved: solved));
    
    if (solved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('alphabet_sudoku', xpAmount: 20);
    }
  }

  String getLetter(int value) => _engine.getLetter(value);
}
