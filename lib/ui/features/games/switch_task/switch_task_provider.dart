import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'switch_task_engine.dart';

part 'switch_task_provider.g.dart';

class SwitchTaskState {
  final SwitchRule rule;
  final SwitchItem item;
  final String expectedAnswer;
  final List<String> options;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  SwitchTaskState({
    required this.rule,
    required this.item,
    required this.expectedAnswer,
    required this.options,
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  SwitchTaskState copyWith({
    SwitchRule? rule,
    SwitchItem? item,
    String? expectedAnswer,
    List<String>? options,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return SwitchTaskState(
      rule: rule ?? this.rule,
      item: item ?? this.item,
      expectedAnswer: expectedAnswer ?? this.expectedAnswer,
      options: options ?? this.options,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SwitchTaskNotifier extends _$SwitchTaskNotifier {
  final _engine = SwitchTaskEngine();
  Timer? _timer;

  @override
  SwitchTaskState build() {
    return SwitchTaskState(
      rule: SwitchRule.color,
      item: SwitchItem(color: Colors.transparent, colorName: '', shape: Icons.error, shapeName: ''),
      expectedAnswer: '',
      options: [],
    );
  }

  void initGame() {
    _timer?.cancel();
    final trial = _engine.generateTrial(null);
    final rule = trial['rule'] as SwitchRule;
    state = SwitchTaskState(
      rule: rule,
      item: trial['item'],
      expectedAnswer: trial['expectedAnswer'],
      options: _engine.getOptions(rule),
      timeLeft: 30,
      isLoading: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        state = state.copyWith(isGameOver: true, isGameWon: state.score >= 15);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void onOptionSelected(String option) {
    if (state.isGameOver) return;

    if (option == state.expectedAnswer) {
      final newTrial = _engine.generateTrial(state.rule);
      final newRule = newTrial['rule'] as SwitchRule;
      state = state.copyWith(
        score: state.score + 1,
        rule: newRule,
        item: newTrial['item'],
        expectedAnswer: newTrial['expectedAnswer'],
        options: _engine.getOptions(newRule),
      );
    } else {
      if (state.timeLeft > 2) {
        state = state.copyWith(timeLeft: state.timeLeft - 2);
      }
    }
  }
}
