import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/path_recall/path_recall_engine.dart';

void main() {
  group('PathRecallEngine', () {
    late PathRecallEngine engine;

    setUp(() {
      engine = PathRecallEngine();
    });

    group('generatePath', () {
      test('returns a path of the requested length', () {
        final path = engine.generatePath(5, 5);
        expect(path.length, equals(5));
      });

      test('returns a longer path correctly', () {
        final path = engine.generatePath(10, 5);
        expect(path.length, equals(10));
      });

      test('all indices are within grid bounds', () {
        final path = engine.generatePath(8, 4);
        for (final idx in path) {
          expect(idx, greaterThanOrEqualTo(0));
          expect(idx, lessThan(16));
        }
      });

      test('path has no duplicate indices', () {
        final path = engine.generatePath(12, 5);
        expect(path.toSet().length, equals(path.length));
      });

      test('consecutive indices are adjacent on the grid', () {
        final path = engine.generatePath(8, 4);
        for (int i = 1; i < path.length; i++) {
          final prev = path[i - 1];
          final curr = path[i];
          final prevR = prev ~/ 4;
          final prevC = prev % 4;
          final currR = curr ~/ 4;
          final currC = curr % 4;
          final manhattan = (prevR - currR).abs() + (prevC - currC).abs();
          expect(manhattan, equals(1),
              reason: 'Non-adjacent at index $i: $prev -> $curr');
        }
      });
    });
  });
}
