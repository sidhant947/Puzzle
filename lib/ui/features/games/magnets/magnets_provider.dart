import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'magnets_engine.dart';

part 'magnets_provider.g.dart';

class MagnetsState {
  final IList<IList<IList<int>>> dominoes;
  final IList<int> states; // 0: blank, 1: +-, 2: -+
  final IList<int> rowPos;
  final IList<int> rowNeg;
  final IList<int> colPos;
  final IList<int> colNeg;
  final bool isVictory;
  final bool isLoading;

  MagnetsState({
    required this.dominoes,
    required this.states,
    required this.rowPos,
    required this.rowNeg,
    required this.colPos,
    required this.colNeg,
    this.isVictory = false,
    this.isLoading = true,
  });

  MagnetsState copyWith({
    IList<IList<IList<int>>>? dominoes,
    IList<int>? states,
    IList<int>? rowPos,
    IList<int>? rowNeg,
    IList<int>? colPos,
    IList<int>? colNeg,
    bool? isVictory,
    bool? isLoading,
  }) {
    return MagnetsState(
      dominoes: dominoes ?? this.dominoes,
      states: states ?? this.states,
      rowPos: rowPos ?? this.rowPos,
      rowNeg: rowNeg ?? this.rowNeg,
      colPos: colPos ?? this.colPos,
      colNeg: colNeg ?? this.colNeg,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class MagnetsNotifier extends _$MagnetsNotifier {
  final _engine = MagnetsEngine();

  @override
  MagnetsState build() {
    return MagnetsState(
      dominoes: <IList<IList<int>>>[].lock,
      states: <int>[].lock,
      rowPos: <int>[].lock,
      rowNeg: <int>[].lock,
      colPos: <int>[].lock,
      colNeg: <int>[].lock,
    );
  }

  void initGame() {
    final level = _engine.generateLevel(rows: 4, cols: 4);
    final doms = level['dominoes'] as List<List<List<int>>>;
    
    state = MagnetsState(
      dominoes: doms.map((d) => d.map((p) => p.lock).toIList()).toIList(),
      states: List.filled(doms.length, 0).lock,
      rowPos: (level['rowPos'] as List<int>).lock,
      rowNeg: (level['rowNeg'] as List<int>).lock,
      colPos: (level['colPos'] as List<int>).lock,
      colNeg: (level['colNeg'] as List<int>).lock,
      isLoading: false,
    );
  }

  void toggleDomino(int idx) {
    if (state.isVictory) return;

    final states = state.states.toList();
    states[idx] = (states[idx] + 1) % 3;
    
    state = state.copyWith(states: states.lock);
    _checkVictory();
  }

  Future<void> _checkVictory() async {
    final doms = state.dominoes.map((d) => d.map((p) => p.toList()).toList()).toList();
    final states = state.states.toList();
    final rowPos = state.rowPos.toList();
    final rowNeg = state.rowNeg.toList();
    final colPos = state.colPos.toList();
    final colNeg = state.colNeg.toList();

    final isVictory = await compute(MagnetsEngine.checkVictoryWrapper, {
      'dominoes': doms,
      'states': states,
      'rowPos': rowPos,
      'rowNeg': rowNeg,
      'colPos': colPos,
      'colNeg': colNeg,
    });

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
