import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'classic_maze_engine.dart';
import '../../../../providers/user_providers.dart';

part 'classic_maze_provider.g.dart';

class ClassicMazeState {
  final List<List<int>> grid;
  final int size;
  final int playerRow;
  final int playerCol;
  final int exitRow;
  final int exitCol;
  final List<List<int>> visitedPath; // list of [r, c] for breadcrumbs trail
  final int moves;
  final bool isVictory;
  final bool isLoading;
  final bool autoMoveEnabled;

  ClassicMazeState({
    required this.grid,
    required this.size,
    required this.playerRow,
    required this.playerCol,
    required this.exitRow,
    required this.exitCol,
    required this.visitedPath,
    this.moves = 0,
    this.isVictory = false,
    this.isLoading = true,
    this.autoMoveEnabled = false,
  });

  ClassicMazeState copyWith({
    List<List<int>>? grid,
    int? size,
    int? playerRow,
    int? playerCol,
    int? exitRow,
    int? exitCol,
    List<List<int>>? visitedPath,
    int? moves,
    bool? isVictory,
    bool? isLoading,
    bool? autoMoveEnabled,
  }) {
    return ClassicMazeState(
      grid: grid ?? this.grid,
      size: size ?? this.size,
      playerRow: playerRow ?? this.playerRow,
      playerCol: playerCol ?? this.playerCol,
      exitRow: exitRow ?? this.exitRow,
      exitCol: exitCol ?? this.exitCol,
      visitedPath: visitedPath ?? this.visitedPath,
      moves: moves ?? this.moves,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      autoMoveEnabled: autoMoveEnabled ?? this.autoMoveEnabled,
    );
  }
}

@riverpod
class ClassicMazeNotifier extends _$ClassicMazeNotifier {
  final _engine = ClassicMazeEngine();
  static const int extremeHardSize = 35; // Extreme Hard Maze Size

  @override
  ClassicMazeState build() {
    return ClassicMazeState(
      grid: [],
      size: 0,
      playerRow: 0,
      playerCol: 0,
      exitRow: 0,
      exitCol: 0,
      visitedPath: [],
      isLoading: true,
    );
  }

  void initGame() {
    final level = _engine.generateLevel(extremeHardSize);
    state = ClassicMazeState(
      grid: level.grid,
      size: level.size,
      playerRow: level.startR,
      playerCol: level.startC,
      exitRow: level.exitR,
      exitCol: level.exitC,
      visitedPath: [[level.startR, level.startC]],
      moves: 0,
      isVictory: false,
      isLoading: false,
      autoMoveEnabled: state.autoMoveEnabled,
    );
  }

  void toggleAutoMove() {
    state = state.copyWith(autoMoveEnabled: !state.autoMoveEnabled);
  }

  bool movePlayer(int dr, int dc) {
    if (state.isVictory || state.isLoading) return false;

    int nr = state.playerRow + dr;
    int nc = state.playerCol + dc;

    // Check boundaries
    if (nr < 0 || nr >= state.size || nc < 0 || nc >= state.size) return false;

    // Check wall
    if (state.grid[nr][nc] == 1) return false;

    int prevR = state.playerRow;
    int prevC = state.playerCol;
    final newPath = List<List<int>>.from(state.visitedPath);

    void step(int r, int c) {
      if (newPath.length > 1 &&
          newPath[newPath.length - 2][0] == r &&
          newPath[newPath.length - 2][1] == c) {
        // Player is backtracking, remove the last cell from the trail
        newPath.removeLast();
      } else {
        // Add new position to trail
        newPath.add([r, c]);
      }
    }

    step(nr, nc);
    int movesAdded = 1;

    if (state.autoMoveEnabled) {
      while (nr != state.exitRow || nc != state.exitCol) {
        // Find path neighbors of (nr, nc) other than (prevR, prevC)
        final neighbors = <List<int>>[];
        final dirs = [
          [-1, 0],
          [1, 0],
          [0, -1],
          [0, 1],
        ];
        for (final d in dirs) {
          final tr = nr + d[0];
          final tc = nc + d[1];
          if (tr >= 0 && tr < state.size && tc >= 0 && tc < state.size) {
            if (state.grid[tr][tc] == 0 && (tr != prevR || tc != prevC)) {
              neighbors.add([tr, tc]);
            }
          }
        }
        if (neighbors.length == 1) {
          // Exactly one way to go, continue sliding!
          final next = neighbors.first;
          prevR = nr;
          prevC = nc;
          nr = next[0];
          nc = next[1];
          step(nr, nc);
          movesAdded++;
        } else {
          // Intersection or dead-end, stop sliding
          break;
        }
      }
    }

    state = state.copyWith(
      playerRow: nr,
      playerCol: nc,
      visitedPath: newPath,
      moves: state.moves + movesAdded,
    );

    // Check victory
    if (nr == state.exitRow && nc == state.exitCol) {
      state = state.copyWith(isVictory: true);
      ref.read(gameStreakNotifierProvider.notifier).completeGame('classic_maze', xpAmount: 25);
    }

    return true;
  }

  void reset() {
    initGame();
  }
}
