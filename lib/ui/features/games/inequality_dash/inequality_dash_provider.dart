import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'inequality_dash_engine.dart';

part 'inequality_dash_provider.g.dart';

class InequalityDashState {
  final InequalityQuestion? currentQuestion;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastAnswerCorrect;
  final bool isLoading;

  InequalityDashState({
    this.currentQuestion,
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.lastAnswerCorrect,
    this.isLoading = true,
  });

  InequalityDashState copyWith({
    InequalityQuestion? currentQuestion,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? lastAnswerCorrect,
    bool? isLoading,
  }) {
    return InequalityDashState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      lastAnswerCorrect: lastAnswerCorrect, // Set directly so null is allowed
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class InequalityDashNotifier extends _$InequalityDashNotifier {
  final _engine = InequalityDashEngine();
  Timer? _timer;

  @override
  InequalityDashState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return InequalityDashState();
  }

  void initGame() {
    _timer?.cancel();
    final question = _engine.generateQuestion(0);
    state = InequalityDashState(
      currentQuestion: question,
      score: 0,
      timeLeft: 30,
      isGameOver: false,
      lastAnswerCorrect: null,
      isLoading: false,
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
        ref.read(gameStreakNotifierProvider.notifier).completeGame('inequality_dash', xpAmount: 25);
      }
    });
  }

  void submitAnswer(String op) {
    if (state.isGameOver || state.isLoading || state.currentQuestion == null) return;

    final isCorrect = state.currentQuestion!.correctOperator == op;
    final newScore = isCorrect ? state.score + 1 : state.score;

    final nextQuestion = _engine.generateQuestion(newScore);

    state = state.copyWith(
      score: newScore,
      currentQuestion: nextQuestion,
      lastAnswerCorrect: isCorrect,
    );
  }

  void reset() {
    initGame();
  }
}
