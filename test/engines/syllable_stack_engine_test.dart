import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/syllable_stack/syllable_stack_engine.dart';

void main() {
  group('SyllableStackEngine', () {
    late SyllableStackEngine engine;

    setUp(() {
      engine = SyllableStackEngine();
    });

    group('generatePuzzle', () {
      test('returns a SyllableStackPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<SyllableStackPuzzle>());
      });

      test('word is non-empty string', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.word.isNotEmpty, isTrue);
      });

      test('syllables list is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.syllables.isNotEmpty, isTrue);
      });

      test('shuffledSyllables has same length as syllables', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.shuffledSyllables.length, puzzle.syllables.length);
      });

      test('shuffledSyllables contains same elements as syllables', () {
        final puzzle = engine.generatePuzzle();
        final sortedOriginal = List<String>.from(puzzle.syllables)..sort();
        final sortedShuffled = List<String>.from(puzzle.shuffledSyllables)..sort();
        expect(sortedShuffled, sortedOriginal);
      });

      test('syllables concatenated equal the word', () {
        final puzzle = engine.generatePuzzle();
        final concatenated = puzzle.syllables.join();
        expect(concatenated, puzzle.word);
      });

      test('word is all uppercase', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.word, puzzle.word.toUpperCase());
      });

      test('each syllable is non-empty', () {
        final puzzle = engine.generatePuzzle();
        for (final syllable in puzzle.syllables) {
          expect(syllable.isNotEmpty, isTrue);
        }
      });

      test('generates puzzles from different words', () {
        final words = <String>{};
        for (int i = 0; i < 30; i++) {
          words.add(engine.generatePuzzle().word);
        }
        expect(words.length, greaterThan(1));
      });
    });
  });
}
