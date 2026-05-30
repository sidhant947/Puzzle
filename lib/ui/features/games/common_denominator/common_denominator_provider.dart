import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'common_denominator_engine.dart';

part 'common_denominator_provider.g.dart';

class CommonDenominatorState {
  final CommonDenominatorProblem currentProblem;
  final String currentInput;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  CommonDenominatorState({
    required this.currentProblem,
    this.currentInput = '',
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isLoading = true,
  });

  CommonDenominatorState copyWith({
    CommonDenominatorProblem? currentProblem,
    String? currentInput,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return CommonDenominatorState(
      currentProblem: currentProblem ?? this.currentProblem,
      currentInput: currentInput ?? this.currentInput,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CommonDenominatorNotifier extends _$CommonDenominatorNotifier {
  final _engine = CommonDenominatorEngine();
  Timer? _timer;

  @override
  CommonDenominatorState build() {
    return CommonDenominatorState(
      currentProblem: CommonDenominatorProblem(
        numbers: [0, 0],
        type: CommonDenominatorType.gcd,
        answer: 0,
      ),
    );
  }

  void initGame() {
    _timer?.cancel();
    final problem = _engine.generateProblem(0);
    state = CommonDenominatorState(
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

  void onNumberPressed(String val) {
    if (state.isGameOver) return;
    
    final newInput = state.currentInput + val;
    state = state.copyWith(currentInput: newInput);
    
    if (int.tryParse(newInput) == state.currentProblem.answer) {
      final nextProblem = _engine.generateProblem(state.score + 1);
      state = state.copyWith(
        currentProblem: nextProblem,
        currentInput: '',
        score: state.score + 1,
      );
    } else if (newInput.length >= state.currentProblem.answer.toString().length + 1) {
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
