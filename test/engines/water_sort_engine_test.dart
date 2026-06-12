import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/water_sort/water_sort_engine.dart';

void main() {
  group('WaterSortEngine', () {
    late WaterSortEngine engine;

    setUp(() {
      engine = WaterSortEngine();
    });

    test('generateLevel returns correct number of tubes', () {
      final tubes = engine.generateLevel();
      expect(tubes.length, WaterSortEngine.totalTubes);
    });

    test('filled tubes have correct capacity', () {
      final tubes = engine.generateLevel();
      for (int i = 0; i < WaterSortEngine.numColors; i++) {
        expect(tubes[i].length, WaterSortEngine.tubeCapacity);
      }
    });

    test('empty tubes are at the end', () {
      final tubes = engine.generateLevel();
      for (int i = WaterSortEngine.numColors; i < WaterSortEngine.totalTubes; i++) {
        expect(tubes[i].isEmpty, isTrue);
      }
    });

    test('all colors from filled tubes are from available colors', () {
      final tubes = engine.generateLevel();
      for (int i = 0; i < WaterSortEngine.numColors; i++) {
        for (final color in tubes[i]) {
          expect(WaterSortEngine.availableColors, contains(color));
        }
      }
    });

    group('canPour', () {
      test('returns false when source is empty', () {
        final from = <Color>[];
        final to = [WaterSortEngine.availableColors[0]];
        expect(engine.canPour(from, to), isFalse);
      });

      test('returns false when destination is full', () {
        final color = WaterSortEngine.availableColors[0];
        final from = [color];
        final to = [color, color, color, color];
        expect(engine.canPour(from, to), isFalse);
      });

      test('returns true when destination is empty', () {
        final from = [WaterSortEngine.availableColors[0]];
        final to = <Color>[];
        expect(engine.canPour(from, to), isTrue);
      });

      test('returns true when top colors match', () {
        final color = WaterSortEngine.availableColors[0];
        final from = [color];
        final to = [color];
        expect(engine.canPour(from, to), isTrue);
      });

      test('returns false when top colors differ', () {
        final from = [WaterSortEngine.availableColors[0]];
        final to = [WaterSortEngine.availableColors[1]];
        expect(engine.canPour(from, to), isFalse);
      });
    });

    group('pour', () {
      test('moves matching top colors from source to destination', () {
        final color = WaterSortEngine.availableColors[0];
        final from = [color, color];
        final to = [color];
        engine.pour(from, to);
        expect(from.length, 0);
        expect(to.length, 3);
      });

      test('does nothing when canPour is false', () {
        final from = [WaterSortEngine.availableColors[0]];
        final to = [WaterSortEngine.availableColors[1]];
        engine.pour(from, to);
        expect(from.length, 1);
        expect(to.length, 1);
      });

      test('pours only contiguous matching colors', () {
        final c1 = WaterSortEngine.availableColors[0];
        final c2 = WaterSortEngine.availableColors[1];
        final from = [c2, c1, c1];
        final to = [c1];
        engine.pour(from, to);
        expect(from.length, 1);
        expect(from.first, c2);
        expect(to.length, 3);
      });
    });

    group('isSolved', () {
      test('returns true when all tubes are empty or uniform', () {
        final c = WaterSortEngine.availableColors[0];
        final List<List<Color>> tubes = [
          [c, c, c, c],
          [WaterSortEngine.availableColors[1], WaterSortEngine.availableColors[1], WaterSortEngine.availableColors[1], WaterSortEngine.availableColors[1]],
          [],
          [],
        ];
        expect(engine.isSolved(tubes), isTrue);
      });

      test('returns false when a tube has mixed colors', () {
        final c1 = WaterSortEngine.availableColors[0];
        final c2 = WaterSortEngine.availableColors[1];
        final List<List<Color>> tubes = [
          [c1, c2, c1, c1],
          [],
        ];
        expect(engine.isSolved(tubes), isFalse);
      });

      test('returns false when a tube is not full', () {
        final c = WaterSortEngine.availableColors[0];
        final List<List<Color>> tubes = [
          [c, c],
          [],
        ];
        expect(engine.isSolved(tubes), isFalse);
      });
    });
  });
}
