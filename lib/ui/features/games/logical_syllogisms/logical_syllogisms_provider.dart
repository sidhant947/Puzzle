import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'logical_syllogisms_engine.dart';

part 'logical_syllogisms_provider.g.dart';

class LogicalSyllogismsState {
  final LogicalSyllogismPuzzle? puzzle;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastResult;

  LogicalSyllogismsState({
    this.puzzle,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.lastResult,
  });

  LogicalSyllogismsState copyWith({
    LogicalSyllogismPuzzle? puzzle,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? lastResult,
  }) {
    return LogicalSyllogismsState(
      puzzle: puzzle ?? this.puzzle,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      lastResult: lastResult,
    );
  }
}

@riverpod
class LogicalSyllogismsNotifier extends _$LogicalSyllogismsNotifier {
  final _engine = LogicalSyllogismsEngine();
  Timer? _timer;

  @override
  LogicalSyllogismsState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return LogicalSyllogismsState();
  }

  void startGame() {
    _timer?.cancel();
    state = LogicalSyllogismsState(
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

    final isCorrect = answer == state.puzzle!.isValid;
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
