import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'base_shift_engine.dart';

part 'base_shift_provider.g.dart';

class BaseShiftState {
  final BaseShiftLevel? currentLevel;
  final int score;
  final bool isGameOver;
  final bool isLoading;
  final String? message;

  BaseShiftState({
    this.currentLevel,
    this.score = 0,
    this.isGameOver = false,
    this.isLoading = true,
    this.message,
  });

  BaseShiftState copyWith({
    BaseShiftLevel? currentLevel,
    int? score,
    bool? isGameOver,
    bool? isLoading,
    String? message,
  }) {
    return BaseShiftState(
      currentLevel: currentLevel ?? this.currentLevel,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      message: message,
    );
  }
}

@riverpod
class BaseShiftNotifier extends _$BaseShiftNotifier {
  final _engine = BaseShiftEngine();

  @override
  BaseShiftState build() {
    return BaseShiftState();
  }

  void initGame() {
    state = BaseShiftState(
      currentLevel: _engine.generateLevel(),
      isLoading: false,
    );
  }

  void submitAnswer(String answer) {
    if (state.currentLevel == null || state.isGameOver) return;

    final result = int.tryParse(answer);
    if (result == state.currentLevel!.result) {
      final nextScore = state.score + 1;
      if (nextScore >= 5) {
        state = state.copyWith(score: nextScore, isGameOver: true);
        ref.read(gameStreakNotifierProvider.notifier).completeGame('base_shift', xpAmount: 25);
      } else {
        state = state.copyWith(
          score: nextScore,
          currentLevel: _engine.generateLevel(),
          message: 'correct',
        );
        Future.delayed(const Duration(seconds: 1), () {
          if (state.message == 'correct') state = state.copyWith(message: null);
        });
      }
    } else {
      state = state.copyWith(message: 'incorrect');
      Future.delayed(const Duration(seconds: 1), () {
        if (state.message == 'incorrect') state = state.copyWith(message: null);
      });
    }
  }

  void reset() {
    initGame();
  }
}
