import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'roman_arithmetic_engine.dart';

part 'roman_arithmetic_provider.g.dart';

enum RomanStatus { ready, playing, gameOver }

class RomanArithmeticState {
  final RomanStatus status;
  final RomanProblem? currentProblem;
  final int score;
  final int timeRemaining;
  final int bestScore;
  final bool isInvalidGuess;

  RomanArithmeticState({
    this.status = RomanStatus.ready,
    this.currentProblem,
    this.score = 0,
    this.timeRemaining = 60,
    this.bestScore = 0,
    this.isInvalidGuess = false,
  });

  RomanArithmeticState copyWith({
    RomanStatus? status,
    RomanProblem? currentProblem,
    int? score,
    int? timeRemaining,
    int? bestScore,
    bool? isInvalidGuess,
  }) {
    return RomanArithmeticState(
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
class RomanArithmeticNotifier extends _$RomanArithmeticNotifier {
  final _engine = RomanArithmeticEngine();
  Timer? _timer;

  @override
  RomanArithmeticState build() {
    return RomanArithmeticState();
  }

  void startGame() {
    if (state.status == RomanStatus.playing) return;
    
    state = state.copyWith(
      status: RomanStatus.playing,
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
    if (state.status != RomanStatus.playing || state.currentProblem == null) return;

    if (answer == state.currentProblem!.answer) {
      final newScore = state.score + 1;
      state = state.copyWith(
        score: newScore,
        currentProblem: _engine.generateProblem(newScore),
        isInvalidGuess: false,
      );
    } else {
      final newTime = state.timeRemaining - 3;
      if (newTime <= 0) {
        state = state.copyWith(timeRemaining: 0, isInvalidGuess: true);
        _endGame();
      } else {
        state = state.copyWith(timeRemaining: newTime, isInvalidGuess: true);
      }
      
      Future.delayed(const Duration(milliseconds: 400), () {
        if (state.status == RomanStatus.playing) {
          state = state.copyWith(isInvalidGuess: false);
        }
      });
    }
  }

  void _endGame() {
    _timer?.cancel();
    
    int newBest = state.score > state.bestScore ? state.score : state.bestScore;

    state = state.copyWith(
      status: RomanStatus.gameOver,
      bestScore: newBest,
    );

    if (state.score >= 10) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('roman_arithmetic', xpAmount: 20 + (state.score ~/ 2));
    }
  }

  void reset() {
    _timer?.cancel();
    state = RomanArithmeticState(bestScore: state.bestScore);
  }
}
