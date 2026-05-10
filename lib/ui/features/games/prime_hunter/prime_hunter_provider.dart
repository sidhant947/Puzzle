import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'prime_hunter_engine.dart';

part 'prime_hunter_provider.g.dart';

class PrimeHunterState {
  final String roundId;
  final int currentNumber;
  final bool isPrime;
  final int score;
  final bool isGameOver;
  final bool isVictory;
  final bool isLoading;

  PrimeHunterState({
    this.roundId = '',
    this.currentNumber = 0,
    this.isPrime = false,
    this.score = 0,
    this.isGameOver = false,
    this.isVictory = false,
    this.isLoading = true,
  });

  PrimeHunterState copyWith({
    String? roundId,
    int? currentNumber,
    bool? isPrime,
    int? score,
    bool? isGameOver,
    bool? isVictory,
    bool? isLoading,
  }) {
    return PrimeHunterState(
      roundId: roundId ?? this.roundId,
      currentNumber: currentNumber ?? this.currentNumber,
      isPrime: isPrime ?? this.isPrime,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PrimeHunterNotifier extends _$PrimeHunterNotifier {
  final _engine = PrimeHunterEngine();

  @override
  PrimeHunterState build() {
    return PrimeHunterState();
  }

  void initGame() {
    final level = _engine.generateLevel(0);
    state = PrimeHunterState(
      roundId: DateTime.now().millisecondsSinceEpoch.toString(),
      currentNumber: level.number,
      isPrime: level.isPrime,
      isLoading: false,
    );
  }

  void onSwipe(bool swipedLeft) {
    if (state.isGameOver || state.isVictory) return;

    // Left = Prime, Right = Composite
    if (swipedLeft == state.isPrime) {
      final newScore = state.score + 1;
      
      if (newScore >= 10) {
        state = state.copyWith(
          roundId: 'victory',
          score: newScore,
          isGameOver: true,
          isVictory: true,
        );
        return;
      }

      final nextLevel = _engine.generateLevel(newScore);
      state = state.copyWith(
        roundId: DateTime.now().millisecondsSinceEpoch.toString(),
        score: newScore,
        currentNumber: nextLevel.number,
        isPrime: nextLevel.isPrime,
      );
    } else {
      state = state.copyWith(
        roundId: 'game_over', // Change key to trigger removal
        isGameOver: true,
        isVictory: false,
      );
    }
  }

  void resetGame() {
    state = PrimeHunterState(score: 0, isGameOver: false, isLoading: false);
    initGame();
  }
}
