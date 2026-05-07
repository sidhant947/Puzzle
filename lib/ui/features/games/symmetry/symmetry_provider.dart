import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'symmetry_engine.dart';

part 'symmetry_provider.g.dart';

class SymmetryState {
  final List<List<bool>> grid;
  final bool isGameOver;

  SymmetryState({
    required this.grid,
    this.isGameOver = false,
  });

  SymmetryState copyWith({
    List<List<bool>>? grid,
    bool? isGameOver,
  }) {
    return SymmetryState(
      grid: grid ?? this.grid,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}

@riverpod
class SymmetryNotifier extends _$SymmetryNotifier {
  final _engine = SymmetryEngine();

  @override
  SymmetryState build() {
    return SymmetryState(grid: _engine.generatePattern());
  }

  void toggleCell(int x, int y) {
    if (state.isGameOver) return;
    if (x < _engine.size ~/ 2) return; // Only toggle right half

    final newGrid = List<List<bool>>.from(state.grid.map((row) => List<bool>.from(row)));
    newGrid[y][x] = !newGrid[y][x];
    
    state = state.copyWith(grid: newGrid);

    if (_engine.checkSymmetry(newGrid)) {
      state = state.copyWith(isGameOver: true);
    }
  }

  void reset() {
    state = SymmetryState(grid: _engine.generatePattern());
  }
}
