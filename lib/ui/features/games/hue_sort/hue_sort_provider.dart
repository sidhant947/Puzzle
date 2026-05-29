import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'hue_sort_engine.dart';

part 'hue_sort_provider.g.dart';

class HueSortState {
  final HueSortLevel level;
  final List<Color> currentColors;
  final int? selectedIndex;
  final bool isSolved;

  HueSortState({
    required this.level,
    required this.currentColors,
    this.selectedIndex,
    this.isSolved = false,
  });

  HueSortState copyWith({
    HueSortLevel? level,
    List<Color>? currentColors,
    int? selectedIndex,
    bool? isSolved,
    bool clearSelection = false,
  }) {
    return HueSortState(
      level: level ?? this.level,
      currentColors: currentColors ?? this.currentColors,
      selectedIndex: clearSelection ? null : (selectedIndex ?? this.selectedIndex),
      isSolved: isSolved ?? this.isSolved,
    );
  }

  int get wrongTilesCount {
    int count = 0;
    for (int i = 0; i < currentColors.length; i++) {
      if (currentColors[i].r != level.solution[i].r ||
          currentColors[i].g != level.solution[i].g ||
          currentColors[i].b != level.solution[i].b) {
        count++;
      }
    }
    return count;
  }
}

@riverpod
class HueSortNotifier extends _$HueSortNotifier {
  final _engine = HueSortEngine();

  @override
  HueSortState build() {
    final level = _engine.generateLevel();
    return HueSortState(
      level: level,
      currentColors: List.from(level.colors),
    );
  }

  void newGame() {
    final level = _engine.generateLevel();
    state = HueSortState(
      level: level,
      currentColors: List.from(level.colors),
      isSolved: false,
    );
  }

  void selectTile(int index) {
    if (state.isSolved) return;
    if (state.level.fixedIndices.contains(index)) return;

    if (state.selectedIndex == null) {
      state = state.copyWith(selectedIndex: index);
    } else if (state.selectedIndex == index) {
      state = state.copyWith(clearSelection: true);
    } else {
      // Swap tiles
      final newColors = List<Color>.from(state.currentColors);
      final temp = newColors[state.selectedIndex!];
      newColors[state.selectedIndex!] = newColors[index];
      newColors[index] = temp;

      bool solved = _checkSolved(newColors);
      state = state.copyWith(
        currentColors: newColors,
        isSolved: solved,
        clearSelection: true,
      );
    }
  }

  bool _checkSolved(List<Color> current) {
    for (int i = 0; i < current.length; i++) {
      if (current[i].r != state.level.solution[i].r ||
          current[i].g != state.level.solution[i].g ||
          current[i].b != state.level.solution[i].b) {
        return false;
      }
    }
    return true;
  }
}
