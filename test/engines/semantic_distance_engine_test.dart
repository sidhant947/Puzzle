import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/semantic_distance/semantic_distance_engine.dart';

void main() {
  group('SemanticDistanceEngine', () {
    late SemanticDistanceEngine engine;

    setUp(() {
      engine = SemanticDistanceEngine();
    });

    group('generatePuzzle', () {
      test('returns a SemanticDistancePuzzle', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, isA<SemanticDistancePuzzle>());
      });

      test('puzzle has a non-empty target', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.target.isNotEmpty, true);
      });

      test('puzzle has related words', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.relatedWords.isNotEmpty, true);
      });

      test('returns different puzzles across calls', () {
        final puzzles = List.generate(30, (_) => engine.generatePuzzle());
        final uniqueTargets = puzzles.map((p) => p.target).toSet();
        expect(uniqueTargets.length, greaterThan(1));
      });
    });

    group('calculateDistance', () {
      test('returns 0.0 when guess matches target exactly', () {
        final distance = engine.calculateDistance('APPLE', 'APPLE');
        expect(distance, 0.0);
      });

      test('returns 0.0 for case-insensitive exact match', () {
        final distance = engine.calculateDistance('APPLE', 'apple');
        expect(distance, 0.0);
      });

      test('returns 0.0 for exact match with extra whitespace', () {
        final distance = engine.calculateDistance('APPLE', '  APPLE  ');
        expect(distance, 0.0);
      });

      test('returns known distance for related word FRUIT', () {
        final distance = engine.calculateDistance('APPLE', 'FRUIT');
        expect(distance, 10.5);
      });

      test('returns known distance for related word ORANGE', () {
        final distance = engine.calculateDistance('APPLE', 'ORANGE');
        expect(distance, 25.2);
      });

      test('returns known distance for OCEAN target related words', () {
        expect(engine.calculateDistance('OCEAN', 'WATER'), 5.2);
        expect(engine.calculateDistance('OCEAN', 'SEA'), 8.1);
        expect(engine.calculateDistance('OCEAN', 'SHARK'), 30.2);
      });

      test('returns known distance for SPACE target related words', () {
        expect(engine.calculateDistance('SPACE', 'STAR'), 10.2);
        expect(engine.calculateDistance('SPACE', 'PLANET'), 12.5);
      });

      test('returns pseudo-random distance for unknown word', () {
        final distance = engine.calculateDistance('APPLE', 'XYZZY');
        expect(distance, greaterThanOrEqualTo(50.0));
        expect(distance, lessThan(100.0));
      });

      test('unknown word distances are deterministic for same input', () {
        final d1 = engine.calculateDistance('APPLE', 'UNKNOWN');
        final d2 = engine.calculateDistance('APPLE', 'UNKNOWN');
        expect(d1, d2);
      });

      test('unknown word distances vary across different inputs', () {
        final d1 = engine.calculateDistance('APPLE', 'CAT');
        final d2 = engine.calculateDistance('APPLE', 'ELEPHANT');
        expect(d1 != d2, true);
      });
    });
  });

  group('SemanticDistancePuzzle', () {
    test('stores target and related words correctly', () {
      final puzzle = SemanticDistancePuzzle(
        target: 'TEST',
        relatedWords: {'A': 1.0, 'B': 2.0},
      );
      expect(puzzle.target, 'TEST');
      expect(puzzle.relatedWords['A'], 1.0);
      expect(puzzle.relatedWords['B'], 2.0);
    });
  });
}
