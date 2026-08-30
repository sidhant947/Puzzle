import 'dart:math' as math;

class PowerItem {
  final int base;
  final int exp;
  final int value;

  PowerItem({
    required this.base,
    required this.exp,
    required this.value,
  });

  String get label => '$base^$exp';
}

class ExponentTowerRound {
  final List<PowerItem> items; // Scrambled
  final List<PowerItem> sortedItems; // Ascending order

  ExponentTowerRound({
    required this.items,
    required this.sortedItems,
  });
}

class ExponentTowerEngine {
  static final List<List<int>> _powerBank = [
    [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8],
    [3, 1], [3, 2], [3, 3], [3, 4], [3, 5],
    [4, 1], [4, 2], [4, 3], [4, 4],
    [5, 1], [5, 2], [5, 3], [5, 4],
    [6, 1], [6, 2], [6, 3],
    [7, 1], [7, 2], [7, 3],
    [8, 1], [8, 2], [8, 3],
    [9, 1], [9, 2], [9, 3],
    [10, 1], [10, 2], [10, 3],
  ];

  static ExponentTowerRound generateRound({int count = 4, math.Random? random}) {
    final rng = random ?? math.Random();
    
    final selectedPairs = <List<int>>[];
    final usedValues = <int>{};

    final shuffledBank = List<List<int>>.from(_powerBank)..shuffle(rng);

    for (final pair in shuffledBank) {
      if (selectedPairs.length >= count) break;
      final val = math.pow(pair[0], pair[1]).toInt();
      if (!usedValues.contains(val)) {
        usedValues.add(val);
        selectedPairs.add(pair);
      }
    }

    final items = selectedPairs.map((p) {
      return PowerItem(
        base: p[0],
        exp: p[1],
        value: math.pow(p[0], p[1]).toInt(),
      );
    }).toList();

    final sorted = List<PowerItem>.from(items)..sort((a, b) => a.value.compareTo(b.value));

    return ExponentTowerRound(
      items: items,
      sortedItems: sorted,
    );
  }
}
