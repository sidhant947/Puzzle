import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'unblock_me_engine.dart';

part 'unblock_me_provider.g.dart';

class UnblockMeState {
  final List<Block> blocks;
  final bool isSolved;
  final int moveCount;

  UnblockMeState({
    required this.blocks,
    this.isSolved = false,
    this.moveCount = 0,
  });

  UnblockMeState copyWith({
    List<Block>? blocks,
    bool? isSolved,
    int? moveCount,
  }) {
    return UnblockMeState(
      blocks: blocks ?? this.blocks,
      isSolved: isSolved ?? this.isSolved,
      moveCount: moveCount ?? this.moveCount,
    );
  }
}

@riverpod
class UnblockMeNotifier extends _$UnblockMeNotifier {
  final _engine = UnblockMeEngine();

  @override
  UnblockMeState build() {
    final puzzle = _engine.getRandomPuzzle();
    return UnblockMeState(
      blocks: puzzle.blocks.map((b) => b.copyWith()).toList(),
    );
  }

  void newGame() {
    final puzzle = _engine.getRandomPuzzle();
    state = UnblockMeState(
      blocks: puzzle.blocks.map((b) => b.copyWith()).toList(),
      moveCount: 0,
      isSolved: false,
    );
  }

  void moveBlock(int blockId, int dx, int dy) {
    if (state.isSolved) return;

    final blockIndex = state.blocks.indexWhere((b) => b.id == blockId);
    if (blockIndex == -1) return;

    final block = state.blocks[blockIndex];
    int newX = block.x;
    int newY = block.y;

    if (block.orientation == BlockOrientation.horizontal) {
      newX += dx;
    } else {
      newY += dy;
    }

    if (_engine.canMoveTo(block, newX, newY, state.blocks)) {
      final newBlocks = state.blocks.map((b) => b.id == blockId ? b.copyWith(x: newX, y: newY) : b).toList();
      
      bool solved = false;
      final target = newBlocks.firstWhere((b) => b.isTarget);
      if (_engine.isSolved(target)) {
        solved = true;
      }

      state = state.copyWith(
        blocks: newBlocks,
        isSolved: solved,
        moveCount: state.moveCount + 1,
      );
    }
  }
}
