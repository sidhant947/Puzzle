import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/find_word/find_word_engine.dart';

void main() {
  group('FindWordEngine', () {
    late FindWordEngine engine;

    setUp(() {
      engine = FindWordEngine();
    });

    group('constants', () {
      test('maxTries is 6', () {
        expect(FindWordEngine.maxTries, 6);
      });

      test('wordLength is 5', () {
        expect(FindWordEngine.wordLength, 5);
      });
    });

    group('getRandomWord', () {
      test('returns a word from the set', () {
        final words = {'APPLE', 'BRAIN', 'CHAIR', 'DANCE', 'EARTH'};
        final word = engine.getRandomWord(words);
        expect(words.contains(word), isTrue);
      });

      test('returns APPLE for empty set', () {
        expect(engine.getRandomWord({}), 'APPLE');
      });
    });

    group('checkGuess', () {
      test('all correct spots for exact match', () {
        final result = engine.checkGuess('HELLO', 'HELLO');
        expect(result, List.filled(5, LetterStatus.correctSpot));
      });

      test('all notInWord when no letters match', () {
        final result = engine.checkGuess('AAA', 'BBB');
        expect(result.every((s) => s == LetterStatus.notInWord), isTrue);
      });

      test('mixed correct and notInWord', () {
        final result = engine.checkGuess('HELLO', 'HXLXO');
        expect(result[0], LetterStatus.correctSpot);
        expect(result[1], LetterStatus.notInWord);
        expect(result[2], LetterStatus.correctSpot);
        expect(result[3], LetterStatus.notInWord);
        expect(result[4], LetterStatus.correctSpot);
      });

      test('handles duplicate letters correctly', () {
        final result = engine.checkGuess('SPEED', 'STEED');
        expect(result[0], LetterStatus.correctSpot);
        expect(result[1], LetterStatus.notInWord);
        expect(result[2], LetterStatus.correctSpot);
        expect(result[3], LetterStatus.correctSpot);
        expect(result[4], LetterStatus.correctSpot);
      });

      test('returns notInWord for wrong length', () {
        final result = engine.checkGuess('HI', 'HELLO');
        expect(result.every((s) => s == LetterStatus.notInWord), isTrue);
      });

      test('correctSpot is prioritized over wrongSpot', () {
        final result = engine.checkGuess('EERIE', 'ERASE');
        expect(result[0], LetterStatus.correctSpot);
        expect(result[1], LetterStatus.notInWord);
        expect(result[2], LetterStatus.wrongSpot);
        expect(result[3], LetterStatus.notInWord);
        expect(result[4], LetterStatus.correctSpot);
      });
    });
  });
}
