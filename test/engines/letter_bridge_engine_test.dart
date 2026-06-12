import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/letter_bridge/letter_bridge_engine.dart';

void main() {
  group('LetterBridgeEngine', () {
    late LetterBridgeEngine engine;

    setUp(() {
      engine = LetterBridgeEngine();
    });

    group('getRandomPuzzle', () {
      test('returns puzzle with first, second, and bridge', () {
        final puzzle = engine.getRandomPuzzle();
        expect(puzzle.containsKey('first'), isTrue);
        expect(puzzle.containsKey('second'), isTrue);
        expect(puzzle.containsKey('bridge'), isTrue);
      });

      test('first and second are non-empty strings', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.getRandomPuzzle();
          expect((puzzle['first'] as String).isNotEmpty, isTrue);
          expect((puzzle['second'] as String).isNotEmpty, isTrue);
        }
      });

      test('bridge is a single letter', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.getRandomPuzzle();
          final bridge = puzzle['bridge'] as String;
          expect(bridge.length, equals(1));
        }
      });

      test('generates different puzzles (statistically)', () {
        final results = <String>{};
        for (int i = 0; i < 30; i++) {
          final puzzle = engine.getRandomPuzzle();
          results.add('${puzzle['first']}-${puzzle['second']}');
        }
        expect(results.length, greaterThan(1));
      });
    });

    group('isCorrect', () {
      test('returns true for matching bridge (case insensitive)', () {
        expect(engine.isCorrect('T', 't'), isTrue);
        expect(engine.isCorrect('A', 'A'), isTrue);
        expect(engine.isCorrect('Z', 'z'), isTrue);
      });

      test('returns false for non-matching bridge', () {
        expect(engine.isCorrect('T', 'A'), isFalse);
        expect(engine.isCorrect('X', 'Y'), isFalse);
      });
    });
  });
}
