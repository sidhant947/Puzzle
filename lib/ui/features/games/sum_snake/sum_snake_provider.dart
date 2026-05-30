import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'sum_snake_engine.dart';

part 'sum_snake_provider.g.dart';

class SumSnakeState {
  final List<List<int>> grid;
  final List<Point<int>> currentPath;
  final int targetSum;
  final int currentSum;
  final bool isVictory;
  final bool isLoading;
  final int score;

  SumSnakeState({
    required this.grid,
    this.currentPath = const [],
    this.targetSum = 0,
    this.currentSum = 0,
    this.isVictory = false,
    this.isLoading = true,
    this.score = 0,
  });

  SumSnakeState copyWith({
    List<List<int>>? grid,
    List<Point<int>>? currentPath,
    int? targetSum,
    int? currentSum,
    bool? isVictory,
    bool? isLoading,
    int? score,
  }) {
    return SumSnakeState(
      grid: grid ?? this.grid,
      currentPath: currentPath ?? this.currentPath,
      targetSum: targetSum ?? this.targetSum,
      currentSum: currentSum ?? this.currentSum,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      score: score ?? this.score,
    );
  }
}

@riverpod
class SumSnakeNotifier extends _$SumSnakeNotifier {
  final _engine = SumSnakeEngine();

  @override
  SumSnakeState build() {
    return SumSnakeState(grid: []);
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = SumSnakeState(
      grid: level['grid'],
      targetSum: level['targetSum'],
      isLoading: false,
      score: state.score,
    );
  }

  void toggleCell(int x, int y) {
    if (state.isVictory || state.isLoading) return;

    final p = Point(x, y);
    final path = List<Point<int>>.from(state.currentPath);

    if (path.isEmpty) {
      path.add(p);
    } else {
      // Must be adjacent and not already in path
      final last = path.last;
      bool isAdjacent = (last.x - p.x).abs() + (last.y - p.y).abs() == 1;
      
      if (path.contains(p)) {
        // If it's the last one, remove it
        if (path.last == p) {
          path.removeLast();
        } else {
          // Reset if tapping inside path
          path.clear();
          path.add(p);
        }
      } else if (isAdjacent) {
        path.add(p);
      } else {
        // Reset path to just this cell if not adjacent
        path.clear();
        path.add(p);
      }
    }

    int sum = 0;
    for (final cell in path) {
      sum += state.grid[cell.y][cell.x];
    }

    state = state.copyWith(
      currentPath: path,
      currentSum: sum,
    );

    if (sum == state.targetSum) {
      state = state.copyWith(isVictory: true, score: state.score + 1);
    }
  }

  void clearPath() {
    state = state.copyWith(currentPath: [], currentSum: 0);
  }
}
