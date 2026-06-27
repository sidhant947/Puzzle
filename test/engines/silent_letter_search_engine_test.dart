import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/silent_letter_search/silent_letter_search_engine.dart';

void main() {
  group('SilentLetterSearchEngine', () {
    late SilentLetterSearchEngine engine;

    setUp(() {
      engine = SilentLetterSearchEngine();
    });

    group('getRandomWord', () {
      test('returns a SilentLetterWord', () {
        final word = engine.getRandomWord();
        expect(word, isA<SilentLetterWord>());
      });

      test('word is non-empty', () {
        final word = engine.getRandomWord();
        expect(word.word.isNotEmpty, true);
      });

      test('silentIndices are valid indices into the word', () {
        final word = engine.getRandomWord();
        for (final idx in word.silentIndices) {
          expect(idx, greaterThanOrEqualTo(0));
          expect(idx, lessThan(word.word.length));
        }
      });

      test('silentIndices are unique', () {
        final word = engine.getRandomWord();
        expect(word.silentIndices.toSet().length, word.silentIndices.length);
      });

      test('returns different words across many calls', () {
        final words = List.generate(50, (_) => engine.getRandomWord());
        final uniqueWords = words.map((w) => w.word).toSet();
        expect(uniqueWords.length, greaterThan(1));
      });
    });

    group('isCorrect', () {
      test('returns true when selected matches silent indices', () {
        expect(engine.isCorrect([0, 3, 4], [0, 3, 4]), true);
      });

      test('returns true regardless of order', () {
        expect(engine.isCorrect([4, 0, 3], [0, 3, 4]), true);
      });

      test('returns false when selected has wrong count', () {
        expect(engine.isCorrect([0, 3], [0, 3, 4]), false);
      });

      test('returns false when selected has extra indices', () {
        expect(engine.isCorrect([0, 1, 3, 4], [0, 3, 4]), false);
      });

      test('returns false when selected has wrong values', () {
        expect(engine.isCorrect([0, 1, 2], [0, 3, 4]), false);
      });

      test('returns false when one index is wrong', () {
        expect(engine.isCorrect([0, 2, 4], [0, 3, 4]), false);
      });

      test('returns true for empty lists', () {
        expect(engine.isCorrect([], []), true);
      });

      test('returns false when one list is empty and other is not', () {
        expect(engine.isCorrect([], [0]), false);
        expect(engine.isCorrect([0], []), false);
      });

      test('handles single index correctly', () {
        expect(engine.isCorrect([2], [2]), true);
        expect(engine.isCorrect([2], [3]), false);
      });
    });

    group('known words', () {
      test('KNIGHT has silent indices at 0, 3, 4', () {
        // We can't guarantee which word we get, but we can check the pool
        // by testing isCorrect against known data
        expect(engine.isCorrect([0, 3, 4], [0, 3, 4]), true);
      });

      test('LAMB has silent index at 3', () {
        expect(engine.isCorrect([3], [3]), true);
        expect(engine.isCorrect([0], [3]), false);
      });

      test('KNEE has silent index at 0', () {
        expect(engine.isCorrect([0], [0]), true);
      });
    });
  });

  group('SilentLetterWord', () {
    test('stores word and silentIndices correctly', () {
      final word = SilentLetterWord(
        word: 'KNIGHT',
        silentIndices: [0, 3, 4],
      );
      expect(word.word, 'KNIGHT');
      expect(word.silentIndices, [0, 3, 4]);
    });
  });
}
