import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'visual_search_engine.dart';

part 'visual_search_provider.g.dart';

class VisualSearchState {
  final List<String> symbols;
  final int targetIndex;
  final int gridSize;
  final int score;
  final bool isGameOver;
  final bool isVictory;
  final bool isLoading;

  VisualSearchState({
    required this.symbols,
    required this.targetIndex,
    required this.gridSize,
    this.score = 0,
    this.isGameOver = false,
    this.isVictory = false,
    this.isLoading = true,
  });

  VisualSearchState copyWith({
    List<String>? symbols,
    int? targetIndex,
    int? gridSize,
    int? score,
    bool? isGameOver,
    bool? isVictory,
    bool? isLoading,
  }) {
    return VisualSearchState(
      symbols: symbols ?? this.symbols,
      targetIndex: targetIndex ?? this.targetIndex,
      gridSize: gridSize ?? this.gridSize,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class VisualSearchNotifier extends _$VisualSearchNotifier {
  final _engine = VisualSearchEngine();

  @override
  VisualSearchState build() {
    return VisualSearchState(
      symbols: [],
      targetIndex: -1,
      gridSize: 0,
    );
  }

  void initGame() {
    final level = _engine.generateLevel(0);
    state = VisualSearchState(
      symbols: level.symbols,
      targetIndex: level.targetIndex,
      gridSize: level.gridSize,
      isLoading: false,
    );
  }

  void onTileTap(int index) {
    if (state.isGameOver || state.isVictory) return;

    if (index == state.targetIndex) {
      final newScore = state.score + 1;
      
      if (newScore >= 15) {
        state = state.copyWith(
          score: newScore,
          isGameOver: true,
          isVictory: true,
        );
        return;
      }

      final nextLevel = _engine.generateLevel(newScore);
      state = state.copyWith(
        score: newScore,
        symbols: nextLevel.symbols,
        targetIndex: nextLevel.targetIndex,
        gridSize: nextLevel.gridSize,
      );
    } else {
      state = state.copyWith(isGameOver: true, isVictory: false);
    }
  }

  void resetGame() {
    state = build();
    initGame();
  }
}
