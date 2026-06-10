import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'rotating_maze_engine.dart';
import '../../../../providers/user_providers.dart';

part 'rotating_maze_provider.g.dart';

class RotatingMazeState {
  final List<List<int>> grid;
  final int size;
  final int marbleRow;
  final int marbleCol;
  final int exitRow;
  final int exitCol;
  final int movesUntilRotation;
  final double visualRotation; // In turns (0.25 = 90 deg, 0.5 = 180 deg)
  final bool isVictory;
  final bool isLoading;
  final bool justRotated;

  RotatingMazeState({
    required this.grid,
    required this.size,
    required this.marbleRow,
    required this.marbleCol,
    required this.exitRow,
    required this.exitCol,
    required this.movesUntilRotation,
    this.visualRotation = 0.0,
    this.isVictory = false,
    this.isLoading = true,
    this.justRotated = false,
  });

  RotatingMazeState copyWith({
    List<List<int>>? grid,
    int? size,
    int? marbleRow,
    int? marbleCol,
    int? exitRow,
    int? exitCol,
    int? movesUntilRotation,
    double? visualRotation,
    bool? isVictory,
    bool? isLoading,
    bool? justRotated,
  }) {
    return RotatingMazeState(
      grid: grid ?? this.grid,
      size: size ?? this.size,
      marbleRow: marbleRow ?? this.marbleRow,
      marbleCol: marbleCol ?? this.marbleCol,
      exitRow: exitRow ?? this.exitRow,
      exitCol: exitCol ?? this.exitCol,
      movesUntilRotation: movesUntilRotation ?? this.movesUntilRotation,
      visualRotation: visualRotation ?? this.visualRotation,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      justRotated: justRotated ?? this.justRotated,
    );
  }
}

@riverpod
class RotatingMazeNotifier extends _$RotatingMazeNotifier {
  final _engine = RotatingMazeEngine();

  @override
  RotatingMazeState build() {
    return RotatingMazeState(
      grid: [],
      size: 0,
      marbleRow: 0,
      marbleCol: 0,
      exitRow: 0,
      exitCol: 0,
      movesUntilRotation: 5,
      isLoading: true,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = RotatingMazeState(
      grid: level.grid,
      size: level.size,
      marbleRow: level.startR,
      marbleCol: level.startC,
      exitRow: level.exitR,
      exitCol: level.exitC,
      movesUntilRotation: 5,
      visualRotation: 0.0,
      isVictory: false,
      isLoading: false,
      justRotated: false,
    );
  }

  bool moveMarble(int dr, int dc) {
    if (state.isVictory || state.isLoading) return false;

    final nr = state.marbleRow + dr;
    final nc = state.marbleCol + dc;

    // Boundary check
    if (nr < 0 || nr >= state.size || nc < 0 || nc >= state.size) return false;

    // Wall check
    if (state.grid[nr][nc] == 1) return false;

    // Update position and decrease move counter
    int nextMoves = state.movesUntilRotation - 1;
    
    bool rotated = false;
    List<List<int>> nextGrid = state.grid;
    int nextMarbleR = nr;
    int nextMarbleC = nc;
    int nextExitR = state.exitRow;
    int nextExitC = state.exitCol;
    double nextVisualRot = state.visualRotation;

    if (nextMoves == 0) {
      rotated = true;
      // Perform 90 degrees rotation
      final rotRes = _engine.rotate90Clockwise(
        state.grid,
        nr,
        nc,
        state.exitRow,
        state.exitCol,
      );

      nextGrid = rotRes['grid'] as List<List<int>>;
      nextMarbleR = rotRes['marbleR'] as int;
      nextMarbleC = rotRes['marbleC'] as int;
      nextExitR = rotRes['exitR'] as int;
      nextExitC = rotRes['exitC'] as int;
      nextVisualRot += 0.25; // Spin 90 degrees clockwise
      nextMoves = 5; // Reset counter
    }

    state = state.copyWith(
      grid: nextGrid,
      marbleRow: nextMarbleR,
      marbleCol: nextMarbleC,
      exitRow: nextExitR,
      exitCol: nextExitC,
      movesUntilRotation: nextMoves,
      visualRotation: nextVisualRot,
      justRotated: rotated,
    );

    // Check victory
    if (state.marbleRow == state.exitRow && state.marbleCol == state.exitCol) {
      state = state.copyWith(isVictory: true);
      ref.read(gameStreakNotifierProvider.notifier).completeGame('rotating_maze', xpAmount: 25);
    }

    return true;
  }

  void clearRotatedFlag() {
    state = state.copyWith(justRotated: false);
  }

  void reset() {
    initGame();
  }
}
