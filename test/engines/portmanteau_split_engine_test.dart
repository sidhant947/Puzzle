import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/portmanteau_split/portmanteau_split_engine.dart';

void main() {
  group('PortmanteauSplitEngine', () {
    late PortmanteauSplitEngine engine;

    setUp(() {
      engine = PortmanteauSplitEngine();
    });

    group('generatePuzzle', () {
      test('returns a PortmanteauPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<PortmanteauPuzzle>());
      });

      test('portmanteau is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.portmanteau.isNotEmpty, isTrue);
      });

      test('word1 and word2 are non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.word1.isNotEmpty, isTrue);
        expect(puzzle.word2.isNotEmpty, isTrue);
      });

      test('options list contains 6 items (2 correct + 4 distractors)', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.length, equals(6));
      });

      test('correct words are in options', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.contains(puzzle.word1), isTrue);
        expect(puzzle.options.contains(puzzle.word2), isTrue);
      });

      test('all options are unique', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.toSet().length, equals(puzzle.options.length));
      });

      test('generates different puzzles on multiple calls', () {
        final portmanteaus = <String>{};
        for (int i = 0; i < 10; i++) {
          portmanteaus.add(engine.generatePuzzle().portmanteau);
        }
        expect(portmanteaus.length, greaterThan(1));
      });
    });
  });
}
