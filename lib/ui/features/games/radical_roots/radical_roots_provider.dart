import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'radical_roots_engine.dart';

part 'radical_roots_provider.g.dart';

enum RadicalStatus { ready, playing, gameOver }

class RadicalRootsState {
  final RadicalStatus status;
  final RadicalProblem? currentProblem;
  final int score;
  final int timeRemaining;
  final int bestScore;
  final bool isInvalidGuess;

  RadicalRootsState({
    this.status = RadicalStatus.ready,
    this.currentProblem,
    this.score = 0,
    this.timeRemaining = 60,
    this.bestScore = 0,
    this.isInvalidGuess = false,
  });

  RadicalRootsState copyWith({
    RadicalStatus? status,
    RadicalProblem? currentProblem,
    int? score,
    int? timeRemaining,
    int? bestScore,
    bool? isInvalidGuess,
  }) {
    return RadicalRootsState(
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
class RadicalRootsNotifier extends _$RadicalRootsNotifier {
  final _engine = RadicalRootsEngine();
  Timer? _timer;

  @override
  RadicalRootsState build() {
    return RadicalRootsState();
  }

  void startGame() {
    if (state.status == RadicalStatus.playing) return;
    
    state = state.copyWith(
      status: RadicalStatus.playing,
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
    if (state.status != RadicalStatus.playing || state.currentProblem == null) return;

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
        if (state.status == RadicalStatus.playing) {
          state = state.copyWith(isInvalidGuess: false);
        }
      });
    }
  }

  void _endGame() {
    _timer?.cancel();
    
    int newBest = state.score > state.bestScore ? state.score : state.bestScore;

    state = state.copyWith(
      status: RadicalStatus.gameOver,
      bestScore: newBest,
    );

    if (state.score >= 10) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('radical_roots', xpAmount: 20 + (state.score ~/ 2));
    }
  }

  void reset() {
    _timer?.cancel();
    state = RadicalRootsState(bestScore: state.bestScore);
  }
}
