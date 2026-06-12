import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/visual_search/visual_search_engine.dart';

void main() {
  group('VisualSearchEngine', () {
    late VisualSearchEngine engine;

    setUp(() {
      engine = VisualSearchEngine();
    });

    test('generateLevel returns valid VisualSearchLevel', () {
      final level = engine.generateLevel(0);
      expect(level.symbols, isNotEmpty);
      expect(level.targetIndex, greaterThanOrEqualTo(0));
      expect(level.gridSize, greaterThanOrEqualTo(4));
    });

    test('grid size is 4 for score < 5', () {
      final level = engine.generateLevel(3);
      expect(level.gridSize, 4);
      expect(level.symbols.length, 16);
    });

    test('grid size is 5 for score 5-11', () {
      final level = engine.generateLevel(8);
      expect(level.gridSize, 5);
      expect(level.symbols.length, 25);
    });

    test('grid size is 6 for score 12-19', () {
      final level = engine.generateLevel(15);
      expect(level.gridSize, 6);
      expect(level.symbols.length, 36);
    });

    test('grid size is 7 for score 20-29', () {
      final level = engine.generateLevel(25);
      expect(level.gridSize, 7);
      expect(level.symbols.length, 49);
    });

    test('grid size is 8 for score >= 30', () {
      final level = engine.generateLevel(35);
      expect(level.gridSize, 8);
      expect(level.symbols.length, 64);
    });

    test('targetIndex is within grid bounds', () {
      final level = engine.generateLevel(10);
      expect(level.targetIndex, lessThan(level.symbols.length));
    });

    test('grid contains exactly one target among distractors', () {
      final level = engine.generateLevel(5);
      final target = level.symbols[level.targetIndex];
      final distractorCount = level.symbols.where((s) => s != target).length;
      expect(distractorCount, level.symbols.length - 1);
    });

    test('symbols contain only two distinct characters', () {
      final level = engine.generateLevel(3);
      final distinct = level.symbols.toSet();
      expect(distinct.length, 2);
    });
  });
}
