import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/consonant_reconstruct/consonant_reconstruct_engine.dart';

void main() {
  group('ConsonantReconstructEngine', () {
    late ConsonantReconstructEngine engine;

    setUp(() {
      engine = ConsonantReconstructEngine();
    });

    group('generatePuzzle', () {
      test('returns a ConsonantReconstructPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<ConsonantReconstructPuzzle>());
      });

      test('original sentence is uppercase', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.originalSentence, equals(puzzle.originalSentence.toUpperCase()));
      });

      test('masked sentence has same length as original', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.maskedSentence.length, puzzle.originalSentence.length);
      });

      test('vowels remain in masked sentence', () {
        final puzzle = engine.generatePuzzle();
        for (int i = 0; i < puzzle.originalSentence.length; i++) {
          final origChar = puzzle.originalSentence[i];
          final maskedChar = puzzle.maskedSentence[i];
          if ('AEIOU'.contains(origChar)) {
            expect(maskedChar, origChar,
                reason: 'Vowel $origChar should remain');
          }
        }
      });

      test('consonants are replaced with underscores', () {
        final puzzle = engine.generatePuzzle();
        for (int i = 0; i < puzzle.originalSentence.length; i++) {
          final origChar = puzzle.originalSentence[i];
          final maskedChar = puzzle.maskedSentence[i];
          if (RegExp(r'[A-Z]').hasMatch(origChar) && !'AEIOU'.contains(origChar)) {
            expect(maskedChar, '_',
                reason: 'Consonant $origChar should be replaced');
          }
        }
      });

      test('non-alpha characters remain unchanged', () {
        final puzzle = engine.generatePuzzle();
        for (int i = 0; i < puzzle.originalSentence.length; i++) {
          final origChar = puzzle.originalSentence[i];
          if (!RegExp(r'[A-Z]').hasMatch(origChar)) {
            expect(puzzle.maskedSentence[i], origChar);
          }
        }
      });

      test('consonants list contains only consonants', () {
        final puzzle = engine.generatePuzzle();
        for (final c in puzzle.consonants) {
          expect(RegExp(r'[BCDFGHJKLMNPQRSTVWXYZ]').hasMatch(c), isTrue);
        }
      });

      test('consonants count matches underscore count in masked', () {
        final puzzle = engine.generatePuzzle();
        int underscoreCount = 0;
        for (final c in puzzle.maskedSentence.split('')) {
          if (c == '_') underscoreCount++;
        }
        expect(puzzle.consonants.length, underscoreCount);
      });
    });
  });

  group('ConsonantReconstructPuzzle', () {
    test('stores all fields', () {
      final puzzle = ConsonantReconstructPuzzle(
        originalSentence: 'TEST SENTENCE',
        maskedSentence: 'T_S_ S_NT_NC_',
        consonants: ['T', 'S', 'T', 'S', 'N', 'T', 'N', 'C'],
      );
      expect(puzzle.originalSentence, 'TEST SENTENCE');
      expect(puzzle.maskedSentence, 'T_S_ S_NT_NC_');
      expect(puzzle.consonants.length, 8);
    });
  });
}
