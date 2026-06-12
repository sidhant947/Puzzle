import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/vowel_reconstruct/vowel_reconstruct_engine.dart';

void main() {
  group('VowelReconstructEngine', () {
    late VowelReconstructEngine engine;

    setUp(() {
      engine = VowelReconstructEngine();
    });

    test('generatePuzzle returns valid puzzle', () {
      final puzzle = engine.generatePuzzle();
      expect(puzzle.originalSentence, isNotEmpty);
      expect(puzzle.maskedSentence, isNotEmpty);
      expect(puzzle.vowels, isNotEmpty);
    });

    test('original sentence is uppercase', () {
      final puzzle = engine.generatePuzzle();
      expect(puzzle.originalSentence, puzzle.originalSentence.toUpperCase());
    });

    test('masked sentence has underscores where vowels were', () {
      final puzzle = engine.generatePuzzle();
      final vowels = ['A', 'E', 'I', 'O', 'U'];
      for (int i = 0; i < puzzle.originalSentence.length; i++) {
        final originalChar = puzzle.originalSentence[i];
        final maskedChar = puzzle.maskedSentence[i];
        if (vowels.contains(originalChar)) {
          expect(maskedChar, '_');
        } else {
          expect(maskedChar, originalChar);
        }
      }
    });

    test('masked sentence preserves non-vowel characters and length', () {
      final puzzle = engine.generatePuzzle();
      expect(puzzle.maskedSentence.length, puzzle.originalSentence.length);
    });

    test('vowels list contains only AEIOU', () {
      final puzzle = engine.generatePuzzle();
      final validVowels = {'A', 'E', 'I', 'O', 'U'};
      for (final v in puzzle.vowels) {
        expect(validVowels, contains(v));
      }
    });

    test('number of vowels equals number of underscores in masked sentence', () {
      final puzzle = engine.generatePuzzle();
      final underscoreCount = puzzle.maskedSentence.split('').where((c) => c == '_').length;
      expect(puzzle.vowels.length, underscoreCount);
    });

    test('multiple calls produce different puzzles', () {
      final sentences = <String>{};
      for (int i = 0; i < 20; i++) {
        sentences.add(engine.generatePuzzle().originalSentence);
      }
      expect(sentences.length, greaterThan(1));
    });
  });
}
