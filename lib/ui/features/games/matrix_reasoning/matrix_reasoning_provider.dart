import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'matrix_reasoning_engine.dart';

part 'matrix_reasoning_provider.g.dart';

class MatrixReasoningState {
  final MatrixReasoningPuzzle? puzzle;
  final int score;
  final int totalTrials;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastResult;
  final bool isTrialMode;
  final int targetTrials;

  MatrixReasoningState({
    this.puzzle,
    this.score = 0,
    this.totalTrials = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.lastResult,
    this.isTrialMode = false,
    this.targetTrials = 20,
  });

  MatrixReasoningState copyWith({
    MatrixReasoningPuzzle? puzzle,
    int? score,
    int? totalTrials,
    int? timeLeft,
    bool? isGameOver,
    bool? lastResult,
    bool? isTrialMode,
    int? targetTrials,
  }) {
    return MatrixReasoningState(
      puzzle: puzzle ?? this.puzzle,
      score: score ?? this.score,
      totalTrials: totalTrials ?? this.totalTrials,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      lastResult: lastResult,
      isTrialMode: isTrialMode ?? this.isTrialMode,
      targetTrials: targetTrials ?? this.targetTrials,
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
    final isTrialMode = ref.read(userDataNotifierProvider).isTrialModeEnabled ?? false;

    state = MatrixReasoningState(
      puzzle: _engine.generatePuzzle(),
      score: 0,
      totalTrials: 0,
      timeLeft: 60,
      isGameOver: false,
      isTrialMode: isTrialMode,
    );

    if (!isTrialMode) {
      _startTimer();
    }
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
    
    final newScore = isCorrect ? state.score + 1 : state.score;
    final newTotalTrials = state.totalTrials + 1;

    state = state.copyWith(
      score: newScore,
      totalTrials: newTotalTrials,
      lastResult: isCorrect,
    );

    if (state.isTrialMode && newTotalTrials >= state.targetTrials) {
      state = state.copyWith(isGameOver: true);
    } else {
      state = state.copyWith(puzzle: _engine.generatePuzzle());
    }
  }
}
