import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'lighthouses_engine.dart';

part 'lighthouses_provider.g.dart';

class LighthousesState {
  final IList<IList<int?>> clues;
  final IList<IList<bool>> ships;
  final bool isVictory;
  final bool isLoading;

  LighthousesState({
    required this.clues,
    required this.ships,
    this.isVictory = false,
    this.isLoading = true,
  });

  LighthousesState copyWith({
    IList<IList<int?>>? clues,
    IList<IList<bool>>? ships,
    bool? isVictory,
    bool? isLoading,
  }) {
    return LighthousesState(
      clues: clues ?? this.clues,
      ships: ships ?? this.ships,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class LighthousesNotifier extends _$LighthousesNotifier {
  final _engine = LighthousesEngine();

  @override
  LighthousesState build() {
    return LighthousesState(
      clues: <IList<int?>>[].lock,
      ships: <IList<bool>>[].lock,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final clues = level['clues'] as List<List<int?>>;
    final size = clues.length;
    
    state = LighthousesState(
      clues: clues.map((r) => r.lock).toIList(),
      ships: List.generate(size, (_) => List.filled(size, false).lock).toIList(),
      isLoading: false,
    );
  }

  void toggleShip(int r, int c) {
    if (state.isVictory || state.clues[r][c] != null) return;

    final ships = state.ships.map((row) => row.toList()).toList();
    ships[r][c] = !ships[r][c];
    
    state = state.copyWith(ships: ships.map((row) => row.lock).toIList());
    _checkVictory();
  }

  Future<void> _checkVictory() async {
    final clues = state.clues.map((r) => r.toList()).toList();
    final ships = state.ships.map((r) => r.toList()).toList();

    final isVictory = await compute(LighthousesEngine.checkVictoryWrapper, {
      'clues': clues,
      'ships': ships,
    });

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
