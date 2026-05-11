import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'choice_reaction_time_engine.dart';

part 'choice_reaction_time_provider.g.dart';

class ChoiceReactionTimeState {
  final int? targetIndex;
  final bool isWaiting;
  final DateTime? startTime;
  final List<int> reactionTimes;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  ChoiceReactionTimeState({
    this.targetIndex,
    this.isWaiting = true,
    this.startTime,
    this.reactionTimes = const [],
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  ChoiceReactionTimeState copyWith({
    int? targetIndex,
    bool? isWaiting,
    DateTime? startTime,
    List<int>? reactionTimes,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return ChoiceReactionTimeState(
      targetIndex: targetIndex != null ? (targetIndex == -1 ? null : targetIndex) : this.targetIndex,
      isWaiting: isWaiting ?? this.isWaiting,
      startTime: startTime ?? this.startTime,
      reactionTimes: reactionTimes ?? this.reactionTimes,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class ChoiceReactionTimeNotifier extends _$ChoiceReactionTimeNotifier {
  final _engine = ChoiceReactionTimeEngine();
  Timer? _timer;
  Timer? _trialTimer;

  @override
  ChoiceReactionTimeState build() {
    ref.onDispose(() {
      _timer?.cancel();
      _trialTimer?.cancel();
    });
    return ChoiceReactionTimeState();
  }

  void initGame() {
    _timer?.cancel();
    _trialTimer?.cancel();
    state = ChoiceReactionTimeState(timeLeft: 60, isGameOver: false, isLoading: false);
    _startTimer();
    _prepareNextTrial();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        _trialTimer?.cancel();
        state = state.copyWith(isGameOver: true);
      }
    });
  }

  void _prepareNextTrial() {
    if (state.isGameOver) return;
    state = state.copyWith(isWaiting: true, targetIndex: -1);
    _trialTimer = Timer(Duration(milliseconds: _engine.getDelay()), () {
      if (state.isGameOver) return;
      state = state.copyWith(
        isWaiting: false,
        targetIndex: _engine.generateTarget(),
        startTime: DateTime.now(),
      );
    });
  }

  void onSquarePressed(int index) {
    if (state.isGameOver || state.isWaiting || state.targetIndex == null) return;

    if (index == state.targetIndex) {
      final endTime = DateTime.now();
      final rt = endTime.difference(state.startTime!).inMilliseconds;
      state = state.copyWith(
        reactionTimes: [...state.reactionTimes, rt],
      );
      _prepareNextTrial();
    }
  }
}
