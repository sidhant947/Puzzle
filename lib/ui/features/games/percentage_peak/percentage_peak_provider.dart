import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'percentage_peak_engine.dart';

part 'percentage_peak_provider.g.dart';

class PercentagePeakState {
  final PercentageQuestion currentQuestion;
  final String currentInput;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  PercentagePeakState({
    required this.currentQuestion,
    this.currentInput = '',
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isLoading = true,
  });

  PercentagePeakState copyWith({
    PercentageQuestion? currentQuestion,
    String? currentInput,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return PercentagePeakState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      currentInput: currentInput ?? this.currentInput,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PercentagePeakNotifier extends _$PercentagePeakNotifier {
  final _engine = PercentagePeakEngine();
  Timer? _timer;

  @override
  PercentagePeakState build() {
    return PercentagePeakState(
      currentQuestion: PercentageQuestion(
        question: '',
        answer: 0,
        type: PercentageQuestionType.calculateValue,
      ),
    );
  }

  void initGame() {
    _timer?.cancel();
    final question = _engine.generateQuestion();
    state = PercentagePeakState(
      currentQuestion: question,
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

  void onNumberPressed(String val) {
    if (state.isGameOver) return;
    
    final newInput = state.currentInput + val;
    state = state.copyWith(currentInput: newInput);
    
    if (int.tryParse(newInput) == state.currentQuestion.answer) {
      final nextQuestion = _engine.generateQuestion();
      state = state.copyWith(
        currentQuestion: nextQuestion,
        currentInput: '',
        score: state.score + 1,
      );
    } else if (newInput.length >= state.currentQuestion.answer.toString().length + 1) {
      // Clear if obviously wrong or too long
      state = state.copyWith(currentInput: '');
    }
  }

  void onBackspace() {
    if (state.isGameOver || state.currentInput.isEmpty) return;
    state = state.copyWith(
      currentInput: state.currentInput.substring(0, state.currentInput.length - 1),
    );
  }

  void clearInput() {
    state = state.copyWith(currentInput: '');
  }
}
