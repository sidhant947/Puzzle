import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'matrix_reasoning_engine.dart';

part 'matrix_reasoning_provider.g.dart';

class MatrixReasoningState {
  final MatrixReasoningPuzzle? puzzle;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastResult;

  MatrixReasoningState({
    this.puzzle,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.lastResult,
  });

  MatrixReasoningState copyWith({
    MatrixReasoningPuzzle? puzzle,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? lastResult,
  }) {
    return MatrixReasoningState(
      puzzle: puzzle ?? this.puzzle,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      lastResult: lastResult,
    );
  }
}

@riverpod
class MatrixReasoningNotifier extends _$MatrixReasoningNotifier {
  final _engine = MatrixReasoningEngine();
  Timer? _timer;

  @override
  MatrixReasoningState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return MatrixReasoningState();
  }

  void startGame() {
    _timer?.cancel();
    state = MatrixReasoningState(
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

  void submitAnswer(MatrixCell cell) {
    if (state.isGameOver || state.puzzle == null) return;

    final isCorrect = cell.shape == state.puzzle!.answer.shape && 
                      cell.color == state.puzzle!.answer.color;
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
