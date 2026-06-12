import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/einstein_riddle/einstein_riddle_engine.dart';

void main() {
  group('EinsteinRiddleEngine', () {
    late EinsteinRiddleEngine engine;

    setUp(() {
      engine = EinsteinRiddleEngine();
    });

    group('generatePuzzle', () {
      test('returns a map with required keys', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.containsKey('categories'), isTrue);
        expect(puzzle.containsKey('options'), isTrue);
        expect(puzzle.containsKey('clues'), isTrue);
        expect(puzzle.containsKey('solution'), isTrue);
      });

      test('categories list contains 6 entries', () {
        final puzzle = engine.generatePuzzle();
        final categories = puzzle['categories'] as List;
        expect(categories.length, 6);
      });

      test('clues list is non-empty', () {
        final puzzle = engine.generatePuzzle();
        final clues = puzzle['clues'] as List;
        expect(clues.isNotEmpty, isTrue);
      });

      test('solution has 5 houses', () {
        final puzzle = engine.generatePuzzle();
        final solution = puzzle['solution'] as Map<String, Map<String, String>>;
        expect(solution.length, 5);
      });

      test('each house in solution has all 5 category keys', () {
        final puzzle = engine.generatePuzzle();
        final solution = puzzle['solution'] as Map<String, Map<String, String>>;
        for (final house in solution.values) {
          expect(house.containsKey('Color'), isTrue);
          expect(house.containsKey('Nationality'), isTrue);
          expect(house.containsKey('Drink'), isTrue);
          expect(house.containsKey('Pet'), isTrue);
          expect(house.containsKey('Cigar'), isTrue);
        }
      });
    });

    group('checkVictory', () {
      test('returns true for identical solutions', () {
        final puzzle = engine.generatePuzzle();
        final solution = puzzle['solution'] as Map<String, Map<String, String>>;
        expect(engine.checkVictory(solution, solution), isTrue);
      });

      test('returns false for different solutions', () {
        final puzzle = engine.generatePuzzle();
        final solution = puzzle['solution'] as Map<String, Map<String, String>>;
        final altered = Map<String, Map<String, String>>.from(solution);
        altered['1'] = Map<String, String>.from(altered['1']!);
        altered['1']!['Color'] = 'Wrong';
        expect(engine.checkVictory(altered, solution), isFalse);
      });

      test('returns false for incomplete user solution', () {
        final puzzle = engine.generatePuzzle();
        final solution = puzzle['solution'] as Map<String, Map<String, String>>;
        final incomplete = Map<String, Map<String, String>>.from(solution);
        incomplete.remove('5');
        expect(engine.checkVictory(incomplete, solution), isFalse);
      });
    });
  });
}
