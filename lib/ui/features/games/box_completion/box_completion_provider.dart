import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'box_completion_engine.dart';

part 'box_completion_provider.g.dart';

class BoxCompletionState {
  final BoxCompletionPuzzle? currentPuzzle;
  final int score;
  final int totalTrials;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  BoxCompletionState({
    this.currentPuzzle,
    this.score = 0,
    this.totalTrials = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  BoxCompletionState copyWith({
    BoxCompletionPuzzle? currentPuzzle,
    int? score,
    int? totalTrials,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return BoxCompletionState(
      currentPuzzle: currentPuzzle ?? this.currentPuzzle,
      score: score ?? this.score,
      totalTrials: totalTrials ?? this.totalTrials,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class BoxCompletionNotifier extends _$BoxCompletionNotifier {
  final _engine = BoxCompletionEngine();
  Timer? _timer;

  @override
  BoxCompletionState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return BoxCompletionState();
  }

  void initGame() {
    _timer?.cancel();
    _nextTrial(resetScore: true);
    state = state.copyWith(timeLeft: 60, isGameOver: false, isLoading: false);
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

  void _nextTrial({bool resetScore = false}) {
    final puzzle = _engine.generatePuzzle();
    state = state.copyWith(
      currentPuzzle: puzzle,
      score: resetScore ? 0 : state.score,
      totalTrials: resetScore ? 0 : state.totalTrials,
    );
  }

  void onOptionPressed(int index) {
    if (state.isGameOver || state.currentPuzzle == null) return;

    bool correct = index == state.currentPuzzle!.correctOptionIndex;
    state = state.copyWith(
      score: correct ? state.score + 1 : state.score,
      totalTrials: state.totalTrials + 1,
    );
    _nextTrial();
  }
}
