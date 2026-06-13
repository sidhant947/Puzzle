import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/chain_reaction/chain_reaction_engine.dart';

void main() {
  group('ChainReactionEngine', () {
    late ChainReactionEngine engine;

    setUp(() {
      engine = ChainReactionEngine();
    });

    tearDown(() {
      ChainReactionEngine.debugReset();
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
      setUp(() {
        // Inject a deterministic dictionary for tests so we do not depend on
        // the asset bundle being available in the test environment.
        ChainReactionEngine.debugSetDictionary({'CAT', 'DOG', 'HELLO', 'WORLD', 'PUZZLE'});
      });

      test('returns true for words in the dictionary', () {
        expect(engine.isRealWord('CAT'), isTrue);
        expect(engine.isRealWord('HELLO'), isTrue);
      });

      test('is case insensitive', () {
        expect(engine.isRealWord('cat'), isTrue);
        expect(engine.isRealWord('Hello'), isTrue);
      });

      test('returns false for nonsense words', () {
        expect(engine.isRealWord('QWERTY'), isFalse);
        expect(engine.isRealWord('XYZQQ'), isFalse);
        expect(engine.isRealWord('ZXCVBN'), isFalse);
      });

      test('returns false for words shorter than 3 chars', () {
        expect(engine.isRealWord('AB'), isFalse);
        expect(engine.isRealWord('A'), isFalse);
      });

      test('returns false for words longer than 7 chars', () {
        expect(engine.isRealWord('SUPERCALIFRAGILISTIC'), isFalse);
        expect(engine.isRealWord('ABCDEFGH'), isFalse);
      });

      test('returns false when dictionary has not been loaded', () {
        ChainReactionEngine.debugReset();
        expect(engine.isRealWord('CAT'), isFalse);
      });

      test('returns false for words containing non-letters', () {
        expect(engine.isRealWord('CAT1'), isFalse);
        expect(engine.isRealWord('CA-T'), isFalse);
      });
    });

    group('ensureLoaded', () {
      test('returns false when asset is unavailable', () async {
        // No asset bundle is wired up in this test; loadString will throw.
        final loaded = await engine.ensureLoaded();
        expect(loaded, isFalse);
      });

      test('returns true when dictionary is pre-populated', () async {
        ChainReactionEngine.debugSetDictionary({'CAT'});
        final loaded = await engine.ensureLoaded();
        expect(loaded, isTrue);
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
