import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'math_path_engine.dart';

part 'math_path_provider.g.dart';

class MathPathState {
  final MathPathLevel level;
  final List<Point<int>> currentPath;
  final int currentSum;
  final bool isSolved;

  MathPathState({
    required this.level,
    this.currentPath = const [Point(0, 0)],
    required this.currentSum,
    this.isSolved = false,
  });

  MathPathState copyWith({
    MathPathLevel? level,
    List<Point<int>>? currentPath,
    int? currentSum,
    bool? isSolved,
  }) {
    return MathPathState(
      level: level ?? this.level,
      currentPath: currentPath ?? this.currentPath,
      currentSum: currentSum ?? this.currentSum,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class MathPathNotifier extends _$MathPathNotifier {
  final _engine = MathPathEngine();

  @override
  MathPathState build() {
    final level = _engine.generateLevel();
    return MathPathState(
      level: level,
      currentSum: level.grid[0][0],
    );
  }

  void newGame() {
    final level = _engine.generateLevel();
    state = MathPathState(
      level: level,
      currentSum: level.grid[0][0],
    );
  }

  void toggleTile(int x, int y) {
    if (state.isSolved) return;

    final p = Point(x, y);
    final last = state.currentPath.last;

    // Must be adjacent to the last tile in path
    if ((p.x - last.x).abs() + (p.y - last.y).abs() != 1) {
      // If tapping a tile already in path, we backtrack to it
      if (state.currentPath.contains(p)) {
        final index = state.currentPath.indexOf(p);
        final newPath = state.currentPath.sublist(0, index + 1);
        int newSum = 0;
        for (var tile in newPath) {
          newSum += state.level.grid[tile.y][tile.x];
        }
        
        bool solved = newSum == state.level.targetSum;
        state = state.copyWith(currentPath: newPath, currentSum: newSum, isSolved: solved);
      }
      return;
    }

    if (state.currentPath.contains(p)) return;

    final newPath = [...state.currentPath, p];
    final newSum = state.currentSum + state.level.grid[y][x];
    
    bool solved = newSum == state.level.targetSum;

    state = state.copyWith(
      currentPath: newPath,
      currentSum: newSum,
      isSolved: solved,
    );
  }

  void resetPath() {
    state = state.copyWith(
      currentPath: [const Point(0, 0)],
      currentSum: state.level.grid[0][0],
      isSolved: false,
    );
  }
}
