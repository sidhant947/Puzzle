import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'odd_rotation_engine.dart';

part 'odd_rotation_provider.g.dart';

class OddRotationState {
  final IconData shape;
  final List<RotationOption> options;
  final int targetIndex;
  final int? selectedIndex;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  OddRotationState({
    required this.shape,
    required this.options,
    required this.targetIndex,
    this.selectedIndex,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  OddRotationState copyWith({
    IconData? shape,
    List<RotationOption>? options,
    int? targetIndex,
    int? selectedIndex,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return OddRotationState(
      shape: shape ?? this.shape,
      options: options ?? this.options,
      targetIndex: targetIndex ?? this.targetIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class OddRotationNotifier extends _$OddRotationNotifier {
  final _engine = OddRotationEngine();

  @override
  OddRotationState build() {
    return OddRotationState(shape: Icons.abc, options: [], targetIndex: 0);
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    state = OddRotationState(
      shape: puzzle['shape'],
      options: puzzle['options'],
      targetIndex: puzzle['targetIndex'],
      isLoading: false,
    );
  }

  void selectOption(int index) {
    if (state.isGameOver) return;
    
    final won = index == state.targetIndex;
    state = state.copyWith(
      selectedIndex: index,
      isGameOver: true,
      isGameWon: won,
    );
  }
}
