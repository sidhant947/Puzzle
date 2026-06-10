import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utils/design_system.dart';

part 'sopt_provider.g.dart';

class SoptItem {
  final int id;
  final IconData icon;
  final Color color;

  SoptItem({required this.id, required this.icon, required this.color});
}

class SoptState {
  final List<SoptItem> items;
  final List<int> tappedIds;
  final int gridSize;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;

  SoptState({
    required this.items,
    this.tappedIds = const [],
    this.gridSize = 4,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
  });

  SoptState copyWith({
    List<SoptItem>? items,
    List<int>? tappedIds,
    int? gridSize,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
  }) {
    return SoptState(
      items: items ?? this.items,
      tappedIds: tappedIds ?? this.tappedIds,
      gridSize: gridSize ?? this.gridSize,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: lastRoundCorrect ?? this.lastRoundCorrect,
    );
  }
}

@riverpod
class SoptNotifier extends _$SoptNotifier {
  final Random _random = Random();
  Timer? _gameTimer;

  static const List<IconData> _availableIcons = [
    Icons.home_rounded,
    Icons.star_rounded,
    Icons.favorite_rounded,
    Icons.beach_access_rounded,
    Icons.face_rounded,
    Icons.lightbulb_rounded,
    Icons.palette_rounded,
    Icons.pets_rounded,
    Icons.rocket_launch_rounded,
    Icons.sunny,
    Icons.umbrella_rounded,
    Icons.directions_car_rounded,
    Icons.forest_rounded,
    Icons.local_pizza_rounded,
    Icons.cookie_rounded,
    Icons.cake_rounded,
  ];

  static const List<Color> _availableColors = [
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
  SoptState build() {
    return SoptState(items: []);
  }

  void initGame() {
    _gameTimer?.cancel();
    state = SoptState(
      items: [],
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
    final pool = List<IconData>.from(_availableIcons)..shuffle(_random);
    final colorPool = List<Color>.from(_availableColors)..shuffle(_random);
    
    List<SoptItem> newItems = [];
    for (int i = 0; i < state.gridSize; i++) {
      newItems.add(SoptItem(
        id: i,
        icon: pool[i % pool.length],
        color: colorPool[i % colorPool.length],
      ));
    }

    state = state.copyWith(
      items: newItems,
      tappedIds: [],
      lastRoundCorrect: null,
    );
  }

  void onTapItem(int id) {
    if (state.isGameOver) return;

    if (state.tappedIds.contains(id)) {
      state = state.copyWith(
        lastRoundCorrect: false,
        gridSize: state.gridSize > 4 ? state.gridSize - 2 : 4,
      );
      Timer(const Duration(milliseconds: 800), _startRound);
    } else {
      final newTapped = [...state.tappedIds, id];
      
      if (newTapped.length == state.items.length) {
        state = state.copyWith(
          score: state.score + state.gridSize,
          tappedIds: newTapped,
          lastRoundCorrect: true,
          gridSize: state.gridSize < 12 ? state.gridSize + 2 : 12,
        );
        Timer(const Duration(milliseconds: 800), _startRound);
      } else {
        final shuffledItems = List<SoptItem>.from(state.items)..shuffle(_random);
        state = state.copyWith(
          items: shuffledItems,
          tappedIds: newTapped,
        );
      }
    }
  }

  void _endGame() {
    _gameTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
