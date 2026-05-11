import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'trail_making_engine.dart';

part 'trail_making_provider.g.dart';

class TrailMakingState {
  final List<TMTPoint> points;
  final int nextIndex;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  TrailMakingState({
    required this.points,
    this.nextIndex = 0,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  TrailMakingState copyWith({
    List<TMTPoint>? points,
    int? nextIndex,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return TrailMakingState(
      points: points ?? this.points,
      nextIndex: nextIndex ?? this.nextIndex,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class TrailMakingNotifier extends _$TrailMakingNotifier {
  final _engine = TMTEngine();
  Timer? _timer;

  @override
  TrailMakingState build() {
    return TrailMakingState(points: []);
  }

  void initGame() {
    _timer?.cancel();
    state = TrailMakingState(
      points: _engine.generatePoints(12),
      isLoading: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        _endGame();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void onPointTap(int index) {
    if (state.isGameOver) return;

    if (index == state.nextIndex) {
      final newNextIndex = state.nextIndex + 1;
      if (newNextIndex == state.points.length) {
        // Round complete, generate new points
        state = state.copyWith(
          score: state.score + 1,
          points: _engine.generatePoints(12),
          nextIndex: 0,
        );
      } else {
        state = state.copyWith(nextIndex: newNextIndex);
      }
    } else {
      // Penalty for wrong tap
      state = state.copyWith(
        timeLeft: state.timeLeft > 2 ? state.timeLeft - 2 : 0,
      );
    }
  }

  void _endGame() {
    _timer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
