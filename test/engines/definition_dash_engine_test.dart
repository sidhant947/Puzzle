import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/definition_dash/definition_dash_engine.dart';

void main() {
  group('DefinitionDashEngine', () {
    late DefinitionDashEngine engine;

    setUp(() {
      engine = DefinitionDashEngine();
    });

    group('generatePuzzle', () {
      test('returns a DefinitionDashPuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<DefinitionDashPuzzle>());
      });

      test('puzzle has a non-empty word', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.word.isNotEmpty, isTrue);
      });

      test('puzzle has a non-empty correctDefinition', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.correctDefinition.isNotEmpty, isTrue);
      });

      test('options has exactly 4 entries', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.length, 4);
      });

      test('correctDefinition is among the options', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.contains(puzzle.correctDefinition), isTrue);
      });

      test('all options are unique', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.options.toSet().length, 4);
      });

      test('word is all uppercase', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.word, equals(puzzle.word.toUpperCase()));
      });

      test('generates different puzzles on multiple calls', () {
        final words = <String>{};
        for (int i = 0; i < 20; i++) {
          words.add(engine.generatePuzzle().word);
        }
        expect(words.length, greaterThan(1));
      });
    });
  });
}
