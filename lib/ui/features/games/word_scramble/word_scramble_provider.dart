import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'word_scramble_engine.dart';

part 'word_scramble_provider.g.dart';

class WordScrambleState {
  final String targetWord;
  final String scrambledWord;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;
  final bool isInvalidGuess;
  final bool isLoading;

  WordScrambleState({
    required this.targetWord,
    required this.scrambledWord,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isInvalidGuess = false,
    this.isLoading = true,
  });

  WordScrambleState copyWith({
    String? targetWord,
    String? scrambledWord,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
    bool? isInvalidGuess,
    bool? isLoading,
  }) {
    return WordScrambleState(
      targetWord: targetWord ?? this.targetWord,
      scrambledWord: scrambledWord ?? this.scrambledWord,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isInvalidGuess: isInvalidGuess ?? this.isInvalidGuess,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class WordScrambleNotifier extends _$WordScrambleNotifier {
  final _engine = WordScrambleEngine();
  List<String> _wordList = [];

  @override
  WordScrambleState build() {
    return WordScrambleState(targetWord: '', scrambledWord: '');
  }

  Future<void> initGame() async {
    state = state.copyWith(isLoading: true);
    _wordList = await _engine.loadWords();
    final target = _engine.getRandomWord(_wordList);
    final scrambled = _engine.scrambleWord(target);
    
    state = WordScrambleState(
      targetWord: target,
      scrambledWord: scrambled,
      isLoading: false,
    );
  }

  void onLetterPressed(String letter) {
    if (state.isGameOver) return;
    state = state.copyWith(
      currentGuess: state.currentGuess + letter,
      isInvalidGuess: false,
    );
  }

  void onBackspace() {
    if (state.isGameOver || state.currentGuess.isEmpty) return;
    state = state.copyWith(
      currentGuess: state.currentGuess.substring(0, state.currentGuess.length - 1),
      isInvalidGuess: false,
    );
  }

  void submitGuess() {
    if (state.isGameOver || state.currentGuess.isEmpty) return;

    final isCorrect = _engine.checkGuess(state.currentGuess, state.targetWord, _wordList);

    if (isCorrect) {      state = state.copyWith(
        isGameOver: true,
        isGameWon: true,
      );
    } else {
      if (state.currentGuess.length == state.targetWord.length) {
         state = state.copyWith(isInvalidGuess: true);
      }
    }
  }

  void resetGuess() {
    if (state.isGameOver) return;
    state = state.copyWith(currentGuess: '', isInvalidGuess: false);
  }
}
