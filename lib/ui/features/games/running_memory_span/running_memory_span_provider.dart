import 'dart:async';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'running_memory_span_provider.g.dart';

enum RunningSpanPhase { instruction, showingStream, recalling, result }

class RunningMemorySpanState {
  final RunningSpanPhase phase;
  final List<String> fullStream;
  final String currentCharacter; // empty string for none
  final int streamIndex;
  final List<String> targetSequence;
  final List<String> userSequence;
  final int recallCount; // value of N (how many items to recall from end)
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;

  RunningMemorySpanState({
    this.phase = RunningSpanPhase.instruction,
    this.fullStream = const [],
    this.currentCharacter = "",
    this.streamIndex = 0,
    this.targetSequence = const [],
    this.userSequence = const [],
    this.recallCount = 3,
    this.score = 0,
    this.timeLeft = 70,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
  });

  RunningMemorySpanState copyWith({
    RunningSpanPhase? phase,
    List<String>? fullStream,
    String? currentCharacter,
    int? streamIndex,
    List<String>? targetSequence,
    List<String>? userSequence,
    int? recallCount,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
    bool resetLastRoundCorrect = false,
  }) {
    return RunningMemorySpanState(
      phase: phase ?? this.phase,
      fullStream: fullStream ?? this.fullStream,
      currentCharacter: currentCharacter ?? this.currentCharacter,
      streamIndex: streamIndex ?? this.streamIndex,
      targetSequence: targetSequence ?? this.targetSequence,
      userSequence: userSequence ?? this.userSequence,
      recallCount: recallCount ?? this.recallCount,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: resetLastRoundCorrect ? null : (lastRoundCorrect ?? this.lastRoundCorrect),
    );
  }
}

@riverpod
class RunningMemorySpanNotifier extends _$RunningMemorySpanNotifier {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _streamTimer;

  static const List<String> _alphabet = [
    "A", "B", "D", "E", "F", "H", "K", "L", "M", "N", "P", "R", "T", "U", "W", "X", "Y"
  ];

  @override
  RunningMemorySpanState build() {
    return RunningMemorySpanState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _streamTimer?.cancel();

    state = RunningMemorySpanState(
      isLoading: false,
    );
    _startRound();
    _startTimer();
  }

  void _startTimer() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        _endGame();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _startRound() {
    _streamTimer?.cancel();
    
    // Generate full stream of random letters (length between 6 and 12)
    final length = _random.nextInt(6) + 7; // 7 to 12 letters
    List<String> stream = [];
    for (int i = 0; i < length; i++) {
      stream.add(_alphabet[_random.nextInt(_alphabet.length)]);
    }

    // Target is the last N letters
    final target = stream.sublist(stream.length - state.recallCount);

    state = state.copyWith(
      phase: RunningSpanPhase.instruction,
      fullStream: stream,
      streamIndex: 0,
      targetSequence: target,
      userSequence: [],
      resetLastRoundCorrect: true,
    );

    // Show instruction for 2 seconds, then start stream
    _streamTimer = Timer(const Duration(seconds: 2), _runStream);
  }

  void _runStream() {
    if (state.streamIndex < state.fullStream.length) {
      state = state.copyWith(
        phase: RunningSpanPhase.showingStream,
        currentCharacter: state.fullStream[state.streamIndex],
      );

      _streamTimer = Timer(const Duration(milliseconds: 900), () {
        // blank between characters
        state = state.copyWith(currentCharacter: "");
        _streamTimer = Timer(const Duration(milliseconds: 300), () {
          state = state.copyWith(streamIndex: state.streamIndex + 1);
          _runStream();
        });
      });
    } else {
      // Transition to recall phase
      state = state.copyWith(
        phase: RunningSpanPhase.recalling,
        currentCharacter: "",
      );
    }
  }

  void onLetterTapRecall(String letter) {
    if (state.isGameOver || state.phase != RunningSpanPhase.recalling) return;

    final newUserSeq = [...state.userSequence, letter];
    state = state.copyWith(userSequence: newUserSeq);

    final targetLetter = state.targetSequence[newUserSeq.length - 1];
    if (letter != targetLetter) {
      _checkRoundResult(false);
    } else if (newUserSeq.length == state.targetSequence.length) {
      _checkRoundResult(true);
    }
  }

  void _checkRoundResult(bool correct) {
    int nextRecall = state.recallCount;
    if (correct) {
      if (state.recallCount < 5) {
        nextRecall = state.recallCount + 1;
      }
    } else {
      if (state.recallCount > 3) {
        nextRecall = state.recallCount - 1;
      }
    }

    state = state.copyWith(
      phase: RunningSpanPhase.result,
      score: correct ? state.score + state.recallCount : state.score,
      lastRoundCorrect: correct,
      recallCount: nextRecall,
    );

    _streamTimer = Timer(const Duration(milliseconds: 1500), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _streamTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
