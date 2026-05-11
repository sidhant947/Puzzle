import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'operation_span_engine.dart';

part 'operation_span_provider.g.dart';

enum OperationSpanPhase { math, letter, recall, result }

class OperationSpanState {
  final String equation;
  final bool isEquationCorrect;
  final String currentLetter;
  final List<String> sequence;
  final List<String> userRecall;
  final OperationSpanPhase phase;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final int currentStep;
  final int totalStepsInRound;

  OperationSpanState({
    this.equation = '',
    this.isEquationCorrect = true,
    this.currentLetter = '',
    this.sequence = const [],
    this.userRecall = const [],
    this.phase = OperationSpanPhase.math,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.currentStep = 0,
    this.totalStepsInRound = 2,
  });

  OperationSpanState copyWith({
    String? equation,
    bool? isEquationCorrect,
    String? currentLetter,
    List<String>? sequence,
    List<String>? userRecall,
    OperationSpanPhase? phase,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    int? currentStep,
    int? totalStepsInRound,
  }) {
    return OperationSpanState(
      equation: equation ?? this.equation,
      isEquationCorrect: isEquationCorrect ?? this.isEquationCorrect,
      currentLetter: currentLetter ?? this.currentLetter,
      sequence: sequence ?? this.sequence,
      userRecall: userRecall ?? this.userRecall,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      currentStep: currentStep ?? this.currentStep,
      totalStepsInRound: totalStepsInRound ?? this.totalStepsInRound,
    );
  }
}

@riverpod
class OperationSpanNotifier extends _$OperationSpanNotifier {
  final _engine = OperationSpanEngine();
  Timer? _timer;

  @override
  OperationSpanState build() {
    ref.onDispose(cleanUp);
    return OperationSpanState();
  }

  void initGame() {
    _timer?.cancel();
    state = OperationSpanState(isLoading: false);
    _nextRound();
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

  void _nextRound() {
    final problem = _engine.generateProblem();
    state = state.copyWith(
      phase: OperationSpanPhase.math,
      equation: problem['equation'],
      isEquationCorrect: problem['isCorrect'],
      sequence: [],
      userRecall: [],
      currentStep: 0,
    );
  }

  void answerMath(bool userChoice) {
    if (state.phase != OperationSpanPhase.math) return;

    if (userChoice == state.isEquationCorrect) {
      // Correct math answer
    }

    // Move to letter phase
    final letter = _engine.getRandomLetter();
    state = state.copyWith(
      phase: OperationSpanPhase.letter,
      currentLetter: letter,
      sequence: [...state.sequence, letter],
    );

    // Show letter for 1 second then move to next step or recall
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (state.currentStep + 1 < state.totalStepsInRound) {
        final problem = _engine.generateProblem();
        state = state.copyWith(
          phase: OperationSpanPhase.math,
          equation: problem['equation'],
          isEquationCorrect: problem['isCorrect'],
          currentStep: state.currentStep + 1,
        );
      } else {
        state = state.copyWith(phase: OperationSpanPhase.recall);
      }
    });
  }

  void recallLetter(String letter) {
    if (state.phase != OperationSpanPhase.recall) return;
    state = state.copyWith(userRecall: [...state.userRecall, letter]);

    if (state.userRecall.length == state.sequence.length) {
      _checkRecall();
    }
  }

  void _checkRecall() {
    bool allCorrect = true;
    for (int i = 0; i < state.sequence.length; i++) {
      if (state.sequence[i] != state.userRecall[i]) {
        allCorrect = false;
        break;
      }
    }

    if (allCorrect) {
      state = state.copyWith(
        score: state.score + state.sequence.length,
        totalStepsInRound: state.totalStepsInRound < 6 ? state.totalStepsInRound + 1 : state.totalStepsInRound,
      );
    } else {
      state = state.copyWith(
        totalStepsInRound: state.totalStepsInRound > 2 ? state.totalStepsInRound - 1 : 2,
      );
    }
    
    Future.delayed(const Duration(milliseconds: 500), () {
      _nextRound();
    });
  }

  void clearRecall() {
    state = state.copyWith(userRecall: []);
  }

  void cleanUp() {
    _timer?.cancel();
  }
}
