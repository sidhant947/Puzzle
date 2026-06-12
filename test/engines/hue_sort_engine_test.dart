import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/hue_sort/hue_sort_engine.dart';

void main() {
  group('HueSortEngine', () {
    late HueSortEngine engine;

    setUp(() {
      engine = HueSortEngine();
    });

    group('generateLevel', () {
      test('returns a HueSortLevel', () {
        final level = engine.generateLevel(size: 5);
        expect(level, isA<HueSortLevel>());
      });

      test('size matches requested size', () {
        final level = engine.generateLevel(size: 5);
        expect(level.size, 5);
      });

      test('colors list has size*size entries', () {
        final level = engine.generateLevel(size: 5);
        expect(level.colors.length, 25);
      });

      test('solution list has size*size entries', () {
        final level = engine.generateLevel(size: 5);
        expect(level.solution.length, 25);
      });

      test('fixedIndices has exactly 4 corners', () {
        final level = engine.generateLevel(size: 5);
        expect(level.fixedIndices.length, 4);
        expect(level.fixedIndices.contains(0), isTrue);
        expect(level.fixedIndices.contains(4), isTrue);
        expect(level.fixedIndices.contains(20), isTrue);
        expect(level.fixedIndices.contains(24), isTrue);
      });

      test('fixed corners have same color in solution and shuffled', () {
        final level = engine.generateLevel(size: 5);
        for (final idx in level.fixedIndices) {
          expect(level.colors[idx], level.solution[idx]);
        }
      });

      test('all solution colors are non-null', () {
        final level = engine.generateLevel(size: 5);
        for (final color in level.solution) {
          expect(color, isNotNull);
        }
      });

      test('colors list contains same set of colors as solution', () {
        final level = engine.generateLevel(size: 5);
        final colorValues1 = level.colors.map((c) => c.value).toSet();
        final colorValues2 = level.solution.map((c) => c.value).toSet();
        expect(colorValues1, colorValues2);
      });
    });
  });
}
