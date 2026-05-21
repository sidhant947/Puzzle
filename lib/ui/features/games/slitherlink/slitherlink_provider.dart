import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'slitherlink_engine.dart';
import '../../../../providers/user_providers.dart';

part 'slitherlink_provider.g.dart';

class SlitherlinkState {
  final SlitherlinkLevel level;
  final List<List<bool>> currentHEdges;
  final List<List<bool>> currentVEdges;
  final bool isSolved;

  SlitherlinkState({
    required this.level,
    required this.currentHEdges,
    required this.currentVEdges,
    this.isSolved = false,
  });

  SlitherlinkState copyWith({
    SlitherlinkLevel? level,
    List<List<bool>>? currentHEdges,
    List<List<bool>>? currentVEdges,
    bool? isSolved,
  }) {
    return SlitherlinkState(
      level: level ?? this.level,
      currentHEdges: currentHEdges ?? this.currentHEdges,
      currentVEdges: currentVEdges ?? this.currentVEdges,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class SlitherlinkNotifier extends _$SlitherlinkNotifier {
  final _engine = SlitherlinkEngine();

  @override
  SlitherlinkState build() {
    final level = _engine.generateLevel(size: 3);
    return SlitherlinkState(
      level: level,
      currentHEdges: List.generate(level.size + 1, (_) => List.filled(level.size, false)),
      currentVEdges: List.generate(level.size, (_) => List.filled(level.size + 1, false)),
    );
  }

  void toggleHEdge(int r, int c) {
    if (state.isSolved) return;

    final newHEdges = [for (var row in state.currentHEdges) [...row]];
    newHEdges[r][c] = !newHEdges[r][c];

    final isSolved = _checkSolved(newHEdges, state.currentVEdges);
    state = state.copyWith(currentHEdges: newHEdges, isSolved: isSolved);

    if (isSolved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('slitherlink', xpAmount: 25);
    }
  }

  void toggleVEdge(int r, int c) {
    if (state.isSolved) return;

    final newVEdges = [for (var row in state.currentVEdges) [...row]];
    newVEdges[r][c] = !newVEdges[r][c];

    final isSolved = _checkSolved(state.currentHEdges, newVEdges);
    state = state.copyWith(currentVEdges: newVEdges, isSolved: isSolved);

    if (isSolved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('slitherlink', xpAmount: 25);
    }
  }

  void reset() {
    state = SlitherlinkState(
      level: state.level,
      currentHEdges: List.generate(state.level.size + 1, (_) => List.filled(state.level.size, false)),
      currentVEdges: List.generate(state.level.size, (_) => List.filled(state.level.size + 1, false)),
      isSolved: false,
    );
  }

  void newGame() {
    final level = _engine.generateLevel(size: 3);
    state = SlitherlinkState(
      level: level,
      currentHEdges: List.generate(level.size + 1, (_) => List.filled(level.size, false)),
      currentVEdges: List.generate(level.size, (_) => List.filled(level.size + 1, false)),
      isSolved: false,
    );
  }

  bool _checkSolved(List<List<bool>> hEdges, List<List<bool>> vEdges) {
    final level = state.level;
    final size = level.size;

    // 1. Check all clue constraints
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final clue = level.clues[r][c];
        if (clue != null) {
          int count = 0;
          if (hEdges[r][c]) count++;       // Top
          if (hEdges[r + 1][c]) count++;   // Bottom
          if (vEdges[r][c]) count++;       // Left
          if (vEdges[r][c + 1]) count++;   // Right
          if (count != clue) return false;
        }
      }
    }

    // 2. Check if the edges form a single closed loop
    return _engine.isValidSingleLoop(size, hEdges, vEdges);
  }
}
