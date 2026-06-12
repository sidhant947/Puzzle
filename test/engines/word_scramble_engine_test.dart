import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/word_scramble/word_scramble_engine.dart';

void main() {
  group('WordScrambleEngine', () {
    late WordScrambleEngine engine;

    setUp(() {
      engine = WordScrambleEngine();
    });

    test('minWordLength is 4', () {
      expect(WordScrambleEngine.minWordLength, 4);
    });

    test('maxWordLength is 8', () {
      expect(WordScrambleEngine.maxWordLength, 8);
    });

    test('getRandomWord returns a word from the list', () {
      final words = ['APPLE', 'BANANA', 'CHERRY'];
      final word = engine.getRandomWord(words);
      expect(words, contains(word));
    });

    test('getRandomWord returns APPLE for empty list', () {
      expect(engine.getRandomWord([]), 'APPLE');
    });

    group('scrambleWord', () {
      test('returns a different arrangement', () {
        final scrambled = engine.scrambleWord('TEST');
        expect(scrambled.length, 4);
        expect(scrambled.split('').toSet().length, 3);
      });

      test('contains same letters as original', () {
        final original = 'HELLO';
        final scrambled = engine.scrambleWord(original);
        expect((scrambled.split('')..sort()).join(), (original.split('')..sort()).join());
      });

      test('does not return same word (for length > 1)', () {
        int sameCount = 0;
        for (int i = 0; i < 50; i++) {
          if (engine.scrambleWord('TEST') == 'TEST') sameCount++;
        }
        expect(sameCount, lessThan(50));
      });
    });

    group('checkGuess', () {
      test('returns true for exact match', () {
        expect(engine.checkGuess('APPLE', 'APPLE', ['APPLE']), isTrue);
      });

      test('returns true for valid anagram in wordList', () {
        expect(engine.checkGuess('PAPLE', 'APPLE', ['APPLE', 'PAPLE']), isTrue);
      });

      test('returns false for wrong guess not in wordList', () {
        expect(engine.checkGuess('BANANA', 'APPLE', ['APPLE']), isFalse);
      });

      test('returns false for anagram not in wordList', () {
        expect(engine.checkGuess('PAPLE', 'APPLE', ['APPLE']), isFalse);
      });

      test('is case insensitive', () {
        expect(engine.checkGuess('apple', 'APPLE', ['APPLE']), isTrue);
      });
    });
  });
}
