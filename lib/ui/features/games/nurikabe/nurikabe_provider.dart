import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'nurikabe_engine.dart';

part 'nurikabe_provider.g.dart';

class NurikabeState {
  final IList<IList<int>> grid;
  final IList<IList<int>> initialGrid;
  final IList<IList<int>> solution;
  final bool isVictory;
  final bool isLoading;

  NurikabeState({
    required this.grid,
    required this.initialGrid,
    required this.solution,
    this.isVictory = false,
    this.isLoading = true,
  });

  NurikabeState copyWith({
    IList<IList<int>>? grid,
    IList<IList<int>>? initialGrid,
    IList<IList<int>>? solution,
    bool? isVictory,
    bool? isLoading,
  }) {
    return NurikabeState(
      grid: grid ?? this.grid,
      initialGrid: initialGrid ?? this.initialGrid,
      solution: solution ?? this.solution,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class NurikabeNotifier extends _$NurikabeNotifier {
  final _engine = NurikabeEngine();

  @override
  NurikabeState build() {
    return NurikabeState(
      grid: <IList<int>>[].lock,
      initialGrid: <IList<int>>[].lock,
      solution: <IList<int>>[].lock,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final grid = level['grid'] as List<List<int>>;
    final solution = level['solution'] as List<List<int>>? ?? [];

    final initialGrid = grid.map((r) => r.map((c) => c > 0 ? c : 0).toList().lock).toIList();

    state = NurikabeState(
      grid: initialGrid,
      initialGrid: initialGrid,
      solution: solution.map((r) => r.lock).toIList(),
      isLoading: false,
    );
  }

  void toggleCell(int r, int c) {
    if (state.isVictory || state.initialGrid[r][c] > 0) return;

    final grid = state.grid.map((row) => row.toList()).toList();
    grid[r][c] = grid[r][c] == 0 ? -1 : 0;

    state = state.copyWith(grid: grid.map((row) => row.lock).toIList());
    _checkVictory();
  }

  void showHint() {
    if (state.isVictory || state.solution.isEmpty) return;

    for (int r = 0; r < state.grid.length; r++) {
      for (int c = 0; c < state.grid.length; c++) {
        if (state.initialGrid[r][c] > 0) continue;
        if (state.grid[r][c] != state.solution[r][c]) {
          final newGrid = state.grid.map((row) => row.toList()).toList();
          newGrid[r][c] = state.solution[r][c];
          state = state.copyWith(grid: newGrid.map((row) => row.lock).toIList());
          _checkVictory();
          return;
        }
      }
    }
  }

  void _checkVictory() {
    final grid = state.grid.map((r) => r.toList()).toList();

    final isVictory = NurikabeEngine.checkVictoryWrapper({'grid': grid});

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
