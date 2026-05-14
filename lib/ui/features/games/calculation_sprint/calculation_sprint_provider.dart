import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'calculation_sprint_engine.dart';

part 'calculation_sprint_provider.g.dart';

enum SprintStatus { ready, playing, gameOver }

class CalculationSprintState {
  final SprintStatus status;
  final MathProblem? currentProblem;
  final int score;
  final int timeRemaining;
  final int bestScore;
  final bool isInvalidGuess;

  CalculationSprintState({
    this.status = SprintStatus.ready,
    this.currentProblem,
    this.score = 0,
    this.timeRemaining = 60,
    this.bestScore = 0,
    this.isInvalidGuess = false,
  });

  CalculationSprintState copyWith({
    SprintStatus? status,
    MathProblem? currentProblem,
    int? score,
    int? timeRemaining,
    int? bestScore,
    bool? isInvalidGuess,
  }) {
    return CalculationSprintState(
      status: status ?? this.status,
      currentProblem: currentProblem ?? this.currentProblem,
      score: score ?? this.score,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      bestScore: bestScore ?? this.bestScore,
      isInvalidGuess: isInvalidGuess ?? this.isInvalidGuess,
    );
  }
}

@riverpod
class CalculationSprintNotifier extends _$CalculationSprintNotifier {
  final _engine = CalculationSprintEngine();
  Timer? _timer;

  @override
  CalculationSprintState build() {
    return CalculationSprintState();
  }

  void startGame() {
    if (state.status == SprintStatus.playing) return;
    
    state = state.copyWith(
      status: SprintStatus.playing,
      score: 0,
      timeRemaining: 60,
      currentProblem: _engine.generateProblem(0),
    );

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeRemaining > 0) {
        state = state.copyWith(timeRemaining: state.timeRemaining - 1);
      } else {
        _endGame();
      }
    });
  }

  void submitAnswer(int answer) {
    if (state.status != SprintStatus.playing || state.currentProblem == null) return;

    if (answer == state.currentProblem!.answer) {
      final newScore = state.score + 1;
      state = state.copyWith(
        score: newScore,
        currentProblem: _engine.generateProblem(newScore),
        isInvalidGuess: false,
      );
    } else {
      // Penalty for wrong answer (time deduction)
      final newTime = state.timeRemaining - 3;
      if (newTime <= 0) {
        state = state.copyWith(timeRemaining: 0, isInvalidGuess: true);
        _endGame();
      } else {
        state = state.copyWith(timeRemaining: newTime, isInvalidGuess: true);
      }
      
      // Auto clear the invalid flag after a tiny delay so it can shake again
      Future.delayed(const Duration(milliseconds: 400), () {
        if (state.status == SprintStatus.playing) {
          state = state.copyWith(isInvalidGuess: false);
        }
      });
    }
  }

  void _endGame() {
    _timer?.cancel();
    
    int newBest = state.score > state.bestScore ? state.score : state.bestScore;

    state = state.copyWith(
      status: SprintStatus.gameOver,
      bestScore: newBest,
    );

    // Goal: Get at least 15 points to "complete" the game for the daily streak
    if (state.score >= 15) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('calculation_sprint', xpAmount: 20 + (state.score ~/ 2));
    }
  }

  void reset() {
    _timer?.cancel();
    state = CalculationSprintState(bestScore: state.bestScore);
  }
}
