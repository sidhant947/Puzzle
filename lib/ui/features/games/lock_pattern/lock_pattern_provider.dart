import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'lock_pattern_engine.dart';

part 'lock_pattern_provider.g.dart';

enum LockPatternDotStatus {
  correct, // Bull: Correct dot, correct position
  wrongPosition, // Cow: Correct dot, wrong position
  incorrect // Not in pattern
}

class LockPatternGuess {
  final List<int> pattern;
  final List<LockPatternDotStatus> feedback;

  LockPatternGuess({
    required this.pattern,
    required this.feedback,
  });
}

class LockPatternState {
  final List<int> secretPattern;
  final List<LockPatternGuess> guesses;
  final List<int> currentGuess;
  final bool isWon;
  final bool isGameOver;
  final int maxTries;
  final int patternLength;

  LockPatternState({
    required this.secretPattern,
    required this.guesses,
    required this.currentGuess,
    this.isWon = false,
    this.isGameOver = false,
    this.maxTries = 30,
    this.patternLength = 5,
  });

  LockPatternState copyWith({
    List<int>? secretPattern,
    List<LockPatternGuess>? guesses,
    List<int>? currentGuess,
    bool? isWon,
    bool? isGameOver,
  }) {
    return LockPatternState(
      secretPattern: secretPattern ?? this.secretPattern,
      guesses: guesses ?? this.guesses,
      currentGuess: currentGuess ?? this.currentGuess,
      isWon: isWon ?? this.isWon,
      isGameOver: isGameOver ?? this.isGameOver,
      maxTries: maxTries,
      patternLength: patternLength,
    );
  }
}

@riverpod
class LockPatternNotifier extends _$LockPatternNotifier {
  final _engine = LockPatternEngine();

  @override
  LockPatternState build() {
    return LockPatternState(
      secretPattern: _engine.generatePattern(LockPatternEngine.defaultLength),
      guesses: [],
      currentGuess: [],
    );
  }

  void initGame() {
    state = LockPatternState(
      secretPattern: _engine.generatePattern(LockPatternEngine.defaultLength),
      guesses: [],
      currentGuess: [],
    );
  }

  void addDot(int dot) {
    if (state.isGameOver) return;
    if (state.currentGuess.contains(dot)) return;
    if (state.currentGuess.length >= state.patternLength) return;

    final newPath = _engine.normalizePath(state.currentGuess, dot);
    if (newPath.length > state.patternLength) return;

    state = state.copyWith(currentGuess: newPath);
  }

  void clearCurrentGuess() {
    state = state.copyWith(currentGuess: []);
  }

  void submitGuess() {
    if (state.isGameOver) return;
    
    if (state.currentGuess.length != state.patternLength) {
      state = state.copyWith(currentGuess: []);
      return;
    }

    final feedback = _calculateFeedback(state.currentGuess, state.secretPattern);
    
    final newGuess = LockPatternGuess(
      pattern: List.from(state.currentGuess),
      feedback: feedback,
    );

    final newGuesses = [...state.guesses, newGuess];
    final isWon = feedback.every((f) => f == LockPatternDotStatus.correct);
    final isGameOver = isWon || newGuesses.length >= state.maxTries;

    state = state.copyWith(
      guesses: newGuesses,
      currentGuess: [],
      isWon: isWon,
      isGameOver: isGameOver,
    );
  }

  List<LockPatternDotStatus> _calculateFeedback(List<int> guess, List<int> target) {
    final List<LockPatternDotStatus> feedback = List.filled(guess.length, LockPatternDotStatus.incorrect);
    final List<bool> targetUsed = List.filled(target.length, false);
    final List<bool> guessUsed = List.filled(guess.length, false);

    // First pass: Correct position (Bulls)
    for (int i = 0; i < guess.length; i++) {
      if (guess[i] == target[i]) {
        feedback[i] = LockPatternDotStatus.correct;
        targetUsed[i] = true;
        guessUsed[i] = true;
      }
    }

    // Second pass: Wrong position (Cows)
    for (int i = 0; i < guess.length; i++) {
      if (guessUsed[i]) continue;
      for (int j = 0; j < target.length; j++) {
        if (!targetUsed[j] && guess[i] == target[j]) {
          feedback[i] = LockPatternDotStatus.wrongPosition;
          targetUsed[j] = true;
          break;
        }
      }
    }

    return feedback;
  }
}
