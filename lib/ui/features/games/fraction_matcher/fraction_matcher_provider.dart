import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'fraction_matcher_engine.dart';

part 'fraction_matcher_provider.g.dart';

class FractionMatcherState {
  final FractionMatcherLevel? currentLevel;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastAnswerCorrect;

  FractionMatcherState({
    this.currentLevel,
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastAnswerCorrect,
  });

  FractionMatcherState copyWith({
    FractionMatcherLevel? currentLevel,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastAnswerCorrect,
  }) {
    return FractionMatcherState(
      currentLevel: currentLevel ?? this.currentLevel,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastAnswerCorrect: lastAnswerCorrect, // Null is allowed here
    );
  }
}

@riverpod
class FractionMatcherNotifier extends _$FractionMatcherNotifier {
  final _engine = FractionMatcherEngine();
  Timer? _timer;

  @override
  FractionMatcherState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return FractionMatcherState();
  }

  void initGame() {
    _timer?.cancel();
    final firstLevel = _engine.generateLevel(0);
    state = FractionMatcherState(
      currentLevel: firstLevel,
      score: 0,
      timeLeft: 30,
      isGameOver: false,
      isLoading: false,
      lastAnswerCorrect: null,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 1) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        state = state.copyWith(
          timeLeft: 0,
          isGameOver: true,
        );
        ref.read(gameStreakNotifierProvider.notifier).completeGame('fraction_matcher', xpAmount: 25);
      }
    });
  }

  void selectOption(int index) {
    if (state.isGameOver || state.isLoading || state.currentLevel == null) return;

    final level = state.currentLevel!;
    final isCorrect = index == level.correctOptionIndex;

    final nextScore = isCorrect ? state.score + 1 : state.score;
    final penaltyOrBonus = isCorrect ? 2 : -3;
    final nextTime = (state.timeLeft + penaltyOrBonus).clamp(0, 30);

    if (nextTime == 0) {
      _timer?.cancel();
      state = state.copyWith(
        score: nextScore,
        timeLeft: 0,
        isGameOver: true,
        lastAnswerCorrect: isCorrect,
      );
      ref.read(gameStreakNotifierProvider.notifier).completeGame('fraction_matcher', xpAmount: 25);
      return;
    }

    final nextLevel = _engine.generateLevel(nextScore);

    state = state.copyWith(
      score: nextScore,
      currentLevel: nextLevel,
      timeLeft: nextTime,
      lastAnswerCorrect: isCorrect,
    );
  }

  void reset() {
    initGame();
  }
}
