import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/typing_speed/typing_speed_engine.dart';

void main() {
  group('TypingSpeedEngine', () {
    late TypingSpeedEngine engine;

    setUp(() {
      engine = TypingSpeedEngine();
    });

    group('getRandomPhrase', () {
      test('returns a non-empty string', () {
        final phrase = engine.getRandomPhrase();
        expect(phrase, isNotEmpty);
      });

      test('returns uppercase strings', () {
        for (int i = 0; i < 20; i++) {
          final phrase = engine.getRandomPhrase();
          expect(phrase, equals(phrase.toUpperCase()));
        }
      });

      test('produces varied phrases', () {
        final phrases = <String>{};
        for (int i = 0; i < 50; i++) {
          phrases.add(engine.getRandomPhrase());
        }
        expect(phrases.length, greaterThan(1));
      });
    });

    group('calculateWPM', () {
      test('returns 0 for zero seconds', () {
        expect(engine.calculateWPM(100, 0), 0.0);
      });

      test('returns 0 for negative seconds', () {
        expect(engine.calculateWPM(100, -1), 0.0);
      });

      test('calculates correct WPM', () {
        // 25 correct chars in 60 seconds = 5 WPM
        expect(engine.calculateWPM(25, 60), 5.0);
      });

      test('calculates WPM for 100 chars in 30 seconds', () {
        // (100/5) / (30/60) = 20 / 0.5 = 40 WPM
        expect(engine.calculateWPM(100, 30), 40.0);
      });

      test('returns 0 for zero correct chars', () {
        expect(engine.calculateWPM(0, 60), 0.0);
      });

      test('higher correct chars means higher WPM', () {
        final wpm1 = engine.calculateWPM(25, 60);
        final wpm2 = engine.calculateWPM(50, 60);
        expect(wpm2, greaterThan(wpm1));
      });
    });

    group('countCorrectChars', () {
      test('counts all correct for identical strings', () {
        expect(engine.countCorrectChars('HELLO', 'HELLO'), 5);
      });

      test('counts matching characters', () {
        expect(engine.countCorrectChars('HXXLX', 'HELLO'), 2);
      });

      test('returns 0 for no matches', () {
        expect(engine.countCorrectChars('AAAA', 'BBBB'), 0);
      });

      test('is case insensitive', () {
        expect(engine.countCorrectChars('hello', 'HELLO'), 5);
      });

      test('handles different length inputs', () {
        expect(engine.countCorrectChars('HEL', 'HELLO'), 3);
      });

      test('handles empty strings', () {
        expect(engine.countCorrectChars('', 'HELLO'), 0);
      });

      test('handles both empty strings', () {
        expect(engine.countCorrectChars('', ''), 0);
      });

      test('handles input longer than target', () {
        expect(engine.countCorrectChars('HELLO WORLD', 'HELLO'), 5);
      });
    });
  });
}
