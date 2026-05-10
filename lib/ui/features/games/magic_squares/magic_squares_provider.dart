import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'magic_squares_engine.dart';

part 'magic_squares_provider.g.dart';

class MagicSquaresState {
  final List<List<int?>> grid;
  final List<List<bool>> fixed;
  final List<List<int>> solution;
  final int targetSum;
  final int? selectedRow;
  final int? selectedCol;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  MagicSquaresState({
    required this.grid,
    required this.fixed,
    required this.solution,
    required this.targetSum,
    this.selectedRow,
    this.selectedCol,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  MagicSquaresState copyWith({
    List<List<int?>>? grid,
    List<List<bool>>? fixed,
    List<List<int>>? solution,
    int? targetSum,
    int? selectedRow,
    int? selectedCol,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return MagicSquaresState(
      grid: grid ?? this.grid,
      fixed: fixed ?? this.fixed,
      solution: solution ?? this.solution,
      targetSum: targetSum ?? this.targetSum,
      selectedRow: selectedRow ?? this.selectedRow,
      selectedCol: selectedCol ?? this.selectedCol,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class MagicSquaresNotifier extends _$MagicSquaresNotifier {
  final _engine = MagicSquaresEngine();

  @override
  MagicSquaresState build() {
    return MagicSquaresState(
      grid: [],
      fixed: [],
      solution: [],
      targetSum: 15,
      isLoading: true,
    );
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    state = MagicSquaresState(
      grid: puzzle['puzzle'],
      fixed: puzzle['fixed'],
      solution: puzzle['solution'],
      targetSum: puzzle['targetSum'],
      isLoading: false,
    );
  }

  void selectCell(int r, int c) {
    if (state.isGameOver || state.fixed[r][c]) return;
    state = state.copyWith(selectedRow: r, selectedCol: c);
  }

  void onNumberPressed(int val) {
    if (state.selectedRow == null || state.selectedCol == null || state.isGameOver) return;
    
    final newGrid = state.grid.map((row) => List<int?>.from(row)).toList();
    newGrid[state.selectedRow!][state.selectedCol!] = val;
    
    state = state.copyWith(grid: newGrid);
    _checkWin();
  }

  void onClear() {
    if (state.selectedRow == null || state.selectedCol == null || state.isGameOver) return;
    final newGrid = state.grid.map((row) => List<int?>.from(row)).toList();
    newGrid[state.selectedRow!][state.selectedCol!] = null;
    state = state.copyWith(grid: newGrid);
  }

  void _checkWin() {
    // Check if all cells are filled
    for (var row in state.grid) {
      for (var cell in row) {
        if (cell == null) return;
      }
    }

    // Check row sums
    for (int r = 0; r < 3; r++) {
      int sum = 0;
      for (int c = 0; c < 3; c++) { sum += state.grid[r][c]!; }
      if (sum != state.targetSum) return;
    }

    // Check col sums
    for (int c = 0; c < 3; c++) {
      int sum = 0;
      for (int r = 0; r < 3; r++) { sum += state.grid[r][c]!; }
      if (sum != state.targetSum) return;
    }

    // Check diagonals
    if (state.grid[0][0]! + state.grid[1][1]! + state.grid[2][2]! != state.targetSum) return;
    if (state.grid[0][2]! + state.grid[1][1]! + state.grid[2][0]! != state.targetSum) return;

    state = state.copyWith(isGameOver: true, isGameWon: true);
  }
}
