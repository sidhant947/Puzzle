import 'dart:math';

enum WCSAttribute { color, shape, number }

class WCSCard {
  final String shape;
  final String color;
  final int number;

  WCSCard({required this.shape, required this.color, required this.number});

  @override
  String toString() => '$number $color $shape';
}

class WisconsinCardSortingEngine {
  final Random _random = Random();
  
  final List<String> shapes = ['circle', 'triangle', 'star', 'cross'];
  final List<String> colors = ['red', 'blue', 'green', 'yellow'];
  final List<int> numbers = [1, 2, 3, 4];

  List<WCSCard> getStimulusCards() {
    return [
      WCSCard(shape: 'circle', color: 'red', number: 1),
      WCSCard(shape: 'triangle', color: 'blue', number: 2),
      WCSCard(shape: 'star', color: 'green', number: 3),
      WCSCard(shape: 'cross', color: 'yellow', number: 4),
    ];
  }

  WCSCard generateRandomCard() {
    return WCSCard(
      shape: shapes[_random.nextInt(shapes.length)],
      color: colors[_random.nextInt(colors.length)],
      number: numbers[_random.nextInt(numbers.length)],
    );
  }

  bool isMatch(WCSCard card, WCSCard stimulus, WCSAttribute rule) {
    switch (rule) {
      case WCSAttribute.color:
        return card.color == stimulus.color;
      case WCSAttribute.shape:
        return card.shape == stimulus.shape;
      case WCSAttribute.number:
        return card.number == stimulus.number;
    }
  }

  WCSAttribute nextRule(WCSAttribute currentRule) {
    List<WCSAttribute> remaining = WCSAttribute.values.where((r) => r != currentRule).toList();
    return remaining[_random.nextInt(remaining.length)];
  }
}
