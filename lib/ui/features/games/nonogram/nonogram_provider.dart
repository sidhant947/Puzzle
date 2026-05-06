import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'nonogram_engine.dart';

part 'nonogram_provider.g.dart';

class NonogramState {
  final List<List<int>> grid;
  final List<List<int>> rowClues;
  final List<List<int>> colClues;
  final List<List<bool>> solution;
  final bool isSolved;
  final int size;

  NonogramState({
    required this.grid,
    required this.rowClues,
    required this.colClues,
    required this.solution,
    this.isSolved = false,
    this.size = 5,
  });

  NonogramState copyWith({
    List<List<int>>? grid,
    bool? isSolved,
  }) {
    return NonogramState(
      grid: grid ?? this.grid,
      rowClues: rowClues,
      colClues: colClues,
      solution: solution,
      isSolved: isSolved ?? this.isSolved,
      size: size,
    );
  }
}

@riverpod
class NonogramNotifier extends _$NonogramNotifier {
  final _engine = NonogramEngine();
  static const int defaultSize = 5;

  @override
  NonogramState build() {
    return _initNewGame(defaultSize);
  }

  NonogramState _initNewGame(int size) {
    final puzzle = _engine.generatePuzzle(size);
    return NonogramState(
      grid: List.generate(size, (_) => List.filled(size, 0)),
      rowClues: puzzle.rowClues,
      colClues: puzzle.colClues,
      solution: puzzle.solution,
      size: size,
    );
  }

  void reset() {
    state = _initNewGame(state.size);
  }

  void toggleCell(int r, int c, bool isMarkMode) {
    if (state.isSolved) return;

    final newGrid = List.generate(
      state.size,
      (i) => List<int>.from(state.grid[i]),
    );

    final currentValue = newGrid[r][c];
    
    if (isMarkMode) {
      // Toggle between X-mark (2) and empty (0)
      newGrid[r][c] = currentValue == 2 ? 0 : 2;
    } else {
      // Toggle between filled (1) and empty (0)
      newGrid[r][c] = currentValue == 1 ? 0 : 1;
    }

    final solved = _engine.isCorrect(newGrid, state.solution);
    state = state.copyWith(grid: newGrid, isSolved: solved);

    if (solved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('nonogram', xpAmount: 25);
    }
  }
}
