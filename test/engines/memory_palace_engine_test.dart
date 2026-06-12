import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/memory_palace/memory_palace_engine.dart';

void main() {
  group('MemoryPalaceEngine', () {
    group('generateLevel', () {
      test('returns map with correct number of entries', () {
        final level = MemoryPalaceEngine.generateLevel(5);
        expect(level.length, equals(5));
      });

      test('returns map with 0 entries for wordCount 0', () {
        final level = MemoryPalaceEngine.generateLevel(0);
        expect(level.length, equals(0));
      });

      test('positions are valid grid positions (0-8)', () {
        final level = MemoryPalaceEngine.generateLevel(5);
        for (final pos in level.keys) {
          expect(pos, greaterThanOrEqualTo(0));
          expect(pos, lessThan(9));
        }
      });

      test('words are from the word pool', () {
        final level = MemoryPalaceEngine.generateLevel(5);
        for (final word in level.values) {
          expect(MemoryPalaceEngine.wordPool, contains(word));
        }
      });

      test('all positions are unique', () {
        final level = MemoryPalaceEngine.generateLevel(5);
        expect(level.keys.toSet().length, equals(5));
      });

      test('all words are unique', () {
        final level = MemoryPalaceEngine.generateLevel(5);
        expect(level.values.toSet().length, equals(5));
      });

      test('wordCount capped at available words', () {
        final level = MemoryPalaceEngine.generateLevel(9);
        expect(level.length, equals(9));
      });
    });

    group('wordPool', () {
      test('contains at least 50 words', () {
        expect(MemoryPalaceEngine.wordPool.length, greaterThanOrEqualTo(50));
      });

      test('all words are non-empty strings', () {
        for (final word in MemoryPalaceEngine.wordPool) {
          expect(word.isNotEmpty, isTrue);
        }
      });
    });
  });
}
