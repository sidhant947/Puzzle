import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'stop_signal_engine.dart';

part 'stop_signal_provider.g.dart';

class StopSignalState {
  final StopSignalTrial? currentTrial;
  final bool isStopVisible;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  StopSignalState({
    this.currentTrial,
    this.isStopVisible = false,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  StopSignalState copyWith({
    StopSignalTrial? currentTrial,
    bool? isStopVisible,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return StopSignalState(
      currentTrial: currentTrial ?? this.currentTrial,
      isStopVisible: isStopVisible ?? this.isStopVisible,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class StopSignalNotifier extends _$StopSignalNotifier {
  final _engine = StopSignalEngine();
  Timer? _gameTimer;
  Timer? _trialTimer;
  Timer? _stopSignalTimer;

  @override
  StopSignalState build() {
    return StopSignalState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _trialTimer?.cancel();
    _stopSignalTimer?.cancel();
    
    state = StopSignalState(isLoading: false);
    _nextTrial();
    _startTimer();
  }

  void _startTimer() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        _endGame();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _nextTrial() {
    _trialTimer?.cancel();
    _stopSignalTimer?.cancel();
    
    final trial = _engine.generateTrial();
    state = state.copyWith(
      currentTrial: trial,
      isStopVisible: false,
    );

    if (trial.type == StopSignalType.stop) {
      _stopSignalTimer = Timer(Duration(milliseconds: trial.stopSignalDelay), () {
        state = state.copyWith(isStopVisible: true);
      });
    }

    // Each trial lasts max 1500ms
    _trialTimer = Timer(const Duration(milliseconds: 1500), () {
      if (state.currentTrial?.type == StopSignalType.stop) {
        // Success: didn't tap on stop trial
        state = state.copyWith(score: state.score + 1);
      }
      _nextTrial();
    });
  }

  void onDirectionTap(int dir) {
    if (state.isGameOver || state.currentTrial == null) return;

    final trial = state.currentTrial!;
    
    if (state.isStopVisible || trial.type == StopSignalType.stop) {
      // Failed: tapped on stop trial
      state = state.copyWith(
        timeLeft: state.timeLeft > 3 ? state.timeLeft - 3 : 0,
      );
    } else if (dir == trial.direction) {
      // Success: tapped correct direction on go trial
      state = state.copyWith(score: state.score + 1);
    } else {
      // Failed: tapped wrong direction on go trial
      state = state.copyWith(
        timeLeft: state.timeLeft > 2 ? state.timeLeft - 2 : 0,
      );
    }

    _nextTrial();
  }

  void _endGame() {
    _gameTimer?.cancel();
    _trialTimer?.cancel();
    _stopSignalTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
