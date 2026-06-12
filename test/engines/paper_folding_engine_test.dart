import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/paper_folding/paper_folding_engine.dart';

void main() {
  group('PaperFoldingEngine', () {
    late PaperFoldingEngine engine;

    setUp(() {
      engine = PaperFoldingEngine();
    });

    group('getHoles', () {
      test('returns at least one hole for no folds', () {
        final holes = engine.getHoles(Point(0, 0), []);
        expect(holes.length, greaterThanOrEqualTo(1));
      });

      test('vertical fold produces 2 holes for center punch', () {
        final holes = engine.getHoles(Point(2, 2), [FoldType.vertical]);
        expect(holes.length, equals(2));
      });

      test('horizontal fold produces 2 holes for center punch', () {
        final holes = engine.getHoles(Point(2, 2), [FoldType.horizontal]);
        expect(holes.length, equals(2));
      });

      test('diagonal fold produces 2 holes for off-diagonal punch', () {
        final holes = engine.getHoles(Point(1, 2), [FoldType.diagonal]);
        expect(holes.length, equals(2));
      });

      test('two folds produce more holes', () {
        final holes = engine.getHoles(Point(1, 1), [
          FoldType.vertical,
          FoldType.horizontal,
        ]);
        expect(holes.length, greaterThanOrEqualTo(2));
      });

      test('holes are within grid bounds', () {
        final holes = engine.getHoles(Point(1, 1), [
          FoldType.vertical,
          FoldType.horizontal,
          FoldType.diagonal,
        ]);
        for (final hole in holes) {
          expect(hole.x, greaterThanOrEqualTo(0));
          expect(hole.x, lessThan(PaperFoldingEngine.gridSize));
          expect(hole.y, greaterThanOrEqualTo(0));
          expect(hole.y, lessThan(PaperFoldingEngine.gridSize));
        }
      });
    });

    group('generateLevel', () {
      test('returns a map with required keys', () {
        final level = engine.generateLevel();
        expect(level.containsKey('folds'), isTrue);
        expect(level.containsKey('punch'), isTrue);
        expect(level.containsKey('options'), isTrue);
        expect(level.containsKey('correctIndex'), isTrue);
      });

      test('folds is a non-empty list', () {
        final level = engine.generateLevel();
        final folds = level['folds'] as List<FoldType>;
        expect(folds.isNotEmpty, isTrue);
      });

      test('options list has 4 entries', () {
        final level = engine.generateLevel();
        final options = level['options'] as List;
        expect(options.length, equals(4));
      });

      test('correctIndex is in valid range', () {
        final level = engine.generateLevel();
        final correctIndex = level['correctIndex'] as int;
        expect(correctIndex, greaterThanOrEqualTo(0));
        expect(correctIndex, lessThan(4));
      });

      test('punch is a valid Point', () {
        final level = engine.generateLevel();
        final punch = level['punch'] as Point<int>;
        expect(punch.x, greaterThanOrEqualTo(0));
        expect(punch.y, greaterThanOrEqualTo(0));
      });
    });
  });
}
