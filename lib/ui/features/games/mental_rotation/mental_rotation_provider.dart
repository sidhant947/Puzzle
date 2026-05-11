import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'mental_rotation_engine.dart';

part 'mental_rotation_provider.g.dart';

class MentalRotationState {
  final MentalRotationPuzzle? puzzle;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastResult; // true if correct, false if wrong, null if pending

  MentalRotationState({
    this.puzzle,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.lastResult,
  });

  MentalRotationState copyWith({
    MentalRotationPuzzle? puzzle,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? lastResult,
  }) {
    return MentalRotationState(
      puzzle: puzzle ?? this.puzzle,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      lastResult: lastResult,
    );
  }
}

@riverpod
class MentalRotationNotifier extends _$MentalRotationNotifier {
  final _engine = MentalRotationEngine();
  Timer? _timer;

  @override
  MentalRotationState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return MentalRotationState();
  }

  void startGame() {
    _timer?.cancel();
    state = MentalRotationState(
      puzzle: _engine.generatePuzzle(),
      score: 0,
      timeLeft: 60,
      isGameOver: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        state = state.copyWith(isGameOver: true);
      }
    });
  }

  void submitAnswer(bool answer) {
    if (state.isGameOver || state.puzzle == null) return;

    final isCorrect = answer == state.puzzle!.isSame;
    if (isCorrect) {
      state = state.copyWith(
        score: state.score + 1,
        puzzle: _engine.generatePuzzle(),
        lastResult: true,
      );
    } else {
      state = state.copyWith(
        puzzle: _engine.generatePuzzle(),
        lastResult: false,
      );
    }
  }
}
