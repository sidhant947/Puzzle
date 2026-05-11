import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'attentional_blink_engine.dart';

part 'attentional_blink_provider.g.dart';

enum ABPhase { sequence, input, result }

class AttentionalBlinkState {
  final List<String> sequence;
  final String t1;
  final String t2;
  final int currentIndex;
  final String inputT1;
  final String inputT2;
  final ABPhase phase;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  AttentionalBlinkState({
    this.sequence = const [],
    this.t1 = '',
    this.t2 = '',
    this.currentIndex = -1,
    this.inputT1 = '',
    this.inputT2 = '',
    this.phase = ABPhase.sequence,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  AttentionalBlinkState copyWith({
    List<String>? sequence,
    String? t1,
    String? t2,
    int? currentIndex,
    String? inputT1,
    String? inputT2,
    ABPhase? phase,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return AttentionalBlinkState(
      sequence: sequence ?? this.sequence,
      t1: t1 ?? this.t1,
      t2: t2 ?? this.t2,
      currentIndex: currentIndex ?? this.currentIndex,
      inputT1: inputT1 ?? this.inputT1,
      inputT2: inputT2 ?? this.inputT2,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class AttentionalBlinkNotifier extends _$AttentionalBlinkNotifier {
  final _engine = AttentionalBlinkEngine();
  Timer? _timer;
  Timer? _sequenceTimer;

  @override
  AttentionalBlinkState build() {
    ref.onDispose(cleanUp);
    return AttentionalBlinkState();
  }

  void initGame() {
    _timer?.cancel();
    _sequenceTimer?.cancel();
    
    state = AttentionalBlinkState(isLoading: false);
    _startTimer();
    _nextTrial();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        _sequenceTimer?.cancel();
        state = state.copyWith(isGameOver: true);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _nextTrial() {
    final trial = _engine.generateTrial(15);
    state = state.copyWith(
      sequence: trial['sequence'],
      t1: trial['t1'],
      t2: trial['t2'],
      currentIndex: -1,
      inputT1: '',
      inputT2: '',
      phase: ABPhase.sequence,
    );

    _startSequence();
  }

  void _startSequence() {
    _sequenceTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (state.currentIndex < state.sequence.length - 1) {
        state = state.copyWith(currentIndex: state.currentIndex + 1);
      } else {
        timer.cancel();
        state = state.copyWith(phase: ABPhase.input);
      }
    });
  }

  void submitInput(String char) {
    if (state.phase != ABPhase.input) return;

    if (state.inputT1.isEmpty) {
      state = state.copyWith(inputT1: char);
    } else if (state.inputT2.isEmpty) {
      state = state.copyWith(inputT2: char);
      _checkResult();
    }
  }

  void _checkResult() {
    bool t1Correct = state.inputT1 == state.t1;
    bool t2Correct = state.inputT2 == state.t2;
    int points = (t1Correct ? 1 : 0) + (t2Correct ? 1 : 0);
    
    state = state.copyWith(
      score: state.score + points,
      phase: ABPhase.result,
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!state.isGameOver) {
        _nextTrial();
      }
    });
  }

  void cleanUp() {
    _timer?.cancel();
    _sequenceTimer?.cancel();
  }
}
