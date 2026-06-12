import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/spelling_sprint/spelling_sprint_engine.dart';

void main() {
  group('SpellingSprintEngine', () {
    late SpellingSprintEngine engine;

    setUp(() {
      engine = SpellingSprintEngine();
    });

    group('getRandomWord', () {
      test('returns a non-empty string', () {
        final word = engine.getRandomWord();
        expect(word.isNotEmpty, isTrue);
      });

      test('returns uppercase letters only', () {
        final word = engine.getRandomWord();
        expect(word, matches(RegExp(r'^[A-Z]+$')));
      });

      test('returns words from the known pool', () {
        final validWords = {
          'APPLE', 'BEACH', 'CLOUD', 'DANCE', 'EAGLE', 'FLAME', 'GRAPE', 'HOUSE',
          'INDEX', 'JOKER', 'KNIFE', 'LEMON', 'MUSIC', 'NIGHT', 'OCEAN', 'PIANO',
          'QUEEN', 'RIVER', 'SNAKE', 'TIGER', 'UNCLE', 'VOICE', 'WATER', 'YACHT',
          'ZEBRA', 'BRIGHT', 'COFFEE', 'DANGER', 'ENERGY', 'FLOWER', 'GARDEN',
          'HEAVEN', 'ISLAND', 'JUNGLE', 'KITTEN', 'LAPTOP', 'MARKET', 'NATURE',
          'ORANGE', 'PLAYER', 'ROCKET', 'SCHOOL', 'TRAVEL', 'UPDATE', 'VALLEY',
          'WINDOW', 'YELLOW', 'ANIMAL', 'BASKET', 'CHURCH',
        };
        final word = engine.getRandomWord();
        expect(validWords.contains(word), isTrue);
      });
    });

    group('getShuffledLetters', () {
      test('returns list with word length + 3 extra letters', () {
        final letters = engine.getShuffledLetters('APPLE');
        expect(letters.length, 8);
      });

      test('returns list with correct length for short word', () {
        final letters = engine.getShuffledLetters('HI');
        expect(letters.length, 5);
      });

      test('contains all original word letters', () {
        final word = 'TEST';
        final letters = engine.getShuffledLetters(word);
        final letterCounts = <String, int>{};
        for (final l in letters) {
          letterCounts[l] = (letterCounts[l] ?? 0) + 1;
        }
        for (final ch in word.split('')) {
          expect(letterCounts[ch], greaterThanOrEqualTo(1));
          letterCounts[ch] = letterCounts[ch]! - 1;
        }
      });

      test('all returned values are single uppercase letters', () {
        final letters = engine.getShuffledLetters('LONG');
        for (final letter in letters) {
          expect(letter.length, 1);
          expect(letter, matches(RegExp(r'^[A-Z]$')));
        }
      });

      test('shuffled letters differ from original order sometimes', () {
        // Run multiple times - with 7 letters including 3 random, very likely to shuffle
        bool foundDifferent = false;
        for (int i = 0; i < 20; i++) {
          final letters = engine.getShuffledLetters('ABCDE');
          if (letters.join() != 'ABCDE') {
            foundDifferent = true;
            break;
          }
        }
        expect(foundDifferent, isTrue);
      });
    });
  });
}
