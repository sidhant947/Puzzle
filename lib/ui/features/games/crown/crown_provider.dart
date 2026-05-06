import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'crown_engine.dart';

part 'crown_provider.g.dart';

class CrownState {
  final CrownBoard? board;
  final List<Point<int>> crowns;
  final Set<Point<int>> markedCells;
  final bool isSolved;

  CrownState({
    this.board,
    this.crowns = const [],
    this.markedCells = const {},
    this.isSolved = false,
  });

  CrownState copyWith({
    CrownBoard? board,
    List<Point<int>>? crowns,
    Set<Point<int>>? markedCells,
    bool? isSolved,
  }) {
    return CrownState(
      board: board ?? this.board,
      crowns: crowns ?? this.crowns,
      markedCells: markedCells ?? this.markedCells,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class CrownNotifier extends _$CrownNotifier {
  final _engine = CrownEngine();

  @override
  CrownState build() {
    return CrownState();
  }

  void initGame() {
    final board = _engine.generateBoard();
    state = CrownState(board: board);
  }

  void tapCell(int x, int y) {
    if (state.board == null || state.isSolved) return;

    final p = Point(x, y);
    List<Point<int>> newCrowns = List.from(state.crowns);
    Set<Point<int>> newMarked = Set.from(state.markedCells);

    bool hasCrown = newCrowns.contains(p);
    bool isMarked = newMarked.contains(p);

    if (!hasCrown && !isMarked) {
      // Empty -> Crown
      newCrowns.add(p);
    } else if (hasCrown) {
      // Crown -> Cross
      newCrowns.remove(p);
      newMarked.add(p);
    } else {
      // Cross -> Empty
      newMarked.remove(p);
    }

    bool solved = _engine.isWin(state.board!.size, state.board!.regions, newCrowns);
    state = state.copyWith(crowns: newCrowns, markedCells: newMarked, isSolved: solved);
  }
}