import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utils/design_system.dart';

part 'continuous_recognition_provider.g.dart';

class RecognitionCard {
  final int id;
  final IconData icon;
  final Color color;

  RecognitionCard({required this.id, required this.icon, required this.color});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecognitionCard &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class ContinuousRecognitionState {
  final RecognitionCard? currentCard;
  final List<RecognitionCard> seenCards;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastAnswerCorrect;

  ContinuousRecognitionState({
    this.currentCard,
    this.seenCards = const [],
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastAnswerCorrect,
  });

  ContinuousRecognitionState copyWith({
    RecognitionCard? currentCard,
    List<RecognitionCard>? seenCards,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastAnswerCorrect,
  }) {
    return ContinuousRecognitionState(
      currentCard: currentCard ?? this.currentCard,
      seenCards: seenCards ?? this.seenCards,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastAnswerCorrect: lastAnswerCorrect ?? this.lastAnswerCorrect,
    );
  }
}

@riverpod
class ContinuousRecognitionNotifier extends _$ContinuousRecognitionNotifier {
  final Random _random = Random();
  Timer? _gameTimer;

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
    Icons.wb_cloudy_rounded,
    Icons.key_rounded,
    Icons.lock_rounded,
    Icons.music_note_rounded,
    Icons.emoji_events_rounded,
    Icons.bolt_rounded,
    Icons.diamond_rounded,
    Icons.local_florist_rounded,
    Icons.local_fire_department_rounded,
    Icons.water_drop_rounded,
    Icons.compass_calibration_rounded,
    Icons.palette_rounded,
    Icons.brush_rounded,
    Icons.camera_alt_rounded,
    Icons.headphones_rounded,
    Icons.watch_rounded,
    Icons.chair_rounded,
    Icons.coffee_rounded,
    Icons.brunch_dining_rounded,
    Icons.flight_rounded,
    Icons.sailing_rounded,
    Icons.hiking_rounded,
    Icons.bike_scooter_rounded,
    Icons.sports_esports_rounded,
    Icons.school_rounded,
    Icons.science_rounded,
    Icons.build_rounded,
    Icons.healing_rounded,
    Icons.nature_rounded,
    Icons.eco_rounded,
    Icons.energy_savings_leaf_rounded,
    Icons.park_rounded,
    Icons.pool_rounded,
    Icons.wind_power_rounded,
    Icons.ac_unit_rounded,
    Icons.water_rounded,
    Icons.waves_rounded,
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
    DesignSystem.gameRose,
    DesignSystem.gameViolet,
    DesignSystem.gameCyan,
    DesignSystem.gameEmerald,
  ];

  final List<RecognitionCard> _cardPool = [];

  @override
  ContinuousRecognitionState build() {
    return ContinuousRecognitionState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _cardPool.clear();
    int idCounter = 0;
    for (final icon in _icons) {
      for (final color in _colors) {
        _cardPool.add(RecognitionCard(id: idCounter++, icon: icon, color: color));
      }
    }

    state = ContinuousRecognitionState(
      seenCards: [],
      isLoading: false,
    );
    _nextCard();
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

  void _nextCard() {
    if (_cardPool.isEmpty) {
      _endGame();
      return;
    }

    final previousIcon = state.currentCard?.icon;
    RecognitionCard card;

    if (state.seenCards.isNotEmpty && _random.nextBool()) {
      final eligible = state.seenCards.where((c) => c.icon != previousIcon).toList();
      if (eligible.isNotEmpty) {
        card = eligible[_random.nextInt(eligible.length)];
      } else {
        card = state.seenCards[_random.nextInt(state.seenCards.length)];
      }
    } else {
      final unseenPool = _cardPool.where((c) =>
          !state.seenCards.contains(c) && c.icon != previousIcon).toList();
      if (unseenPool.isEmpty) {
        final anyUnseen = _cardPool.where((c) => !state.seenCards.contains(c)).toList();
        if (anyUnseen.isEmpty) {
          _endGame();
          return;
        }
        card = anyUnseen[_random.nextInt(anyUnseen.length)];
      } else {
        card = unseenPool[_random.nextInt(unseenPool.length)];
      }
    }

    state = ContinuousRecognitionState(
      currentCard: card,
      seenCards: state.seenCards,
      score: state.score,
      timeLeft: state.timeLeft,
      isGameOver: false,
      isLoading: false,
      lastAnswerCorrect: null,
    );
  }

  void answer(bool claimedOld) {
    if (state.isGameOver || state.currentCard == null) return;

    final actualOld = state.seenCards.contains(state.currentCard!);
    final isCorrect = (claimedOld == actualOld);

    List<RecognitionCard> newSeen = [...state.seenCards];
    if (!actualOld) {
      newSeen.add(state.currentCard!);
    }

    state = state.copyWith(
      score: isCorrect ? state.score + 1 : state.score,
      seenCards: newSeen,
      lastAnswerCorrect: isCorrect,
    );

    Timer(const Duration(milliseconds: 600), _nextCard);
  }

  void _endGame() {
    _gameTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
