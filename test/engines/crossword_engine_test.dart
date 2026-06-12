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
        final board = CrosswordEngine.generateBoard([words, CrosswordEngine.defaultBoardSize]);
        expect(board, isA<CrosswordBoard>());
      });

      test('board has correct size', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
          {'word': 'DOG', 'clue': 'A canine'},
        ];
        final board = CrosswordEngine.generateBoard([words, 5]);
        expect(board.size, 5);
      });

      test('board grid has correct dimensions', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
        ];
        final board = CrosswordEngine.generateBoard([words, 6]);
        expect(board.grid.length, 6);
        for (final row in board.grid) {
          expect(row.length, 6);
        }
      });

      test('words too long for board are filtered out', () {
        final words = [
          {'word': 'VERYLONGWORD', 'clue': 'Too long'},
          {'word': 'CAT', 'clue': 'A feline'},
        ];
        final board = CrosswordEngine.generateBoard([words, 5]);
        expect(board.words.any((w) => w.word == 'VERYLONGWORD'), isFalse);
      });

      test('placed words are on the board', () {
        final words = [
          {'word': 'CAT', 'clue': 'A feline'},
          {'word': 'DOG', 'clue': 'A canine'},
          {'word': 'ACE', 'clue': 'Top card'},
        ];
        final board = CrosswordEngine.generateBoard([words, 5]);
        for (final w in board.words) {
          expect(w.x, greaterThanOrEqualTo(0));
          expect(w.y, greaterThanOrEqualTo(0));
          if (w.isHorizontal) {
            expect(w.x + w.word.length, lessThanOrEqualTo(5));
          } else {
            expect(w.y + w.word.length, lessThanOrEqualTo(5));
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
        final board = CrosswordEngine.generateBoard([words, 5]);
        for (final w in board.words) {
          expect(w.number, greaterThanOrEqualTo(1));
        }
      });

      test('empty word list produces empty board', () {
        final board = CrosswordEngine.generateBoard([[], 5]);
        expect(board.words, isEmpty);
      });

      test('words do not embed within each other', () {
        final words = [
          {'word': 'YEAR', 'clue': 'Time period'},
          {'word': 'EAR', 'clue': 'Organ of hearing'},
          {'word': 'EAT', 'clue': 'Consume food'},
          {'word': 'TEAR', 'clue': 'Rip apart'},
          {'word': 'BEAR', 'clue': 'Large mammal'},
          {'word': 'NEAR', 'clue': 'Close by'},
          {'word': 'DEAR', 'clue': 'Beloved'},
          {'word': 'HEAR', 'clue': 'Perceive sound'},
          {'word': 'PEAR', 'clue': 'A fruit'},
          {'word': 'REAR', 'clue': 'Back part'},
        ];
        final board = CrosswordEngine.generateBoard([words, 8]);
        
        for (final w in board.words) {
          for (final other in board.words) {
            if (w == other) continue;
            
            if (w.isHorizontal == other.isHorizontal) {
              if (w.isHorizontal && w.y == other.y) {
                fail('Two horizontal words on same row: "${w.word}" and "${other.word}" at y=${w.y}');
              }
              if (!w.isHorizontal && w.x == other.x) {
                fail('Two vertical words on same column: "${w.word}" and "${other.word}" at x=${w.x}');
              }
            }
          }
        }
      });

      test('perpendicular words share at most one cell', () {
        final words = [
          {'word': 'YEAR', 'clue': 'Time period'},
          {'word': 'EAR', 'clue': 'Organ of hearing'},
          {'word': 'EAT', 'clue': 'Consume food'},
          {'word': 'TEAR', 'clue': 'Rip apart'},
          {'word': 'BEAR', 'clue': 'Large mammal'},
          {'word': 'NEAR', 'clue': 'Close by'},
          {'word': 'DEAR', 'clue': 'Beloved'},
          {'word': 'HEAR', 'clue': 'Perceive sound'},
          {'word': 'PEAR', 'clue': 'A fruit'},
          {'word': 'REAR', 'clue': 'Back part'},
        ];
        final board = CrosswordEngine.generateBoard([words, 8]);
        
        for (int i = 0; i < board.words.length; i++) {
          for (int j = i + 1; j < board.words.length; j++) {
            final w1 = board.words[i];
            final w2 = board.words[j];
            
            if (w1.isHorizontal != w2.isHorizontal) {
              int sharedCells = 0;
              for (int a = 0; a < w1.word.length; a++) {
                int x1 = w1.isHorizontal ? w1.x + a : w1.x;
                int y1 = w1.isHorizontal ? w1.y : w1.y + a;
                
                for (int b = 0; b < w2.word.length; b++) {
                  int x2 = w2.isHorizontal ? w2.x + b : w2.x;
                  int y2 = w2.isHorizontal ? w2.y : w2.y + b;
                  
                  if (x1 == x2 && y1 == y2) sharedCells++;
                }
              }
              expect(sharedCells, lessThanOrEqualTo(1),
                reason: 'Words "${w1.word}" and "${w2.word}" share $sharedCells cells (max 1 allowed)');
            }
          }
        }
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
        size: 8,
        grid: List.generate(8, (_) => List.filled(8, ' ')),
        words: [],
      );
      expect(board.size, 8);
      expect(board.grid.length, 8);
      expect(board.words, isEmpty);
    });
  });
}
