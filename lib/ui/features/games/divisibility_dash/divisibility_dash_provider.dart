import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'divisibility_dash_engine.dart';

part 'divisibility_dash_provider.g.dart';

class DivisibilityDashState {
  final DivisibilityProblem currentProblem;
  final List<int> selectedDivisors;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  DivisibilityDashState({
    required this.currentProblem,
    this.selectedDivisors = const [],
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  DivisibilityDashState copyWith({
    DivisibilityProblem? currentProblem,
    List<int>? selectedDivisors,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return DivisibilityDashState(
      currentProblem: currentProblem ?? this.currentProblem,
      selectedDivisors: selectedDivisors ?? this.selectedDivisors,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class DivisibilityDashNotifier extends _$DivisibilityDashNotifier {
  final _engine = DivisibilityDashEngine();
  Timer? _timer;

  @override
  DivisibilityDashState build() {
    return DivisibilityDashState(
      currentProblem: DivisibilityProblem(number: 0, correctDivisors: []),
    );
  }

  void initGame() {
    _timer?.cancel();
    final problem = _engine.generateProblem();
    state = DivisibilityDashState(
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
        state = state.copyWith(isGameOver: true, isGameWon: state.score >= 5);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void onDivisorTapped(int divisor) {
    if (state.isGameOver) return;
    
    if (state.selectedDivisors.contains(divisor)) return;

    if (state.currentProblem.correctDivisors.contains(divisor)) {
      final newSelected = [...state.selectedDivisors, divisor];
      if (newSelected.length == state.currentProblem.correctDivisors.length) {
        // Solved all divisors for this number
        final nextProblem = _engine.generateProblem();
        state = state.copyWith(
          currentProblem: nextProblem,
          selectedDivisors: [],
          score: state.score + 1,
        );
      } else {
        state = state.copyWith(selectedDivisors: newSelected);
      }
    } else {
      // Wrong divisor - small penalty or just reset selection
      state = state.copyWith(selectedDivisors: []);
    }
  }
}
