import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utils/design_system.dart';

part 'object_displacement_provider.g.dart';

enum DisplacementPhase { memorize, delay, choice, result }

class DisplacementItem {
  final int id;
  final IconData icon;
  final Color color;
  final Offset position; // coordinates (0 to 1)

  DisplacementItem({
    required this.id,
    required this.icon,
    required this.color,
    required this.position,
  });

  DisplacementItem copyWith({
    Offset? position,
  }) {
    return DisplacementItem(
      id: id,
      icon: icon,
      color: color,
      position: position ?? this.position,
    );
  }
}

class ObjectDisplacementState {
  final DisplacementPhase phase;
  final List<DisplacementItem> items;
  final int movedItemId; // -1 for none
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;
  final int itemCount; // starts at 5, increases up to 10

  ObjectDisplacementState({
    this.phase = DisplacementPhase.memorize,
    this.items = const [],
    this.movedItemId = -1,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
    this.itemCount = 5,
  });

  ObjectDisplacementState copyWith({
    DisplacementPhase? phase,
    List<DisplacementItem>? items,
    int? movedItemId,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
    int? itemCount,
  }) {
    return ObjectDisplacementState(
      phase: phase ?? this.phase,
      items: items ?? this.items,
      movedItemId: movedItemId ?? this.movedItemId,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: lastRoundCorrect,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}

@riverpod
class ObjectDisplacementNotifier extends _$ObjectDisplacementNotifier {
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
    Icons.phone_android_rounded,
    Icons.headphones_rounded,
    Icons.coffee_rounded,
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
  ObjectDisplacementState build() {
    return ObjectDisplacementState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();

    state = ObjectDisplacementState(
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

    // Generate unique icons and colors
    final iconPool = List<IconData>.from(_icons)..shuffle(_random);
    final colorPool = List<Color>.from(_colors)..shuffle(_random);

    List<DisplacementItem> generatedItems = [];
    for (int i = 0; i < state.itemCount; i++) {
      final pos = _generateNonOverlappingPosition(generatedItems);
      generatedItems.add(DisplacementItem(
        id: i,
        icon: iconPool[i % iconPool.length],
        color: colorPool[i % colorPool.length],
        position: pos,
      ));
    }

    state = state.copyWith(
      phase: DisplacementPhase.memorize,
      items: generatedItems,
      movedItemId: -1,
      lastRoundCorrect: null,
    );

    // Memorize phase is 5 seconds
    _phaseTimer = Timer(const Duration(seconds: 5), () {
      state = state.copyWith(phase: DisplacementPhase.delay);

      // Delay phase is 1.5 seconds
      _phaseTimer = Timer(const Duration(milliseconds: 1500), () {
        // Pick one item to displace
        final targetIndex = _random.nextInt(state.items.length);
        final targetItem = state.items[targetIndex];

        // Generate a new position for the target item
        final otherItems = List<DisplacementItem>.from(state.items)..removeAt(targetIndex);
        final newPos = _generateNonOverlappingPosition(otherItems);

        // Update items list with displaced item
        final updatedItems = state.items.map((item) {
          if (item.id == targetItem.id) {
            return item.copyWith(position: newPos);
          }
          return item;
        }).toList();

        state = state.copyWith(
          phase: DisplacementPhase.choice,
          items: updatedItems,
          movedItemId: targetItem.id,
        );
      });
    });
  }

  Offset _generateNonOverlappingPosition(List<DisplacementItem> existing) {
    double x = 0;
    double y = 0;
    bool overlapping = true;
    int attempts = 0;

    while (overlapping && attempts < 100) {
      x = _random.nextDouble() * 0.75 + 0.12; // margin
      y = _random.nextDouble() * 0.75 + 0.12;
      overlapping = false;
      attempts++;

      for (final item in existing) {
        final dist = (x - item.position.dx) * (x - item.position.dx) +
            (y - item.position.dy) * (y - item.position.dy);
        if (dist < 0.015) { // min distance squared
          overlapping = true;
          break;
        }
      }
    }
    return Offset(x, y);
  }

  void onTapItem(int id) {
    if (state.isGameOver || state.phase != DisplacementPhase.choice) return;

    final isCorrect = id == state.movedItemId;

    int nextCount = state.itemCount;
    if (isCorrect) {
      if (state.itemCount < 10) {
        nextCount = state.itemCount + 1;
      }
    } else {
      if (state.itemCount > 5) {
        nextCount = state.itemCount - 1;
      }
    }

    state = state.copyWith(
      phase: DisplacementPhase.result,
      score: isCorrect ? state.score + 1 : state.score,
      lastRoundCorrect: isCorrect,
      itemCount: nextCount,
    );

    _phaseTimer = Timer(const Duration(milliseconds: 1500), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
