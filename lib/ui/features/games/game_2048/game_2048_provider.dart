import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'game_2048_engine.dart';

part 'game_2048_provider.g.dart';

class Game2048State {
  final List<Tile> tiles;
  final int score;
  final bool isGameOver;
  final bool isGameWon;

  Game2048State({
    required this.tiles,
    this.score = 0,
    this.isGameOver = false,
    this.isGameWon = false,
  });

  Game2048State copyWith({
    List<Tile>? tiles,
    int? score,
    bool? isGameOver,
    bool? isGameWon,
  }) {
    return Game2048State(
      tiles: tiles ?? this.tiles,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
    );
  }
}

@riverpod
class Game2048Notifier extends _$Game2048Notifier {
  final _engine = Game2048Engine();

  @override
  Game2048State build() {
    return Game2048State(tiles: _engine.initBoard());
  }

  void reset() {
    state = Game2048State(tiles: _engine.initBoard());
  }

  void move(int dx, int dy) {
    if (state.isGameOver) return;

    final result = _engine.move(state.tiles, dx, dy);
    if (result['moved'] == false) return;

    final List<Tile> newTiles = result['tiles'];
    final int newScore = state.score + (result['score'] as int);
    
    bool won = state.isGameWon;
    if (!won) {
      for (var t in newTiles) {
        if (t.value == 2048) {
          won = true;
          break;
        }
      }
    }

    state = state.copyWith(
      tiles: newTiles,
      score: newScore,
      isGameOver: _engine.isGameOver(newTiles),
      isGameWon: won,
    );
  }
}
