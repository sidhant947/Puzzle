import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/stroop_test/stroop_test_engine.dart';

void main() {
  group('StroopTestEngine', () {
    late StroopTestEngine engine;

    setUp(() {
      engine = StroopTestEngine();
    });

    group('generateItem', () {
      test('returns a StroopItem', () {
        final item = engine.generateItem();
        expect(item, isA<StroopItem>());
      });

      test('item has non-empty text and colorName', () {
        final item = engine.generateItem();
        expect(item.text.isNotEmpty, isTrue);
        expect(item.colorName.isNotEmpty, isTrue);
      });

      test('item text is a valid color name', () {
        final validNames = engine.getAllColorNames();
        for (int i = 0; i < 20; i++) {
          final item = engine.generateItem();
          expect(validNames.contains(item.text), isTrue);
        }
      });

      test('item colorName is a valid color name', () {
        final validNames = engine.getAllColorNames();
        for (int i = 0; i < 20; i++) {
          final item = engine.generateItem();
          expect(validNames.contains(item.colorName), isTrue);
        }
      });

      test('item color matches colorName', () {
        for (int i = 0; i < 20; i++) {
          final item = engine.generateItem();
          final expectedColor = engine.getColorByName(item.colorName);
          expect(item.color, expectedColor);
        }
      });

      test('most items are incongruent (text != colorName)', () {
        int incongruentCount = 0;
        const int total = 100;
        for (int i = 0; i < total; i++) {
          final item = engine.generateItem();
          if (item.text != item.colorName) incongruentCount++;
        }
        expect(incongruentCount, greaterThan(total * 0.5));
      });
    });

    group('getAllColorNames', () {
      test('returns 6 color names', () {
        final names = engine.getAllColorNames();
        expect(names.length, 6);
      });

      test('contains expected color names', () {
        final names = engine.getAllColorNames();
        expect(names, containsAll(['RED', 'BLUE', 'GREEN', 'YELLOW', 'PURPLE', 'ORANGE']));
      });
    });

    group('getColorByName', () {
      test('returns correct Color for valid name', () {
        expect(engine.getColorByName('RED'), isA<Color>());
        expect(engine.getColorByName('BLUE'), isA<Color>());
      });

      test('returns Colors.black for unknown name', () {
        expect(engine.getColorByName('NONEXISTENT'), Colors.black);
      });

      test('all color names return non-black colors', () {
        for (final name in engine.getAllColorNames()) {
          expect(engine.getColorByName(name), isNot(Colors.black));
        }
      });
    });
  });
}
