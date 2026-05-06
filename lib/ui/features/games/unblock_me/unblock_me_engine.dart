import 'dart:math';

enum BlockOrientation { horizontal, vertical }

class Block {
  final int id;
  int x;
  int y;
  final int length;
  final BlockOrientation orientation;
  final bool isTarget;

  Block({
    required this.id,
    required this.x,
    required this.y,
    required this.length,
    required this.orientation,
    this.isTarget = false,
  });

  Block copyWith({int? x, int? y}) {
    return Block(
      id: id,
      x: x ?? this.x,
      y: y ?? this.y,
      length: length,
      orientation: orientation,
      isTarget: isTarget,
    );
  }

  List<Point<int>> get occupiedCells {
    return List.generate(length, (i) {
      if (orientation == BlockOrientation.horizontal) {
        return Point(x + i, y);
      } else {
        return Point(x, y + i);
      }
    });
  }
}

class UnblockLevel {
  final List<Block> blocks;
  const UnblockLevel({required this.blocks});
}

class UnblockMeEngine {
  static const int size = 6;
  static const int exitRow = 2;

  final List<UnblockLevel> _puzzles = [
    UnblockLevel(blocks: [
      Block(id: 0, x: 0, y: 2, length: 2, orientation: BlockOrientation.horizontal, isTarget: true),
      Block(id: 1, x: 2, y: 0, length: 3, orientation: BlockOrientation.vertical),
      Block(id: 2, x: 3, y: 0, length: 2, orientation: BlockOrientation.horizontal),
      Block(id: 3, x: 5, y: 0, length: 3, orientation: BlockOrientation.vertical),
      Block(id: 4, x: 0, y: 4, length: 2, orientation: BlockOrientation.vertical),
      Block(id: 5, x: 1, y: 4, length: 2, orientation: BlockOrientation.horizontal),
      Block(id: 6, x: 4, y: 4, length: 2, orientation: BlockOrientation.vertical),
    ]),
    UnblockLevel(blocks: [
      Block(id: 0, x: 1, y: 2, length: 2, orientation: BlockOrientation.horizontal, isTarget: true),
      Block(id: 1, x: 0, y: 0, length: 2, orientation: BlockOrientation.horizontal),
      Block(id: 2, x: 0, y: 1, length: 3, orientation: BlockOrientation.vertical),
      Block(id: 3, x: 3, y: 0, length: 2, orientation: BlockOrientation.vertical),
      Block(id: 4, x: 4, y: 0, length: 2, orientation: BlockOrientation.horizontal),
      Block(id: 5, x: 4, y: 1, length: 3, orientation: BlockOrientation.vertical),
      Block(id: 6, x: 1, y: 3, length: 2, orientation: BlockOrientation.horizontal),
      Block(id: 7, x: 0, y: 4, length: 2, orientation: BlockOrientation.horizontal),
    ]),
  ];

  UnblockLevel getRandomPuzzle() {
    return _puzzles[Random().nextInt(_puzzles.length)];
  }

  bool canMoveTo(Block block, int newX, int newY, List<Block> allBlocks) {
    if (newX < 0 || newY < 0) return false;
    if (block.orientation == BlockOrientation.horizontal) {
      if (newX + block.length > size) return false;
      if (newY != block.y) return false;
    } else {
      if (newY + block.length > size) return false;
      if (newX != block.x) return false;
    }

    final tempBlock = block.copyWith(x: newX, y: newY);
    final occupied = tempBlock.occupiedCells;

    for (var other in allBlocks) {
      if (other.id == block.id) continue;
      final otherOccupied = other.occupiedCells;
      for (var cell in occupied) {
        if (otherOccupied.contains(cell)) return false;
      }
    }

    return true;
  }

  bool isSolved(Block targetBlock) {
    return targetBlock.isTarget && targetBlock.x + targetBlock.length == size;
  }
}
