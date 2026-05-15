import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'numerical_estimation_engine.dart';

part 'numerical_estimation_provider.g.dart';

class NumericalEstimationState {
  final NumericalEstimationPuzzle? currentPuzzle;
  final int score;
  final int timeLeft;
  final int totalTrials;
  final int targetTrials;
  final bool isGameOver;
  final bool? isLastCorrect;
  final int? selectedAnswer;
  final bool isTrialMode;

  NumericalEstimationState({
    this.currentPuzzle,
    this.score = 0,
    this.timeLeft = 60,
    this.totalTrials = 0,
    this.targetTrials = 20,
    this.isGameOver = false,
    this.isLastCorrect,
    this.selectedAnswer,
    this.isTrialMode = false,
  });

  NumericalEstimationState copyWith({
    NumericalEstimationPuzzle? currentPuzzle,
    int? score,
    int? timeLeft,
    int? totalTrials,
    bool? isGameOver,
    bool? isLastCorrect,
    int? selectedAnswer,
    bool? isTrialMode,
    bool clearSelection = false,
  }) {
    return NumericalEstimationState(
      currentPuzzle: currentPuzzle ?? this.currentPuzzle,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      totalTrials: totalTrials ?? this.totalTrials,
      targetTrials: targetTrials,
      isGameOver: isGameOver ?? this.isGameOver,
      isLastCorrect: clearSelection ? null : (isLastCorrect ?? this.isLastCorrect),
      selectedAnswer: clearSelection ? null : (selectedAnswer ?? this.selectedAnswer),
      isTrialMode: isTrialMode ?? this.isTrialMode,
    );
  }
}

@riverpod
class NumericalEstimationNotifier extends _$NumericalEstimationNotifier {
  final _engine = NumericalEstimationEngine();
  Timer? _timer;

  @override
  NumericalEstimationState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    
    return NumericalEstimationState(
      currentPuzzle: _engine.generatePuzzle(),
    );
  }

  void startGame() {
    _timer?.cancel();
    final isTrialMode = ref.read(userDataNotifierProvider).isTrialModeEnabled ?? false;
    
    state = NumericalEstimationState(
      currentPuzzle: _engine.generatePuzzle(),
      timeLeft: 60,
      totalTrials: 0,
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

  void selectOption(int option) {
    if (state.isGameOver || state.selectedAnswer != null || state.currentPuzzle == null) return;

    final isCorrect = option == state.currentPuzzle?.answer;
    final newTotalTrials = state.totalTrials + 1;
    
    state = state.copyWith(
      selectedAnswer: option,
      isLastCorrect: isCorrect,
      score: isCorrect ? state.score + 1 : state.score,
      totalTrials: newTotalTrials,
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (!ref.exists(numericalEstimationNotifierProvider)) return;
      if (state.isGameOver) return;

      if (state.isTrialMode && newTotalTrials >= state.targetTrials) {
        _timer?.cancel();
        state = state.copyWith(isGameOver: true);
        return;
      }
      
      state = state.copyWith(
        currentPuzzle: _engine.generatePuzzle(),
        clearSelection: true,
      );
    });
  }

  void resetGame() {
    startGame();
  }
}
