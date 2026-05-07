import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'spelling_sprint_engine.dart';

part 'spelling_sprint_provider.g.dart';

class SpellingSprintState {
  final String targetWord;
  final String currentSpelling;
  final List<String> availableLetters;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isSolved;

  SpellingSprintState({
    required this.targetWord,
    required this.currentSpelling,
    required this.availableLetters,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isSolved = false,
  });

  SpellingSprintState copyWith({
    String? targetWord,
    String? currentSpelling,
    List<String>? availableLetters,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isSolved,
  }) {
    return SpellingSprintState(
      targetWord: targetWord ?? this.targetWord,
      currentSpelling: currentSpelling ?? this.currentSpelling,
      availableLetters: availableLetters ?? this.availableLetters,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class SpellingSprintNotifier extends _$SpellingSprintNotifier {
  final _engine = SpellingSprintEngine();

  @override
  SpellingSprintState build() {
    final word = _engine.getRandomWord();
    return SpellingSprintState(
      targetWord: word,
      currentSpelling: '',
      availableLetters: _engine.getShuffledLetters(word),
    );
  }

  void startGame() {
    final word = _engine.getRandomWord();
    state = SpellingSprintState(
      targetWord: word,
      currentSpelling: '',
      availableLetters: _engine.getShuffledLetters(word),
      timeLeft: 60,
    );
  }

  void tick() {
    if (state.isGameOver || state.isSolved) return;
    if (state.timeLeft <= 1) {
      state = state.copyWith(timeLeft: 0, isGameOver: true);
    } else {
      state = state.copyWith(timeLeft: state.timeLeft - 1);
    }
  }

  void addLetter(int index) {
    if (state.isGameOver || state.isSolved) return;

    final letter = state.availableLetters[index];
    final nextIndex = state.currentSpelling.length;
    
    if (nextIndex < state.targetWord.length && state.targetWord[nextIndex] == letter) {
      final newSpelling = state.currentSpelling + letter;
      final newLetters = List<String>.from(state.availableLetters)..removeAt(index);
      
      if (newSpelling == state.targetWord) {
        final newScore = state.score + 1;
        if (newScore >= 10) {
          state = state.copyWith(score: newScore, isSolved: true);
        } else {
          final nextWord = _engine.getRandomWord();
          state = state.copyWith(
            score: newScore,
            targetWord: nextWord,
            currentSpelling: '',
            availableLetters: _engine.getShuffledLetters(nextWord),
            timeLeft: state.timeLeft + 5,
          );
        }
      } else {
        state = state.copyWith(
          currentSpelling: newSpelling,
          availableLetters: newLetters,
        );
      }
    } else {
      // Wrong letter penalty
      state = state.copyWith(timeLeft: state.timeLeft - 2);
    }
  }
}
