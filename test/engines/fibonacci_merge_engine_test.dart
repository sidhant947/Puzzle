import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/fibonacci_merge/fibonacci_merge_engine.dart';

void main() {
  group('FibonacciMergeEngine', () {
    late FibonacciMergeEngine engine;

    setUp(() {
      engine = FibonacciMergeEngine();
    });

    group('initBoard', () {
      test('returns exactly 2 tiles', () {
        final tiles = engine.initBoard();
        expect(tiles.length, 2);
      });

      test('tiles have values 1 or 2', () {
        final tiles = engine.initBoard();
        for (final t in tiles) {
          expect(t.value == 1 || t.value == 2, isTrue);
        }
      });

      test('tiles are within the board bounds', () {
        final tiles = engine.initBoard();
        for (final t in tiles) {
          expect(t.x, greaterThanOrEqualTo(0));
          expect(t.x, lessThan(FibonacciMergeEngine.size));
          expect(t.y, greaterThanOrEqualTo(0));
          expect(t.y, lessThan(FibonacciMergeEngine.size));
        }
      });

      test('tiles have unique positions', () {
        final tiles = engine.initBoard();
        final positions = tiles.map((t) => '${t.x},${t.y}').toSet();
        expect(positions.length, 2);
      });
    });

    group('canMerge', () {
      test('1 and 1 can merge', () {
        expect(engine.canMerge(1, 1), isTrue);
      });

      test('1 and 2 can merge', () {
        expect(engine.canMerge(1, 2), isTrue);
        expect(engine.canMerge(2, 1), isTrue);
      });

      test('2 and 3 can merge', () {
        expect(engine.canMerge(2, 3), isTrue);
        expect(engine.canMerge(3, 2), isTrue);
      });

      test('3 and 5 can merge', () {
        expect(engine.canMerge(3, 5), isTrue);
        expect(engine.canMerge(5, 3), isTrue);
      });

      test('5 and 8 can merge', () {
        expect(engine.canMerge(5, 8), isTrue);
        expect(engine.canMerge(8, 5), isTrue);
      });

      test('non-consecutive Fibonacci numbers cannot merge', () {
        expect(engine.canMerge(2, 5), isFalse);
        expect(engine.canMerge(3, 8), isFalse);
        expect(engine.canMerge(1, 3), isFalse);
      });

      test('zero or negative values cannot merge', () {
        expect(engine.canMerge(0, 1), isFalse);
        expect(engine.canMerge(1, 0), isFalse);
        expect(engine.canMerge(-1, 1), isFalse);
      });
    });

    group('move', () {
      test('returns tiles, score, and moved key', () {
        final tiles = engine.initBoard();
        final result = engine.move(tiles, 1, 0);
        expect(result.containsKey('tiles'), isTrue);
        expect(result.containsKey('score'), isTrue);
        expect(result.containsKey('moved'), isTrue);
      });

      test('adds a new tile after a valid move', () {
        final tiles = engine.initBoard();
        final result = engine.move(tiles, 1, 0);
        if (result['moved'] == true) {
          expect((result['tiles'] as List).length, greaterThan(tiles.where((t) => !t.merged).length));
        }
      });
    });

    group('isGameOver', () {
      test('returns false when board is not full', () {
        final tiles = engine.initBoard();
        expect(engine.isGameOver(tiles), isFalse);
      });
    });

    group('fibonacci constant', () {
      test('fibonacci list starts with 1, 1, 2, 3, 5, 8', () {
        expect(FibonacciMergeEngine.fibonacci.take(6).toList(), [1, 1, 2, 3, 5, 8]);
      });

      test('each value is sum of previous two', () {
        final fib = FibonacciMergeEngine.fibonacci;
        for (int i = 2; i < fib.length; i++) {
          expect(fib[i], fib[i - 1] + fib[i - 2]);
        }
      });
    });
  });
}
