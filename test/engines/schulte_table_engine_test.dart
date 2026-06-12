import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/schulte_table/schulte_table_engine.dart';

void main() {
  group('SchulteTableEngine', () {
    late SchulteTableEngine engine;

    setUp(() {
      engine = SchulteTableEngine(size: 5);
    });

    test('generates grid with correct size', () {
      final grid = engine.generateGrid();
      expect(grid.length, 25);
    });

    test('grid contains numbers from 1 to size*size', () {
      final grid = engine.generateGrid();
      final sorted = List<int>.from(grid)..sort();
      expect(sorted, List.generate(25, (i) => i + 1));
    });

    test('grid has no duplicate values', () {
      final grid = engine.generateGrid();
      final unique = grid.toSet();
      expect(unique.length, 25);
    });

    test('grid is shuffled (not always in order)', () {
      final grids = List.generate(10, (_) => engine.generateGrid());
      final allSameOrder = grids.every((g) =>
          List.generate(25, (i) => i + 1).every((n) => g[n - 1] == n));
      expect(allSameOrder, false);
    });

    test('isCorrectTap returns true when value matches expected', () {
      expect(engine.isCorrectTap(5, 5), true);
    });

    test('isCorrectTap returns false when value does not match expected', () {
      expect(engine.isCorrectTap(3, 5), false);
    });

    test('isCorrectTap returns false for zero values', () {
      expect(engine.isCorrectTap(0, 0), true);
      expect(engine.isCorrectTap(0, 1), false);
    });

    group('different sizes', () {
      test('size 3 generates 9-element grid', () {
        final small = SchulteTableEngine(size: 3);
        final grid = small.generateGrid();
        expect(grid.length, 9);
        final sorted = List<int>.from(grid)..sort();
        expect(sorted, List.generate(9, (i) => i + 1));
      });

      test('size 4 generates 16-element grid', () {
        final med = SchulteTableEngine(size: 4);
        final grid = med.generateGrid();
        expect(grid.length, 16);
        final sorted = List<int>.from(grid)..sort();
        expect(sorted, List.generate(16, (i) => i + 1));
      });
    });
  });
}
