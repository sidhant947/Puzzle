import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'word_ladder_engine.dart';

part 'word_ladder_provider.g.dart';

class WordLadderState {
  final String startWord;
  final String endWord;
  final List<String> ladder;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;
  final String? errorMessage;

  WordLadderState({
    required this.startWord,
    required this.endWord,
    required this.ladder,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.errorMessage,
  });

  WordLadderState copyWith({
    String? startWord,
    String? endWord,
    List<String>? ladder,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
    String? errorMessage,
  }) {
    return WordLadderState(
      startWord: startWord ?? this.startWord,
      endWord: endWord ?? this.endWord,
      ladder: ladder ?? this.ladder,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      errorMessage: errorMessage,
    );
  }
}

@riverpod
class WordLadderNotifier extends _$WordLadderNotifier {
  final _engine = WordLadderEngine();

  @override
  WordLadderState build() {
    final puzzle = _engine.getRandomPuzzle();
    return WordLadderState(
      startWord: puzzle['start']!,
      endWord: puzzle['end']!,
      ladder: [puzzle['start']!],
    );
  }

  void addLetter(String letter) {
    if (state.isGameOver) return;
    if (state.currentGuess.length < 4) {
      state = state.copyWith(currentGuess: state.currentGuess + letter.toUpperCase(), errorMessage: null);
    }
  }

  void removeLetter() {
    if (state.isGameOver) return;
    if (state.currentGuess.isNotEmpty) {
      state = state.copyWith(currentGuess: state.currentGuess.substring(0, state.currentGuess.length - 1), errorMessage: null);
    }
  }

  void submitGuess() {
    if (state.isGameOver) return;
    if (state.currentGuess.length != 4) return;

    final lastWord = state.ladder.last;
    
    if (!_engine.isValidWord(state.currentGuess)) {
      state = state.copyWith(errorMessage: 'Not a valid word');
      return;
    }

    if (!_engine.isOneLetterDifferent(lastWord, state.currentGuess)) {
      state = state.copyWith(errorMessage: 'Must change exactly one letter');
      return;
    }

    final newLadder = List<String>.from(state.ladder)..add(state.currentGuess);
    bool won = state.currentGuess == state.endWord;

    state = state.copyWith(
      ladder: newLadder,
      currentGuess: '',
      isGameOver: won,
      isGameWon: won,
    );
  }

  void reset() {
    final puzzle = _engine.getRandomPuzzle();
    state = WordLadderState(
      startWord: puzzle['start']!,
      endWord: puzzle['end']!,
      ladder: [puzzle['start']!],
    );
  }
}
