import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'fibonacci_merge_engine.dart';

part 'fibonacci_merge_provider.g.dart';

class FibonacciMergeState {
  final List<Tile> tiles;
  final int score;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  FibonacciMergeState({
    required this.tiles,
    this.score = 0,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  FibonacciMergeState copyWith({
    List<Tile>? tiles,
    int? score,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return FibonacciMergeState(
      tiles: tiles ?? this.tiles,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class FibonacciMergeNotifier extends _$FibonacciMergeNotifier {
  final _engine = FibonacciMergeEngine();

  @override
  FibonacciMergeState build() {
    return FibonacciMergeState(tiles: []);
  }

  void initGame() {
    final initialTiles = _engine.initBoard();
    state = FibonacciMergeState(
      tiles: initialTiles,
      isLoading: false,
    );
  }

  void move(int dx, int dy) {
    if (state.isGameOver) return;

    final result = _engine.move(state.tiles, dx, dy);
    if (result['moved'] as bool) {
      final newTiles = result['tiles'] as List<Tile>;
      final scoreGained = result['score'] as int;
      final newScore = state.score + scoreGained;
      
      bool won = newTiles.any((t) => t.value >= 1597); // Target can be 1597 (9th unique Fib)
      bool lost = _engine.isGameOver(newTiles);

      state = state.copyWith(
        tiles: newTiles,
        score: newScore,
        isGameOver: lost || won,
        isGameWon: won,
      );
    }
  }
}
