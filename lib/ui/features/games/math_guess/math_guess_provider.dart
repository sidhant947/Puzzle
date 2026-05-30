import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'math_guess_engine.dart';

part 'math_guess_provider.g.dart';

class GuessRecord {
  final int guess;
  final String result;

  GuessRecord({required this.guess, required this.result});
}

class MathGuessState {
  final int targetNumber;
  final String currentInput;
  final int guessesLeft;
  final int minPossible;
  final int maxPossible;
  final List<GuessRecord> guessesHistory;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;
  final String feedbackMessage;

  MathGuessState({
    required this.targetNumber,
    this.currentInput = '',
    this.guessesLeft = 15,
    this.minPossible = 1,
    this.maxPossible = 10000,
    this.guessesHistory = const [],
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
    this.feedbackMessage = 'FIND THE NUMBER BETWEEN 1 AND 10,000!',
  });

  MathGuessState copyWith({
    int? targetNumber,
    String? currentInput,
    int? guessesLeft,
    int? minPossible,
    int? maxPossible,
    List<GuessRecord>? guessesHistory,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
    String? feedbackMessage,
  }) {
    return MathGuessState(
      targetNumber: targetNumber ?? this.targetNumber,
      currentInput: currentInput ?? this.currentInput,
      guessesLeft: guessesLeft ?? this.guessesLeft,
      minPossible: minPossible ?? this.minPossible,
      maxPossible: maxPossible ?? this.maxPossible,
      guessesHistory: guessesHistory ?? this.guessesHistory,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
      feedbackMessage: feedbackMessage ?? this.feedbackMessage,
    );
  }
}

@riverpod
class MathGuessNotifier extends _$MathGuessNotifier {
  final _engine = MathGuessEngine();

  @override
  MathGuessState build() {
    return MathGuessState(targetNumber: 0);
  }

  void initGame() {
    final target = _engine.generateTargetNumber();
    state = MathGuessState(
      targetNumber: target,
      isLoading: false,
    );
  }

  void onNumberPressed(String val) {
    if (state.isGameOver) return;
    if (state.currentInput.length >= 5) return;
    state = state.copyWith(currentInput: state.currentInput + val);
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

  void submitGuess() {
    if (state.isGameOver || state.currentInput.isEmpty) return;
    final guess = int.tryParse(state.currentInput);
    if (guess == null || guess < 1 || guess > 10000) {
      state = state.copyWith(
        currentInput: '',
        feedbackMessage: 'ENTER A NUMBER BETWEEN 1 AND 10,000!',
      );
      return;
    }

    final newGuessesLeft = state.guessesLeft - 1;
    final List<GuessRecord> newHistory = List.from(state.guessesHistory);

    if (guess == state.targetNumber) {
      newHistory.add(GuessRecord(guess: guess, result: 'CORRECT 🎉'));
      state = state.copyWith(
        currentInput: '',
        guessesLeft: newGuessesLeft,
        guessesHistory: newHistory,
        isGameOver: true,
        isGameWon: true,
        feedbackMessage: 'CORRECT! THE NUMBER WAS ${state.targetNumber}.',
      );
    } else {
      final String result;
      int newMin = state.minPossible;
      int newMax = state.maxPossible;

      if (guess < state.targetNumber) {
        result = 'TOO LOW ⬆️';
        newMin = max(state.minPossible, guess + 1);
      } else {
        result = 'TOO HIGH ⬇️';
        newMax = min(state.maxPossible, guess - 1);
      }

      newHistory.add(GuessRecord(guess: guess, result: result));

      final bool gameOver = newGuessesLeft <= 0;
      state = state.copyWith(
        currentInput: '',
        guessesLeft: newGuessesLeft,
        minPossible: newMin,
        maxPossible: newMax,
        guessesHistory: newHistory,
        isGameOver: gameOver,
        isGameWon: false,
        feedbackMessage: gameOver
            ? 'GAME OVER! THE NUMBER WAS ${state.targetNumber}.'
            : '$guess IS $result!',
      );
    }
  }
}
