import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/semantic_link/semantic_link_engine.dart';

void main() {
  group('SemanticLinkEngine', () {
    late SemanticLinkEngine engine;

    setUp(() {
      engine = SemanticLinkEngine();
    });

    group('generatePuzzle', () {
      test('returns a SemanticLinkPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<SemanticLinkPuzzle>());
      });

      test('puzzle has exactly 3 clue words', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.words.length, 3);
      });

      test('puzzle has exactly 4 options', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.length, 4);
      });

      test('answer is one of the options', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options, contains(puzzle.answer));
      });

      test('options contain no duplicates', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.toSet().length, 4);
      });

      test('clue words are non-empty strings', () {
        final puzzle = engine.generatePuzzle();
        for (final word in puzzle.words) {
          expect(word.isNotEmpty, true);
        }
      });

      test('options are shuffled (not always in original order)', () {
        final results = List.generate(20, (_) {
          final p = engine.generatePuzzle();
          return p.options.indexOf(p.answer);
        });
        // The answer should not always be at index 0 (original order)
        final alwaysFirst = results.every((i) => i == 0);
        expect(alwaysFirst, false);
      });
    });

    group('known puzzles', () {
      test('Apple/Print/Board links to Finger', () {
        // Search through multiple generated puzzles for this specific one
        final puzzles = List.generate(100, (_) => engine.generatePuzzle());
        final match = puzzles.where((p) =>
            p.words.contains('Apple') &&
            p.words.contains('Print') &&
            p.words.contains('Board'));
        if (match.isNotEmpty) {
          expect(match.first.answer, 'Finger');
        }
      });

      test('all puzzles have answer in options', () {
        // Generate many puzzles and verify invariant
        for (int i = 0; i < 50; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.options, contains(puzzle.answer),
              reason: 'Answer "${puzzle.answer}" not found in options ${puzzle.options}');
        }
      });
    });
  });

  group('SemanticLinkPuzzle', () {
    test('stores words, answer, and options correctly', () {
      final puzzle = SemanticLinkPuzzle(
        words: ['A', 'B', 'C'],
        answer: 'X',
        options: ['X', 'Y', 'Z', 'W'],
      );
      expect(puzzle.words, ['A', 'B', 'C']);
      expect(puzzle.answer, 'X');
      expect(puzzle.options.length, 4);
    });
  });
}
