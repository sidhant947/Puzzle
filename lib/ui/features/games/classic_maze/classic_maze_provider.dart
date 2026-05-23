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
    );
  }

  bool movePlayer(int dr, int dc) {
    if (state.isVictory || state.isLoading) return false;

    final nr = state.playerRow + dr;
    final nc = state.playerCol + dc;

    // Check boundaries
    if (nr < 0 || nr >= state.size || nc < 0 || nc >= state.size) return false;

    // Check wall
    if (state.grid[nr][nc] == 1) return false;

    // Handle breadcrumbs and backtracking
    final newPath = List<List<int>>.from(state.visitedPath);
    if (newPath.length > 1 &&
        newPath[newPath.length - 2][0] == nr &&
        newPath[newPath.length - 2][1] == nc) {
      // Player is backtracking, remove the last cell from the trail
      newPath.removeLast();
    } else {
      // Add new position to trail
      newPath.add([nr, nc]);
    }

    state = state.copyWith(
      playerRow: nr,
      playerCol: nc,
      visitedPath: newPath,
      moves: state.moves + 1,
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
