import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/sentence_unscramble/sentence_unscramble_engine.dart';

void main() {
  group('SentenceUnscrambleEngine', () {
    late SentenceUnscrambleEngine engine;

    setUp(() {
      engine = SentenceUnscrambleEngine();
    });

    group('generatePuzzle', () {
      test('returns a SentenceUnscramblePuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<SentenceUnscramblePuzzle>());
      });

      test('originalWords is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.originalWords.isNotEmpty, true);
      });

      test('scrambledWords has same length as originalWords', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.scrambledWords.length, puzzle.originalWords.length);
      });

      test('fullSentence is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.fullSentence.isNotEmpty, true);
      });

      test('fullSentence contains all original words joined by spaces', () {
        final puzzle = engine.generatePuzzle();
        final reconstructed = puzzle.originalWords.join(' ');
        expect(puzzle.fullSentence, reconstructed);
      });

      test('original words are uppercase', () {
        final puzzle = engine.generatePuzzle();
        for (final word in puzzle.originalWords) {
          expect(word, word.toUpperCase());
        }
      });

      test('scrambled words contain same words as original', () {
        final puzzle = engine.generatePuzzle();
        final originalSorted = List<String>.from(puzzle.originalWords)..sort();
        final scrambledSorted = List<String>.from(puzzle.scrambledWords)..sort();
        expect(scrambledSorted, originalSorted);
      });

      test('scrambled words are not identical to original (mostly)', () {
        // Generate many and check at least one is actually scrambled
        final allSame = List.generate(20, (_) {
          final p = engine.generatePuzzle();
          return List.generate(p.originalWords.length,
              (i) => p.originalWords[i] == p.scrambledWords[i]).every((b) => b);
        }).every((b) => b);
        expect(allSame, false);
      });

      test('fullSentence has no punctuation', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.fullSentence.contains('.'), false);
        expect(puzzle.fullSentence.contains(','), false);
        expect(puzzle.fullSentence.contains('!'), false);
        expect(puzzle.fullSentence.contains('?'), false);
      });
    });
  });

  group('SentenceUnscramblePuzzle', () {
    test('stores fields correctly', () {
      final puzzle = SentenceUnscramblePuzzle(
        originalWords: ['THE', 'CAT'],
        scrambledWords: ['CAT', 'THE'],
        fullSentence: 'THE CAT',
      );
      expect(puzzle.originalWords, ['THE', 'CAT']);
      expect(puzzle.scrambledWords, ['CAT', 'THE']);
      expect(puzzle.fullSentence, 'THE CAT');
    });
  });
}
