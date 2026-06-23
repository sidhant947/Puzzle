import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utils/design_system.dart';

part 'dnms_provider.g.dart';

enum DnmsPhase { memorize, delay, choice }

class DnmsCard {
  final int id;
  final IconData icon;
  final Color color;

  DnmsCard({required this.id, required this.icon, required this.color});
}

class DnmsState {
  final DnmsPhase phase;
  final DnmsCard? sampleCard;
  final List<DnmsCard> options;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;
  final int currentDifficulty; // how many choices: 2, 3, or 4

  DnmsState({
    this.phase = DnmsPhase.memorize,
    this.sampleCard,
    this.options = const [],
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
    this.currentDifficulty = 2,
  });

  DnmsState copyWith({
    DnmsPhase? phase,
    DnmsCard? sampleCard,
    List<DnmsCard>? options,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
    int? currentDifficulty,
  }) {
    return DnmsState(
      phase: phase ?? this.phase,
      sampleCard: sampleCard ?? this.sampleCard,
      options: options ?? this.options,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: lastRoundCorrect ?? this.lastRoundCorrect,
      currentDifficulty: currentDifficulty ?? this.currentDifficulty,
    );
  }
}

@riverpod
class DnmsNotifier extends _$DnmsNotifier {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _phaseTimer;

  static const List<IconData> _icons = [
    Icons.star_rounded,
    Icons.favorite_rounded,
    Icons.face_rounded,
    Icons.lightbulb_rounded,
    Icons.pets_rounded,
    Icons.rocket_launch_rounded,
    Icons.sunny,
    Icons.forest_rounded,
    Icons.directions_car_rounded,
    Icons.local_pizza_rounded,
    Icons.cookie_rounded,
    Icons.cake_rounded,
    Icons.anchor_rounded,
    Icons.key_rounded,
    Icons.lock_rounded,
  ];

  static const List<Color> _colors = [
    DesignSystem.primary,
    DesignSystem.accentAmber,
    DesignSystem.accentBerry,
    DesignSystem.success,
    DesignSystem.error,
    DesignSystem.gameBlue,
    DesignSystem.gameIndigo,
    DesignSystem.gameTeal,
    DesignSystem.gameGreen,
    DesignSystem.gameOrange,
    DesignSystem.gamePurple,
    DesignSystem.gamePink,
  ];

  @override
  DnmsState build() {
    return DnmsState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();

    state = DnmsState(
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

    // Generate sample card
    final sample = DnmsCard(
      id: 0,
      icon: _icons[_random.nextInt(_icons.length)],
      color: _colors[_random.nextInt(_colors.length)],
    );

    state = DnmsState(
      phase: DnmsPhase.memorize,
      sampleCard: sample,
      options: const [],
      lastRoundCorrect: null,
      isLoading: false,
      score: state.score,
      timeLeft: state.timeLeft,
      isGameOver: state.isGameOver,
      currentDifficulty: state.currentDifficulty,
    );

    // After 2 seconds, transition to delay
    _phaseTimer = Timer(const Duration(seconds: 2), () {
      state = state.copyWith(phase: DnmsPhase.delay);
      
      // Delay phase for 1.5 seconds, then choice phase
      _phaseTimer = Timer(const Duration(milliseconds: 1500), () {
        final options = _generateOptions(sample, state.currentDifficulty);

        options.shuffle(_random);

        state = state.copyWith(
          phase: DnmsPhase.choice,
          options: options,
        );
      });
    });
  }

  List<DnmsCard> _generateOptions(DnmsCard sample, int count) {
    final options = <DnmsCard>[sample];
    final usedIcons = {sample.icon};
    final usedColors = {sample.color};

    Color pickDifferentColor() {
      final available = _colors.where((c) => c != sample.color).toList();
      return available[_random.nextInt(available.length)];
    }

    IconData pickDifferentIcon() {
      final available = _icons.where((i) => i != sample.icon).toList();
      return available[_random.nextInt(available.length)];
    }

    IconData pickAnyIcon() {
      final available = _icons.where((i) => !usedIcons.contains(i)).toList();
      if (available.isEmpty) return _icons[_random.nextInt(_icons.length)];
      return available[_random.nextInt(available.length)];
    }

    Color pickAnyColor() {
      final available = _colors.where((c) => !usedColors.contains(c)).toList();
      if (available.isEmpty) return _colors[_random.nextInt(_colors.length)];
      return available[_random.nextInt(available.length)];
    }

    // First novel: same icon, different color
    if (options.length < count) {
      final card = DnmsCard(
        id: options.length,
        icon: sample.icon,
        color: pickDifferentColor(),
      );
      options.add(card);
      usedColors.add(card.color);
    }

    // Second novel: same color, different icon
    if (options.length < count) {
      final card = DnmsCard(
        id: options.length,
        icon: pickDifferentIcon(),
        color: sample.color,
      );
      options.add(card);
      usedIcons.add(card.icon);
    }

    // Third novel (difficulty 4): completely different
    if (options.length < count) {
      final card = DnmsCard(
        id: options.length,
        icon: pickAnyIcon(),
        color: pickAnyColor(),
      );
      options.add(card);
    }

    return options;
  }

  void onSelectCard(DnmsCard card) {
    if (state.isGameOver || state.phase != DnmsPhase.choice) return;

    final isCorrect = card.icon != state.sampleCard!.icon || card.color != state.sampleCard!.color;

    int newDifficulty = state.currentDifficulty;
    if (isCorrect) {
      if (state.currentDifficulty < 4) {
        newDifficulty = state.currentDifficulty + 1;
      }
    } else {
      if (state.currentDifficulty > 2) {
        newDifficulty = state.currentDifficulty - 1;
      }
    }

    state = state.copyWith(
      score: isCorrect ? state.score + 1 : state.score,
      lastRoundCorrect: isCorrect,
      currentDifficulty: newDifficulty,
    );

    _phaseTimer = Timer(const Duration(milliseconds: 800), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
