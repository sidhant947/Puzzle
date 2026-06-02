import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'akari_engine.dart';

part 'akari_provider.g.dart';

class AkariState {
  final IList<IList<int>> grid; // -2: white, -1: wall, 0-4: numbered wall
  final IList<IList<bool>> bulbs;
  final IList<IList<bool>> lit;
  final bool isVictory;
  final bool isLoading;

  AkariState({
    required this.grid,
    required this.bulbs,
    required this.lit,
    this.isVictory = false,
    this.isLoading = true,
  });

  AkariState copyWith({
    IList<IList<int>>? grid,
    IList<IList<bool>>? bulbs,
    IList<IList<bool>>? lit,
    bool? isVictory,
    bool? isLoading,
  }) {
    return AkariState(
      grid: grid ?? this.grid,
      bulbs: bulbs ?? this.bulbs,
      lit: lit ?? this.lit,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class AkariNotifier extends _$AkariNotifier {
  final _engine = AkariEngine();

  @override
  AkariState build() {
    return AkariState(
      grid: <IList<int>>[].lock,
      bulbs: <IList<bool>>[].lock,
      lit: <IList<bool>>[].lock,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final grid = level['grid'] as List<List<int>>;
    final size = grid.length;
    
    final immutableGrid = grid.map((r) => r.lock).toIList();
    final immutableBulbs = List.generate(size, (_) => List.filled(size, false).lock).toIList();
    
    state = AkariState(
      grid: immutableGrid,
      bulbs: immutableBulbs,
      lit: List.generate(size, (_) => List.filled(size, false).lock).toIList(),
      isLoading: false,
    );
    _updateLit();
  }

  void toggleBulb(int r, int c) {
    if (state.isVictory || state.grid[r][c] != -2) return;

    final bulbs = state.bulbs.map((row) => row.toList()).toList();
    bulbs[r][c] = !bulbs[r][c];
    
    state = state.copyWith(bulbs: bulbs.map((row) => row.lock).toIList());
    _updateLit();
  }

  Future<void> _updateLit() async {
    final grid = state.grid.map((r) => r.toList()).toList();
    final bulbs = state.bulbs.map((r) => r.toList()).toList();

    final newLit = await compute(AkariEngine.calculateLitWrapper, {'grid': grid, 'bulbs': bulbs});

    state = state.copyWith(lit: newLit.map((r) => r.lock).toIList());
    _checkVictory();
  }

  Future<void> _checkVictory() async {
    final grid = state.grid.map((r) => r.toList()).toList();
    final bulbs = state.bulbs.map((r) => r.toList()).toList();
    final lit = state.lit.map((r) => r.toList()).toList();

    final isVictory = await compute(AkariEngine.checkVictoryWrapper, {'grid': grid, 'bulbs': bulbs, 'lit': lit});

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
