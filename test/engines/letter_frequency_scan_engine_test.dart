import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/letter_frequency_scan/letter_frequency_scan_engine.dart';

void main() {
  group('LetterFrequencyScanEngine', () {
    late LetterFrequencyScanEngine engine;

    setUp(() {
      engine = LetterFrequencyScanEngine();
    });

    group('getRandomPuzzle', () {
      test('returns paragraph, targetLetter, and count', () {
        final puzzle = engine.getRandomPuzzle();
        expect(puzzle.containsKey('paragraph'), isTrue);
        expect(puzzle.containsKey('targetLetter'), isTrue);
        expect(puzzle.containsKey('count'), isTrue);
      });

      test('paragraph is a non-empty string', () {
        final puzzle = engine.getRandomPuzzle();
        final para = puzzle['paragraph'] as String;
        expect(para.isNotEmpty, isTrue);
      });

      test('targetLetter is a single uppercase letter', () {
        final puzzle = engine.getRandomPuzzle();
        final letter = puzzle['targetLetter'] as String;
        expect(letter.length, equals(1));
        expect(letter, matches(RegExp(r'[A-Z]')));
      });

      test('count matches actual occurrences of target in paragraph', () {
        for (int i = 0; i < 30; i++) {
          final puzzle = engine.getRandomPuzzle();
          final para = puzzle['paragraph'] as String;
          final target = puzzle['targetLetter'] as String;
          final reportedCount = puzzle['count'] as int;
          final actualCount = para.toUpperCase().split('').where((l) => l == target).length;
          expect(reportedCount, equals(actualCount),
              reason: 'Count mismatch for target "$target"');
        }
      });

      test('count is at least 1', () {
        for (int i = 0; i < 30; i++) {
          final puzzle = engine.getRandomPuzzle();
          expect(puzzle['count'], greaterThanOrEqualTo(1));
        }
      });

      test('generates different puzzles', () {
        final letters = <String>{};
        for (int i = 0; i < 30; i++) {
          letters.add(engine.getRandomPuzzle()['targetLetter'] as String);
        }
        // Very likely to have multiple different target letters
        expect(letters.length, greaterThan(1));
      });
    });

    group('isCorrect', () {
      test('returns true for matching counts', () {
        expect(engine.isCorrect(5, 5), isTrue);
        expect(engine.isCorrect(0, 0), isTrue);
      });

      test('returns false for mismatching counts', () {
        expect(engine.isCorrect(5, 3), isFalse);
        expect(engine.isCorrect(1, 0), isFalse);
      });
    });
  });
}
