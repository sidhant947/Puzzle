import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'quick_math_engine.dart';

part 'quick_math_provider.g.dart';

class QuickMathState {
  final MathProblem currentProblem;
  final String currentInput;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  QuickMathState({
    required this.currentProblem,
    this.currentInput = '',
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  QuickMathState copyWith({
    MathProblem? currentProblem,
    String? currentInput,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return QuickMathState(
      currentProblem: currentProblem ?? this.currentProblem,
      currentInput: currentInput ?? this.currentInput,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class QuickMathNotifier extends _$QuickMathNotifier {
  final _engine = QuickMathEngine();
  Timer? _timer;

  @override
  QuickMathState build() {
    return QuickMathState(currentProblem: MathProblem(equation: '', answer: 0));
  }

  void initGame() {
    _timer?.cancel();
    final problem = _engine.generateProblem();
    state = QuickMathState(
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

  void onNumberPressed(String val) {
    if (state.isGameOver) return;
    state = state.copyWith(currentInput: state.currentInput + val);
    
    if (int.tryParse(state.currentInput) == state.currentProblem.answer) {
      final nextProblem = _engine.generateProblem();
      state = state.copyWith(
        currentProblem: nextProblem,
        currentInput: '',
        score: state.score + 1,
      );
    } else if (state.currentInput.length >= state.currentProblem.answer.toString().length + 1) {
      // Auto clear if obviously wrong
      state = state.copyWith(currentInput: '');
    }
  }

  void onBackspace() {
    if (state.isGameOver || state.currentInput.isEmpty) return;
    state = state.copyWith(currentInput: state.currentInput.substring(0, state.currentInput.length - 1));
  }

  void clearInput() {
    state = state.copyWith(currentInput: '');
  }
}
