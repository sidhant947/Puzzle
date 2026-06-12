import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/block_escape/block_escape_engine.dart';

void main() {
  group('BlockEscapeEngine', () {
    late BlockEscapeEngine engine;

    setUp(() {
      engine = BlockEscapeEngine();
    });

    group('generatePuzzle', () {
      test('returns an UnblockLevel', () {
        final level = engine.generatePuzzle();
        expect(level, isA<UnblockLevel>());
      });

      test('puzzle has blocks', () {
        final level = engine.generatePuzzle();
        expect(level.blocks, isNotEmpty);
      });

      test('first block is the target', () {
        final level = engine.generatePuzzle();
        expect(level.blocks.first.isTarget, isTrue);
      });

      test('target block is horizontal with length 2', () {
        final level = engine.generatePuzzle();
        final target = level.blocks.first;
        expect(target.orientation, BlockOrientation.horizontal);
        expect(target.length, 2);
      });

      test('target block is on exit row', () {
        final level = engine.generatePuzzle();
        final target = level.blocks.first;
        expect(target.y, BlockEscapeEngine.exitRow);
      });
    });

    group('isSolved', () {
      test('returns true when target reaches right edge', () {
        final target = Block(
          id: 0,
          x: BlockEscapeEngine.size - 2,
          y: 2,
          length: 2,
          orientation: BlockOrientation.horizontal,
          isTarget: true,
        );
        expect(engine.isSolved(target), isTrue);
      });

      test('returns false when target is not at right edge', () {
        final target = Block(
          id: 0,
          x: 0,
          y: 2,
          length: 2,
          orientation: BlockOrientation.horizontal,
          isTarget: true,
        );
        expect(engine.isSolved(target), isFalse);
      });
    });

    group('canMoveTo', () {
      test('returns true for valid move', () {
        final target = Block(
          id: 0,
          x: 0,
          y: 2,
          length: 2,
          orientation: BlockOrientation.horizontal,
          isTarget: true,
        );
        final other = Block(
          id: 1,
          x: 3,
          y: 0,
          length: 2,
          orientation: BlockOrientation.vertical,
        );
        expect(engine.canMoveTo(target, 1, 2, [target, other]), isTrue);
      });

      test('returns false for out of bounds', () {
        final target = Block(
          id: 0,
          x: 0,
          y: 2,
          length: 2,
          orientation: BlockOrientation.horizontal,
          isTarget: true,
        );
        expect(engine.canMoveTo(target, -1, 2, [target]), isFalse);
      });

      test('returns false when overlapping another block', () {
        final target = Block(
          id: 0,
          x: 0,
          y: 2,
          length: 2,
          orientation: BlockOrientation.horizontal,
          isTarget: true,
        );
        final other = Block(
          id: 1,
          x: 2,
          y: 1,
          length: 2,
          orientation: BlockOrientation.vertical,
        );
        expect(engine.canMoveTo(target, 2, 2, [target, other]), isFalse);
      });

      test('returns false for vertical block moving horizontally', () {
        final block = Block(
          id: 0,
          x: 1,
          y: 1,
          length: 2,
          orientation: BlockOrientation.vertical,
        );
        expect(engine.canMoveTo(block, 2, 1, [block]), isFalse);
      });
    });
  });

  group('Block', () {
    test('occupiedCells for horizontal block', () {
      final block = Block(
        id: 0,
        x: 1,
        y: 2,
        length: 3,
        orientation: BlockOrientation.horizontal,
      );
      final cells = block.occupiedCells;
      expect(cells.length, 3);
      expect(cells[0].x, 1);
      expect(cells[0].y, 2);
      expect(cells[2].x, 3);
    });

    test('occupiedCells for vertical block', () {
      final block = Block(
        id: 0,
        x: 1,
        y: 2,
        length: 3,
        orientation: BlockOrientation.vertical,
      );
      final cells = block.occupiedCells;
      expect(cells.length, 3);
      expect(cells[0].x, 1);
      expect(cells[0].y, 2);
      expect(cells[2].x, 1);
      expect(cells[2].y, 4);
    });

    test('copyWith creates new block with updated position', () {
      final block = Block(
        id: 0,
        x: 0,
        y: 0,
        length: 2,
        orientation: BlockOrientation.horizontal,
      );
      final newBlock = block.copyWith(x: 3, y: 4);
      expect(newBlock.x, 3);
      expect(newBlock.y, 4);
      expect(newBlock.length, 2);
      expect(newBlock.id, 0);
    });
  });
}
