import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'word_mastermind_engine.dart';

part 'word_mastermind_provider.g.dart';

class MastermindGuess {
  final String guess;
  final int bulls;
  final int cows;

  MastermindGuess({required this.guess, required this.bulls, required this.cows});
}

class WordMastermindState {
  final String targetWord;
  final List<MastermindGuess> guesses;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;

  WordMastermindState({
    required this.targetWord,
    required this.guesses,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
  });

  WordMastermindState copyWith({
    String? targetWord,
    List<MastermindGuess>? guesses,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
  }) {
    return WordMastermindState(
      targetWord: targetWord ?? this.targetWord,
      guesses: guesses ?? this.guesses,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
    );
  }
}

@riverpod
class WordMastermindNotifier extends _$WordMastermindNotifier {
  final _engine = WordMastermindEngine();

  @override
  WordMastermindState build() {
    return WordMastermindState(
      targetWord: _engine.getRandomWord(),
      guesses: [],
    );
  }

  void addLetter(String letter) {
    if (state.isGameOver) return;
    if (state.currentGuess.length < WordMastermindEngine.wordLength) {
      state = state.copyWith(currentGuess: state.currentGuess + letter.toUpperCase());
    }
  }

  void removeLetter() {
    if (state.isGameOver) return;
    if (state.currentGuess.isNotEmpty) {
      state = state.copyWith(currentGuess: state.currentGuess.substring(0, state.currentGuess.length - 1));
    }
  }

  void submitGuess() {
    if (state.isGameOver) return;
    if (state.currentGuess.length != WordMastermindEngine.wordLength) return;

    final result = _engine.checkGuess(state.currentGuess, state.targetWord);
    final newGuess = MastermindGuess(
      guess: state.currentGuess,
      bulls: result[0],
      cows: result[1],
    );

    final newGuesses = List<MastermindGuess>.from(state.guesses)..add(newGuess);
    bool won = result[0] == WordMastermindEngine.wordLength;
    bool lost = newGuesses.length >= WordMastermindEngine.maxTries;

    state = state.copyWith(
      guesses: newGuesses,
      currentGuess: '',
      isGameOver: won || lost,
      isGameWon: won,
    );
  }

  void reset() {
    state = WordMastermindState(
      targetWord: _engine.getRandomWord(),
      guesses: [],
    );
  }
}
