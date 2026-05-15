import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'find_word_engine.dart';

part 'find_word_provider.g.dart';

class FindWordState {
  final String targetWord;
  final List<String> guesses;
  final List<List<LetterStatus>> results;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;
  final bool isInvalidGuess;
  final bool shouldShake;
  final Map<String, LetterStatus> keyboardStatus;

  FindWordState({
    required this.targetWord,
    required this.guesses,
    required this.results,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isInvalidGuess = false,
    this.shouldShake = false,
    this.keyboardStatus = const {},
  });

  FindWordState copyWith({
    String? targetWord,
    List<String>? guesses,
    List<List<LetterStatus>>? results,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
    bool? isInvalidGuess,
    bool? shouldShake,
    Map<String, LetterStatus>? keyboardStatus,
  }) {
    return FindWordState(
      targetWord: targetWord ?? this.targetWord,
      guesses: guesses ?? this.guesses,
      results: results ?? this.results,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isInvalidGuess: isInvalidGuess ?? this.isInvalidGuess,
      shouldShake: shouldShake ?? this.shouldShake,
      keyboardStatus: keyboardStatus ?? this.keyboardStatus,
    );
  }
}

@riverpod
class FindWordNotifier extends _$FindWordNotifier {
  final _engine = FindWordEngine();
  Set<String> _wordList = {};

  @override
  FindWordState build() {
    return FindWordState(
      targetWord: '',
      guesses: [],
      results: [],
    );
  }

  Future<void> initGame() async {
    _wordList = await _engine.loadWords();
    final target = _engine.getRandomWord(_wordList);
    state = FindWordState(
      targetWord: target,
      guesses: [],
      results: [],
    );
  }

  void addLetter(String letter) {
    if (state.isGameOver) return;
    if (state.currentGuess.length < FindWordEngine.wordLength) {
      state = state.copyWith(
        currentGuess: state.currentGuess + letter.toUpperCase(),
        isInvalidGuess: false,
      );
    }
  }

  void removeLetter() {
    if (state.isGameOver) return;
    if (state.currentGuess.isNotEmpty) {
      state = state.copyWith(
        currentGuess: state.currentGuess.substring(0, state.currentGuess.length - 1),
        isInvalidGuess: false,
      );
    }
  }

  void submitGuess() {
    if (state.isGameOver || state.targetWord.isEmpty) return;
    if (state.currentGuess.length != FindWordEngine.wordLength) return;

    // Check if word exists in our wordlist
    if (!_wordList.contains(state.currentGuess)) {
      state = state.copyWith(isInvalidGuess: true, shouldShake: true);
      return;
    }

    final result = _engine.checkGuess(state.currentGuess, state.targetWord);
    final newGuesses = List<String>.from(state.guesses)..add(state.currentGuess);
    final newResults = List<List<LetterStatus>>.from(state.results)..add(result);

    bool won = state.currentGuess == state.targetWord;
    bool lost = newGuesses.length >= FindWordEngine.maxTries;

    final newKeyboardStatus = Map<String, LetterStatus>.from(state.keyboardStatus);
    for (int i = 0; i < state.currentGuess.length; i++) {
      final letter = state.currentGuess[i];
      final currentStatus = newKeyboardStatus[letter] ?? LetterStatus.initial;
      if (result[i] == LetterStatus.correctSpot) {
        newKeyboardStatus[letter] = LetterStatus.correctSpot;
      } else if (result[i] == LetterStatus.wrongSpot && currentStatus != LetterStatus.correctSpot) {
        newKeyboardStatus[letter] = LetterStatus.wrongSpot;
      } else if (result[i] == LetterStatus.notInWord && currentStatus == LetterStatus.initial) {
        newKeyboardStatus[letter] = LetterStatus.notInWord;
      }
    }

    state = state.copyWith(
      guesses: newGuesses,
      results: newResults,
      currentGuess: '',
      isGameOver: won || lost,
      isGameWon: won,
      isInvalidGuess: false,
      keyboardStatus: newKeyboardStatus,
    );
  }
}
