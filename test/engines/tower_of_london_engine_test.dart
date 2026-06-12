import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/tower_of_london/tower_of_london_engine.dart';

void main() {
  group('TowerOfLondonEngine', () {
    late TowerOfLondonEngine engine;

    setUp(() {
      engine = TowerOfLondonEngine();
    });

    group('generateRandomConfig', () {
      test('returns 3 pegs', () {
        final config = engine.generateRandomConfig();
        expect(config.length, 3);
      });

      test('total beads across all pegs is 3', () {
        final config = engine.generateRandomConfig();
        final total = config.fold<int>(0, (sum, peg) => sum + peg.length);
        expect(total, 3);
      });

      test('peg 0 has max 3 beads', () {
        for (int i = 0; i < 20; i++) {
          final config = engine.generateRandomConfig();
          expect(config[0].length, lessThanOrEqualTo(3));
        }
      });

      test('peg 1 has max 2 beads', () {
        for (int i = 0; i < 20; i++) {
          final config = engine.generateRandomConfig();
          expect(config[1].length, lessThanOrEqualTo(2));
        }
      });

      test('peg 2 has max 1 bead', () {
        for (int i = 0; i < 20; i++) {
          final config = engine.generateRandomConfig();
          expect(config[2].length, lessThanOrEqualTo(1));
        }
      });
    });

    group('isSolved', () {
      test('returns true for identical configs', () {
        final List<List<int>> config = [[1, 2], [3], []];
        expect(engine.isSolved(config, config), isTrue);
      });

      test('returns false for different configs', () {
        final List<List<int>> start = [[1, 2, 3], [], []];
        final List<List<int>> target = [[], [1, 2, 3], []];
        expect(engine.isSolved(start, target), isFalse);
      });

      test('returns true for deep equal configs', () {
        final List<List<int>> a = [[1], [2], [3]];
        final List<List<int>> b = [[1], [2], [3]];
        expect(engine.isSolved(a, b), isTrue);
      });
    });

    group('canMove', () {
      test('returns false when from equals to', () {
        final List<List<int>> config = [[1, 2], [3], []];
        expect(engine.canMove(config, 0, 0), isFalse);
      });

      test('returns false when source peg is empty', () {
        final List<List<int>> config = [[], [1, 2], [3]];
        expect(engine.canMove(config, 0, 2), isFalse);
      });

      test('returns true for valid move from peg 0 to peg 2', () {
        final List<List<int>> config = [[1, 2, 3], [], []];
        expect(engine.canMove(config, 0, 2), isTrue);
      });

      test('returns false when target peg is full', () {
        final List<List<int>> config = [[1, 2], [3], [4]];
        expect(engine.canMove(config, 0, 2), isFalse);
      });

      test('returns false when peg 1 is full (2 beads)', () {
        final List<List<int>> config = [[1], [2, 3], []];
        expect(engine.canMove(config, 0, 1), isFalse);
      });
    });

    group('move', () {
      test('moves bead from one peg to another', () {
        final List<List<int>> config = [[1, 2, 3], [], []];
        final next = engine.move(config, 0, 2);
        expect(next[0], [1, 2]);
        expect(next[2], [3]);
      });

      test('does not mutate original config', () {
        final List<List<int>> config = [[1, 2, 3], [], []];
        engine.move(config, 0, 1);
        expect(config[0].length, 3);
      });

      test('moves bead to empty peg', () {
        final List<List<int>> config = [[3], [2], [1]];
        final next = engine.move(config, 2, 0);
        expect(next[2], isEmpty);
        expect(next[0].contains(1), isTrue);
      });
    });

    group('solve', () {
      test('returns 0 for already solved config', () {
        final List<List<int>> config = [[1, 2, 3], [], []];
        expect(engine.solve(config, config), 0);
      });

      test('returns 1 for single-move solution', () {
        final List<List<int>> start = [[1, 2], [3], []];
        final List<List<int>> target = [[1, 2], [], [3]];
        expect(engine.solve(start, target), 1);
      });

      test('returns positive moves for complex puzzle', () {
        final List<List<int>> start = [[1, 2, 3], [], []];
        final List<List<int>> target = [[], [1, 2], [3]];
        final moves = engine.solve(start, target);
        expect(moves, greaterThan(0));
      });
    });

    group('generatePuzzle', () {
      test('returns start and target', () {
        final puzzle = engine.generatePuzzle(minMoves: 3);
        expect(puzzle, contains('start'));
        expect(puzzle, contains('target'));
      });

      test('start and target are different', () {
        final puzzle = engine.generatePuzzle(minMoves: 1);
        expect(engine.isSolved(puzzle['start']!, puzzle['target']!), isFalse);
      });
    });
  });
}
