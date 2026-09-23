import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/nurikabe/nurikabe_engine.dart';

void main() {
  group('NurikabeEngine', () {
    late NurikabeEngine engine;

    setUp(() {
      engine = NurikabeEngine();
    });

    test('generateLevel returns a 5x5 grid with clues', () {
      final level = engine.generateLevel(size: 5);
      expect(level['grid'], isA<List<List<int>>>());
      final grid = level['grid'] as List<List<int>>;
      expect(grid.length, 5);
      for (final row in grid) {
        expect(row.length, 5);
      }
    });

    test('fallback grid is solvable and valid', () {
      final solution = [
        [2, 0, -1, -1, -1],
        [-1, -1, -1, 3, -1],
        [-1, 1, -1, 0, -1],
        [-1, -1, -1, 0, -1],
        [2, 0, -1, -1, 1],
      ];
      expect(NurikabeEngine.checkVictoryWrapper({'grid': solution}), isTrue);
    });

    test('checkVictoryWrapper detects 2x2 sea', () {
      final invalid2x2Sea = [
        [-1, -1, 0, 0, 0],
        [-1, -1, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
      ];
      expect(NurikabeEngine.checkVictoryWrapper({'grid': invalid2x2Sea}), isFalse);
    });

    test('checkVictoryWrapper detects disconnected sea', () {
      final disconnectedSea = [
        [-1, 0, 0, 0, -1],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
      ];
      expect(NurikabeEngine.checkVictoryWrapper({'grid': disconnectedSea}), isFalse);
    });
  });
}
