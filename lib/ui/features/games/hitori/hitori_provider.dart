import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'hitori_engine.dart';

part 'hitori_provider.g.dart';

class HitoriState {
  final IList<IList<int>> grid;
  final IList<IList<bool>> shaded;
  final bool isVictory;
  final bool isLoading;

  HitoriState({
    required this.grid,
    required this.shaded,
    this.isVictory = false,
    this.isLoading = true,
  });

  HitoriState copyWith({
    IList<IList<int>>? grid,
    IList<IList<bool>>? shaded,
    bool? isVictory,
    bool? isLoading,
  }) {
    return HitoriState(
      grid: grid ?? this.grid,
      shaded: shaded ?? this.shaded,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class HitoriNotifier extends _$HitoriNotifier {
  final _engine = HitoriEngine();

  @override
  HitoriState build() {
    return HitoriState(
      grid: <IList<int>>[].lock,
      shaded: <IList<bool>>[].lock,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final grid = level['grid'] as List<List<int>>;
    final size = grid.length;
    
    state = HitoriState(
      grid: grid.map((r) => r.lock).toIList(),
      shaded: List.generate(size, (_) => List.filled(size, false).lock).toIList(),
      isLoading: false,
    );
  }

  void toggleShade(int r, int c) {
    if (state.isVictory) return;

    final shaded = state.shaded.map((row) => row.toList()).toList();
    shaded[r][c] = !shaded[r][c];
    
    state = state.copyWith(shaded: shaded.map((row) => row.lock).toIList());
    _checkVictory();
  }

  Future<void> _checkVictory() async {
    final grid = state.grid.map((r) => r.toList()).toList();
    final shaded = state.shaded.map((r) => r.toList()).toList();

    final isVictory = await compute(HitoriEngine.checkVictoryWrapper, {'grid': grid, 'shaded': shaded});

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
