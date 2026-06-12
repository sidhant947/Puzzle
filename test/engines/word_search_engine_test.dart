import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/word_search/word_search_engine.dart';

void main() {
  group('WordSearchEngine', () {
    test('generateBoard returns valid board', () {
      final board = WordSearchEngine.generateBoard(['CAT', 'DOG', 'BIRD']);
      expect(board.size, 10);
      expect(board.grid.length, 10);
      expect(board.words, isA<List<WordSearchWord>>());
    });

    test('grid has correct dimensions', () {
      final board = WordSearchEngine.generateBoard(['CAT', 'DOG']);
      expect(board.grid.length, 10);
      for (final row in board.grid) {
        expect(row.length, 10);
      }
    });

    test('grid cells are single uppercase letters', () {
      final board = WordSearchEngine.generateBoard(['CAT', 'DOG']);
      for (final row in board.grid) {
        for (final cell in row) {
          expect(cell.length, 1);
          expect(RegExp(r'^[A-Z]$').hasMatch(cell), isTrue);
        }
      }
    });

    test('placed words appear in the grid at their positions', () {
      final board = WordSearchEngine.generateBoard(['CAT', 'DOG', 'BIRD']);
      for (final word in board.words) {
        String reconstructed = '';
        for (final pos in word.positions) {
          reconstructed += board.grid[pos.y][pos.x];
        }
        expect(reconstructed, word.word);
      }
    });

    test('places up to 8 words', () {
      final candidates = List.generate(20, (i) => 'WORD$i');
      final board = WordSearchEngine.generateBoard(candidates);
      expect(board.words.length, lessThanOrEqualTo(8));
    });

    test('no empty cells in the grid', () {
      final board = WordSearchEngine.generateBoard(['CAT']);
      for (final row in board.grid) {
        for (final cell in row) {
          expect(cell.isNotEmpty, isTrue);
        }
      }
    });

    test('empty candidates produces board with no placed words', () {
      final board = WordSearchEngine.generateBoard([]);
      expect(board.words.length, 0);
    });
  });

  group('WordSearchWord', () {
    test('isFound defaults to false', () {
      final word = WordSearchWord(word: 'CAT', positions: []);
      expect(word.isFound, isFalse);
    });

    test('isFound can be set', () {
      final word = WordSearchWord(word: 'CAT', positions: [], isFound: true);
      expect(word.isFound, isTrue);
    });
  });
}
