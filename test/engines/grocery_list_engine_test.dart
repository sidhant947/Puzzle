import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/grocery_list/grocery_list_engine.dart';

void main() {
  group('GroceryListEngine', () {
    late GroceryListEngine engine;

    setUp(() {
      engine = GroceryListEngine();
    });

    group('categories', () {
      test('has 5 categories', () {
        expect(engine.categories.length, 5);
      });

      test('each category has items', () {
        for (final items in engine.categories.values) {
          expect(items.isNotEmpty, isTrue);
        }
      });

      test('FRUITS category exists with expected items', () {
        expect(engine.categories.containsKey('FRUITS'), isTrue);
        expect(engine.categories['FRUITS']!.contains('Apple'), isTrue);
      });
    });

    group('generateList', () {
      test('returns requested number of items', () {
        final list = engine.generateList(5);
        expect(list.length, 5);
      });

      test('each item has item and category keys', () {
        final list = engine.generateList(3);
        for (final entry in list) {
          expect(entry.containsKey('item'), isTrue);
          expect(entry.containsKey('category'), isTrue);
        }
      });

      test('no duplicate items', () {
        final list = engine.generateList(10);
        final items = list.map((e) => e['item']).toList();
        expect(items.toSet().length, items.length);
      });

      test('categories are valid', () {
        final validCategories = engine.categories.keys.toSet();
        final list = engine.generateList(10);
        for (final entry in list) {
          expect(validCategories.contains(entry['category']), isTrue);
        }
      });

      test('items belong to their stated category', () {
        final list = engine.generateList(10);
        for (final entry in list) {
          final cat = entry['category']!;
          final item = entry['item']!;
          expect(engine.categories[cat]!.contains(item), isTrue);
        }
      });

      test('generates empty list for length 0', () {
        final list = engine.generateList(0);
        expect(list, isEmpty);
      });
    });
  });
}
