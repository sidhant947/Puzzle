import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'color_flood_engine.dart';

part 'color_flood_provider.g.dart';

enum ColorFloodStatus { playing, won, lost }

class ColorFloodState {
  final List<List<int>> grid;
  final int moves;
  final int maxMoves;
  final ColorFloodStatus status;

  ColorFloodState({
    required this.grid,
    this.moves = 0,
    this.maxMoves = 25,
    this.status = ColorFloodStatus.playing,
  });

  ColorFloodState copyWith({
    List<List<int>>? grid,
    int? moves,
    int? maxMoves,
    ColorFloodStatus? status,
  }) {
    return ColorFloodState(
      grid: grid ?? this.grid,
      moves: moves ?? this.moves,
      maxMoves: maxMoves ?? this.maxMoves,
      status: status ?? this.status,
    );
  }
}

@riverpod
class ColorFloodNotifier extends _$ColorFloodNotifier {
  final _engine = ColorFloodEngine();
  static const int gridSize = 12;

  @override
  ColorFloodState build() {
    return ColorFloodState(grid: []);
  }

  void initGame() {
    state = ColorFloodState(
      grid: _engine.generateGrid(gridSize),
      moves: 0,
      maxMoves: 22,
      status: ColorFloodStatus.playing,
    );
  }

  void changeColor(int colorIndex) {
    if (state.status != ColorFloodStatus.playing) return;
    if (colorIndex == state.grid[0][0]) return;

    final newGrid = state.grid.map((row) => List<int>.from(row)).toList();
    _engine.floodFill(newGrid, 0, 0, state.grid[0][0], colorIndex);

    final newMoves = state.moves + 1;
    ColorFloodStatus newStatus = state.status;

    if (_engine.isSolved(newGrid)) {
      newStatus = ColorFloodStatus.won;
    } else if (newMoves >= state.maxMoves) {
      newStatus = ColorFloodStatus.lost;
    }

    state = state.copyWith(
      grid: newGrid,
      moves: newMoves,
      status: newStatus,
    );
  }
}
