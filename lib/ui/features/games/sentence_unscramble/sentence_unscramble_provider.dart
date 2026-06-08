import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'sentence_unscramble_engine.dart';

part 'sentence_unscramble_provider.g.dart';

class SentenceUnscrambleState {
  final SentenceUnscramblePuzzle? puzzle;
  final List<String> currentWords;
  final List<String> availableWords;
  final int score;
  final bool isGameOver;
  final int timeLeft;
  final bool? lastCheck;

  SentenceUnscrambleState({
    this.puzzle,
    this.currentWords = const [],
    this.availableWords = const [],
    this.score = 0,
    this.isGameOver = false,
    this.timeLeft = 90,
    this.lastCheck,
  });

  SentenceUnscrambleState copyWith({
    SentenceUnscramblePuzzle? puzzle,
    List<String>? currentWords,
    List<String>? availableWords,
    int? score,
    bool? isGameOver,
    int? timeLeft,
    bool? lastCheck,
  }) {
    return SentenceUnscrambleState(
      puzzle: puzzle ?? this.puzzle,
      currentWords: currentWords ?? this.currentWords,
      availableWords: availableWords ?? this.availableWords,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
      lastCheck: lastCheck ?? this.lastCheck,
    );
  }
}

@riverpod
class SentenceUnscrambleNotifier extends _$SentenceUnscrambleNotifier {
  final _engine = SentenceUnscrambleEngine();
  Timer? _timer;

  @override
  SentenceUnscrambleState build() {
    ref.onDispose(() => _timer?.cancel());
    return SentenceUnscrambleState();
  }

  void startGame() {
    _timer?.cancel();
    final puzzle = _engine.generatePuzzle();
    state = SentenceUnscrambleState(
      puzzle: puzzle,
      availableWords: puzzle.scrambledWords,
      currentWords: [],
      score: 0,
      isGameOver: false,
      timeLeft: 90,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        state = state.copyWith(isGameOver: true);
      }
    });
  }

  void addWord(int index) {
    if (state.isGameOver) return;
    
    final word = state.availableWords[index];
    final updatedCurrent = [...state.currentWords, word];
    final updatedAvailable = List<String>.from(state.availableWords)..removeAt(index);
    
    state = state.copyWith(
      currentWords: updatedCurrent,
      availableWords: updatedAvailable,
      lastCheck: null,
    );

    if (updatedAvailable.isEmpty) {
      _checkAnswer();
    }
  }

  void removeWord(int index) {
    if (state.isGameOver) return;

    final word = state.currentWords[index];
    final updatedCurrent = List<String>.from(state.currentWords)..removeAt(index);
    final updatedAvailable = [...state.availableWords, word];

    state = state.copyWith(
      currentWords: updatedCurrent,
      availableWords: updatedAvailable,
      lastCheck: null,
    );
  }

  void _checkAnswer() {
    final combined = state.currentWords.join(' ');
    if (combined == state.puzzle?.fullSentence) {
      state = state.copyWith(
        score: state.score + 20 + (state.timeLeft ~/ 4),
        lastCheck: true,
      );
      Future.delayed(const Duration(milliseconds: 600), () {
        _nextPuzzle();
      });
    } else {
      state = state.copyWith(lastCheck: false);
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (state.isGameOver) return;
        // Reset current puzzle
        state = state.copyWith(
          currentWords: [],
          availableWords: state.puzzle?.scrambledWords ?? [],
          lastCheck: null,
        );
      });
    }
  }

  void _nextPuzzle() {
    if (state.isGameOver) return;
    final puzzle = _engine.generatePuzzle();
    state = state.copyWith(
      puzzle: puzzle,
      availableWords: puzzle.scrambledWords,
      currentWords: [],
      lastCheck: null,
    );
  }
}
