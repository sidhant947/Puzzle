import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'slide_puzzle_engine.dart';

part 'slide_puzzle_provider.g.dart';

class SlidePuzzleState {
  final List<int> board;
  final bool isSolved;
  final int moves;

  SlidePuzzleState({
    required this.board,
    this.isSolved = false,
    this.moves = 0,
  });

  SlidePuzzleState copyWith({
    List<int>? board,
    bool? isSolved,
    int? moves,
  }) {
    return SlidePuzzleState(
      board: board ?? this.board,
      isSolved: isSolved ?? this.isSolved,
      moves: moves ?? this.moves,
    );
  }
}

@riverpod
class SlidePuzzleNotifier extends _$SlidePuzzleNotifier {
  final _engine = SlidePuzzleEngine();

  @override
  SlidePuzzleState build() {
    return SlidePuzzleState(
      board: _engine.generateSolvableBoard(),
    );
  }

  void newGame() {
    state = SlidePuzzleState(
      board: _engine.generateSolvableBoard(),
    );
  }

  void moveTile(int index) {
    if (state.isSolved) return;

    final board = List<int>.from(state.board);
    final emptyIndex = board.indexOf(0);

    if (_engine.canMove(index, emptyIndex)) {
      board[emptyIndex] = board[index];
      board[index] = 0;

      final solved = _engine.isSolved(board);
      state = state.copyWith(
        board: board,
        isSolved: solved,
        moves: state.moves + 1,
      );
    }
  }
}
