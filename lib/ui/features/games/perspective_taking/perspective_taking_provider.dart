import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'perspective_taking_engine.dart';

part 'perspective_taking_provider.g.dart';

class PerspectiveTakingState {
  final List<Cube> cubes;
  final List<List<Color?>> topView;
  final List<List<List<Color?>>> options;
  final ViewDirection targetDirection;
  final int correctOptionIndex;
  final bool isVictory;
  final bool isLoading;
  final int? selectedOptionIndex;

  PerspectiveTakingState({
    required this.cubes,
    required this.topView,
    required this.options,
    required this.targetDirection,
    required this.correctOptionIndex,
    this.isVictory = false,
    this.isLoading = true,
    this.selectedOptionIndex,
  });

  PerspectiveTakingState copyWith({
    List<Cube>? cubes,
    List<List<Color?>>? topView,
    List<List<List<Color?>>>? options,
    ViewDirection? targetDirection,
    int? correctOptionIndex,
    bool? isVictory,
    bool? isLoading,
    int? selectedOptionIndex,
  }) {
    return PerspectiveTakingState(
      cubes: cubes ?? this.cubes,
      topView: topView ?? this.topView,
      options: options ?? this.options,
      targetDirection: targetDirection ?? this.targetDirection,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }
}

@riverpod
class PerspectiveTakingNotifier extends _$PerspectiveTakingNotifier {
  final _engine = PerspectiveTakingEngine();

  @override
  PerspectiveTakingState build() {
    return PerspectiveTakingState(
      cubes: [],
      topView: [],
      options: [],
      targetDirection: ViewDirection.south,
      correctOptionIndex: 0,
    );
  }

  void initGame() {
    final cubes = _engine.generateLevel();
    final topView = _engine.getView(cubes, ViewDirection.top);
    
    final directions = [ViewDirection.north, ViewDirection.south, ViewDirection.east, ViewDirection.west];
    final targetDirection = directions[DateTime.now().millisecondsSinceEpoch % directions.length];
    
    // Generate 3 incorrect views
    // We can generate incorrect views by using other directions or slightly modified arrangements
    // To keep it simple but challenging, let's use the other 3 side directions.
    final List<List<List<Color?>>> options = [];
    for (final dir in directions) {
      options.add(_engine.getView(cubes, dir));
    }
    
    // Find the correct option index
    int correctIndex = directions.indexOf(targetDirection);
    
    // Shuffle options
    final List<int> indices = [0, 1, 2, 3];
    indices.shuffle();
    
    final shuffledOptions = indices.map((i) => options[i]).toList();
    final finalCorrectIndex = indices.indexOf(correctIndex);

    state = PerspectiveTakingState(
      cubes: cubes,
      topView: topView,
      options: shuffledOptions,
      targetDirection: targetDirection,
      correctOptionIndex: finalCorrectIndex,
      isLoading: false,
    );
  }

  void selectOption(int index) {
    if (state.isVictory) return;
    
    state = state.copyWith(selectedOptionIndex: index);
    
    if (index == state.correctOptionIndex) {
      state = state.copyWith(isVictory: true);
    }
  }
}
