import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'skyscrapers_engine.dart';

part 'skyscrapers_provider.g.dart';

class SkyscrapersState {
  final IList<IList<int>> grid;
  final IList<int> top;
  final IList<int> bottom;
  final IList<int> left;
  final IList<int> right;
  final bool isVictory;
  final bool isLoading;

  SkyscrapersState({
    required this.grid,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    this.isVictory = false,
    this.isLoading = true,
  });

  SkyscrapersState copyWith({
    IList<IList<int>>? grid,
    IList<int>? top,
    IList<int>? bottom,
    IList<int>? left,
    IList<int>? right,
    bool? isVictory,
    bool? isLoading,
  }) {
    return SkyscrapersState(
      grid: grid ?? this.grid,
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SkyscrapersNotifier extends _$SkyscrapersNotifier {
  final _engine = SkyscrapersEngine();

  @override
  SkyscrapersState build() {
    return SkyscrapersState(
      grid: <IList<int>>[].lock,
      top: <int>[].lock,
      bottom: <int>[].lock,
      left: <int>[].lock,
      right: <int>[].lock,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final size = (level['top'] as List<int>).length;
    
    state = SkyscrapersState(
      grid: List.generate(size, (_) => List.filled(size, 0).lock).toIList(),
      top: (level['top'] as List<int>).lock,
      bottom: (level['bottom'] as List<int>).lock,
      left: (level['left'] as List<int>).lock,
      right: (level['right'] as List<int>).lock,
      isLoading: false,
    );
  }

  void updateCell(int r, int c, int value) {
    if (state.isVictory) return;

    final grid = state.grid.map((row) => row.toList()).toList();
    grid[r][c] = value;
    
    state = state.copyWith(grid: grid.map((row) => row.lock).toIList());
    _checkVictory();
  }

  Future<void> _checkVictory() async {
    final grid = state.grid.map((r) => r.toList()).toList();
    final top = state.top.toList();
    final bottom = state.bottom.toList();
    final left = state.left.toList();
    final right = state.right.toList();

    final isVictory = await compute(SkyscrapersEngine.checkVictoryWrapper, {
      'grid': grid,
      'top': top,
      'bottom': bottom,
      'left': left,
      'right': right,
    });

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
