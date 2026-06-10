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

    state = state.copyWith(
      phase: DnmsPhase.memorize,
      sampleCard: sample,
      options: [],
      lastRoundCorrect: null,
    );

    // After 2 seconds, transition to delay
    _phaseTimer = Timer(const Duration(seconds: 2), () {
      state = state.copyWith(phase: DnmsPhase.delay);
      
      // Delay phase for 1.5 seconds, then choice phase
      _phaseTimer = Timer(const Duration(milliseconds: 1500), () {
        // Generate options (1 is sample, rest are novel)
        List<DnmsCard> options = [sample];
        
        while (options.length < state.currentDifficulty) {
          final candidate = DnmsCard(
            id: options.length,
            icon: _icons[_random.nextInt(_icons.length)],
            color: _colors[_random.nextInt(_colors.length)],
          );
          
          // Ensure it's not identical to the sample or existing options in look
          final exists = options.any((o) => o.icon == candidate.icon && o.color == candidate.color);
          if (!exists) {
            options.add(candidate);
          }
        }

        options.shuffle(_random);

        state = state.copyWith(
          phase: DnmsPhase.choice,
          options: options,
        );
      });
    });
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
