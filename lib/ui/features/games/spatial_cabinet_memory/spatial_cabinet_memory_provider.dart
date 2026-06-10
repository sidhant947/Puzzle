import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utils/design_system.dart';

part 'spatial_cabinet_memory_provider.g.dart';

enum CabinetPhase { showingCabinet, prompting, result }

class CabinetItem {
  final IconData icon;
  final Color color;
  final String name;

  CabinetItem({required this.icon, required this.color, required this.name});
}

class SpatialCabinetMemoryState {
  final CabinetPhase phase;
  final Map<int, CabinetItem> cabinetContents; // cellIndex (0..8) -> CabinetItem
  final int currentlyOpenDrawer; // cellIndex of drawer currently open (showing item), -1 for none
  final int? targetDrawerIndex; // index of the drawer holding the target item
  final CabinetItem? targetItem;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;
  final int itemsToMemorize; // difficulty level: 3 to 6 items

  SpatialCabinetMemoryState({
    this.phase = CabinetPhase.showingCabinet,
    this.cabinetContents = const {},
    this.currentlyOpenDrawer = -1,
    this.targetDrawerIndex,
    this.targetItem,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
    this.itemsToMemorize = 3,
  });

  SpatialCabinetMemoryState copyWith({
    CabinetPhase? phase,
    Map<int, CabinetItem>? cabinetContents,
    int? currentlyOpenDrawer,
    int? targetDrawerIndex,
    CabinetItem? targetItem,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
    bool resetTargets = false,
    bool resetLastRoundCorrect = false,
    int? itemsToMemorize,
  }) {
    return SpatialCabinetMemoryState(
      phase: phase ?? this.phase,
      cabinetContents: cabinetContents ?? this.cabinetContents,
      currentlyOpenDrawer: currentlyOpenDrawer ?? this.currentlyOpenDrawer,
      targetDrawerIndex: resetTargets ? null : (targetDrawerIndex ?? this.targetDrawerIndex),
      targetItem: resetTargets ? null : (targetItem ?? this.targetItem),
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: resetLastRoundCorrect ? null : (lastRoundCorrect ?? this.lastRoundCorrect),
      itemsToMemorize: itemsToMemorize ?? this.itemsToMemorize,
    );
  }
}

@riverpod
class SpatialCabinetMemoryNotifier extends _$SpatialCabinetMemoryNotifier {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _displayTimer;

  static final List<CabinetItem> _availableItems = [
    CabinetItem(icon: Icons.key_rounded, color: DesignSystem.accentAmber, name: "KEY"),
    CabinetItem(icon: Icons.apple_rounded, color: DesignSystem.error, name: "APPLE"),
    CabinetItem(icon: Icons.diamond_rounded, color: DesignSystem.gameBlue, name: "DIAMOND"),
    CabinetItem(icon: Icons.menu_book_rounded, color: DesignSystem.gameIndigo, name: "BOOK"),
    CabinetItem(icon: Icons.umbrella_rounded, color: DesignSystem.accentBerry, name: "UMBRELLA"),
    CabinetItem(icon: Icons.coffee_rounded, color: DesignSystem.gameOrange, name: "COFFEE"),
    CabinetItem(icon: Icons.lock_rounded, color: DesignSystem.gamePurple, name: "LOCK"),
    CabinetItem(icon: Icons.pets_rounded, color: DesignSystem.success, name: "PET"),
    CabinetItem(icon: Icons.directions_car_rounded, color: DesignSystem.gameGreen, name: "CAR"),
  ];

  @override
  SpatialCabinetMemoryState build() {
    return SpatialCabinetMemoryState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _displayTimer?.cancel();

    state = SpatialCabinetMemoryState(
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
    _displayTimer?.cancel();

    // Pick unique items
    final itemPool = List<CabinetItem>.from(_availableItems)..shuffle(_random);
    
    // Choose random grid cells (0..8 for 3x3 layout)
    final gridCells = List<int>.generate(9, (i) => i)..shuffle(_random);
    final chosenCells = gridCells.sublist(0, state.itemsToMemorize);

    Map<int, CabinetItem> contents = {};
    for (int i = 0; i < state.itemsToMemorize; i++) {
      contents[chosenCells[i]] = itemPool[i];
    }

    state = state.copyWith(
      phase: CabinetPhase.showingCabinet,
      cabinetContents: contents,
      currentlyOpenDrawer: -1,
      resetTargets: true,
      resetLastRoundCorrect: true,
    );

    // Sequentially open doors
    _openDoorSequentially(chosenCells, 0);
  }

  void _openDoorSequentially(List<int> cells, int index) {
    if (index < cells.length) {
      state = state.copyWith(currentlyOpenDrawer: cells[index]);
      
      _displayTimer = Timer(const Duration(milliseconds: 1400), () {
        state = state.copyWith(currentlyOpenDrawer: -1);
        _displayTimer = Timer(const Duration(milliseconds: 300), () {
          _openDoorSequentially(cells, index + 1);
        });
      });
    } else {
      // Pick one of the cabinet items as prompt target
      final targetIndexList = state.cabinetContents.keys.toList();
      final targetCell = targetIndexList[_random.nextInt(targetIndexList.length)];
      final targetItem = state.cabinetContents[targetCell];

      state = state.copyWith(
        phase: CabinetPhase.prompting,
        targetDrawerIndex: targetCell,
        targetItem: targetItem,
        currentlyOpenDrawer: -1,
      );
    }
  }

  void onTapDrawer(int index) {
    if (state.isGameOver || state.phase != CabinetPhase.prompting) return;

    final isCorrect = index == state.targetDrawerIndex;

    int nextItems = state.itemsToMemorize;
    if (isCorrect) {
      if (state.itemsToMemorize < 6) {
        nextItems = state.itemsToMemorize + 1;
      }
    } else {
      if (state.itemsToMemorize > 3) {
        nextItems = state.itemsToMemorize - 1;
      }
    }

    state = state.copyWith(
      phase: CabinetPhase.result,
      score: isCorrect ? state.score + 1 : state.score,
      lastRoundCorrect: isCorrect,
      itemsToMemorize: nextItems,
      currentlyOpenDrawer: index, // Show what was in this door
    );

    _displayTimer = Timer(const Duration(milliseconds: 1500), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _displayTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
