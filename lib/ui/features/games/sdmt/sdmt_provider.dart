import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'sdmt_engine.dart';

part 'sdmt_provider.g.dart';

class SdmtState {
  final Map<IconData, int> symbolKey;
  final IconData currentSymbol;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  SdmtState({
    required this.symbolKey,
    required this.currentSymbol,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
  });

  SdmtState copyWith({
    Map<IconData, int>? symbolKey,
    IconData? currentSymbol,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return SdmtState(
      symbolKey: symbolKey ?? this.symbolKey,
      currentSymbol: currentSymbol ?? this.currentSymbol,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SdmtNotifier extends _$SdmtNotifier {
  final _engine = SDMTEngine();
  Timer? _timer;

  @override
  SdmtState build() {
    return SdmtState(symbolKey: {}, currentSymbol: Icons.help);
  }

  void initGame() {
    _timer?.cancel();
    final key = _engine.generateKey();
    state = SdmtState(
      symbolKey: key,
      currentSymbol: _engine.getRandomSymbol(),
      isLoading: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        _endGame();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void onDigitTap(int digit) {
    if (state.isGameOver) return;

    if (state.symbolKey[state.currentSymbol] == digit) {
      state = state.copyWith(
        score: state.score + 1,
        currentSymbol: _engine.getRandomSymbol(),
      );
    } else {
      state = state.copyWith(
        timeLeft: state.timeLeft > 2 ? state.timeLeft - 2 : 0,
      );
    }
  }

  void _endGame() {
    _timer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
