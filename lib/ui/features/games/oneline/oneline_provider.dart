import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'oneline_engine.dart';

part 'oneline_provider.g.dart';

class OnelineState {
  final List<Point<int>> allDots;
  final List<Point<int>> currentPath;
  final bool isSolved;

  OnelineState({
    required this.allDots,
    required this.currentPath,
    this.isSolved = false,
  });

  OnelineState copyWith({
    List<Point<int>>? currentPath,
    bool? isSolved,
  }) {
    return OnelineState(
      allDots: allDots,
      currentPath: currentPath ?? this.currentPath,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class OnelineNotifier extends _$OnelineNotifier {
  final _engine = OnelineEngine();

  @override
  OnelineState build() {
    final List<Point<int>> dots = [];
    for (int y = 0; y < 4; y++) {
      for (int x = 0; x < 4; x++) {
        dots.add(Point(x, y));
      }
    }
    
    final levelPath = _engine.generateLevel();
    // Start with the first dot of the level path
    return OnelineState(
      allDots: dots,
      currentPath: [levelPath.first],
    );
  }

  void addDot(Point<int> dot) {
    if (state.isSolved) return;
    
    // Check if dot is already in path
    if (state.currentPath.contains(dot)) {
      // If it's the second to last dot, we can "undo" the last move
      if (state.currentPath.length > 1 && state.currentPath[state.currentPath.length - 2] == dot) {
        state = state.copyWith(
          currentPath: state.currentPath.sublist(0, state.currentPath.length - 1),
        );
      }
      return;
    }

    // Check if dot is adjacent to the last dot in path
    final lastDot = state.currentPath.last;
    final dx = (lastDot.x - dot.x).abs();
    final dy = (lastDot.y - dot.y).abs();
    
    if ((dx == 1 && dy == 0) || (dx == 0 && dy == 1)) {
      final newPath = [...state.currentPath, dot];
      final solved = _engine.isComplete(newPath, state.allDots.length);
      state = state.copyWith(currentPath: newPath, isSolved: solved);
    }
  }

  void reset() {
    state = build();
  }
}
