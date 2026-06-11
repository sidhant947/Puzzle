import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'compass_maze_engine.dart';

part 'compass_maze_provider.g.dart';

class CompassMazeState {
  final List<List<int>> grid;
  final int playerR;
  final int playerC;
  final int exitR;
  final int exitC;
  final int rotation;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  CompassMazeState({
    this.grid = const [],
    this.playerR = 0,
    this.playerC = 0,
    this.exitR = 0,
    this.exitC = 0,
    this.rotation = 0,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  CompassMazeState copyWith({
    List<List<int>>? grid,
    int? playerR,
    int? playerC,
    int? exitR,
    int? exitC,
    int? rotation,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return CompassMazeState(
      grid: grid ?? this.grid,
      playerR: playerR ?? this.playerR,
      playerC: playerC ?? this.playerC,
      exitR: exitR ?? this.exitR,
      exitC: exitC ?? this.exitC,
      rotation: rotation ?? this.rotation,
      isVictory: isVictory ?? this.isVictory,
      isFailed: isFailed ?? this.isFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CompassMazeNotifier extends _$CompassMazeNotifier {
  final _engine = CompassMazeEngine();

  @override
  CompassMazeState build() {
    return CompassMazeState();
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = CompassMazeState(
      grid: level.grid,
      playerR: level.startR,
      playerC: level.startC,
      exitR: level.exitR,
      exitC: level.exitC,
      rotation: level.orientationRotation,
      isLoading: false,
    );
  }

  void move(CompassDirection direction) {
    if (state.isVictory || state.isLoading) return;

    final move = _engine.getMove(direction, state.rotation);
    final nr = state.playerR + move[0];
    final nc = state.playerC + move[1];

    if (nr >= 0 && nr < state.grid.length && nc >= 0 && nc < state.grid[0].length) {
      if (state.grid[nr][nc] == 0) {
        state = state.copyWith(playerR: nr, playerC: nc);
        
        if (nr == state.exitR && nc == state.exitC) {
          state = state.copyWith(isVictory: true);
        }
      }
    }
  }
}
