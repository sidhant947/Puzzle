import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'collatz_engine.dart';

part 'collatz_provider.g.dart';

class CollatzState {
  final CollatzLevel? currentLevel;
  final int currentNumber;
  final int stepsTaken;
  final bool isGameOver;
  final bool isLoading;

  CollatzState({
    this.currentLevel,
    this.currentNumber = 0,
    this.stepsTaken = 0,
    this.isGameOver = false,
    this.isLoading = true,
  });

  CollatzState copyWith({
    CollatzLevel? currentLevel,
    int? currentNumber,
    int? stepsTaken,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return CollatzState(
      currentLevel: currentLevel ?? this.currentLevel,
      currentNumber: currentNumber ?? this.currentNumber,
      stepsTaken: stepsTaken ?? this.stepsTaken,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CollatzNotifier extends _$CollatzNotifier {
  final _engine = CollatzEngine();

  @override
  CollatzState build() {
    return CollatzState();
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = CollatzState(
      currentLevel: level,
      currentNumber: level.startNumber,
      stepsTaken: 0,
      isLoading: false,
    );
  }

  void makeMove(int opIndex) {
    if (state.isGameOver || state.isLoading) return;

    final next = _engine.applyOp(state.currentNumber, opIndex);
    if (next == state.currentNumber) return; // Invalid move (e.g. /2 on odd)

    final nextSteps = state.stepsTaken + 1;
    state = state.copyWith(
      currentNumber: next,
      stepsTaken: nextSteps,
    );

    if (next == 1) {
      state = state.copyWith(isGameOver: true);
      ref.read(gameStreakNotifierProvider.notifier).completeGame('collatz', xpAmount: 25);
    }
  }

  void reset() {
    initGame();
  }
}
