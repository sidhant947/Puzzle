import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/rhyme_master/rhyme_master_engine.dart';

void main() {
  group('RhymeMasterEngine', () {
    late RhymeMasterEngine engine;

    setUp(() {
      engine = RhymeMasterEngine();
    });

    group('generatePuzzle', () {
      test('returns a RhymeMasterPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<RhymeMasterPuzzle>());
      });

      test('target word is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.targetWord.isNotEmpty, isTrue);
      });

      test('rhymes list is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.allRhymes.isNotEmpty, isTrue);
      });

      test('target word is uppercase', () {
        for (int i = 0; i < 10; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.targetWord, equals(puzzle.targetWord.toUpperCase()));
        }
      });

      test('all rhymes are uppercase', () {
        final puzzle = engine.generatePuzzle();
        for (final rhyme in puzzle.allRhymes) {
          expect(rhyme, equals(rhyme.toUpperCase()));
        }
      });
    });

    group('isRhyme', () {
      test('returns true for valid rhymes', () {
        final puzzle = engine.generatePuzzle();
        for (final rhyme in puzzle.allRhymes) {
          expect(engine.isRhyme(puzzle.targetWord, rhyme, puzzle.allRhymes),
              isTrue);
        }
      });

      test('returns false for non-rhyming words', () {
        final puzzle = engine.generatePuzzle();
        expect(
          engine.isRhyme(puzzle.targetWord, 'ZZZZZ', puzzle.allRhymes),
          isFalse,
        );
      });

      test('is case-insensitive', () {
        final puzzle = engine.generatePuzzle();
        final firstRhyme = puzzle.allRhymes.first.toLowerCase();
        expect(
          engine.isRhyme(puzzle.targetWord, firstRhyme, puzzle.allRhymes),
          isTrue,
        );
      });

      test('handles whitespace', () {
        final puzzle = engine.generatePuzzle();
        final firstRhyme = '  ${puzzle.allRhymes.first}  ';
        expect(
          engine.isRhyme(puzzle.targetWord, firstRhyme, puzzle.allRhymes),
          isTrue,
        );
      });
    });
  });
}
