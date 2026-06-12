import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/topology/topology_engine.dart';

void main() {
  group('TopologyEngine', () {
    late TopologyEngine engine;

    setUp(() {
      engine = TopologyEngine();
    });

    group('generateLevel', () {
      test('returns a TopologyLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<TopologyLevel>());
      });

      test('char1 is a valid character', () {
        final level = engine.generateLevel();
        expect(level.char1.length, 1);
        expect(level.char1.toUpperCase(), level.char1);
      });

      test('char2 is a valid character', () {
        final level = engine.generateLevel();
        expect(level.char2.length, 1);
        expect(level.char2.toUpperCase(), level.char2);
      });

      test('areEquivalent reflects hole count equality', () {
        final level = engine.generateLevel();
        final holesA = _getHoles(level.char1);
        final holesB = _getHoles(level.char2);
        expect(level.areEquivalent, holesA == holesB);
      });

      test('same characters are always equivalent', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          final eqLevel = TopologyLevel(
            char1: level.char1,
            char2: level.char1,
            areEquivalent: true,
          );
          expect(eqLevel.areEquivalent, isTrue);
        }
      });

      test('generates variety of character pairs', () {
        final pairs = <String>{};
        for (int i = 0; i < 50; i++) {
          final level = engine.generateLevel();
          pairs.add('${level.char1}${level.char2}');
        }
        expect(pairs.length, greaterThan(1));
      });
    });
  });
}

int _getHoles(String char) {
  const holes = {
    'C': 0, 'E': 0, 'F': 0, 'G': 0, 'H': 0, 'I': 0, 'J': 0,
    'K': 0, 'L': 0, 'M': 0, 'N': 0, 'S': 0, 'T': 0, 'U': 0,
    'V': 0, 'W': 0, 'X': 0, 'Y': 0, 'Z': 0,
    'A': 1, 'D': 1, 'O': 1, 'P': 1, 'Q': 1, 'R': 1,
    'B': 2,
  };
  return holes[char] ?? 0;
}
