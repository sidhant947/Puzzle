import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/crown/crown_engine.dart';

void main() {
  group('CrownEngine', () {
    late CrownEngine engine;

    setUp(() {
      engine = CrownEngine();
    });

    group('generateBoard', () {
      test('returns a CrownBoard', () {
        final board = engine.generateBoard();
        expect(board, isA<CrownBoard>());
      });

      test('board has correct size', () {
        final board = engine.generateBoard();
        expect(board.size, CrownEngine.boardSize);
      });

      test('regions grid has correct dimensions', () {
        final board = engine.generateBoard();
        expect(board.regions.length, CrownEngine.boardSize);
        for (final row in board.regions) {
          expect(row.length, CrownEngine.boardSize);
        }
      });

      test('solution has correct number of crowns', () {
        final board = engine.generateBoard();
        expect(board.solution.length, CrownEngine.boardSize);
      });

      test('solution crowns are in valid positions', () {
        final board = engine.generateBoard();
        for (final p in board.solution) {
          expect(p.x, greaterThanOrEqualTo(0));
          expect(p.x, lessThan(CrownEngine.boardSize));
          expect(p.y, greaterThanOrEqualTo(0));
          expect(p.y, lessThan(CrownEngine.boardSize));
        }
      });

      test('solution crowns are in different rows', () {
        final board = engine.generateBoard();
        final rows = board.solution.map((p) => p.y).toSet();
        expect(rows.length, CrownEngine.boardSize);
      });

      test('solution crowns are in different columns', () {
        final board = engine.generateBoard();
        final cols = board.solution.map((p) => p.x).toSet();
        expect(cols.length, CrownEngine.boardSize);
      });

      test('solution crowns are not adjacent', () {
        final board = engine.generateBoard();
        for (int i = 0; i < board.solution.length; i++) {
          for (int j = i + 1; j < board.solution.length; j++) {
            final a = board.solution[i];
            final b = board.solution[j];
            expect(
              (a.x - b.x).abs() > 1 || (a.y - b.y).abs() > 1,
              isTrue,
              reason: 'Crowns at $a and $b are adjacent',
            );
          }
        }
      });

      test('each crown is in a different region', () {
        final board = engine.generateBoard();
        final regions = <int>{};
        for (final p in board.solution) {
          regions.add(board.regions[p.y][p.x]);
        }
        expect(regions.length, CrownEngine.boardSize);
      });
    });

    group('isWin', () {
      test('returns true for correct solution', () {
        final board = engine.generateBoard();
        expect(engine.isWin(board.size, board.regions, board.solution), isTrue);
      });

      test('returns false for wrong number of crowns', () {
        final board = engine.generateBoard();
        final crowns = board.solution.sublist(0, CrownEngine.boardSize - 1);
        expect(engine.isWin(board.size, board.regions, crowns), isFalse);
      });

      test('returns false when two crowns share a row', () {
        final board = engine.generateBoard();
        final badCrowns = List<Point<int>>.from(board.solution);
        badCrowns[0] = Point(badCrowns[1].x, badCrowns[1].y);
        expect(engine.isWin(board.size, board.regions, badCrowns), isFalse);
      });

      test('returns false when two crowns are adjacent', () {
        final regions = List.generate(5, (_) => List.generate(5, (c) => c));
        final badCrowns = [
          Point(0, 0),
          Point(1, 1), // adjacent to (0,0)
          Point(4, 2),
          Point(2, 3),
          Point(0, 4),
        ];
        expect(engine.isWin(5, regions, badCrowns), isFalse);
      });

      test('returns false for empty crowns', () {
        final board = engine.generateBoard();
        expect(engine.isWin(board.size, board.regions, []), isFalse);
      });
    });
  });
}
