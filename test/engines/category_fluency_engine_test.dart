import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/category_fluency/category_fluency_engine.dart';

void main() {
  group('CategoryFluencyEngine', () {
    late CategoryFluencyEngine engine;

    setUp(() {
      engine = CategoryFluencyEngine();
    });

    group('getRandomCategory', () {
      test('returns a Category', () {
        final category = engine.getRandomCategory();
        expect(category, isA<Category>());
      });

      test('category has name and items', () {
        final category = engine.getRandomCategory();
        expect(category.name, isNotEmpty);
        expect(category.items, isNotEmpty);
      });

      test('category has many items', () {
        final category = engine.getRandomCategory();
        expect(category.items.length, greaterThan(10));
      });

      test('returns different categories over time', () {
        final names = <String>{};
        for (int i = 0; i < 20; i++) {
          names.add(engine.getRandomCategory().name);
        }
        expect(names.length, greaterThan(1));
      });
    });

    group('isValidItem', () {
      test('returns true for valid item', () {
        final category = engine.getRandomCategory();
        final item = category.items.first;
        expect(engine.isValidItem(item, category), isTrue);
      });

      test('returns true case insensitive', () {
        final category = engine.getRandomCategory();
        final item = category.items.first;
        expect(engine.isValidItem(item.toUpperCase(), category), isTrue);
      });

      test('returns false for invalid item', () {
        final category = engine.getRandomCategory();
        expect(engine.isValidItem('xyznotaword', category), isFalse);
      });

      test('returns true with extra whitespace', () {
        final category = engine.getRandomCategory();
        final item = category.items.first;
        expect(engine.isValidItem('  $item  ', category), isTrue);
      });
    });
  });

  group('Category', () {
    test('stores name and items', () {
      final category = Category(
        name: 'Test',
        items: {'a', 'b', 'c'},
      );
      expect(category.name, 'Test');
      expect(category.items.length, 3);
    });
  });
}
