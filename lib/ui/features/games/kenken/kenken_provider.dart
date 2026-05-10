import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'kenken_engine.dart';
import 'dart:math';

part 'kenken_provider.g.dart';

class KenKenState {
  final int size;
  final List<List<int?>> grid;
  final List<List<int>> solution;
  final List<List<int>> cages;
  final List<Map<String, dynamic>> cageData;
  final Point<int>? selectedCell;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  KenKenState({
    required this.size,
    required this.grid,
    required this.solution,
    required this.cages,
    required this.cageData,
    this.selectedCell,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  KenKenState copyWith({
    int? size,
    List<List<int?>>? grid,
    List<List<int>>? solution,
    List<List<int>>? cages,
    List<Map<String, dynamic>>? cageData,
    Point<int>? selectedCell,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return KenKenState(
      size: size ?? this.size,
      grid: grid ?? this.grid,
      solution: solution ?? this.solution,
      cages: cages ?? this.cages,
      cageData: cageData ?? this.cageData,
      selectedCell: selectedCell ?? this.selectedCell,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class KenKenNotifier extends _$KenKenNotifier {
  final _engine = KenKenEngine();

  @override
  KenKenState build() {
    return KenKenState(
      size: 4,
      grid: [],
      solution: [],
      cages: [],
      cageData: [],
      isLoading: true,
    );
  }

  void initGame({int size = 4}) {
    final puzzle = _engine.generatePuzzle(size: size);
    state = KenKenState(
      size: size,
      grid: List.generate(size, (_) => List.filled(size, null)),
      solution: puzzle['solution'],
      cages: puzzle['cages'],
      cageData: puzzle['cageData'],
      isLoading: false,
    );
  }

  void selectCell(int r, int c) {
    if (state.isGameOver) return;
    state = state.copyWith(selectedCell: Point(c, r));
  }

  void onNumberPressed(int val) {
    if (state.selectedCell == null || state.isGameOver) return;
    
    final newGrid = state.grid.map((row) => List<int?>.from(row)).toList();
    newGrid[state.selectedCell!.y][state.selectedCell!.x] = val;
    
    state = state.copyWith(grid: newGrid);
    _checkWin();
  }

  void onClear() {
    if (state.selectedCell == null || state.isGameOver) return;
    final newGrid = state.grid.map((row) => List<int?>.from(row)).toList();
    newGrid[state.selectedCell!.y][state.selectedCell!.x] = null;
    state = state.copyWith(grid: newGrid);
  }

  void _checkWin() {
    // 1. Check if all cells filled
    for (var row in state.grid) {
      for (var cell in row) {
        if (cell == null) return;
      }
    }

    // 2. Check Latin Square constraints
    for (int i = 0; i < state.size; i++) {
      Set<int> rowSet = {};
      Set<int> colSet = {};
      for (int j = 0; j < state.size; j++) {
        rowSet.add(state.grid[i][j]!);
        colSet.add(state.grid[j][i]!);
      }
      if (rowSet.length != state.size || colSet.length != state.size) return;
    }

    // 3. Check Cages
    for (var cage in state.cageData) {
      List<int> values = (cage['cells'] as List<Point<int>>).map((p) => state.grid[p.y][p.x]!).toList();
      int target = cage['target'];
      String op = cage['op'];

      if (op == '') {
        if (values[0] != target) return;
      } else if (op == '+') {
        if (values.reduce((a, b) => a + b) != target) return;
      } else if (op == '×') {
        if (values.reduce((a, b) => a * b) != target) return;
      } else if (op == '-') {
        if ((values[0] - values[1]).abs() != target) return;
      } else if (op == '÷') {
        double res = values[0] > values[1] ? values[0] / values[1] : values[1] / values[0];
        if ((res - target).abs() > 1e-6) return;
      }
    }

    state = state.copyWith(isGameOver: true, isGameWon: true);
  }
}
