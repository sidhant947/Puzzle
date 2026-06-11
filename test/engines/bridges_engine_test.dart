import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/bridges/bridges_engine.dart';

void main() {
  group('BridgesEngine', () {
    late BridgesEngine engine;

    setUp(() {
      engine = BridgesEngine();
    });

    group('generateBoard', () {
      test('generates a board with islands', () {
        final board = engine.generateBoard();
        expect(board.islands, isNotEmpty);
      });

      test('islands have valid positions', () {
        final board = engine.generateBoard();
        for (final island in board.islands) {
          expect(island.x, greaterThanOrEqualTo(0));
          expect(island.y, greaterThanOrEqualTo(0));
          expect(island.count, greaterThanOrEqualTo(0));
        }
      });

      test('islands have unique positions', () {
        final board = engine.generateBoard();
        final positions = <String>{};
        for (final island in board.islands) {
          final pos = '${island.x},${island.y}';
          expect(positions.contains(pos), isFalse,
              reason: 'Duplicate island position at $pos');
          positions.add(pos);
        }
      });

      test('board has a solution', () {
        final board = engine.generateBoard();
        expect(board.solution, isNotNull);
      });
    });
  });
}
