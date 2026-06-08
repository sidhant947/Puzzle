import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'phonetic_guess_engine.dart';

part 'phonetic_guess_provider.g.dart';

class PhoneticGuessState {
  final String targetWord;
  final String ipa;
  final String scrambledLetters;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  PhoneticGuessState({
    required this.targetWord,
    required this.ipa,
    required this.scrambledLetters,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  PhoneticGuessState copyWith({
    String? targetWord,
    String? ipa,
    String? scrambledLetters,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return PhoneticGuessState(
      targetWord: targetWord ?? this.targetWord,
      ipa: ipa ?? this.ipa,
      scrambledLetters: scrambledLetters ?? this.scrambledLetters,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PhoneticGuessNotifier extends _$PhoneticGuessNotifier {
  final _engine = PhoneticGuessEngine();

  @override
  PhoneticGuessState build() {
    return PhoneticGuessState(targetWord: '', ipa: '', scrambledLetters: '');
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    final scrambled = _engine.scrambleWord(task.word);
    state = PhoneticGuessState(
      targetWord: task.word,
      ipa: task.ipa,
      scrambledLetters: scrambled,
      isLoading: false,
    );
  }

  void onLetterPressed(String letter) {
    if (state.isGameOver || state.currentGuess.length >= state.targetWord.length) return;
    state = state.copyWith(currentGuess: state.currentGuess + letter);
  }

  void onBackspace() {
    if (state.isGameOver || state.currentGuess.isEmpty) return;
    state = state.copyWith(currentGuess: state.currentGuess.substring(0, state.currentGuess.length - 1));
  }

  void submit() {
    if (state.isGameOver || state.currentGuess.length != state.targetWord.length) return;
    
    final isCorrect = _engine.checkGuess(state.currentGuess, state.targetWord);
    if (isCorrect) {
      state = state.copyWith(isGameOver: true, isGameWon: true);
    } else {
      state = state.copyWith(currentGuess: '');
    }
  }
}
