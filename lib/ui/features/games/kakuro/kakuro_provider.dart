import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'kakuro_engine.dart';
import '../../../../providers/user_providers.dart';

part 'kakuro_provider.g.dart';

class KakuroState {
  final KakuroLevel level;
  final Map<Point<int>, int?> currentValues; // key: white cell (c, r)
  final int? selectedRow;
  final int? selectedCol;
  final bool isSolved;

  KakuroState({
    required this.level,
    required this.currentValues,
    this.selectedRow,
    this.selectedCol,
    this.isSolved = false,
  });

  KakuroState copyWith({
    KakuroLevel? level,
    Map<Point<int>, int?>? currentValues,
    int? selectedRow,
    int? selectedCol,
    bool? isSolved,
  }) {
    return KakuroState(
      level: level ?? this.level,
      currentValues: currentValues ?? this.currentValues,
      selectedRow: selectedRow ?? this.selectedRow,
      selectedCol: selectedCol ?? this.selectedCol,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class KakuroNotifier extends _$KakuroNotifier {
  final _engine = KakuroEngine();

  @override
  KakuroState build() {
    final level = _engine.generateLevel();
    final initialValues = _getInitialValues(level);
    return KakuroState(
      level: level,
      currentValues: initialValues,
    );
  }

  Map<Point<int>, int?> _getInitialValues(KakuroLevel level) {
    final values = <Point<int>, int?>{};
    for (int r = 0; r < level.size; r++) {
      for (int c = 0; c < level.size; c++) {
        if (level.grid[r][c].isWhite) {
          values[Point(c, r)] = null;
        }
      }
    }
    return values;
  }

  void selectCell(int r, int c) {
    if (state.isSolved) return;
    if (!state.level.grid[r][c].isWhite) return;

    state = state.copyWith(selectedRow: r, selectedCol: c);
  }

  void setCellValue(int? value) {
    if (state.isSolved) return;
    final r = state.selectedRow;
    final c = state.selectedCol;
    if (r == null || c == null) return;

    final newValues = Map<Point<int>, int?>.from(state.currentValues);
    newValues[Point(c, r)] = value;

    final solved = _checkSolved(newValues);
    state = state.copyWith(currentValues: newValues, isSolved: solved);

    if (solved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('kakuro', xpAmount: 25);
    }
  }

  void reset() {
    state = KakuroState(
      level: state.level,
      currentValues: _getInitialValues(state.level),
      selectedRow: null,
      selectedCol: null,
      isSolved: false,
    );
  }

  void newGame() {
    final level = _engine.generateLevel();
    state = KakuroState(
      level: level,
      currentValues: _getInitialValues(level),
      selectedRow: null,
      selectedCol: null,
      isSolved: false,
    );
  }

  bool _checkSolved(Map<Point<int>, int?> values) {
    final size = state.level.size;
    final grid = state.level.grid;

    // 1. Check all white cells are filled and are valid digits 1-9
    for (var val in values.values) {
      if (val == null || val < 1 || val > 9) return false;
    }

    // 2. Verify all clues
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final cell = grid[r][c];
        if (cell.isClue) {
          // Verify Horizontal Segment
          if (cell.hClue != null) {
            final hList = <int>[];
            int nextC = c + 1;
            while (nextC < size && grid[r][nextC].isWhite) {
              final val = values[Point(nextC, r)];
              if (val == null) return false;
              hList.add(val);
              nextC++;
            }
            if (hList.isEmpty) return false;
            final sum = hList.reduce((a, b) => a + b);
            if (sum != cell.hClue) return false;
            if (hList.toSet().length != hList.length) return false; // duplicate digits
          }

          // Verify Vertical Segment
          if (cell.vClue != null) {
            final vList = <int>[];
            int nextR = r + 1;
            while (nextR < size && grid[nextR][c].isWhite) {
              final val = values[Point(c, nextR)];
              if (val == null) return false;
              vList.add(val);
              nextR++;
            }
            if (vList.isEmpty) return false;
            final sum = vList.reduce((a, b) => a + b);
            if (sum != cell.vClue) return false;
            if (vList.toSet().length != vList.length) return false; // duplicate digits
          }
        }
      }
    }

    return true;
  }
}
