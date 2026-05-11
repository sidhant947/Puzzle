import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'sternberg_task_engine.dart';

part 'sternberg_task_provider.g.dart';

enum SternbergPhase { memorize, probe, feedback }

class SternbergState {
  final List<String> memorySet;
  final String probe;
  final bool isPresent;
  final SternbergPhase phase;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final int setSize;

  SternbergState({
    this.memorySet = const [],
    this.probe = '',
    this.isPresent = false,
    this.phase = SternbergPhase.memorize,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.setSize = 3,
  });

  SternbergState copyWith({
    List<String>? memorySet,
    String? probe,
    bool? isPresent,
    SternbergPhase? phase,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    int? setSize,
  }) {
    return SternbergState(
      memorySet: memorySet ?? this.memorySet,
      probe: probe ?? this.probe,
      isPresent: isPresent ?? this.isPresent,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      setSize: setSize ?? this.setSize,
    );
  }
}

@riverpod
class SternbergTaskNotifier extends _$SternbergTaskNotifier {
  final _engine = SternbergTaskEngine();
  Timer? _timer;

  @override
  SternbergState build() {
    ref.onDispose(cleanUp);
    return SternbergState();
  }

  void initGame() {
    _timer?.cancel();
    state = SternbergState(isLoading: false);
    _startTimer();
    _nextTrial();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        state = state.copyWith(isGameOver: true);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _nextTrial() {
    final trial = _engine.generateTrial(state.setSize);
    state = state.copyWith(
      memorySet: trial['memorySet'],
      probe: trial['probe'],
      isPresent: trial['isPresent'],
      phase: SternbergPhase.memorize,
    );

    // Show memory set for 2 seconds
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (state.isGameOver) return;
      state = state.copyWith(phase: SternbergPhase.probe);
    });
  }

  void answer(bool userChoice) {
    if (state.phase != SternbergPhase.probe) return;

    final isCorrect = userChoice == state.isPresent;
    state = state.copyWith(
      score: isCorrect ? state.score + 1 : state.score,
      phase: SternbergPhase.feedback,
      setSize: isCorrect 
          ? (state.setSize < 7 ? state.setSize + 1 : 7) 
          : (state.setSize > 3 ? state.setSize - 1 : 3),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      if (state.isGameOver) return;
      _nextTrial();
    });
  }

  void cleanUp() {
    _timer?.cancel();
  }
}
