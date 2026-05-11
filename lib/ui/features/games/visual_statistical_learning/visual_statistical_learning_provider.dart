import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'visual_statistical_learning_engine.dart';

part 'visual_statistical_learning_provider.g.dart';

enum VSLPhase { learning, test, result }

class VSLState {
  final List<List<IconData>> triplets;
  final List<IconData> learningSequence;
  final int currentSequenceIndex;
  final List<IconData> testLeft;
  final List<IconData> testRight;
  final bool isLeftCorrect;
  final VSLPhase phase;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  VSLState({
    this.triplets = const [],
    this.learningSequence = const [],
    this.currentSequenceIndex = 0,
    this.testLeft = const [],
    this.testRight = const [],
    this.isLeftCorrect = true,
    this.phase = VSLPhase.learning,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  VSLState copyWith({
    List<List<IconData>>? triplets,
    List<IconData>? learningSequence,
    int? currentSequenceIndex,
    List<IconData>? testLeft,
    List<IconData>? testRight,
    bool? isLeftCorrect,
    VSLPhase? phase,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return VSLState(
      triplets: triplets ?? this.triplets,
      learningSequence: learningSequence ?? this.learningSequence,
      currentSequenceIndex: currentSequenceIndex ?? this.currentSequenceIndex,
      testLeft: testLeft ?? this.testLeft,
      testRight: testRight ?? this.testRight,
      isLeftCorrect: isLeftCorrect ?? this.isLeftCorrect,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class VisualStatisticalLearningNotifier extends _$VisualStatisticalLearningNotifier {
  final _engine = VisualStatisticalLearningEngine();
  Timer? _timer;
  Timer? _sequenceTimer;

  @override
  VSLState build() {
    ref.onDispose(cleanUp);
    return VSLState();
  }

  void initGame() {
    _timer?.cancel();
    _sequenceTimer?.cancel();
    
    final triplets = _engine.generateTriplets();
    final sequence = _engine.generateLearningSequence(triplets, 10); // 30 items

    state = VSLState(
      triplets: triplets,
      learningSequence: sequence,
      isLoading: false,
      phase: VSLPhase.learning,
    );
    
    _startTimer();
    _startLearningSequence();
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

  void _startLearningSequence() {
    _sequenceTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (state.currentSequenceIndex < state.learningSequence.length - 1) {
        state = state.copyWith(currentSequenceIndex: state.currentSequenceIndex + 1);
      } else {
        timer.cancel();
        _startTestPhase();
      }
    });
  }

  void _startTestPhase() {
    final trial = _engine.generateTestTrial(state.triplets);
    state = state.copyWith(
      phase: VSLPhase.test,
      testLeft: trial['left'],
      testRight: trial['right'],
      isLeftCorrect: trial['isLeftCorrect'],
    );
  }

  void choose(bool isLeft) {
    if (state.phase != VSLPhase.test) return;

    final correct = isLeft == state.isLeftCorrect;
    state = state.copyWith(score: state.score + (correct ? 1 : 0));

    // Next test trial
    final trial = _engine.generateTestTrial(state.triplets);
    state = state.copyWith(
      testLeft: trial['left'],
      testRight: trial['right'],
      isLeftCorrect: trial['isLeftCorrect'],
    );
  }

  void cleanUp() {
    _timer?.cancel();
    _sequenceTimer?.cancel();
  }
}
