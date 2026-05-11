import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'letter_cancellation_engine.dart';

part 'letter_cancellation_provider.g.dart';

class LetterCancellationState {
  final String target;
  final List<String> grid;
  final Set<int> foundIndices;
  final int targetCount;
  final int score;
  final int totalTaps;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  LetterCancellationState({
    this.target = '',
    this.grid = const [],
    this.foundIndices = const {},
    this.targetCount = 0,
    this.score = 0,
    this.totalTaps = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  LetterCancellationState copyWith({
    String? target,
    List<String>? grid,
    Set<int>? foundIndices,
    int? targetCount,
    int? score,
    int? totalTaps,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return LetterCancellationState(
      target: target ?? this.target,
      grid: grid ?? this.grid,
      foundIndices: foundIndices ?? this.foundIndices,
      targetCount: targetCount ?? this.targetCount,
      score: score ?? this.score,
      totalTaps: totalTaps ?? this.totalTaps,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class LetterCancellationNotifier extends _$LetterCancellationNotifier {
  final _engine = LetterCancellationEngine();
  Timer? _timer;

  @override
  LetterCancellationState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return LetterCancellationState();
  }

  void initGame() {
    _timer?.cancel();
    _nextGrid(resetScore: true);
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

  void _nextGrid({bool resetScore = false}) {
    final data = _engine.generateGrid();
    state = state.copyWith(
      target: data['target'],
      grid: data['grid'],
      targetCount: data['targetCount'],
      foundIndices: {},
      score: resetScore ? 0 : state.score,
      totalTaps: resetScore ? 0 : state.totalTaps,
    );
  }

  void onLetterPressed(int index) {
    if (state.isGameOver || state.foundIndices.contains(index)) return;

    bool correct = state.grid[index] == state.target;
    if (correct) {
      final newFound = Set<int>.from(state.foundIndices)..add(index);
      state = state.copyWith(
        foundIndices: newFound,
        score: state.score + 1,
        totalTaps: state.totalTaps + 1,
      );

      if (newFound.length == state.targetCount) {
        _nextGrid();
      }
    } else {
      state = state.copyWith(
        totalTaps: state.totalTaps + 1,
      );
    }
  }
}
