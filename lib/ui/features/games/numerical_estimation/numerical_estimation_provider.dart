import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'numerical_estimation_engine.dart';

part 'numerical_estimation_provider.g.dart';

class NumericalEstimationState {
  final NumericalEstimationPuzzle? currentPuzzle;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool? isLastCorrect;
  final int? selectedAnswer;

  NumericalEstimationState({
    this.currentPuzzle,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLastCorrect,
    this.selectedAnswer,
  });

  NumericalEstimationState copyWith({
    NumericalEstimationPuzzle? currentPuzzle,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLastCorrect,
    int? selectedAnswer,
    bool clearSelection = false,
  }) {
    return NumericalEstimationState(
      currentPuzzle: currentPuzzle ?? this.currentPuzzle,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLastCorrect: clearSelection ? null : (isLastCorrect ?? this.isLastCorrect),
      selectedAnswer: clearSelection ? null : (selectedAnswer ?? this.selectedAnswer),
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
    state = NumericalEstimationState(
      currentPuzzle: _engine.generatePuzzle(),
      timeLeft: 60,
      isGameOver: false,
    );
    _startTimer();
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
    
    // 1. Update state with selected answer and result
    state = state.copyWith(
      selectedAnswer: option,
      isLastCorrect: isCorrect,
      score: isCorrect ? state.score + 1 : state.score,
    );

    // 2. Delay slightly for visual feedback
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!ref.exists(numericalEstimationNotifierProvider)) return;
      if (state.isGameOver) return;
      
      // 3. Generate NEW puzzle and CLEAR selection in one go
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
