import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'syllable_stack_engine.dart';

part 'syllable_stack_provider.g.dart';

class SyllableStackState {
  final SyllableStackPuzzle? puzzle;
  final List<String> currentStack;
  final List<String> remainingSyllables;
  final int score;
  final bool isGameOver;
  final int timeLeft;
  final bool? lastCheck; // true if correct, false if incorrect, null if pending

  SyllableStackState({
    this.puzzle,
    this.currentStack = const [],
    this.remainingSyllables = const [],
    this.score = 0,
    this.isGameOver = false,
    this.timeLeft = 60,
    this.lastCheck,
  });

  SyllableStackState copyWith({
    SyllableStackPuzzle? puzzle,
    List<String>? currentStack,
    List<String>? remainingSyllables,
    int? score,
    bool? isGameOver,
    int? timeLeft,
    bool? lastCheck,
  }) {
    return SyllableStackState(
      puzzle: puzzle ?? this.puzzle,
      currentStack: currentStack ?? this.currentStack,
      remainingSyllables: remainingSyllables ?? this.remainingSyllables,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
      lastCheck: lastCheck ?? this.lastCheck,
    );
  }
}

@riverpod
class SyllableStackNotifier extends _$SyllableStackNotifier {
  final _engine = SyllableStackEngine();
  Timer? _timer;

  @override
  SyllableStackState build() {
    ref.onDispose(() => _timer?.cancel());
    return SyllableStackState();
  }

  void startGame() {
    _timer?.cancel();
    final puzzle = _engine.generatePuzzle();
    state = SyllableStackState(
      puzzle: puzzle,
      remainingSyllables: puzzle.shuffledSyllables,
      currentStack: [],
      score: 0,
      isGameOver: false,
      timeLeft: 60,
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

  void addSyllable(int index) {
    if (state.isGameOver) return;
    
    final syllable = state.remainingSyllables[index];
    final updatedStack = [...state.currentStack, syllable];
    final updatedRemaining = List<String>.from(state.remainingSyllables)..removeAt(index);
    
    state = state.copyWith(
      currentStack: updatedStack,
      remainingSyllables: updatedRemaining,
      lastCheck: null,
    );

    if (updatedRemaining.isEmpty) {
      _checkAnswer();
    }
  }

  void undoLast() {
    if (state.isGameOver || state.currentStack.isEmpty) return;

    final lastSyllable = state.currentStack.last;
    final updatedStack = List<String>.from(state.currentStack)..removeLast();
    final updatedRemaining = [...state.remainingSyllables, lastSyllable];

    state = state.copyWith(
      currentStack: updatedStack,
      remainingSyllables: updatedRemaining,
      lastCheck: null,
    );
  }

  void _checkAnswer() {
    final combined = state.currentStack.join('');
    if (combined == state.puzzle?.word) {
      state = state.copyWith(
        score: state.score + 10 + (state.timeLeft ~/ 5),
        lastCheck: true,
      );
      Future.delayed(const Duration(milliseconds: 500), () {
        _nextPuzzle();
      });
    } else {
      state = state.copyWith(lastCheck: false);
      Future.delayed(const Duration(milliseconds: 800), () {
        if (state.isGameOver) return;
        // Reset current puzzle
        state = state.copyWith(
          currentStack: [],
          remainingSyllables: state.puzzle?.shuffledSyllables ?? [],
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
      remainingSyllables: puzzle.shuffledSyllables,
      currentStack: [],
      lastCheck: null,
    );
  }
}
