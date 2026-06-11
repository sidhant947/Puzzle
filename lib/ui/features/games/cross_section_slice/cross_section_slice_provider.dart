import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'cross_section_slice_engine.dart';

part 'cross_section_slice_provider.g.dart';

class CrossSectionSliceState {
  final CrossSectionSliceChallenge? challenge;
  final int score;
  final int totalTrials;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastResult;
  final bool isTrialMode;
  final int targetTrials;

  CrossSectionSliceState({
    this.challenge,
    this.score = 0,
    this.totalTrials = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.lastResult,
    this.isTrialMode = false,
    this.targetTrials = 15,
  });

  CrossSectionSliceState copyWith({
    CrossSectionSliceChallenge? challenge,
    int? score,
    int? totalTrials,
    int? timeLeft,
    bool? isGameOver,
    bool? lastResult,
    bool? isTrialMode,
    int? targetTrials,
  }) {
    return CrossSectionSliceState(
      challenge: challenge ?? this.challenge,
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
class CrossSectionSliceNotifier extends _$CrossSectionSliceNotifier {
  final _engine = CrossSectionSliceEngine();
  Timer? _timer;

  @override
  CrossSectionSliceState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return CrossSectionSliceState();
  }

  void startGame() {
    _timer?.cancel();
    final isTrialMode = ref.read(userDataNotifierProvider).isTrialModeEnabled ?? false;

    state = CrossSectionSliceState(
      challenge: _engine.generateChallenge(),
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

  void submitAnswer(SectionShape answer) {
    if (state.isGameOver || state.challenge == null) return;

    final isCorrect = answer == state.challenge!.correctShape;
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
      state = state.copyWith(challenge: _engine.generateChallenge());
    }
  }
}
