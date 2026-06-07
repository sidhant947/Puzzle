import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'nurikabe_engine.dart';

part 'nurikabe_provider.g.dart';

class NurikabeState {
  final IList<IList<int>> grid; // -1: sea, 0: white, >0: clue
  final IList<IList<int>> initialGrid;
  final bool isVictory;
  final bool isLoading;

  NurikabeState({
    required this.grid,
    required this.initialGrid,
    this.isVictory = false,
    this.isLoading = true,
  });

  NurikabeState copyWith({
    IList<IList<int>>? grid,
    IList<IList<int>>? initialGrid,
    bool? isVictory,
    bool? isLoading,
  }) {
    return NurikabeState(
      grid: grid ?? this.grid,
      initialGrid: initialGrid ?? this.initialGrid,
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
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final grid = level['grid'] as List<List<int>>;
    
    // In Nurikabe, initially everything is white except clues.
    // Or we can let users toggle between white and shaded.
    final initialGrid = grid.map((r) => r.map((c) => c > 0 ? c : 0).toList().lock).toIList();

    state = NurikabeState(
      grid: initialGrid,
      initialGrid: initialGrid,
      isLoading: false,
    );
  }

  void toggleCell(int r, int c) {
    if (state.isVictory || state.initialGrid[r][c] > 0) return;

    final grid = state.grid.map((row) => row.toList()).toList();
    // Toggle: white (0) -> shaded (-1) -> white (0)
    grid[r][c] = grid[r][c] == 0 ? -1 : 0;
    
    state = state.copyWith(grid: grid.map((row) => row.lock).toIList());
    _checkVictory();
  }

  Future<void> _checkVictory() async {
    final grid = state.grid.map((r) => r.toList()).toList();

    final isVictory = await compute(NurikabeEngine.checkVictoryWrapper, {'grid': grid});

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
