import 'dart:async';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'reflex_tap_engine.dart';

part 'reflex_tap_provider.g.dart';

class ReflexTapState {
  final Point<double> targetPosition;
  final double targetSize;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  ReflexTapState({
    required this.targetPosition,
    required this.targetSize,
    this.score = 0,
    this.timeLeft = 20,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  ReflexTapState copyWith({
    Point<double>? targetPosition,
    double? targetSize,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return ReflexTapState(
      targetPosition: targetPosition ?? this.targetPosition,
      targetSize: targetSize ?? this.targetSize,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class ReflexTapNotifier extends _$ReflexTapNotifier {
  final _engine = ReflexTapEngine();
  Timer? _timer;

  @override
  ReflexTapState build() {
    return ReflexTapState(targetPosition: const Point(0.5, 0.5), targetSize: 80);
  }

  void initGame() {
    _timer?.cancel();
    final pos = _engine.getRandomTargetPosition();
    state = ReflexTapState(
      targetPosition: pos,
      targetSize: 80,
      timeLeft: 20,
      isLoading: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        state = state.copyWith(isGameOver: true, isGameWon: state.score >= 15);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void onTargetTapped() {
    if (state.isGameOver) return;
    
    final newScore = state.score + 1;
    final newPos = _engine.getRandomTargetPosition();
    final newSize = _engine.calculateTargetSize(newScore);
    
    state = state.copyWith(
      score: newScore,
      targetPosition: newPos,
      targetSize: newSize,
    );
  }

  void onMissed() {
    if (state.isGameOver) return;
    // Optional: Penalty for missing? Let's just do nothing for now or minus time.
    if (state.timeLeft > 1) {
       state = state.copyWith(timeLeft: state.timeLeft - 1);
    }
  }
}
