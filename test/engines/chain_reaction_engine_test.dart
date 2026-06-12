import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/chain_reaction/chain_reaction_engine.dart';

void main() {
  group('ChainReactionEngine', () {
    late ChainReactionEngine engine;

    setUp(() {
      engine = ChainReactionEngine();
    });

    group('generatePuzzle', () {
      test('returns a ChainReactionPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<ChainReactionPuzzle>());
      });

      test('puzzle has a start word', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.startWord, isNotEmpty);
      });

      test('puzzle has a target chain length of 5', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.targetChainLength, 5);
      });

      test('start word is uppercase', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.startWord, equals(puzzle.startWord.toUpperCase()));
      });
    });

    group('isValidNextWord', () {
      test('returns true when last 2 chars match first 2 chars', () {
        expect(engine.isValidNextWord('ACTION', 'ONION'), isTrue);
      });

      test('returns false when last 2 chars do not match', () {
        expect(engine.isValidNextWord('ACTION', 'HELLO'), isFalse);
      });

      test('returns true case insensitive', () {
        expect(engine.isValidNextWord('action', 'ONION'), isTrue);
      });

      test('returns false for words shorter than 2 chars', () {
        expect(engine.isValidNextWord('A', 'ONION'), isFalse);
        expect(engine.isValidNextWord('ACTION', 'O'), isFalse);
      });
    });

    group('isRealWord', () {
      test('returns true for words 3+ chars', () {
        expect(engine.isRealWord('CAT'), isTrue);
        expect(engine.isRealWord('HELLO'), isTrue);
      });

      test('returns false for words shorter than 3 chars', () {
        expect(engine.isRealWord('AB'), isFalse);
        expect(engine.isRealWord('A'), isFalse);
      });
    });
  });

  group('ChainReactionPuzzle', () {
    test('stores startWord and targetChainLength', () {
      final puzzle = ChainReactionPuzzle(
        startWord: 'TEST',
        targetChainLength: 5,
      );
      expect(puzzle.startWord, 'TEST');
      expect(puzzle.targetChainLength, 5);
    });
  });
}
