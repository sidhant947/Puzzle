import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/phonetic_guess/phonetic_guess_engine.dart';

void main() {
  group('PhoneticGuessEngine', () {
    late PhoneticGuessEngine engine;

    setUp(() {
      engine = PhoneticGuessEngine();
    });

    group('getRandomTask', () {
      test('returns a PhoneticTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<PhoneticTask>());
      });

      test('task has a non-empty word', () {
        final task = engine.getRandomTask();
        expect(task.word.isNotEmpty, isTrue);
      });

      test('task has a non-empty IPA', () {
        final task = engine.getRandomTask();
        expect(task.ipa.isNotEmpty, isTrue);
      });

      test('word is uppercase', () {
        for (int i = 0; i < 10; i++) {
          final task = engine.getRandomTask();
          expect(task.word, equals(task.word.toUpperCase()));
        }
      });

      test('returns different tasks on multiple calls', () {
        final words = <String>{};
        for (int i = 0; i < 20; i++) {
          words.add(engine.getRandomTask().word);
        }
        expect(words.length, greaterThan(1));
      });
    });

    group('scrambleWord', () {
      test('result has same length as input', () {
        final scrambled = engine.scrambleWord('APPLE');
        expect(scrambled.length, equals(5));
      });

      test('result contains same characters', () {
        final scrambled = engine.scrambleWord('HELLO');
        final sortedOriginal = 'HELLO'.split('')..sort();
        final sortedScrambled = scrambled.split('')..sort();
        expect(sortedScrambled.join(), equals(sortedOriginal.join()));
      });

      test('scramble changes the word (most of the time)', () {
        int changedCount = 0;
        for (int i = 0; i < 20; i++) {
          if (engine.scrambleWord('HELLO') != 'HELLO') changedCount++;
        }
        expect(changedCount, greaterThan(0));
      });
    });

    group('checkGuess', () {
      test('returns true for exact match', () {
        expect(engine.checkGuess('APPLE', 'APPLE'), isTrue);
      });

      test('returns true for case-insensitive match', () {
        expect(engine.checkGuess('apple', 'APPLE'), isTrue);
      });

      test('returns true with whitespace', () {
        expect(engine.checkGuess('  APPLE  ', 'APPLE'), isTrue);
      });

      test('returns false for wrong guess', () {
        expect(engine.checkGuess('HELLO', 'APPLE'), isFalse);
      });
    });
  });
}
