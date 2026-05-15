import 'dart:math';

class MemoryPalaceEngine {
  static const List<String> wordPool = [
    'Apple', 'Banana', 'Cat', 'Dog', 'Elephant', 'Frog', 'Guitar', 'Hat', 'Ice', 'Jacket',
    'Kangaroo', 'Lemon', 'Mouse', 'Notebook', 'Orange', 'Pencil', 'Queen', 'Rabbit', 'Snake', 'Tiger',
    'Umbrella', 'Violin', 'Whale', 'Xylophone', 'Yo-yo', 'Zebra', 'Airplane', 'Boat', 'Car', 'Drum',
    'Egg', 'Flower', 'Grape', 'Hammer', 'Island', 'Juice', 'Key', 'Lamp', 'Moon', 'Nest',
    'Owl', 'Piano', 'Quilt', 'Ring', 'Sun', 'Tree', 'Vase', 'Watch', 'Yacht', 'Zip'
  ];

  static Map<int, String> generateLevel(int wordCount) {
    final random = Random();
    List<String> selectedWords = List.from(wordPool)..shuffle();
    selectedWords = selectedWords.take(wordCount).toList();

    List<int> positions = List.generate(9, (i) => i)..shuffle();
    
    Map<int, String> assignments = {};
    for (int i = 0; i < wordCount; i++) {
      assignments[positions[i]] = selectedWords[i];
    }

    return assignments;
  }
}
