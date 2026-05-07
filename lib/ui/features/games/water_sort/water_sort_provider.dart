import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'water_sort_engine.dart';
import '../../../../providers/user_providers.dart';

part 'water_sort_provider.g.dart';

class WaterSortState {
  final List<List<Color>> tubes;
  final int? selectedTubeIndex;
  final bool isSolved;

  WaterSortState({
    required this.tubes,
    this.selectedTubeIndex,
    this.isSolved = false,
  });

  WaterSortState copyWith({
    List<List<Color>>? tubes,
    int? selectedTubeIndex,
    bool? isSolved,
    bool clearSelection = false,
  }) {
    return WaterSortState(
      tubes: tubes ?? this.tubes,
      selectedTubeIndex: clearSelection ? null : (selectedTubeIndex ?? this.selectedTubeIndex),
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class WaterSortNotifier extends _$WaterSortNotifier {
  final WaterSortEngine _engine = WaterSortEngine();

  @override
  WaterSortState build() {
    return WaterSortState(tubes: _engine.generateLevel());
  }

  void selectTube(int index) {
    if (state.isSolved) return;

    if (state.selectedTubeIndex == null) {
      if (state.tubes[index].isNotEmpty) {
        state = state.copyWith(selectedTubeIndex: index);
      }
    } else if (state.selectedTubeIndex == index) {
      state = state.copyWith(clearSelection: true);
    } else {
      final fromIndex = state.selectedTubeIndex!;
      final toIndex = index;
      
      final tubes = [for (var t in state.tubes) [...t]];
      if (_engine.canPour(tubes[fromIndex], tubes[toIndex])) {
        _engine.pour(tubes[fromIndex], tubes[toIndex]);
        final isSolved = _engine.isSolved(tubes);
        
        state = state.copyWith(
          tubes: tubes,
          clearSelection: true,
          isSolved: isSolved,
        );

        if (isSolved) {
          ref.read(gameStreakNotifierProvider.notifier).completeGame('water_sort', xpAmount: 30);
        }
      } else {
        state = state.copyWith(clearSelection: true);
      }
    }
  }

  void reset() {
    state = WaterSortState(tubes: _engine.generateLevel());
  }
}
