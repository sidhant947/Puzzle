import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'spelling_bee_engine.dart';

part 'spelling_bee_provider.g.dart';

class SpellingBeeState {
  final String letters;
  final String centerLetter;
  final Set<String> validWords;
  final Set<String> foundWords;
  final String currentWord;
  final String? errorMessage;
  final bool isGameOver;

  SpellingBeeState({
    required this.letters,
    required this.centerLetter,
    required this.validWords,
    required this.foundWords,
    this.currentWord = '',
    this.errorMessage,
    this.isGameOver = false,
  });

  SpellingBeeState copyWith({
    String? letters,
    String? centerLetter,
    Set<String>? validWords,
    Set<String>? foundWords,
    String? currentWord,
    String? errorMessage,
    bool? isGameOver,
  }) {
    return SpellingBeeState(
      letters: letters ?? this.letters,
      centerLetter: centerLetter ?? this.centerLetter,
      validWords: validWords ?? this.validWords,
      foundWords: foundWords ?? this.foundWords,
      currentWord: currentWord ?? this.currentWord,
      errorMessage: errorMessage,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}

@riverpod
class SpellingBeeNotifier extends _$SpellingBeeNotifier {
  final _engine = SpellingBeeEngine();

  @override
  SpellingBeeState build() {
    final puzzle = _engine.getRandomPuzzle();
    return SpellingBeeState(
      letters: puzzle['letters'] as String,
      centerLetter: puzzle['center'] as String,
      validWords: Set<String>.from(puzzle['words'] as List),
      foundWords: {},
    );
  }

  void addLetter(String letter) {
    state = state.copyWith(currentWord: state.currentWord + letter.toUpperCase(), errorMessage: null);
  }

  void removeLetter() {
    if (state.currentWord.isNotEmpty) {
      state = state.copyWith(currentWord: state.currentWord.substring(0, state.currentWord.length - 1), errorMessage: null);
    }
  }

  void submitWord() {
    final word = state.currentWord.toUpperCase();
    
    if (word.length < 4) {
      state = state.copyWith(errorMessage: 'Too short');
      return;
    }

    if (!word.contains(state.centerLetter)) {
      state = state.copyWith(errorMessage: 'Missing center letter');
      return;
    }

    if (state.foundWords.contains(word)) {
      state = state.copyWith(errorMessage: 'Already found');
      return;
    }

    if (!state.validWords.contains(word)) {
      state = state.copyWith(errorMessage: 'Not in word list');
      return;
    }

    final newFoundWords = Set<String>.from(state.foundWords)..add(word);
    bool won = newFoundWords.length == state.validWords.length;

    state = state.copyWith(
      foundWords: newFoundWords,
      currentWord: '',
      isGameOver: won,
    );
  }

  void reset() {
    final puzzle = _engine.getRandomPuzzle();
    state = SpellingBeeState(
      letters: puzzle['letters'] as String,
      centerLetter: puzzle['center'] as String,
      validWords: Set<String>.from(puzzle['words'] as List),
      foundWords: {},
    );
  }
}
