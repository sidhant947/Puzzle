import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'topology_engine.dart';

part 'topology_provider.g.dart';

class TopologyState {
  final TopologyLevel? currentLevel;
  final int score;
  final bool isGameOver;
  final bool isLoading;
  final String? message;

  TopologyState({
    this.currentLevel,
    this.score = 0,
    this.isGameOver = false,
    this.isLoading = true,
    this.message,
  });

  TopologyState copyWith({
    TopologyLevel? currentLevel,
    int? score,
    bool? isGameOver,
    bool? isLoading,
    String? message,
  }) {
    return TopologyState(
      currentLevel: currentLevel ?? this.currentLevel,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      message: message,
    );
  }
}

@riverpod
class TopologyNotifier extends _$TopologyNotifier {
  final _engine = TopologyEngine();

  @override
  TopologyState build() {
    return TopologyState();
  }

  void initGame() {
    state = TopologyState(
      currentLevel: _engine.generateLevel(),
      isLoading: false,
    );
  }

  void submitAnswer(bool areEquivalent) {
    if (state.currentLevel == null || state.isGameOver) return;

    if (areEquivalent == state.currentLevel!.areEquivalent) {
      final nextScore = state.score + 1;
      if (nextScore >= 10) {
        state = state.copyWith(score: nextScore, isGameOver: true);
        ref.read(gameStreakNotifierProvider.notifier).completeGame('topology', xpAmount: 20);
      } else {
        state = state.copyWith(
          score: nextScore,
          currentLevel: _engine.generateLevel(),
          message: 'correct',
        );
        Future.delayed(const Duration(milliseconds: 500), () {
          if (state.message == 'correct') state = state.copyWith(message: null);
        });
      }
    } else {
      state = state.copyWith(message: 'incorrect');
      Future.delayed(const Duration(milliseconds: 500), () {
        if (state.message == 'incorrect') state = state.copyWith(message: null);
      });
    }
  }

  void reset() {
    initGame();
  }
}
