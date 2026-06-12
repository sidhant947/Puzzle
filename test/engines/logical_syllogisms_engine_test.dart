import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/logical_syllogisms/logical_syllogisms_engine.dart';

void main() {
  group('LogicalSyllogismsEngine', () {
    late LogicalSyllogismsEngine engine;

    setUp(() {
      engine = LogicalSyllogismsEngine();
    });

    group('generatePuzzle', () {
      test('returns a puzzle with premises and conclusion', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.premise1, isNotEmpty);
        expect(puzzle.premise2, isNotEmpty);
        expect(puzzle.conclusion, isNotEmpty);
      });

      test('premises end with periods', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.premise1, endsWith('.'));
          expect(puzzle.premise2, endsWith('.'));
        }
      });

      test('conclusion starts with "Therefore"', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.conclusion, startsWith('Therefore'));
        }
      });

      test('isValid is a boolean', () {
        for (int i = 0; i < 20; i++) {
          final puzzle = engine.generatePuzzle();
          expect(puzzle.isValid, isA<bool>());
        }
      });

      test('generates both valid and invalid puzzles', () {
        bool foundValid = false;
        bool foundInvalid = false;
        for (int i = 0; i < 50; i++) {
          final puzzle = engine.generatePuzzle();
          if (puzzle.isValid) foundValid = true;
          if (!puzzle.isValid) foundInvalid = true;
          if (foundValid && foundInvalid) break;
        }
        expect(foundValid, isTrue, reason: 'Should generate at least one valid puzzle');
        expect(foundInvalid, isTrue, reason: 'Should generate at least one invalid puzzle');
      });

      test('premises contain subject and object terms', () {
        final puzzle = engine.generatePuzzle();
        // Premise 1 should contain "All", "No", or "Some"
        expect(puzzle.premise1, matches(RegExp(r'(All|No|Some)')));
        expect(puzzle.premise2, matches(RegExp(r'(All|No|Some)')));
      });
    });

    group('Quantifier', () {
      test('has correct labels', () {
        expect(Quantifier.all.label, equals('All'));
        expect(Quantifier.no.label, equals('No'));
        expect(Quantifier.some.label, equals('Some'));
        expect(Quantifier.someNot.label, equals('Some...not'));
      });
    });

    group('LogicalSyllogismPuzzle', () {
      test('stores fields correctly', () {
        final puzzle = LogicalSyllogismPuzzle(
          premise1: 'All cats are animals.',
          premise2: 'All animals are living things.',
          conclusion: 'Therefore, all cats are living things.',
          isValid: true,
        );
        expect(puzzle.premise1, equals('All cats are animals.'));
        expect(puzzle.isValid, isTrue);
      });
    });
  });
}
