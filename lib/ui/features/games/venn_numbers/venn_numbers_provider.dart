import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'venn_numbers_engine.dart';

part 'venn_numbers_provider.g.dart';

class VennNumbersState {
  final VennProblem currentProblem;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  VennNumbersState({
    required this.currentProblem,
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isLoading = true,
  });

  VennNumbersState copyWith({
    VennProblem? currentProblem,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return VennNumbersState(
      currentProblem: currentProblem ?? this.currentProblem,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class VennNumbersNotifier extends _$VennNumbersNotifier {
  final _engine = VennNumbersEngine();
  Timer? _timer;

  @override
  VennNumbersState build() {
    return VennNumbersState(
      currentProblem: VennProblem(
        number: 0,
        ruleA: MultiplesRule(2),
        ruleB: MultiplesRule(3),
        correctRegion: VennRegion.neither,
      ),
    );
  }

  void initGame() {
    _timer?.cancel();
    final problem = _engine.generateProblem();
    state = VennNumbersState(
      currentProblem: problem,
      timeLeft: 30,
      isLoading: false,
    );
    _startTimer();
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

  void onRegionSelected(VennRegion region) {
    if (state.isGameOver) return;

    if (region == state.currentProblem.correctRegion) {
      final nextProblem = _engine.generateProblem();
      state = state.copyWith(
        currentProblem: nextProblem,
        score: state.score + 1,
      );
    } else {
      // Small penalty or just skip
      final nextProblem = _engine.generateProblem();
      state = state.copyWith(
        currentProblem: nextProblem,
      );
    }
  }
}
