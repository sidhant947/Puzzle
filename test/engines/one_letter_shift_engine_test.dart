import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/one_letter_shift/one_letter_shift_engine.dart';

void main() {
  group('OneLetterShiftEngine', () {
    late OneLetterShiftEngine engine;

    setUp(() {
      engine = OneLetterShiftEngine();
    });

    group('getRandomPuzzle', () {
      test('returns a map with start, end, and hint', () {
        final puzzle = engine.getRandomPuzzle();
        expect(puzzle.containsKey('start'), isTrue);
        expect(puzzle.containsKey('end'), isTrue);
        expect(puzzle.containsKey('hint'), isTrue);
      });

      test('start and end words are 5 characters', () {
        for (int i = 0; i < 10; i++) {
          final puzzle = engine.getRandomPuzzle();
          expect((puzzle['start'] as String).length, equals(5));
          expect((puzzle['end'] as String).length, equals(5));
        }
      });

      test('start and end are different words', () {
        for (int i = 0; i < 10; i++) {
          final puzzle = engine.getRandomPuzzle();
          expect(puzzle['start'], isNot(equals(puzzle['end'])));
        }
      });

      test('hint is non-empty', () {
        final puzzle = engine.getRandomPuzzle();
        expect((puzzle['hint'] as String).isNotEmpty, isTrue);
      });
    });

    group('isCorrect', () {
      test('returns true for matching words (case insensitive)', () {
        expect(engine.isCorrect('STARE', 'stare'), isTrue);
        expect(engine.isCorrect('STARE', 'STARE'), isTrue);
        expect(engine.isCorrect('stare', 'STARE'), isTrue);
      });

      test('returns false for non-matching words', () {
        expect(engine.isCorrect('STARE', 'HEART'), isFalse);
        expect(engine.isCorrect('STARE', 'STARS'), isFalse);
      });
    });
  });
}
