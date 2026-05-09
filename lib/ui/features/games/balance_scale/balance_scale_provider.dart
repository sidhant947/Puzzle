import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'balance_scale_engine.dart';

part 'balance_scale_provider.g.dart';

class BalanceScaleState {
  final List<WeightEquation> equations;
  final int correctAnswer;
  final IconData unitIcon;
  final String currentInput;
  final bool isGameOver;
  final bool isGameWon;
  final bool isInvalidGuess;
  final bool isLoading;

  BalanceScaleState({
    required this.equations,
    required this.correctAnswer,
    required this.unitIcon,
    this.currentInput = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isInvalidGuess = false,
    this.isLoading = true,
  });

  BalanceScaleState copyWith({
    List<WeightEquation>? equations,
    int? correctAnswer,
    IconData? unitIcon,
    String? currentInput,
    bool? isGameOver,
    bool? isGameWon,
    bool? isInvalidGuess,
    bool? isLoading,
  }) {
    return BalanceScaleState(
      equations: equations ?? this.equations,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      unitIcon: unitIcon ?? this.unitIcon,
      currentInput: currentInput ?? this.currentInput,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isInvalidGuess: isInvalidGuess ?? this.isInvalidGuess,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class BalanceScaleNotifier extends _$BalanceScaleNotifier {
  final _engine = BalanceScaleEngine();

  @override
  BalanceScaleState build() {
    return BalanceScaleState(equations: [], correctAnswer: 0, unitIcon: Icons.abc);
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    state = BalanceScaleState(
      equations: puzzle['equations'],
      correctAnswer: puzzle['answer'],
      unitIcon: puzzle['unitIcon'],
      isLoading: false,
    );
  }

  void onNumberPressed(String number) {
    if (state.isGameOver) return;
    if (state.currentInput.length < 2) {
      state = state.copyWith(
        currentInput: state.currentInput + number,
        isInvalidGuess: false,
      );
    }
  }

  void onBackspace() {
    if (state.isGameOver || state.currentInput.isEmpty) return;
    state = state.copyWith(
      currentInput: state.currentInput.substring(0, state.currentInput.length - 1),
      isInvalidGuess: false,
    );
  }

  void submitGuess() {
    if (state.isGameOver || state.currentInput.isEmpty) return;
    
    final guess = int.tryParse(state.currentInput);
    if (guess == state.correctAnswer) {
      state = state.copyWith(
        isGameOver: true,
        isGameWon: true,
      );
    } else {
      state = state.copyWith(isInvalidGuess: true, currentInput: '');
    }
  }
}
