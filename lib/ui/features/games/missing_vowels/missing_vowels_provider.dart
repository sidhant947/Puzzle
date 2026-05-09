import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'missing_vowels_engine.dart';

part 'missing_vowels_provider.g.dart';

class MissingVowelsState {
  final String targetWord;
  final String hiddenWord;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;
  final bool isInvalidGuess;
  final bool isLoading;

  MissingVowelsState({
    required this.targetWord,
    required this.hiddenWord,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isInvalidGuess = false,
    this.isLoading = true,
  });

  MissingVowelsState copyWith({
    String? targetWord,
    String? hiddenWord,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
    bool? isInvalidGuess,
    bool? isLoading,
  }) {
    return MissingVowelsState(
      targetWord: targetWord ?? this.targetWord,
      hiddenWord: hiddenWord ?? this.hiddenWord,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isInvalidGuess: isInvalidGuess ?? this.isInvalidGuess,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class MissingVowelsNotifier extends _$MissingVowelsNotifier {
  final _engine = MissingVowelsEngine();
  List<String> _wordList = [];

  @override
  MissingVowelsState build() {
    return MissingVowelsState(targetWord: '', hiddenWord: '');
  }

  Future<void> initGame() async {
    state = state.copyWith(isLoading: true);
    _wordList = await _engine.loadWords();
    final target = _engine.getRandomWord(_wordList);
    final hidden = _engine.hideVowels(target);
    
    state = MissingVowelsState(
      targetWord: target,
      hiddenWord: hidden,
      isLoading: false,
    );
  }

  void onLetterPressed(String letter) {
    if (state.isGameOver) return;
    if (state.currentGuess.length < state.targetWord.length) {
      state = state.copyWith(
        currentGuess: state.currentGuess + letter.toUpperCase(),
        isInvalidGuess: false,
      );
    }
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
    
    if (state.currentGuess.length != state.targetWord.length) return;

    final isCorrect = _engine.checkGuess(state.currentGuess, state.targetWord);
    
    if (isCorrect) {
      state = state.copyWith(
        isGameOver: true,
        isGameWon: true,
      );
    } else {
      state = state.copyWith(isInvalidGuess: true);
    }
  }
}
