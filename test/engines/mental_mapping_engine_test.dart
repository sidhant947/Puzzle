import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/mental_mapping/mental_mapping_engine.dart';

void main() {
  group('MentalMappingEngine', () {
    group('generateLevel', () {
      test('returns gridSize, startRow, startCol, sequence, targetRow, targetCol', () {
        final engine = MentalMappingEngine(gridSize: 5, steps: 3);
        final level = engine.generateLevel();
        expect(level.containsKey('gridSize'), isTrue);
        expect(level.containsKey('startRow'), isTrue);
        expect(level.containsKey('startCol'), isTrue);
        expect(level.containsKey('sequence'), isTrue);
        expect(level.containsKey('targetRow'), isTrue);
        expect(level.containsKey('targetCol'), isTrue);
      });

      test('start position is within grid bounds', () {
        final engine = MentalMappingEngine(gridSize: 5, steps: 3);
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          expect(level['startRow'], greaterThanOrEqualTo(0));
          expect(level['startRow'], lessThan(5));
          expect(level['startCol'], greaterThanOrEqualTo(0));
          expect(level['startCol'], lessThan(5));
        }
      });

      test('target position is within grid bounds', () {
        final engine = MentalMappingEngine(gridSize: 5, steps: 3);
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          expect(level['targetRow'], greaterThanOrEqualTo(0));
          expect(level['targetRow'], lessThan(5));
          expect(level['targetCol'], greaterThanOrEqualTo(0));
          expect(level['targetCol'], lessThan(5));
        }
      });

      test('sequence length matches steps', () {
        final engine = MentalMappingEngine(gridSize: 5, steps: 4);
        final level = engine.generateLevel();
        final seq = level['sequence'] as List<Direction>;
        expect(seq.length, equals(4));
      });

      test('sequence contains valid directions', () {
        final engine = MentalMappingEngine(gridSize: 5, steps: 3);
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          final seq = level['sequence'] as List<Direction>;
          for (final dir in seq) {
            expect(dir, anyOf(
              equals(Direction.north),
              equals(Direction.south),
              equals(Direction.east),
              equals(Direction.west),
            ));
          }
        }
      });

      test('target position matches sequence application', () {
        final engine = MentalMappingEngine(gridSize: 5, steps: 3);
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          int row = level['startRow'] as int;
          int col = level['startCol'] as int;
          final seq = level['sequence'] as List<Direction>;
          for (final dir in seq) {
            switch (dir) {
              case Direction.north: row--; break;
              case Direction.south: row++; break;
              case Direction.east: col++; break;
              case Direction.west: col--; break;
            }
          }
          expect(row, equals(level['targetRow']));
          expect(col, equals(level['targetCol']));
        }
      });

      test('does not immediately backtrack', () {
        final engine = MentalMappingEngine(gridSize: 5, steps: 5);
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          final seq = level['sequence'] as List<Direction>;
          for (int j = 1; j < seq.length; j++) {
            // Should not have opposite consecutive directions
            if (seq[j] == Direction.north) expect(seq[j - 1], isNot(equals(Direction.south)));
            if (seq[j] == Direction.south) expect(seq[j - 1], isNot(equals(Direction.north)));
            if (seq[j] == Direction.east) expect(seq[j - 1], isNot(equals(Direction.west)));
            if (seq[j] == Direction.west) expect(seq[j - 1], isNot(equals(Direction.east)));
          }
        }
      });
    });
  });
}
