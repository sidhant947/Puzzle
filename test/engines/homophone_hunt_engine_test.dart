import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/homophone_hunt/homophone_hunt_engine.dart';

void main() {
  group('HomophoneHuntEngine', () {
    late HomophoneHuntEngine engine;

    setUp(() {
      engine = HomophoneHuntEngine();
    });

    group('generatePuzzle', () {
      test('returns a HomophonePuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<HomophonePuzzle>());
      });

      test('puzzle has non-empty sentence with blank', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.sentence.contains('____'), isTrue);
      });

      test('correctAnswer and wrongAnswer are different', () {
        for (int i = 0; i < 30; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.correctAnswer, isNot(equals(puzzle.wrongAnswer)));
        }
      });

      test('fullSentence has no blank', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.fullSentence.contains('____'), isFalse);
      });

      test('fullSentence contains the correct answer', () {
        final puzzle = engine.generatePuzzle();
        expect(
          puzzle.fullSentence.toLowerCase().contains(puzzle.correctAnswer.toLowerCase()),
          isTrue,
        );
      });

      test('generates different puzzles on multiple calls', () {
        final sentences = <String>{};
        for (int i = 0; i < 20; i++) {
          sentences.add(engine.generatePuzzle().sentence);
        }
        expect(sentences.length, greaterThan(1));
      });

      test('correctAnswer is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.correctAnswer.isNotEmpty, isTrue);
      });

      test('wrongAnswer is non-empty', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.wrongAnswer.isNotEmpty, isTrue);
      });
    });
  });
}
