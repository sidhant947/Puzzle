import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/d2_attention/d2_attention_engine.dart';

void main() {
  group('D2AttentionEngine', () {
    late D2AttentionEngine engine;

    setUp(() {
      engine = D2AttentionEngine();
    });

    group('D2Item', () {
      test('isTarget is true only for letter d with exactly 2 total dashes', () {
        expect(D2Item(id: 0, letter: 'd', dashesAbove: 1, dashesBelow: 1).isTarget, isTrue);
        expect(D2Item(id: 0, letter: 'd', dashesAbove: 2, dashesBelow: 0).isTarget, isTrue);
        expect(D2Item(id: 0, letter: 'd', dashesAbove: 0, dashesBelow: 2).isTarget, isTrue);
        expect(D2Item(id: 0, letter: 'd', dashesAbove: 0, dashesBelow: 0).isTarget, isFalse);
        expect(D2Item(id: 0, letter: 'p', dashesAbove: 1, dashesBelow: 1).isTarget, isFalse);
        expect(D2Item(id: 0, letter: 'p', dashesAbove: 2, dashesBelow: 0).isTarget, isFalse);
      });

      test('totalDashes returns sum of dashesAbove and dashesBelow', () {
        final item = D2Item(id: 0, letter: 'd', dashesAbove: 3, dashesBelow: 2);
        expect(item.totalDashes, 5);
      });
    });

    group('generateBoard', () {
      test('returns exactly 16 items (4x4 grid)', () {
        final board = engine.generateBoard();
        expect(board.length, D2AttentionEngine.totalItems);
      });

      test('items have sequential IDs from 0', () {
        final board = engine.generateBoard();
        for (int i = 0; i < board.length; i++) {
          expect(board[i].id, i);
        }
      });

      test('contains exactly 4 to 6 targets', () {
        for (int trial = 0; trial < 20; trial++) {
          final board = engine.generateBoard();
          final targetCount = board.where((item) => item.isTarget).length;
          expect(targetCount, greaterThanOrEqualTo(4));
          expect(targetCount, lessThanOrEqualTo(6));
        }
      });

      test('all items are either d or p', () {
        final board = engine.generateBoard();
        for (final item in board) {
          expect(item.letter == 'd' || item.letter == 'p', isTrue);
        }
      });

      test('all target items have letter d and exactly 2 dashes', () {
        final board = engine.generateBoard();
        for (final item in board.where((i) => i.isTarget)) {
          expect(item.letter, 'd');
          expect(item.totalDashes, 2);
        }
      });
    });
  });
}
