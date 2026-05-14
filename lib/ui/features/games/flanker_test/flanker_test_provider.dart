import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'flanker_test_engine.dart';

part 'flanker_test_provider.g.dart';

class FlankerTestState {
  final String currentDisplay;
  final int targetDirection;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  FlankerTestState({
    required this.currentDisplay,
    required this.targetDirection,
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  FlankerTestState copyWith({
    String? currentDisplay,
    int? targetDirection,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return FlankerTestState(
      currentDisplay: currentDisplay ?? this.currentDisplay,
      targetDirection: targetDirection ?? this.targetDirection,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class FlankerTestNotifier extends _$FlankerTestNotifier {
  final _engine = FlankerEngine();
  Timer? _timer;

  @override
  FlankerTestState build() {
    return FlankerTestState(currentDisplay: '', targetDirection: 0);
  }

  void initGame() {
    _timer?.cancel();
    final trial = _engine.generateTrial();
    state = FlankerTestState(
      currentDisplay: trial['display'],
      targetDirection: trial['target'],
      timeLeft: 30,
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

  bool _isProcessing = false;

  void onDirectionSelected(int dir) {
    if (state.isGameOver || _isProcessing) return;
    _isProcessing = true;

    if (dir == state.targetDirection) {
      final newTrial = _engine.generateTrial();
      state = state.copyWith(
        score: state.score + 1,
        currentDisplay: newTrial['display'],
        targetDirection: newTrial['target'],
      );
    } else {
      // Penalty for wrong answer
      if (state.timeLeft > 2) {
        state = state.copyWith(timeLeft: state.timeLeft - 2);
      }
    }
    
    // Release the lock immediately after state update
    _isProcessing = false;
  }
}
