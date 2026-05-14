import 'dart:collection';
import 'dart:math';

enum BlockOrientation { horizontal, vertical }

class Block {
  final int id;
  final int x;
  final int y;
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

class BlockEscapeEngine {
  static const int size = 6;
  static const int exitRow = 2;
  final Random _random = Random();

  UnblockLevel generatePuzzle() {
    while (true) {
      final blocks = <Block>[];
      
      // 1. Place target block (horizontal, length 2, on exit row)
      final targetX = _random.nextInt(size - 2);
      blocks.add(Block(
        id: 0,
        x: targetX,
        y: exitRow,
        length: 2,
        orientation: BlockOrientation.horizontal,
        isTarget: true,
      ));

      // 2. Add random blocks
      final numExtraBlocks = 8 + _random.nextInt(4); // 8-11 extra blocks
      for (int i = 0; i < numExtraBlocks; i++) {
        final length = _random.nextDouble() < 0.2 ? 3 : 2;
        final orientation = _random.nextBool() ? BlockOrientation.horizontal : BlockOrientation.vertical;
        
        for (int attempt = 0; attempt < 20; attempt++) {
          final x = _random.nextInt(size - (orientation == BlockOrientation.horizontal ? length - 1 : 0));
          final y = _random.nextInt(size - (orientation == BlockOrientation.vertical ? length - 1 : 0));
          
          final newBlock = Block(
            id: blocks.length,
            x: x,
            y: y,
            length: length,
            orientation: orientation,
          );

          if (_isValidPlacement(newBlock, blocks)) {
            blocks.add(newBlock);
            break;
          }
        }
      }

      final level = UnblockLevel(blocks: blocks);
      final difficulty = _getDifficulty(level);
      
      // Ensure it's solvable and not too trivial
      if (difficulty != null && difficulty >= 5) {
        return level;
      }
    }
  }

  bool _isValidPlacement(Block newBlock, List<Block> existingBlocks) {
    // Special rule for exit row: no horizontal blocks except target
    if (newBlock.orientation == BlockOrientation.horizontal && newBlock.y == exitRow && !newBlock.isTarget) {
      return false;
    }

    final newCells = newBlock.occupiedCells;
    for (final block in existingBlocks) {
      final existingCells = block.occupiedCells;
      for (final cell in newCells) {
        for (final existingCell in existingCells) {
          if (cell.x == existingCell.x && cell.y == existingCell.y) return false;
        }
      }
    }
    return true;
  }

  int? _getDifficulty(UnblockLevel level) {
    final queue = Queue<List<Block>>();
    queue.add(level.blocks);
    
    final visited = <String>{};
    visited.add(_getStateKey(level.blocks));

    final distances = <String, int>{};
    distances[_getStateKey(level.blocks)] = 0;

    int iterations = 0;
    while (queue.isNotEmpty) {
      iterations++;
      if (iterations > 1000) return null; // Too complex for a mobile puzzle

      final currentBlocks = queue.removeFirst();
      final currentKey = _getStateKey(currentBlocks);
      final currentDist = distances[currentKey]!;

      final target = currentBlocks.firstWhere((b) => b.isTarget);
      if (isSolved(target)) return currentDist;

      for (int i = 0; i < currentBlocks.length; i++) {
        final block = currentBlocks[i];
        
        if (block.orientation == BlockOrientation.horizontal) {
          for (int dx in [-1, 1]) {
            int newX = block.x + dx;
            while (canMoveTo(block, newX, block.y, currentBlocks)) {
              final nextBlocks = List<Block>.from(currentBlocks);
              nextBlocks[i] = block.copyWith(x: newX);
              final nextKey = _getStateKey(nextBlocks);
              if (!visited.contains(nextKey)) {
                visited.add(nextKey);
                distances[nextKey] = currentDist + 1;
                queue.add(nextBlocks);
              }
              newX += dx;
            }
          }
        } else {
          for (int dy in [-1, 1]) {
            int newY = block.y + dy;
            while (canMoveTo(block, block.x, newY, currentBlocks)) {
              final nextBlocks = List<Block>.from(currentBlocks);
              nextBlocks[i] = block.copyWith(y: newY);
              final nextKey = _getStateKey(nextBlocks);
              if (!visited.contains(nextKey)) {
                visited.add(nextKey);
                distances[nextKey] = currentDist + 1;
                queue.add(nextBlocks);
              }
              newY += dy;
            }
          }
        }
      }
    }
    return null;
  }

  String _getStateKey(List<Block> blocks) {
    return blocks.map((b) => '${b.x},${b.y}').join('|');
  }

  UnblockLevel getRandomPuzzle() {
    return generatePuzzle();
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
        for (var otherCell in otherOccupied) {
          if (cell.x == otherCell.x && cell.y == otherCell.y) return false;
        }
      }
    }

    return true;
  }

  bool isSolved(Block targetBlock) {
    return targetBlock.isTarget && targetBlock.x + targetBlock.length == size;
  }
}
