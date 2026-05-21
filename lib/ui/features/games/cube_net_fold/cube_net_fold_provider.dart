import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'cube_net_fold_engine.dart';
import '../../../../providers/user_providers.dart';

part 'cube_net_fold_provider.g.dart';

class CubeNetFoldState {
  final List<Color> netColors;
  final List<CubeOption> options;
  final int correctOptionIndex;
  final int? selectedIndex;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  CubeNetFoldState({
    required this.netColors,
    required this.options,
    required this.correctOptionIndex,
    this.selectedIndex,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  CubeNetFoldState copyWith({
    List<Color>? netColors,
    List<CubeOption>? options,
    int? correctOptionIndex,
    int? selectedIndex,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return CubeNetFoldState(
      netColors: netColors ?? this.netColors,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isVictory: isVictory ?? this.isVictory,
      isFailed: isFailed ?? this.isFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CubeNetFoldNotifier extends _$CubeNetFoldNotifier {
  final _engine = CubeNetFoldEngine();

  @override
  CubeNetFoldState build() {
    return CubeNetFoldState(
      netColors: [],
      options: [],
      correctOptionIndex: -1,
      isLoading: true,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = CubeNetFoldState(
      netColors: level.netColors,
      options: level.options,
      correctOptionIndex: level.correctOptionIndex,
      selectedIndex: null,
      isVictory: false,
      isFailed: false,
      isLoading: false,
    );
  }

  void selectOption(int index) {
    if (state.isVictory || state.isFailed) return;
    
    state = state.copyWith(selectedIndex: index);
  }

  bool checkAnswer() {
    if (state.isVictory || state.isFailed || state.selectedIndex == null) return false;
    
    if (state.selectedIndex == state.correctOptionIndex) {
      state = state.copyWith(isVictory: true);
      ref.read(gameStreakNotifierProvider.notifier).completeGame('cube_net_fold', xpAmount: 25);
      return true;
    } else {
      state = state.copyWith(isFailed: true);
      return false;
    }
  }

  void reset() {
    initGame();
  }
}
