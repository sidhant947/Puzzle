import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/odd_rotation/odd_rotation_engine.dart';

void main() {
  group('OddRotationEngine', () {
    late OddRotationEngine engine;

    setUp(() {
      engine = OddRotationEngine();
    });

    group('generatePuzzle', () {
      test('returns a map with required keys', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.containsKey('shape'), isTrue);
        expect(puzzle.containsKey('options'), isTrue);
        expect(puzzle.containsKey('targetIndex'), isTrue);
      });

      test('options list has 4 entries', () {
        final puzzle = engine.generatePuzzle();
        final options = puzzle['options'] as List<RotationOption>;
        expect(options.length, equals(4));
      });

      test('targetIndex is in range 0-3', () {
        final puzzle = engine.generatePuzzle();
        final targetIndex = puzzle['targetIndex'] as int;
        expect(targetIndex, greaterThanOrEqualTo(0));
        expect(targetIndex, lessThan(4));
      });

      test('exactly one option is marked as target', () {
        final puzzle = engine.generatePuzzle();
        final options = puzzle['options'] as List<RotationOption>;
        final targets = options.where((o) => o.isTarget).toList();
        expect(targets.length, equals(1));
      });

      test('target option is mirrored', () {
        final puzzle = engine.generatePuzzle();
        final options = puzzle['options'] as List<RotationOption>;
        final targetIndex = puzzle['targetIndex'] as int;
        expect(options[targetIndex].isMirrored, isTrue);
      });

      test('non-target options are not mirrored', () {
        final puzzle = engine.generatePuzzle();
        final options = puzzle['options'] as List<RotationOption>;
        final targetIndex = puzzle['targetIndex'] as int;
        for (int i = 0; i < options.length; i++) {
          if (i != targetIndex) {
            expect(options[i].isMirrored, isFalse);
          }
        }
      });

      test('all rotations are in valid range', () {
        final puzzle = engine.generatePuzzle();
        final options = puzzle['options'] as List<RotationOption>;
        for (final option in options) {
          expect(option.rotation, greaterThanOrEqualTo(0));
          expect(option.rotation, lessThan(2 * 3.141592653589793));
        }
      });
    });
  });
}
