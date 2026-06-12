import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/mental_rotation/mental_rotation_engine.dart';

void main() {
  group('MentalRotationEngine', () {
    late MentalRotationEngine engine;

    setUp(() {
      engine = MentalRotationEngine();
    });

    group('generatePuzzle', () {
      test('returns original, transformed, and isSame', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.original, isNotEmpty);
        expect(puzzle.transformed, isNotEmpty);
        expect(puzzle.isSame, isA<bool>());
      });

      test('original pattern has 6 elements', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.original.length, equals(6));
        }
      });

      test('transformed pattern has 6 elements', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.transformed.length, equals(6));
        }
      });

      test('pattern indices are within 0-15', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          for (final idx in puzzle.original) {
            expect(idx, greaterThanOrEqualTo(0));
            expect(idx, lessThan(16));
          }
          for (final idx in puzzle.transformed) {
            expect(idx, greaterThanOrEqualTo(0));
            expect(idx, lessThan(16));
          }
        }
      });

      test('isSame is consistent with pattern comparison', () {
        for (int i = 0; i < 50; i++) {
          final puzzle = engine.generatePuzzle();
          // If isSame is true, transformed should be a rotation of original
          if (puzzle.isSame) {
            // Check all 4 rotations of original match transformed
            bool found = false;
            for (int r = 0; r < 4; r++) {
              final rotated = _rotatePattern(puzzle.original, r);
              if (_listEquals(rotated, puzzle.transformed)) {
                found = true;
                break;
              }
            }
            expect(found, isTrue, reason: 'isSame=true but no rotation matches');
          }
        }
      });
    });

    group('MentalRotationPuzzle', () {
      test('stores fields correctly', () {
        final puzzle = MentalRotationPuzzle(
          original: [1, 2, 3, 4, 5, 6],
          transformed: [1, 2, 3, 4, 5, 6],
          isSame: true,
        );
        expect(puzzle.original, equals([1, 2, 3, 4, 5, 6]));
        expect(puzzle.isSame, isTrue);
      });
    });
  });
}

List<int> _rotatePattern(List<int> pattern, int rotation) {
  List<int> result = List.from(pattern);
  for (int i = 0; i < rotation; i++) {
    result = result.map((idx) {
      int r = idx ~/ 4;
      int c = idx % 4;
      return c * 4 + (3 - r);
    }).toList();
  }
  result.sort();
  return result;
}

bool _listEquals(List<int> l1, List<int> l2) {
  if (l1.length != l2.length) return false;
  final s1 = List<int>.from(l1)..sort();
  final s2 = List<int>.from(l2)..sort();
  for (int i = 0; i < s1.length; i++) {
    if (s1[i] != s2[i]) return false;
  }
  return true;
}
