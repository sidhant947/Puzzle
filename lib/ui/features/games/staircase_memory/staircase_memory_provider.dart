import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'staircase_memory_engine.dart';

part 'staircase_memory_provider.g.dart';

enum StaircasePhase { initial, sequence, testing, result }

class StaircaseState {
  final List<IconData> sequence;
  final int currentIndex;
  final StaircasePhase phase;
  final int correctCount;
  final int totalTests;
  final bool isLoading;
  final int n;
  final int score;

  StaircaseState({
    required this.sequence,
    this.currentIndex = 0,
    this.phase = StaircasePhase.initial,
    this.correctCount = 0,
    this.totalTests = 0,
    this.isLoading = true,
    this.n = 2,
    this.score = 0,
  });

  StaircaseState copyWith({
    List<IconData>? sequence,
    int? currentIndex,
    StaircasePhase? phase,
    int? correctCount,
    int? totalTests,
    bool? isLoading,
    int? n,
    int? score,
  }) {
    return StaircaseState(
      sequence: sequence ?? this.sequence,
      currentIndex: currentIndex ?? this.currentIndex,
      phase: phase ?? this.phase,
      correctCount: correctCount ?? this.correctCount,
      totalTests: totalTests ?? this.totalTests,
      isLoading: isLoading ?? this.isLoading,
      n: n ?? this.n,
      score: score ?? this.score,
    );
  }
}

@riverpod
class StaircaseMemoryNotifier extends _$StaircaseMemoryNotifier {
  final _engine = StaircaseMemoryEngine();
  Timer? _timer;

  @override
  StaircaseState build() {
    return StaircaseState(sequence: []);
  }

  void initGame() {
    _timer?.cancel();
    final n = 2 + (state.score ~/ 5);
    final sequence = _engine.generateSequence(15, n);
    state = StaircaseState(
      sequence: sequence,
      n: n,
      score: state.score,
      isLoading: false,
      phase: StaircasePhase.sequence,
    );
    _startSequence();
  }

  void _startSequence() {
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (state.currentIndex < state.sequence.length - 1) {
        final nextIndex = state.currentIndex + 1;
        if (nextIndex >= state.n) {
          state = state.copyWith(
            currentIndex: nextIndex,
            phase: StaircasePhase.testing,
          );
          timer.cancel();
        } else {
          state = state.copyWith(currentIndex: nextIndex);
        }
      } else {
        timer.cancel();
        state = state.copyWith(phase: StaircasePhase.result);
      }
    });
  }

  void onOptionSelected(IconData icon) {
    if (state.phase != StaircasePhase.testing) return;

    final isCorrect = icon == state.sequence[state.currentIndex - state.n];
    final newCorrectCount = isCorrect ? state.correctCount + 1 : state.correctCount;
    final newTotalTests = state.totalTests + 1;

    if (state.currentIndex < state.sequence.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        correctCount: newCorrectCount,
        totalTests: newTotalTests,
      );
    } else {
      state = state.copyWith(
        phase: StaircasePhase.result,
        correctCount: newCorrectCount,
        totalTests: newTotalTests,
        score: (newCorrectCount >= newTotalTests * 0.8) ? state.score + 1 : state.score,
      );
    }
  }
}
