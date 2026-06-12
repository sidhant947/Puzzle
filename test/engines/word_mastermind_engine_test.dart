import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/word_mastermind/word_mastermind_engine.dart';

void main() {
  group('WordMastermindEngine', () {
    late WordMastermindEngine engine;

    setUp(() {
      engine = WordMastermindEngine();
    });

    test('wordLength is 4', () {
      expect(WordMastermindEngine.wordLength, 4);
    });

    test('maxTries is 10', () {
      expect(WordMastermindEngine.maxTries, 10);
    });

    test('getRandomWord returns a 4-letter word', () {
      final word = engine.getRandomWord();
      expect(word.length, 4);
      expect(word, word.toUpperCase());
    });

    group('checkGuess', () {
      test('returns 4 bulls for exact match', () {
        final result = engine.checkGuess('BLUE', 'BLUE');
        expect(result[0], 4);
        expect(result[1], 0);
      });

      test('returns 0 bulls and 0 cows for completely different words', () {
        final result = engine.checkGuess('BLUE', 'MIND');
        expect(result[0], 0);
        expect(result[1], 0);
      });

      test('counts bulls correctly', () {
        final result = engine.checkGuess('B___'.replaceAll('_', 'L'), 'BLUE');
        // BL__ vs BLUE: B=correct, L=correct, _ vs U=wrong, _ vs E=wrong
        expect(result[0], 2);
      });

      test('counts cows correctly', () {
        final result = engine.checkGuess('LUEB', 'BLUE');
        // L in pos 0 vs B: cow (L is in BLUE at pos 1)
        // U in pos 1 vs L: cow (U is in BLUE at pos 2)
        // E in pos 2 vs U: cow (E is in BLUE at pos 3)
        // B in pos 3 vs E: cow (B is in BLUE at pos 0)
        expect(result[1], 4);
        expect(result[0], 0);
      });

      test('handles mixed bulls and cows', () {
        final result = engine.checkGuess('BLUB', 'BLUE');
        // B=correct, L=correct, U=correct, B vs E: no match
        expect(result[0], 3);
        expect(result[1], 0);
      });

      test('handles duplicate letters correctly', () {
        final result = engine.checkGuess('ABBB', 'ABCD');
        // A=correct, B=correct, B vs C: cow? no C in guess. B vs D: no
        expect(result[0], 2);
        expect(result[1], 0);
      });

      test('case insensitive', () {
        final result = engine.checkGuess('blue', 'BLUE');
        expect(result[0], 4);
        expect(result[1], 0);
      });
    });
  });
}
