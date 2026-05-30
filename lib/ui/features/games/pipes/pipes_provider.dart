import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'pipes_engine.dart';

part 'pipes_provider.g.dart';

class PipesState {
  final PipesLevel level;
  final List<List<Point>> paths;
  final int? activeColorIndex;
  final bool isSolved;

  PipesState({
    required this.level,
    required this.paths,
    this.activeColorIndex,
    this.isSolved = false,
  });

  PipesState copyWith({
    PipesLevel? level,
    List<List<Point>>? paths,
    int? activeColorIndex,
    bool? isSolved,
  }) {
    return PipesState(
      level: level ?? this.level,
      paths: paths ?? this.paths,
      activeColorIndex: activeColorIndex == -1 ? null : (activeColorIndex ?? this.activeColorIndex),
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class PipesNotifier extends _$PipesNotifier {
  final _engine = PipesEngine();

  @override
  PipesState build() {
    final level = _engine.generateRandomLevel();
    return PipesState(
      level: level,
      paths: List.generate(level.pairs.length, (_) => []),
    );
  }

  void newGame() {
    final level = _engine.generateRandomLevel();
    state = PipesState(
      level: level,
      paths: List.generate(level.pairs.length, (_) => []),
    );
  }

  void startPath(int x, int y) {
    if (x < 0 || x >= state.level.size || y < 0 || y >= state.level.size) return;
    final point = Point(x, y);
    int? colorIndex;

    for (int i = 0; i < state.level.pairs.length; i++) {
      if (state.level.pairs[i].contains(point)) {
        colorIndex = i;
        break;
      }
    }

    if (colorIndex == null) {
      for (int i = 0; i < state.paths.length; i++) {
        if (state.paths[i].contains(point)) {
          colorIndex = i;
          final newPaths = List<List<Point>>.from(state.paths);
          final indexInPath = newPaths[i].indexOf(point);
          newPaths[i] = newPaths[i].sublist(0, indexInPath + 1);
          state = state.copyWith(paths: newPaths, activeColorIndex: colorIndex);
          return;
        }
      }
    }

    if (colorIndex != null) {
      final newPaths = List<List<Point>>.from(state.paths);
      if (state.level.pairs[colorIndex].contains(point)) {
        newPaths[colorIndex] = [point];
      }
      state = state.copyWith(activeColorIndex: colorIndex, paths: newPaths);
    }
  }

  void updatePath(int x, int y) {
    if (state.activeColorIndex == null) return;
    if (x < 0 || x >= state.level.size || y < 0 || y >= state.level.size) return;
    final colorIndex = state.activeColorIndex!;
    final point = Point(x, y);
    final currentPath = state.paths[colorIndex];

    if (currentPath.isEmpty) return;
    if (currentPath.last == point) return;

    final last = currentPath.last;
    final dx = (last.x - point.x).abs();
    final dy = (last.y - point.y).abs();
    if ((dx == 1 && dy == 0) || (dx == 0 && dy == 1)) {
      int? existingColor;
      for (int i = 0; i < state.paths.length; i++) {
        if (state.paths[i].contains(point)) {
          existingColor = i;
          break;
        }
      }

      final newPaths = List<List<Point>>.from(state.paths.map((e) => List<Point>.from(e)));

      if (existingColor != null) {
        if (existingColor == colorIndex) {
          final idx = newPaths[colorIndex].indexOf(point);
          newPaths[colorIndex] = newPaths[colorIndex].sublist(0, idx + 1);
        } else {
          final idx = newPaths[existingColor].indexOf(point);
          newPaths[existingColor] = newPaths[existingColor].sublist(0, idx);
          newPaths[colorIndex].add(point);
        }
      } else {
        newPaths[colorIndex].add(point);
      }

      final pair = state.level.pairs[colorIndex];
      final otherDot = currentPath.first == pair[0] ? pair[1] : pair[0];
      
      state = state.copyWith(paths: newPaths);
      
      if (point == otherDot) {
        state = state.copyWith(activeColorIndex: -1);
        _checkVictory();
      }
    }
  }

  void endPath() {
    state = state.copyWith(activeColorIndex: -1);
    _checkVictory();
  }

  void _checkVictory() {
    if (_engine.isSolved(state.level.size, state.level.pairs, state.paths)) {
      state = state.copyWith(isSolved: true);
    }
  }
}
