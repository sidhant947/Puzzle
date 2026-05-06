import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'tents_and_trees_engine.dart';

part 'tents_and_trees_provider.g.dart';

class TentsAndTreesState {
  final TentsLevel level;
  final List<List<CellType>> grid;
  final bool isSolved;

  TentsAndTreesState({
    required this.level,
    required this.grid,
    this.isSolved = false,
  });

  TentsAndTreesState copyWith({
    TentsLevel? level,
    List<List<CellType>>? grid,
    bool? isSolved,
  }) {
    return TentsAndTreesState(
      level: level ?? this.level,
      grid: grid ?? this.grid,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class TentsAndTreesNotifier extends _$TentsAndTreesNotifier {
  final _engine = TentsAndTreesEngine();

  @override
  TentsAndTreesState build() {
    final puzzle = _engine.getRandomPuzzle();
    return TentsAndTreesState(
      level: puzzle,
      grid: _initGrid(puzzle),
    );
  }

  List<List<CellType>> _initGrid(TentsLevel level) {
    final grid = List.generate(level.size, (_) => List.filled(level.size, CellType.empty));
    for (var tree in level.treePositions) {
      grid[tree.x][tree.y] = CellType.tree;
    }
    return grid;
  }

  void newGame() {
    final puzzle = _engine.getRandomPuzzle();
    state = TentsAndTreesState(
      level: puzzle,
      grid: _initGrid(puzzle),
      isSolved: false,
    );
  }

  void toggleCell(int r, int c) {
    if (state.isSolved) return;
    if (state.grid[r][c] == CellType.tree) return;

    final newGrid = state.grid.map((row) => List<CellType>.from(row)).toList();
    final current = newGrid[r][c];

    if (current == CellType.empty) {
      newGrid[r][c] = CellType.tent;
    } else if (current == CellType.tent) {
      newGrid[r][c] = CellType.grass;
    } else {
      newGrid[r][c] = CellType.empty;
    }

    bool solved = _engine.isSolved(state.level, newGrid);
    state = state.copyWith(grid: newGrid, isSolved: solved);
  }
}
