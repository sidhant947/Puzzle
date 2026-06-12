import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/kakuro/kakuro_engine.dart';

void main() {
  group('KakuroEngine', () {
    late KakuroEngine engine;

    setUp(() {
      engine = KakuroEngine();
    });

    group('generateLevel', () {
      test('returns a KakuroLevel with correct size', () {
        final level = engine.generateLevel();
        expect(level.size, equals(4));
        expect(level.grid.length, equals(4));
        for (final row in level.grid) {
          expect(row.length, equals(4));
        }
      });

      test('grid contains only block, clue, or white cells', () {
        final level = engine.generateLevel();
        for (final row in level.grid) {
          for (final cell in row) {
            final typeCount = [cell.isBlock, cell.isClue, cell.isWhite]
                .where((b) => b)
                .length;
            expect(typeCount, equals(1),
                reason: 'Cell at (${cell.r},${cell.c}) should have exactly one type');
          }
        }
      });

      test('has at least one clue cell with vClue or hClue', () {
        final level = engine.generateLevel();
        bool hasClue = false;
        for (final row in level.grid) {
          for (final cell in row) {
            if (cell.isClue && (cell.vClue != null || cell.hClue != null)) {
              hasClue = true;
            }
          }
        }
        expect(hasClue, isTrue);
      });

      test('has at least one white cell with solution', () {
        final level = engine.generateLevel();
        bool hasWhite = false;
        for (final row in level.grid) {
          for (final cell in row) {
            if (cell.isWhite && cell.solution != null) {
              hasWhite = true;
            }
          }
        }
        expect(hasWhite, isTrue);
      });

      test('white cell solutions are between 1 and 9', () {
        final level = engine.generateLevel();
        for (final row in level.grid) {
          for (final cell in row) {
            if (cell.isWhite && cell.solution != null) {
              expect(cell.solution!, greaterThanOrEqualTo(1));
              expect(cell.solution!, lessThanOrEqualTo(9));
            }
          }
        }
      });
    });

    group('KakuroCell', () {
      test('creates a block cell', () {
        final cell = KakuroCell(r: 0, c: 0, isBlock: true);
        expect(cell.isBlock, isTrue);
        expect(cell.isWhite, isFalse);
        expect(cell.isClue, isFalse);
      });

      test('creates a white cell with solution', () {
        final cell = KakuroCell(r: 1, c: 2, isWhite: true, solution: 5);
        expect(cell.isWhite, isTrue);
        expect(cell.solution, equals(5));
      });

      test('creates a clue cell with hClue and vClue', () {
        final cell = KakuroCell(r: 0, c: 1, isClue: true, vClue: 10, hClue: 5);
        expect(cell.vClue, equals(10));
        expect(cell.hClue, equals(5));
      });
    });

    group('KakuroLevel', () {
      test('stores size and grid', () {
        final grid = List.generate(4,
            (r) => List.generate(4, (c) => KakuroCell(r: r, c: c, isBlock: true)));
        final level = KakuroLevel(size: 4, grid: grid);
        expect(level.size, equals(4));
        expect(level.grid.length, equals(4));
      });
    });
  });
}
