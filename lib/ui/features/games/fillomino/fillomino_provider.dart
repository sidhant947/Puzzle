import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'fillomino_engine.dart';

part 'fillomino_provider.g.dart';

class FillominoState {
  final IList<IList<int>> grid;
  final IList<IList<int>> initialGrid;
  final bool isVictory;
  final bool isLoading;

  FillominoState({
    required this.grid,
    required this.initialGrid,
    this.isVictory = false,
    this.isLoading = true,
  });

  FillominoState copyWith({
    IList<IList<int>>? grid,
    IList<IList<int>>? initialGrid,
    bool? isVictory,
    bool? isLoading,
  }) {
    return FillominoState(
      grid: grid ?? this.grid,
      initialGrid: initialGrid ?? this.initialGrid,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class FillominoNotifier extends _$FillominoNotifier {
  final _engine = FillominoEngine();

  @override
  FillominoState build() {
    return FillominoState(
      grid: <IList<int>>[].lock,
      initialGrid: <IList<int>>[].lock,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final grid = level['grid'] as List<List<int>>;
    
    state = FillominoState(
      grid: grid.map((r) => r.lock).toIList(),
      initialGrid: grid.map((r) => r.lock).toIList(),
      isLoading: false,
    );
  }

  void updateCell(int r, int c, int value) {
    if (state.isVictory || state.initialGrid[r][c] != 0) return;

    final grid = state.grid.map((row) => row.toList()).toList();
    grid[r][c] = value;
    
    state = state.copyWith(grid: grid.map((row) => row.lock).toIList());
    _checkVictory();
  }

  Future<void> _checkVictory() async {
    final grid = state.grid.map((r) => r.toList()).toList();

    final isVictory = await compute(FillominoEngine.checkVictoryWrapper, {'grid': grid});

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
