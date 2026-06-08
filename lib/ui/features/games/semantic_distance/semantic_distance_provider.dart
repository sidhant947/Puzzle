import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'semantic_distance_engine.dart';

part 'semantic_distance_provider.g.dart';

class SemanticDistanceGuess {
  final String word;
  final double distance;

  SemanticDistanceGuess(this.word, this.distance);
}

class SemanticDistanceState {
  final SemanticDistancePuzzle? puzzle;
  final List<SemanticDistanceGuess> guesses;
  final int score;
  final bool isGameOver;
  final int timeLeft;

  SemanticDistanceState({
    this.puzzle,
    this.guesses = const [],
    this.score = 0,
    this.isGameOver = false,
    this.timeLeft = 120,
  });

  SemanticDistanceState copyWith({
    SemanticDistancePuzzle? puzzle,
    List<SemanticDistanceGuess>? guesses,
    int? score,
    bool? isGameOver,
    int? timeLeft,
  }) {
    return SemanticDistanceState(
      puzzle: puzzle ?? this.puzzle,
      guesses: guesses ?? this.guesses,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
    );
  }
}

@riverpod
class SemanticDistanceNotifier extends _$SemanticDistanceNotifier {
  final _engine = SemanticDistanceEngine();
  Timer? _timer;

  @override
  SemanticDistanceState build() {
    ref.onDispose(() => _timer?.cancel());
    return SemanticDistanceState();
  }

  void startGame() {
    _timer?.cancel();
    state = SemanticDistanceState(
      puzzle: _engine.generatePuzzle(),
      guesses: [],
      score: 0,
      isGameOver: false,
      timeLeft: 120,
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

  void submitGuess(String word) {
    if (state.isGameOver || state.puzzle == null || word.isEmpty) return;
    
    final normalizedWord = word.toUpperCase().trim();
    if (state.guesses.any((g) => g.word == normalizedWord)) return;

    final distance = _engine.calculateDistance(state.puzzle!.target, normalizedWord);
    final newGuess = SemanticDistanceGuess(normalizedWord, distance);
    
    final updatedGuesses = [...state.guesses, newGuess];
    updatedGuesses.sort((a, b) => a.distance.compareTo(b.distance));

    if (distance == 0) {
      _timer?.cancel();
      state = state.copyWith(
        guesses: updatedGuesses,
        score: state.score + (state.timeLeft ~/ 10) + 10,
        isGameOver: true,
      );
    } else {
      state = state.copyWith(
        guesses: updatedGuesses,
      );
    }
  }
}
