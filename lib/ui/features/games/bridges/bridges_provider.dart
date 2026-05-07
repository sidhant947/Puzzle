import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'bridges_engine.dart';

part 'bridges_provider.g.dart';

class BridgesState {
  final BridgesBoard board;
  final List<BridgesConnection> connections;
  final int? selectedIslandId;
  final bool isSolved;

  BridgesState({
    required this.board,
    required this.connections,
    this.selectedIslandId,
    this.isSolved = false,
  });

  BridgesState copyWith({
    BridgesBoard? board,
    List<BridgesConnection>? connections,
    int? selectedIslandId,
    bool? isSolved,
    bool clearSelection = false,
  }) {
    return BridgesState(
      board: board ?? this.board,
      connections: connections ?? this.connections,
      selectedIslandId: clearSelection ? null : (selectedIslandId ?? this.selectedIslandId),
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class BridgesNotifier extends _$BridgesNotifier {
  final _engine = BridgesEngine();

  @override
  BridgesState build() {
    final board = _engine.generateBoard();
    return BridgesState(board: board, connections: []);
  }

  void newGame() {
    final board = _engine.generateBoard();
    state = BridgesState(board: board, connections: [], isSolved: false);
  }

  void selectIsland(int id) {
    if (state.isSolved) return;
    
    if (state.selectedIslandId == null) {
      state = state.copyWith(selectedIslandId: id);
    } else if (state.selectedIslandId == id) {
      state = state.copyWith(clearSelection: true);
    } else {
      // Try to connect
      _tryConnect(state.selectedIslandId!, id);
    }
  }

  void _tryConnect(int id1, int id2) {
    final island1 = state.board.islands.firstWhere((i) => i.id == id1);
    final island2 = state.board.islands.firstWhere((i) => i.id == id2);

    // Must be same row or column
    if (island1.x != island2.x && island1.y != island2.y) {
      state = state.copyWith(selectedIslandId: id2); // Change selection
      return;
    }

    // Check if path is clear of other islands
    if (!_isPathClear(island1, island2)) {
      state = state.copyWith(selectedIslandId: id2);
      return;
    }

    final newConnections = List<BridgesConnection>.from(state.connections);
    int existingIndex = -1;
    for (int i = 0; i < newConnections.length; i++) {
      if ((newConnections[i].island1Id == id1 && newConnections[i].island2Id == id2) ||
          (newConnections[i].island1Id == id2 && newConnections[i].island2Id == id1)) {
        existingIndex = i;
        break;
      }
    }

    if (existingIndex != -1) {
      int count = newConnections[existingIndex].count;
      if (count == 1) {
        newConnections[existingIndex] = BridgesConnection(island1Id: id1, island2Id: id2, count: 2);
      } else {
        newConnections.removeAt(existingIndex);
      }
    } else {
      // Check for crossings
      if (_wouldCross(island1, island2, newConnections)) {
        state = state.copyWith(selectedIslandId: id2);
        return;
      }
      newConnections.add(BridgesConnection(island1Id: id1, island2Id: id2, count: 1));
    }

    bool solved = _engine.isSolved(state.board, newConnections);
    state = state.copyWith(connections: newConnections, isSolved: solved, clearSelection: true);
  }

  bool _isPathClear(BridgesIsland i1, BridgesIsland i2) {
    int x1 = i1.x < i2.x ? i1.x : i2.x;
    int x2 = i1.x < i2.x ? i2.x : i1.x;
    int y1 = i1.y < i2.y ? i1.y : i2.y;
    int y2 = i1.y < i2.y ? i2.y : i1.y;

    for (var island in state.board.islands) {
      if (island.id == i1.id || island.id == i2.id) continue;
      if (i1.y == i2.y && island.y == i1.y && island.x > x1 && island.x < x2) return false;
      if (i1.x == i2.x && island.x == i1.x && island.y > y1 && island.y < y2) return false;
    }
    return true;
  }

  bool _wouldCross(BridgesIsland i1, BridgesIsland i2, List<BridgesConnection> current) {
    for (var conn in current) {
      final c1 = state.board.islands.firstWhere((i) => i.id == conn.island1Id);
      final c2 = state.board.islands.firstWhere((i) => i.id == conn.island2Id);

      // Check crossing of horizontal i1-i2 and vertical c1-c2
      if (i1.y == i2.y && c1.x == c2.x) {
        int ix1 = i1.x < i2.x ? i1.x : i2.x, ix2 = i1.x < i2.x ? i2.x : i1.x;
        int cy1 = c1.y < c2.y ? c1.y : c2.y, cy2 = c1.y < c2.y ? c2.y : c1.y;
        if (c1.x > ix1 && c1.x < ix2 && i1.y > cy1 && i1.y < cy2) return true;
      }
      // Check crossing of vertical i1-i2 and horizontal c1-c2
      if (i1.x == i2.x && c1.y == c2.y) {
        int iy1 = i1.y < i2.y ? i1.y : i2.y, iy2 = i1.y < i2.y ? i2.y : i1.y;
        int cx1 = c1.x < c2.x ? c1.x : c2.x, cx2 = c1.x < c2.x ? c2.x : c1.x;
        if (i1.x > cx1 && i1.x < cx2 && c1.y > iy1 && c1.y < iy2) return true;
      }
    }
    return false;
  }
}
