import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/sdmt/sdmt_engine.dart';

void main() {
  group('SDMTEngine', () {
    late SDMTEngine engine;

    setUp(() {
      engine = SDMTEngine();
    });

    test('has exactly 9 symbols', () {
      expect(engine.symbols.length, 9);
    });

    test('symbols list contains expected icons', () {
      expect(engine.symbols, contains(Icons.star_rounded));
      expect(engine.symbols, contains(Icons.favorite_rounded));
      expect(engine.symbols, contains(Icons.square_rounded));
      expect(engine.symbols, contains(Icons.circle_rounded));
      expect(engine.symbols, contains(Icons.cloud_rounded));
    });

    group('generateKey', () {
      test('returns a map with 9 entries', () {
        final key = engine.generateKey();
        expect(key.length, 9);
      });

      test('maps every symbol to a unique digit 1-9', () {
        final key = engine.generateKey();
        final values = key.values.toList()..sort();
        expect(values, List.generate(9, (i) => i + 1));
      });

      test('every symbol is a key in the map', () {
        final key = engine.generateKey();
        for (final symbol in engine.symbols) {
          expect(key.containsKey(symbol), true);
        }
      });

      test('generates different mappings across calls', () {
        final key1 = engine.generateKey();
        final key2 = engine.generateKey();
        // At least one value should differ (probabilistic but 9! = 362880 permutations)
        final sameMapping = key1.entries.every(
            (e) => key2[e.key] == e.value);
        expect(sameMapping, false);
      });
    });

    group('getRandomSymbol', () {
      test('returns a symbol from the symbols list', () {
        final symbol = engine.getRandomSymbol();
        expect(engine.symbols, contains(symbol));
      });

      test('returns different symbols over many calls', () {
        final results = List.generate(50, (_) => engine.getRandomSymbol());
        final unique = results.toSet();
        expect(unique.length, greaterThan(1));
      });
    });
  });
}
