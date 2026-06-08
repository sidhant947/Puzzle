import 'dart:math';

class SilentLetterSearchEngine {
  final List<SilentLetterWord> _wordPool = [
    SilentLetterWord(word: 'KNIGHT', silentIndices: [0, 3, 4]), // K, G, H
    SilentLetterWord(word: 'WRIST', silentIndices: [0]), // W
    SilentLetterWord(word: 'LAMB', silentIndices: [3]), // B
    SilentLetterWord(word: 'HONEST', silentIndices: [0]), // H
    SilentLetterWord(word: 'PSALM', silentIndices: [0, 4]), // P, L
    SilentLetterWord(word: 'GNOME', silentIndices: [0]), // G
    SilentLetterWord(word: 'COLUMN', silentIndices: [5]), // N
    SilentLetterWord(word: 'DEBT', silentIndices: [2]), // B
    SilentLetterWord(word: 'SCENE', silentIndices: [1]), // C
    SilentLetterWord(word: 'ISLAND', silentIndices: [2]), // S
    SilentLetterWord(word: 'CASTLE', silentIndices: [3]), // T
    SilentLetterWord(word: 'LISTEN', silentIndices: [3]), // T
    SilentLetterWord(word: 'ANSWER', silentIndices: [3]), // W
    SilentLetterWord(word: 'SWORD', silentIndices: [1]), // W
    SilentLetterWord(word: 'KNOT', silentIndices: [0]), // K
    SilentLetterWord(word: 'COMB', silentIndices: [3]), // B
    SilentLetterWord(word: 'AUTUMN', silentIndices: [5]), // N
    SilentLetterWord(word: 'DESIGN', silentIndices: [4]), // G
    SilentLetterWord(word: 'GHOST', silentIndices: [1]), // H
    SilentLetterWord(word: 'HOUR', silentIndices: [0]), // H
    SilentLetterWord(word: 'KNEE', silentIndices: [0]), // K
    SilentLetterWord(word: 'NUMB', silentIndices: [3]), // B
    SilentLetterWord(word: 'THUMB', silentIndices: [4]), // B
    SilentLetterWord(word: 'WRECK', silentIndices: [0]), // W
    SilentLetterWord(word: 'WRONG', silentIndices: [0]), // W
  ];

  SilentLetterWord getRandomWord() {
    return _wordPool[Random().nextInt(_wordPool.length)];
  }

  bool isCorrect(List<int> selectedIndices, List<int> silentIndices) {
    if (selectedIndices.length != silentIndices.length) return false;
    final sortedSelected = List<int>.from(selectedIndices)..sort();
    final sortedSilent = List<int>.from(silentIndices)..sort();
    for (int i = 0; i < sortedSilent.length; i++) {
      if (sortedSelected[i] != sortedSilent[i]) return false;
    }
    return true;
  }
}

class SilentLetterWord {
  final String word;
  final List<int> silentIndices;

  SilentLetterWord({required this.word, required this.silentIndices});
}
