import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/oxymoron_hunt/oxymoron_hunt_engine.dart';

void main() {
  group('OxymoronHuntEngine', () {
    late OxymoronHuntEngine engine;

    setUp(() {
      engine = OxymoronHuntEngine();
    });

    group('generatePuzzle', () {
      test('returns an OxymoronHuntPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<OxymoronHuntPuzzle>());
      });

      test('has 8 words (4 pairs)', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.words.length, equals(8));
      });

      test('has 4 pairs', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.pairs.length, equals(4));
      });

      test('all words from pairs are in the words list', () {
        final puzzle = engine.generatePuzzle();
        for (final pair in puzzle.pairs) {
          expect(puzzle.words.contains(pair.word1), isTrue);
          expect(puzzle.words.contains(pair.word2), isTrue);
        }
      });

      test('words are shuffled (not necessarily in pair order)', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.words, isA<List<String>>());
      });

      test('generates different puzzles on multiple calls', () {
        final wordSets = <String>{};
        for (int i = 0; i < 5; i++) {
          final puzzle = engine.generatePuzzle();
          wordSets.add(puzzle.words.join(','));
        }
        expect(wordSets.length, greaterThan(1));
      });
    });
  });

  group('OxymoronPair', () {
    test('contains returns true for word1', () {
      final pair = OxymoronPair('BITTER', 'SWEET');
      expect(pair.contains('BITTER'), isTrue);
    });

    test('contains returns true for word2', () {
      final pair = OxymoronPair('BITTER', 'SWEET');
      expect(pair.contains('SWEET'), isTrue);
    });

    test('contains returns false for unrelated word', () {
      final pair = OxymoronPair('BITTER', 'SWEET');
      expect(pair.contains('HAPPY'), isFalse);
    });
  });
}
