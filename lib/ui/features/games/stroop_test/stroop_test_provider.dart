import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'stroop_test_engine.dart';

part 'stroop_test_provider.g.dart';

class StroopTestState {
  final StroopItem currentItem;
  final List<String> allColorNames;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  StroopTestState({
    required this.currentItem,
    required this.allColorNames,
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  StroopTestState copyWith({
    StroopItem? currentItem,
    List<String>? allColorNames,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return StroopTestState(
      currentItem: currentItem ?? this.currentItem,
      allColorNames: allColorNames ?? this.allColorNames,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class StroopTestNotifier extends _$StroopTestNotifier {
  final _engine = StroopTestEngine();
  Timer? _timer;

  @override
  StroopTestState build() {
    return StroopTestState(
      currentItem: StroopItem(text: '', color: Colors.black, colorName: ''),
      allColorNames: [],
    );
  }

  void initGame() {
    _timer?.cancel();
    final item = _engine.generateItem();
    state = StroopTestState(
      currentItem: item,
      allColorNames: _engine.getAllColorNames(),
      timeLeft: 30,
      isLoading: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        state = state.copyWith(isGameOver: true, isGameWon: state.score >= 10);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void onColorSelected(String name) {
    if (state.isGameOver) return;

    if (name == state.currentItem.colorName) {
      final newItem = _engine.generateItem();
      state = state.copyWith(
        score: state.score + 1,
        currentItem: newItem,
      );
    } else {
      // Penalty: minus time?
      if (state.timeLeft > 2) {
        state = state.copyWith(timeLeft: state.timeLeft - 2);
      }
    }
  }
}
