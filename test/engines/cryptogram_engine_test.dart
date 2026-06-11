import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/cryptogram/cryptogram_engine.dart';

void main() {
  group('CryptogramEngine', () {
    late CryptogramEngine engine;

    setUp(() {
      engine = CryptogramEngine();
    });

    group('generatePuzzle', () {
      test('returns original and encoded strings', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.containsKey('original'), isTrue);
        expect(puzzle.containsKey('encoded'), isTrue);
      });

      test('original is a valid quote', () {
        final puzzle = engine.generatePuzzle();
        final original = puzzle['original'] as String;
        expect(original.isNotEmpty, isTrue);
        expect(original, matches(RegExp(r'^[A-Z ]+$')));
      });

      test('encoded has same length as original', () {
        final puzzle = engine.generatePuzzle();
        final original = puzzle['original'] as String;
        final encoded = puzzle['encoded'] as String;
        expect(encoded.length, equals(original.length));
      });

      test('encoded is different from original', () {
        final puzzle = engine.generatePuzzle();
        final original = puzzle['original'] as String;
        final encoded = puzzle['encoded'] as String;
        // Very unlikely to be the same with proper shuffling
        expect(encoded, isNot(equals(original)));
      });

      test('no letter maps to itself', () {
        final puzzle = engine.generatePuzzle();
        final original = puzzle['original'] as String;
        final encoded = puzzle['encoded'] as String;

        for (int i = 0; i < original.length; i++) {
          if (original[i] != ' ') {
            expect(encoded[i], isNot(equals(original[i])),
                reason: 'Letter ${original[i]} maps to itself at position $i');
          }
        }
      });
    });

    group('checkWin', () {
      test('returns true for correct mapping', () {
        final puzzle = engine.generatePuzzle();
        final original = puzzle['original'] as String;
        final encoded = puzzle['encoded'] as String;

        // Build correct mapping from encoded to original
        final correctMapping = <String, String>{};
        for (int i = 0; i < original.length; i++) {
          if (encoded[i] != ' ') {
            correctMapping[encoded[i]] = original[i];
          }
        }

        expect(engine.checkWin(original, correctMapping, encoded), isTrue);
      });

      test('returns false for incorrect mapping', () {
        final puzzle = engine.generatePuzzle();
        final original = puzzle['original'] as String;
        final encoded = puzzle['encoded'] as String;

        // Build incorrect mapping
        final incorrectMapping = <String, String>{};
        for (int i = 0; i < original.length; i++) {
          if (encoded[i] != ' ') {
            incorrectMapping[encoded[i]] = 'X'; // Wrong mapping
          }
        }

        expect(engine.checkWin(original, incorrectMapping, encoded), isFalse);
      });

      test('returns true for empty mapping on space-only text', () {
        expect(engine.checkWin('   ', {}, '   '), isTrue);
      });
    });
  });
}
