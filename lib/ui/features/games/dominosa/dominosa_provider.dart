import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'dominosa_engine.dart';

part 'dominosa_provider.g.dart';

class DominosaState {
  final IList<IList<int>> grid;
  final IList<IList<IList<int>>> selections;
  final int maxVal;
  final bool isVictory;
  final bool isLoading;
  final IList<int>? firstSelected; // [r, c]

  DominosaState({
    required this.grid,
    required this.selections,
    required this.maxVal,
    this.isVictory = false,
    this.isLoading = true,
    this.firstSelected,
  });

  DominosaState copyWith({
    IList<IList<int>>? grid,
    IList<IList<IList<int>>>? selections,
    int? maxVal,
    bool? isVictory,
    bool? isLoading,
    IList<int>? firstSelected,
    bool clearSelected = false,
  }) {
    return DominosaState(
      grid: grid ?? this.grid,
      selections: selections ?? this.selections,
      maxVal: maxVal ?? this.maxVal,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      firstSelected: clearSelected ? null : (firstSelected ?? this.firstSelected),
    );
  }
}

@riverpod
class DominosaNotifier extends _$DominosaNotifier {
  final _engine = DominosaEngine();

  @override
  DominosaState build() {
    return DominosaState(
      grid: <IList<int>>[].lock,
      selections: <IList<IList<int>>>[].lock,
      maxVal: 0,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    final grid = level['grid'] as List<List<int>>;
    
    state = DominosaState(
      grid: grid.map((r) => r.lock).toIList(),
      selections: <IList<IList<int>>>[].lock,
      maxVal: level['maxVal'] as int,
      isLoading: false,
    );
  }

  void selectCell(int r, int c) {
    if (state.isVictory) return;

    if (state.firstSelected == null) {
      // Check if already in a selection
      if (_isInSelection(r, c)) {
        _removeSelection(r, c);
        return;
      }
      state = state.copyWith(firstSelected: [r, c].lock);
    } else {
      int r1 = state.firstSelected![0];
      int c1 = state.firstSelected![1];
      
      if (r1 == r && c1 == c) {
        state = state.copyWith(clearSelected: true);
        return;
      }

      // Check adjacency
      if ((r1 == r && (c1 - c).abs() == 1) || (c1 == c && (r1 - r).abs() == 1)) {
        // Valid pair
        if (!_isInSelection(r, c)) {
           final newSel = [[r1, c1].lock, [r, c].lock].lock;
           state = state.copyWith(
             selections: state.selections.add(newSel),
             clearSelected: true,
           );
           _checkVictory();
        } else {
          state = state.copyWith(clearSelected: true);
        }
      } else {
        // Too far, change selection
        state = state.copyWith(firstSelected: [r, c].lock);
      }
    }
  }

  bool _isInSelection(int r, int c) {
    for (var sel in state.selections) {
      if ((sel[0][0] == r && sel[0][1] == c) || (sel[1][0] == r && sel[1][1] == c)) return true;
    }
    return false;
  }

  void _removeSelection(int r, int c) {
    final newSelections = state.selections.where((sel) => 
      !((sel[0][0] == r && sel[0][1] == c) || (sel[1][0] == r && sel[1][1] == c))
    ).toIList();
    state = state.copyWith(selections: newSelections);
  }

  Future<void> _checkVictory() async {
    final grid = state.grid.map((r) => r.toList()).toList();
    final selections = state.selections.map((s) => s.map((p) => p.toList()).toList()).toList();

    final isVictory = await compute(DominosaEngine.checkVictoryWrapper, {
      'grid': grid,
      'selections': selections,
      'maxVal': state.maxVal,
    });

    if (isVictory) {
      state = state.copyWith(isVictory: true);
    }
  }
}
