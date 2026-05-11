import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'symbolic_flanker_engine.dart';

part 'symbolic_flanker_provider.g.dart';

class SymbolicFlankerState {
  final String display;
  final String target;
  final int score;
  final int totalTrials;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  SymbolicFlankerState({
    this.display = '',
    this.target = '',
    this.score = 0,
    this.totalTrials = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  SymbolicFlankerState copyWith({
    String? display,
    String? target,
    int? score,
    int? totalTrials,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return SymbolicFlankerState(
      display: display ?? this.display,
      target: target ?? this.target,
      score: score ?? this.score,
      totalTrials: totalTrials ?? this.totalTrials,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SymbolicFlankerNotifier extends _$SymbolicFlankerNotifier {
  final _engine = SymbolicFlankerEngine();
  Timer? _timer;

  @override
  SymbolicFlankerState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return SymbolicFlankerState();
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
    final trial = _engine.generateTrial();
    state = state.copyWith(
      display: trial['display'],
      target: trial['target'],
      score: resetScore ? 0 : state.score,
      totalTrials: resetScore ? 0 : state.totalTrials,
    );
  }

  void onSymbolPressed(String symbol) {
    if (state.isGameOver) return;

    bool correct = symbol == state.target;
    state = state.copyWith(
      score: correct ? state.score + 1 : state.score,
      totalTrials: state.totalTrials + 1,
    );
    _nextTrial();
  }
}
