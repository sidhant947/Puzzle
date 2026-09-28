import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/klotski/klotski_engine.dart';

void main() {
  group('KlotskiEngine', () {
    test('has multiple levels', () {
      expect(KlotskiEngine.levels.length, greaterThan(1));
    });

    test('all levels contain a hero block', () {
      for (final level in KlotskiEngine.levels) {
        expect(level.any((b) => b.id == 'hero'), isTrue);
      }
    });

    test('getRandomLayout returns a copy', () {
      final layout1 = KlotskiEngine.getRandomLayout();
      final layout2 = KlotskiEngine.getRandomLayout();
      expect(layout1, isNotEmpty);
      expect(layout2, isNotEmpty);
    });

    test('isSolved returns true only when hero is at (1,3)', () {
      final solved = [
        KlotskiBlock(id: 'hero', width: 2, height: 2, x: 1, y: 3),
      ];
      final notSolved = [
        KlotskiBlock(id: 'hero', width: 2, height: 2, x: 1, y: 2),
      ];
      expect(KlotskiEngine.isSolved(solved), isTrue);
      expect(KlotskiEngine.isSolved(notSolved), isFalse);
    });

    test('levels are solvable', () {
      for (final level in KlotskiEngine.levels) {
        expect(KlotskiEngine.isSolvable(level), isTrue);
      }
    });
  });
}
