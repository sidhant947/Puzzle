import 'dart:math';

class GroceryListEngine {
  final Random _random = Random();

  final Map<String, List<String>> categories = {
    'FRUITS': ['Apple', 'Banana', 'Orange', 'Grape', 'Kiwi', 'Mango'],
    'VEGGIES': ['Carrot', 'Broccoli', 'Tomato', 'Potato', 'Spinach', 'Onion'],
    'DAIRY': ['Milk', 'Cheese', 'Butter', 'Yogurt', 'Cream', 'Eggs'],
    'BAKERY': ['Bread', 'Bagel', 'Muffin', 'Croissant', 'Cake', 'Cookie'],
    'MEAT': ['Chicken', 'Beef', 'Pork', 'Fish', 'Turkey', 'Bacon'],
  };

  /// Generates a list of random items and their categories.
  List<Map<String, String>> generateList(int length) {
    List<Map<String, String>> list = [];
    final allCategories = categories.keys.toList();

    for (int i = 0; i < length; i++) {
      String cat = allCategories[_random.nextInt(allCategories.length)];
      List<String> items = categories[cat]!;
      String item = items[_random.nextInt(items.length)];
      
      // Avoid duplicate items
      while (list.any((e) => e['item'] == item)) {
        cat = allCategories[_random.nextInt(allCategories.length)];
        items = categories[cat]!;
        item = items[_random.nextInt(items.length)];
      }
      
      list.add({'item': item, 'category': cat});
    }

    return list;
  }
}
