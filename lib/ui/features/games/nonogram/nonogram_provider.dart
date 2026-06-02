import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'nonogram_engine.dart';

part 'nonogram_provider.g.dart';

class NonogramState {
  final List<List<int>> grid;
  final List<List<int>> rowClues;
  final List<List<int>> colClues;
  final bool isSolved;
  final int size;

  NonogramState({
    required this.grid,
    required this.rowClues,
    required this.colClues,
    this.isSolved = false,
    this.size = 5,
  });

  NonogramState copyWith({
    List<List<int>>? grid,
    bool? isSolved,
  }) {
    return NonogramState(
      grid: grid ?? this.grid,
      rowClues: rowClues,
      colClues: colClues,
      isSolved: isSolved ?? this.isSolved,
      size: size,
    );
  }
}

@riverpod
class NonogramNotifier extends _$NonogramNotifier {
  final _engine = NonogramEngine();
  static const int defaultSize = 8; // Increased for more challenge

  @override
  Future<NonogramState> build() async {
    return _generateInitialState(defaultSize);
  }

  Future<NonogramState> _generateInitialState(int size) async {
    // Generate puzzle in background isolate
    final puzzle = await compute(NonogramEngine.generatePuzzleWrapper, size);
    
    return NonogramState(
      grid: List.generate(size, (_) => List.filled(size, 0)),
      rowClues: puzzle.rowClues,
      colClues: puzzle.colClues,
      size: size,
    );
  }

  Future<void> reset() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _generateInitialState(state.value?.size ?? defaultSize));
  }

  Future<void> toggleCell(int r, int c, bool isMarkMode) async {
    if (!state.hasValue || state.value!.isSolved) return;
    
    final currentState = state.value!;

    final newGrid = List.generate(
      currentState.size,
      (i) => List<int>.from(currentState.grid[i]),
    );

    final currentValue = newGrid[r][c];
    
    if (isMarkMode) {
      newGrid[r][c] = currentValue == 2 ? 0 : 2;
    } else {
      newGrid[r][c] = currentValue == 1 ? 0 : 1;
    }

    final solved = await compute(NonogramEngine.isCorrectWrapper, {
      'grid': newGrid,
      'rowClues': currentState.rowClues,
      'colClues': currentState.colClues,
    });
    
    state = AsyncValue.data(currentState.copyWith(grid: newGrid, isSolved: solved));

    if (solved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('nonogram', xpAmount: 25);
    }
  }
}
