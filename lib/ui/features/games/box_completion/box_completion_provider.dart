import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'box_completion_engine.dart';

part 'box_completion_provider.g.dart';

class BoxCompletionState {
  final BoxCompletionPuzzle? currentPuzzle;
  final int score;
  final int totalTrials;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool isTrialMode;
  final int targetTrials;

  BoxCompletionState({
    this.currentPuzzle,
    this.score = 0,
    this.totalTrials = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.isTrialMode = false,
    this.targetTrials = 20,
  });

  BoxCompletionState copyWith({
    BoxCompletionPuzzle? currentPuzzle,
    int? score,
    int? totalTrials,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? isTrialMode,
    int? targetTrials,
  }) {
    return BoxCompletionState(
      currentPuzzle: currentPuzzle ?? this.currentPuzzle,
      score: score ?? this.score,
      totalTrials: totalTrials ?? this.totalTrials,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      isTrialMode: isTrialMode ?? this.isTrialMode,
      targetTrials: targetTrials ?? this.targetTrials,
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
    final isTrialMode = ref.read(userDataNotifierProvider).isTrialModeEnabled ?? false;

    _nextTrial(resetScore: true);
    state = state.copyWith(
      timeLeft: 60, 
      isGameOver: false, 
      isLoading: false,
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
    final newScore = correct ? state.score + 1 : state.score;
    final newTotalTrials = state.totalTrials + 1;

    state = state.copyWith(
      score: newScore,
      totalTrials: newTotalTrials,
    );

    if (state.isTrialMode && newTotalTrials >= state.targetTrials) {
      state = state.copyWith(isGameOver: true);
    } else {
      _nextTrial();
    }
  }
}
