import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utils/design_system.dart';

part 'mandala_recall_provider.g.dart';

enum MandalaPhase { memorize, repaint, result }

class MandalaRecallState {
  final MandalaPhase phase;
  final Map<int, int> targetColors; // index -> colorIndex
  final Map<int, int> userColors; // index -> colorIndex
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;
  final int targetCellCount; // difficulty: number of colored cells (starts at 3)

  MandalaRecallState({
    this.phase = MandalaPhase.memorize,
    this.targetColors = const {},
    this.userColors = const {},
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
    this.targetCellCount = 3,
  });

  MandalaRecallState copyWith({
    MandalaPhase? phase,
    Map<int, int>? targetColors,
    Map<int, int>? userColors,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
    bool resetLastRoundCorrect = false,
    int? targetCellCount,
  }) {
    return MandalaRecallState(
      phase: phase ?? this.phase,
      targetColors: targetColors ?? this.targetColors,
      userColors: userColors ?? this.userColors,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: resetLastRoundCorrect ? null : (lastRoundCorrect ?? this.lastRoundCorrect),
      targetCellCount: targetCellCount ?? this.targetCellCount,
    );
  }
}

@riverpod
class MandalaRecallNotifier extends _$MandalaRecallNotifier {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _phaseTimer;

  static const List<Color> palette = [
    DesignSystem.primary,      // 0: Pink/Red
    DesignSystem.accentAmber,   // 1: Amber
    DesignSystem.success,       // 2: Green
    DesignSystem.gameBlue,      // 3: Blue
  ];

  @override
  MandalaRecallState build() {
    return MandalaRecallState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();

    state = MandalaRecallState(
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
    _phaseTimer?.cancel();

    // Set up geometric mandala grid (9 cells total for a 3x3 layout)
    // Randomly select targetCellCount cells to color
    final indexes = List<int>.generate(9, (i) => i)..shuffle(_random);
    final selectedIndexes = indexes.sublist(0, state.targetCellCount);

    Map<int, int> targets = {};
    for (final idx in selectedIndexes) {
      targets[idx] = _random.nextInt(palette.length);
    }

    state = state.copyWith(
      phase: MandalaPhase.memorize,
      targetColors: targets,
      userColors: {},
      resetLastRoundCorrect: true,
    );

    // Memorize phase is 4 seconds
    _phaseTimer = Timer(const Duration(seconds: 4), () {
      state = state.copyWith(phase: MandalaPhase.repaint);
    });
  }

  void onPaintCell(int cellIndex, int colorIndex) {
    if (state.isGameOver || state.phase != MandalaPhase.repaint) return;

    final updated = Map<int, int>.from(state.userColors);
    if (colorIndex == -1) {
      updated.remove(cellIndex);
    } else {
      updated[cellIndex] = colorIndex;
    }

    state = state.copyWith(userColors: updated);
  }

  void submitRepaint() {
    if (state.isGameOver || state.phase != MandalaPhase.repaint) return;

    // Check if user repainted all target colors correctly
    bool correct = true;
    
    // 1. All target cells must be colored with correct color index
    for (final entry in state.targetColors.entries) {
      final userColor = state.userColors[entry.key];
      if (userColor != entry.value) {
        correct = false;
        break;
      }
    }

    // 2. No other cells should be colored
    for (final key in state.userColors.keys) {
      if (!state.targetColors.containsKey(key)) {
        correct = false;
        break;
      }
    }

    int nextCount = state.targetCellCount;
    if (correct) {
      if (state.targetCellCount < 7) {
        nextCount = state.targetCellCount + 1;
      }
    } else {
      if (state.targetCellCount > 3) {
        nextCount = state.targetCellCount - 1;
      }
    }

    state = state.copyWith(
      phase: MandalaPhase.result,
      score: correct ? state.score + state.targetCellCount : state.score,
      lastRoundCorrect: correct,
      targetCellCount: nextCount,
    );

    _phaseTimer = Timer(const Duration(milliseconds: 1500), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
