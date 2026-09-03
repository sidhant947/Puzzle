import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'change_blindness_engine.dart';

part 'change_blindness_provider.g.dart';

class ChangeBlindnessState {
  final List<Map<String, dynamic>> originalItems;
  final List<Map<String, dynamic>> changedItems;
  final int changeIndex;
  final bool showOriginal;
  final int gridSize;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool isFlickerActive;
  final int streak;
  final int multiplier;
  final bool isTrialMode;
  final int? lastTappedIndex;
  final bool? lastTapSuccess;

  ChangeBlindnessState({
    this.originalItems = const [],
    this.changedItems = const [],
    this.changeIndex = -1,
    this.showOriginal = true,
    this.gridSize = 3,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.isFlickerActive = false,
    this.streak = 0,
    this.multiplier = 1,
    this.isTrialMode = false,
    this.lastTappedIndex,
    this.lastTapSuccess,
  });

  ChangeBlindnessState copyWith({
    List<Map<String, dynamic>>? originalItems,
    List<Map<String, dynamic>>? changedItems,
    int? changeIndex,
    bool? showOriginal,
    int? gridSize,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? isFlickerActive,
    int? streak,
    int? multiplier,
    bool? isTrialMode,
    int? lastTappedIndex,
    bool? lastTapSuccess,
  }) {
    return ChangeBlindnessState(
      originalItems: originalItems ?? this.originalItems,
      changedItems: changedItems ?? this.changedItems,
      changeIndex: changeIndex ?? this.changeIndex,
      showOriginal: showOriginal ?? this.showOriginal,
      gridSize: gridSize ?? this.gridSize,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      isFlickerActive: isFlickerActive ?? this.isFlickerActive,
      streak: streak ?? this.streak,
      multiplier: multiplier ?? this.multiplier,
      isTrialMode: isTrialMode ?? this.isTrialMode,
      lastTappedIndex: lastTappedIndex,
      lastTapSuccess: lastTapSuccess,
    );
  }
}

@riverpod
class ChangeBlindnessNotifier extends _$ChangeBlindnessNotifier {
  final _engine = ChangeBlindnessEngine();
  Timer? _timer;
  Timer? _flickerTimer;

  @override
  ChangeBlindnessState build() {
    ref.onDispose(cleanUp);
    return ChangeBlindnessState();
  }

  void initGame({bool isTrialMode = false}) {
    _timer?.cancel();
    _flickerTimer?.cancel();
    
    state = ChangeBlindnessState(
      isLoading: false,
      isTrialMode: isTrialMode,
      timeLeft: 60,
    );
    _nextTrial();
    if (!isTrialMode) {
      _startTimer();
    }
    _scheduleFlicker(1000);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        state = state.copyWith(isGameOver: true, isFlickerActive: false);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void pauseGame() {
    _timer?.cancel();
    _flickerTimer?.cancel();
  }

  void resumeGame() {
    if (state.isGameOver) {
      _scheduleFlicker(1000);
      return;
    }
    if (!state.isTrialMode) {
      _startTimer();
    }
    _scheduleFlicker(1000);
  }

  void _scheduleFlicker(int ms) {
    _flickerTimer?.cancel();
    _flickerTimer = Timer(Duration(milliseconds: ms), () {
      if (state.isFlickerActive) {
        state = state.copyWith(
          isFlickerActive: false,
          showOriginal: !state.showOriginal,
        );
        _scheduleFlicker(1000);
      } else {
        state = state.copyWith(isFlickerActive: true);
        _scheduleFlicker(150);
      }
    });
  }

  void _nextTrial() {
    final gridSize = (state.score ~/ 5) + 3;
    final trial = _engine.generateTrial(gridSize.clamp(3, 6), score: state.score);
    state = state.copyWith(
      originalItems: trial['original'],
      changedItems: trial['changed'],
      changeIndex: trial['changeIndex'],
      gridSize: gridSize.clamp(3, 6),
      showOriginal: true,
      isFlickerActive: false,
      lastTappedIndex: null,
      lastTapSuccess: null,
    );
    _scheduleFlicker(1000);
  }

  void tap(int index) {
    if (state.isGameOver) return;
    if (index == state.changeIndex) {
      final newStreak = state.streak + 1;
      final newMultiplier = (newStreak ~/ 3) + 1;
      final newScore = state.score + (1 * state.multiplier);
      
      // Bonus 2 seconds for streaks
      final newTime = state.isTrialMode ? state.timeLeft : (state.timeLeft + (newStreak % 3 == 0 ? 2 : 0)).clamp(0, 60);

      // In trial mode, finish at 20 points
      final bool finishedTrial = state.isTrialMode && newScore >= 20;

      state = state.copyWith(
        score: newScore,
        streak: newStreak,
        multiplier: newMultiplier,
        timeLeft: newTime,
        lastTappedIndex: index,
        lastTapSuccess: true,
        isGameOver: finishedTrial,
      );

      if (!finishedTrial) {
        Future.delayed(const Duration(milliseconds: 200), () {
          _nextTrial();
        });
      }
    } else {
      // Penalty: reset streak, reduce remaining time by 2 seconds
      state = state.copyWith(
        streak: 0,
        multiplier: 1,
        timeLeft: (state.timeLeft - 2).clamp(0, 60),
        lastTappedIndex: index,
        lastTapSuccess: false,
      );
    }
  }

  void cleanUp() {
    _timer?.cancel();
    _flickerTimer?.cancel();
  }
}
