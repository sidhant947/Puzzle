import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'mental_rotation_engine.dart';

part 'mental_rotation_provider.g.dart';

class MentalRotationState {
  final MentalRotationPuzzle? puzzle;
  final int score;
  final int totalTrials;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastResult;
  final bool isTrialMode;
  final int targetTrials;

  MentalRotationState({
    this.puzzle,
    this.score = 0,
    this.totalTrials = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.lastResult,
    this.isTrialMode = false,
    this.targetTrials = 20,
  });

  MentalRotationState copyWith({
    MentalRotationPuzzle? puzzle,
    int? score,
    int? totalTrials,
    int? timeLeft,
    bool? isGameOver,
    bool? lastResult,
    bool? isTrialMode,
    int? targetTrials,
  }) {
    return MentalRotationState(
      puzzle: puzzle ?? this.puzzle,
      score: score ?? this.score,
      totalTrials: totalTrials ?? this.totalTrials,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      lastResult: lastResult,
      isTrialMode: isTrialMode ?? this.isTrialMode,
      targetTrials: targetTrials ?? this.targetTrials,
    );
  }
}

@riverpod
class MentalRotationNotifier extends _$MentalRotationNotifier {
  final _engine = MentalRotationEngine();
  Timer? _timer;

  @override
  MentalRotationState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return MentalRotationState();
  }

  void startGame() {
    _timer?.cancel();
    final isTrialMode = ref.read(userDataNotifierProvider).isTrialModeEnabled ?? false;

    state = MentalRotationState(
      puzzle: _engine.generatePuzzle(),
      score: 0,
      totalTrials: 0,
      timeLeft: 60,
      isGameOver: false,
      isTrialMode: isTrialMode,
    );

    if (!isTrialMode) {
      _startTimer();
    }
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

  void submitAnswer(bool answer) {
    if (state.isGameOver || state.puzzle == null) return;

    final isCorrect = answer == state.puzzle!.isSame;
    final newScore = isCorrect ? state.score + 1 : state.score;
    final newTotalTrials = state.totalTrials + 1;

    state = state.copyWith(
      score: newScore,
      totalTrials: newTotalTrials,
      lastResult: isCorrect,
    );

    if (state.isTrialMode && newTotalTrials >= state.targetTrials) {
      state = state.copyWith(isGameOver: true);
    } else {
      state = state.copyWith(puzzle: _engine.generatePuzzle());
    }
  }
}
