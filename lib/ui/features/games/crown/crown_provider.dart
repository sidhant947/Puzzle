import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'crown_engine.dart';

part 'crown_provider.g.dart';

class CrownState {
  final CrownBoard? board;
  final List<Point<int>> crowns;
  final bool isSolved;

  CrownState({
    this.board,
    this.crowns = const [],
    this.isSolved = false,
  });

  CrownState copyWith({
    CrownBoard? board,
    List<Point<int>>? crowns,
    bool? isSolved,
  }) {
    return CrownState(
      board: board ?? this.board,
      crowns: crowns ?? this.crowns,
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

  void toggleCrown(int x, int y) {
    if (state.board == null || state.isSolved) return;

    final p = Point(x, y);
    List<Point<int>> newCrowns = List.from(state.crowns);
    if (newCrowns.contains(p)) {
      newCrowns.remove(p);
    } else {
      // Logic: User might want to remove existing crown in same row/col first?
      // For now, let them place as many as they want, and check isWin.
      newCrowns.add(p);
    }

    bool solved = _engine.isWin(state.board!.size, state.board!.regions, newCrowns);
    state = state.copyWith(crowns: newCrowns, isSolved: solved);
  }
}
