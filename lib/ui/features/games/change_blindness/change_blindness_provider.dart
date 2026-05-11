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

  void initGame() {
    _timer?.cancel();
    _flickerTimer?.cancel();
    
    state = ChangeBlindnessState(isLoading: false);
    _nextTrial();
    _startTimer();
    _scheduleFlicker(1000);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        _flickerTimer?.cancel();
        state = state.copyWith(isGameOver: true, isFlickerActive: false);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _scheduleFlicker(int ms) {
    _flickerTimer?.cancel();
    _flickerTimer = Timer(Duration(milliseconds: ms), () {
      if (state.isGameOver) return;

      if (state.isFlickerActive) {
        state = state.copyWith(
          isFlickerActive: false,
          showOriginal: !state.showOriginal,
        );
        _scheduleFlicker(1000); // Show image for 1s
      } else {
        state = state.copyWith(isFlickerActive: true);
        _scheduleFlicker(150); // Show mask for 150ms
      }
    });
  }

  void _nextTrial() {
    final gridSize = (state.score ~/ 5) + 3; // Increase grid size every 5 points
    final trial = _engine.generateTrial(gridSize.clamp(3, 6));
    state = state.copyWith(
      originalItems: trial['original'],
      changedItems: trial['changed'],
      changeIndex: trial['changeIndex'],
      gridSize: gridSize.clamp(3, 6),
      showOriginal: true,
      isFlickerActive: false,
    );
    _scheduleFlicker(1000);
  }

  void tap(int index) {
    if (index == state.changeIndex) {
      state = state.copyWith(score: state.score + 1);
      _nextTrial();
    } else {
      // Penalty: decrease time by 2 seconds
      state = state.copyWith(timeLeft: (state.timeLeft - 2).clamp(0, 60));
    }
  }

  void cleanUp() {
    _timer?.cancel();
    _flickerTimer?.cancel();
  }
}
