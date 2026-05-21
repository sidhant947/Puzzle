import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'futoshiki_engine.dart';
import '../../../../providers/user_providers.dart';

part 'futoshiki_provider.g.dart';

class FutoshikiState {
  final FutoshikiLevel level;
  final List<List<int?>> currentGrid;
  final int? selectedRow;
  final int? selectedCol;
  final bool isSolved;

  FutoshikiState({
    required this.level,
    required this.currentGrid,
    this.selectedRow,
    this.selectedCol,
    this.isSolved = false,
  });

  FutoshikiState copyWith({
    FutoshikiLevel? level,
    List<List<int?>>? currentGrid,
    int? selectedRow,
    int? selectedCol,
    bool? isSolved,
  }) {
    return FutoshikiState(
      level: level ?? this.level,
      currentGrid: currentGrid ?? this.currentGrid,
      selectedRow: selectedRow ?? this.selectedRow,
      selectedCol: selectedCol ?? this.selectedCol,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class FutoshikiNotifier extends _$FutoshikiNotifier {
  final _engine = FutoshikiEngine();

  @override
  FutoshikiState build() {
    final level = _engine.generateLevel(size: 4);
    return FutoshikiState(
      level: level,
      currentGrid: _copyClues(level.clues),
    );
  }

  List<List<int?>> _copyClues(List<List<int?>> clues) {
    return clues.map((row) => List<int?>.from(row)).toList();
  }

  void selectCell(int r, int c) {
    if (state.isSolved) return;
    state = state.copyWith(selectedRow: r, selectedCol: c);
  }

  void setCellValue(int? value) {
    if (state.isSolved) return;
    final r = state.selectedRow;
    final c = state.selectedCol;
    if (r == null || c == null) return;

    // Check if cell is a starting clue
    if (state.level.clues[r][c] != null) return;

    final newGrid = _copyClues(state.currentGrid);
    newGrid[r][c] = value;

    final solved = _checkSolved(newGrid);
    state = state.copyWith(currentGrid: newGrid, isSolved: solved);

    if (solved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('futoshiki', xpAmount: 25);
    }
  }

  void reset() {
    state = FutoshikiState(
      level: state.level,
      currentGrid: _copyClues(state.level.clues),
      selectedRow: null,
      selectedCol: null,
      isSolved: false,
    );
  }

  void newGame() {
    final level = _engine.generateLevel(size: 4);
    state = FutoshikiState(
      level: level,
      currentGrid: _copyClues(level.clues),
      selectedRow: null,
      selectedCol: null,
      isSolved: false,
    );
  }

  bool _checkSolved(List<List<int?>> grid) {
    final size = state.level.size;

    // 1. Verify all cells are filled
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (grid[r][c] == null) return false;
      }
    }

    // 2. Verify Row uniqueness (Latin square rule)
    for (int r = 0; r < size; r++) {
      final seen = <int>{};
      for (int c = 0; c < size; c++) {
        final val = grid[r][c]!;
        if (seen.contains(val)) return false;
        seen.add(val);
      }
    }

    // 3. Verify Col uniqueness (Latin square rule)
    for (int c = 0; c < size; c++) {
      final seen = <int>{};
      for (int r = 0; r < size; r++) {
        final val = grid[r][c]!;
        if (seen.contains(val)) return false;
        seen.add(val);
      }
    }

    // 4. Verify Horizontal Inequalities
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size - 1; c++) {
        final ineq = state.level.hInequalities[r][c];
        if (ineq != null) {
          final left = grid[r][c]!;
          final right = grid[r][c + 1]!;
          if (ineq == '<' && left >= right) return false;
          if (ineq == '>' && left <= right) return false;
        }
      }
    }

    // 5. Verify Vertical Inequalities
    for (int r = 0; r < size - 1; r++) {
      for (int c = 0; c < size; c++) {
        final ineq = state.level.vInequalities[r][c];
        if (ineq != null) {
          final top = grid[r][c]!;
          final bottom = grid[r + 1][c]!;
          if (ineq == '^' && top >= bottom) return false; // top < bottom
          if (ineq == 'v' && top <= bottom) return false; // top > bottom
        }
      }
    }

    return true;
  }
}
