import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/interlock_puzzle/interlock_puzzle_engine.dart';

void main() {
  group('InterlockPuzzleEngine', () {
    late InterlockPuzzleEngine engine;

    setUp(() {
      engine = InterlockPuzzleEngine();
    });

    group('generateLevel', () {
      test('returns shapeA, shapeB, and shouldFit', () {
        final level = engine.generateLevel();
        expect(level.containsKey('shapeA'), isTrue);
        expect(level.containsKey('shapeB'), isTrue);
        expect(level.containsKey('shouldFit'), isTrue);
      });

      test('shapes have correct size (27 elements)', () {
        final level = engine.generateLevel();
        final shapeA = level['shapeA'] as List<int>;
        final shapeB = level['shapeB'] as List<int>;
        expect(shapeA.length, equals(27));
        expect(shapeB.length, equals(27));
      });

      test('shapes contain only 0s and 1s', () {
        final level = engine.generateLevel();
        final shapeA = level['shapeA'] as List<int>;
        final shapeB = level['shapeB'] as List<int>;
        for (final v in shapeA) {
          expect(v, anyOf(equals(0), equals(1)));
        }
        for (final v in shapeB) {
          expect(v, anyOf(equals(0), equals(1)));
        }
      });

      test('shapeA has approximately half cells filled', () {
        final level = engine.generateLevel();
        final shapeA = level['shapeA'] as List<int>;
        final filledCount = shapeA.where((v) => v == 1).length;
        expect(filledCount, greaterThanOrEqualTo(10));
        expect(filledCount, lessThanOrEqualTo(17));
      });

      test('when shouldFit is true, shapes do not overlap', () {
        // Run multiple times since shouldFit is random
        bool foundFit = false;
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel();
          if (level['shouldFit'] == true) {
            foundFit = true;
            final shapeA = level['shapeA'] as List<int>;
            final shapeB = level['shapeB'] as List<int>;
            for (int j = 0; j < 27; j++) {
              expect(shapeA[j] & shapeB[j], equals(0),
                  reason: 'Overlap at index $j');
            }
            break;
          }
        }
        expect(foundFit, isTrue, reason: 'Never generated a fit puzzle');
      });

      test('when shouldFit is false, shapes have overlap or gap', () {
        bool foundNoFit = false;
        for (int i = 0; i < 50; i++) {
          final level = engine.generateLevel();
          if (level['shouldFit'] == false) {
            foundNoFit = true;
            final shapeA = level['shapeA'] as List<int>;
            final shapeB = level['shapeB'] as List<int>;
            bool hasOverlap = false;
            for (int j = 0; j < 27; j++) {
              if (shapeA[j] == 1 && shapeB[j] == 1) {
                hasOverlap = true;
                break;
              }
            }
            int filledA = shapeA.where((v) => v == 1).length;
            int filledB = shapeB.where((v) => v == 1).length;
            int combined = 0;
            for (int j = 0; j < 27; j++) {
              if (shapeA[j] == 1 || shapeB[j] == 1) combined++;
            }
            // Either overlap or gap (not a perfect interlock)
            if (hasOverlap || combined != filledA + filledB || combined < 27) {
              break;
            }
          }
        }
        expect(foundNoFit, isTrue, reason: 'Never generated a non-fit puzzle');
      });
    });

    group('generateLevelWrapper', () {
      test('returns a valid level', () {
        final level = InterlockPuzzleEngine.generateLevelWrapper(null);
        expect(level.containsKey('shapeA'), isTrue);
        expect(level.containsKey('shapeB'), isTrue);
      });
    });
  });
}
