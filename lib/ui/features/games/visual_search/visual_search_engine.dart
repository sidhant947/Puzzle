import 'dart:math';

class VisualSearchLevel {
  final List<String> symbols;
  final int targetIndex;
  final int gridSize;

  VisualSearchLevel({
    required this.symbols,
    required this.targetIndex,
    required this.gridSize,
  });
}

class VisualSearchEngine {
  final Random _random = Random();

  final List<List<String>> _symbolPairs = [
    ['O', 'Q'],
    ['E', 'F'],
    ['I', 'L'],
    ['C', 'G'],
    ['M', 'N'],
    ['R', 'P'],
    ['U', 'V'],
    ['S', '5'],
    ['B', '8'],
    ['X', 'Y'],
    ['K', 'X'],
    ['0', 'O'],
    ['1', 'I'],
    ['6', '9'],
    ['n', 'u'],
    ['p', 'q'],
    ['b', 'd'],
    ['m', 'w'],
  ];

  VisualSearchLevel generateLevel(int score) {
    int gridSize;
    if (score < 5) {
      gridSize = 4; // 4x4
    } else if (score < 12) {
      gridSize = 5; // 5x5
    } else if (score < 20) {
      gridSize = 6; // 6x6
    } else if (score < 30) {
      gridSize = 7; // 7x7
    } else {
      gridSize = 8; // 8x8
    }

    int totalCount = gridSize * gridSize;
    final pair = _symbolPairs[_random.nextInt(_symbolPairs.length)];
    
    // Randomly decide which is target and which is distractor
    bool swap = _random.nextBool();
    String distractor = swap ? pair[0] : pair[1];
    String target = swap ? pair[1] : pair[0];

    int targetIndex = _random.nextInt(totalCount);
    List<String> symbols = List.generate(totalCount, (i) => i == targetIndex ? target : distractor);

    return VisualSearchLevel(
      symbols: symbols,
      targetIndex: targetIndex,
      gridSize: gridSize,
    );
  }
}
