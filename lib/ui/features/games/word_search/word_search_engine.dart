import 'dart:math';

class WordSearchWord {
  final String word;
  final List<Point<int>> positions;
  bool isFound;

  WordSearchWord({
    required this.word,
    required this.positions,
    this.isFound = false,
  });
}

class WordSearchBoard {
  final int size;
  final List<List<String>> grid;
  final List<WordSearchWord> words;

  WordSearchBoard({
    required this.size,
    required this.grid,
    required this.words,
  });
}

class WordSearchEngine {
  static const int boardSize = 10;
  final Random _random = Random();

  WordSearchBoard generateBoard(List<String> candidates) {
    List<List<String>> grid =
        List.generate(boardSize, (_) => List.filled(boardSize, ''));
    List<WordSearchWord> placedWords = [];

    // Try to place up to 8 words
    for (String word in candidates) {
      if (placedWords.length >= 8) break;
      _tryPlaceWord(grid, word, placedWords);
    }

    // Fill remaining empty cells with random letters
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for (int y = 0; y < boardSize; y++) {
      for (int x = 0; x < boardSize; x++) {
        if (grid[y][x] == '') {
          grid[y][x] = letters[_random.nextInt(letters.length)];
        }
      }
    }

    return WordSearchBoard(size: boardSize, grid: grid, words: placedWords);
  }

  bool _tryPlaceWord(List<List<String>> grid, String word, List<WordSearchWord> placedWords) {
    // Directions: [dx, dy]
    final directions = [
      [1, 0],   // Horizontal
      [0, 1],   // Vertical
      [1, 1],   // Diagonal down-right
      [1, -1],  // Diagonal up-right
    ];
    directions.shuffle();

    // Try all possible start positions
    List<Point<int>> starts = [];
    for (int y = 0; y < boardSize; y++) {
      for (int x = 0; x < boardSize; x++) {
        starts.add(Point(x, y));
      }
    }
    starts.shuffle();

    for (var dir in directions) {
      int dx = dir[0];
      int dy = dir[1];

      for (var start in starts) {
        if (_canPlace(grid, word, start.x, start.y, dx, dy)) {
          List<Point<int>> positions = [];
          for (int i = 0; i < word.length; i++) {
            int x = start.x + (i * dx);
            int y = start.y + (i * dy);
            grid[y][x] = word[i];
            positions.add(Point(x, y));
          }
          placedWords.add(WordSearchWord(word: word, positions: positions));
          return true;
        }
      }
    }
    return false;
  }

  bool _canPlace(List<List<String>> grid, String word, int startX, int startY, int dx, int dy) {
    int endX = startX + (word.length - 1) * dx;
    int endY = startY + (word.length - 1) * dy;

    if (endX < 0 || endX >= boardSize || endY < 0 || endY >= boardSize) return false;

    for (int i = 0; i < word.length; i++) {
      int x = startX + (i * dx);
      int y = startY + (i * dy);
      if (grid[y][x] != '' && grid[y][x] != word[i]) return false;
    }
    return true;
  }
}
