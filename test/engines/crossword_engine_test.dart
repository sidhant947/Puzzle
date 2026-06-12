import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/crossword/crossword_engine.dart';

void main() {
  group('CrosswordEngine', () {
    group('generateBoard', () {
      test('returns a CrosswordBoard', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
          {'word': 'DOG', 'clue': 'A canine'},
          {'word': 'ACE', 'clue': 'Top card'},
        ];
        final board = CrosswordEngine.generateBoard(words);
        expect(board, isA<CrosswordBoard>());
      });

      test('board has correct size', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
          {'word': 'DOG', 'clue': 'A canine'},
        ];
        final board = CrosswordEngine.generateBoard(words);
        expect(board.size, CrosswordEngine.boardSize);
      });

      test('board grid has correct dimensions', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
        ];
        final board = CrosswordEngine.generateBoard(words);
        expect(board.grid.length, CrosswordEngine.boardSize);
        for (final row in board.grid) {
          expect(row.length, CrosswordEngine.boardSize);
        }
      });

      test('words too long for board are filtered out', () {
        final words = [
          {'word': 'VERYLONGWORD', 'clue': 'Too long'},
          {'word': 'CAT', 'clue': 'A feline'},
        ];
        final board = CrosswordEngine.generateBoard(words);
        expect(board.words.any((w) => w.word == 'VERYLONGWORD'), isFalse);
      });

      test('placed words are on the board', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
          {'word': 'DOG', 'clue': 'A canine'},
          {'word': 'ACE', 'clue': 'Top card'},
        ];
        final board = CrosswordEngine.generateBoard(words);
        for (final w in board.words) {
          expect(w.x, greaterThanOrEqualTo(0));
          expect(w.y, greaterThanOrEqualTo(0));
          if (w.isHorizontal) {
            expect(w.x + w.word.length, lessThanOrEqualTo(CrosswordEngine.boardSize));
          } else {
            expect(w.y + w.word.length, lessThanOrEqualTo(CrosswordEngine.boardSize));
          }
        }
      });

      test('words have numbers assigned', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
          {'word': 'DOG', 'clue': 'A canine'},
          {'word': 'ACE', 'clue': 'Top card'},
          {'word': 'BED', 'clue': 'Furniture for sleeping'},
        ];
        final board = CrosswordEngine.generateBoard(words);
        for (final w in board.words) {
          expect(w.number, greaterThanOrEqualTo(1));
        }
      });

      test('empty word list produces empty board', () {
        final board = CrosswordEngine.generateBoard([]);
        expect(board.words, isEmpty);
      });
    });
  });

  group('CrosswordWord', () {
    test('stores fields with defaults', () {
      final word = CrosswordWord(word: 'TEST', clue: 'A test');
      expect(word.word, 'TEST');
      expect(word.clue, 'A test');
      expect(word.x, 0);
      expect(word.y, 0);
      expect(word.isHorizontal, true);
      expect(word.number, 0);
    });
  });

  group('CrosswordBoard', () {
    test('stores all fields', () {
      final board = CrosswordBoard(
        size: 5,
        grid: List.generate(5, (_) => List.filled(5, ' ')),
        words: [],
      );
      expect(board.size, 5);
      expect(board.grid.length, 5);
      expect(board.words, isEmpty);
    });
  });
}
