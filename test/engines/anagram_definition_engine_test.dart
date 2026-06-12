import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/anagram_definition/anagram_definition_engine.dart';

void main() {
  group('AnagramDefinitionEngine', () {
    late AnagramDefinitionEngine engine;

    setUp(() {
      engine = AnagramDefinitionEngine();
    });

    group('getRandomTask', () {
      test('returns an AnagramTask with all fields', () {
        final task = engine.getRandomTask();
        expect(task.scrambled, isNotEmpty);
        expect(task.target, isNotEmpty);
        expect(task.definition, isNotEmpty);
      });

      test('scrambled word and target are different', () {
        // Run multiple times since random
        for (int i = 0; i < 5; i++) {
          final task = engine.getRandomTask();
          expect(task.scrambled, isNot(equals(task.target)));
        }
      });

      test('scrambled and target contain same letters', () {
        final task = engine.getRandomTask();
        final sortedScrambled = task.scrambled.split('')..sort();
        final sortedTarget = task.target.replaceAll(' ', '').split('')..sort();
        expect(sortedScrambled.join(), equals(sortedTarget.join()));
      });
    });

    group('checkAnswer', () {
      test('returns true for correct answer', () {
        expect(engine.checkAnswer('LEADER', 'LEADER'), isTrue);
      });

      test('returns true case insensitive', () {
        expect(engine.checkAnswer('leader', 'LEADER'), isTrue);
      });

      test('returns true ignores spaces', () {
        expect(engine.checkAnswer('DIRTYROOM', 'DIRTY ROOM'), isTrue);
      });

      test('returns true ignores spaces and case', () {
        expect(engine.checkAnswer('dirty room', 'DIRTY ROOM'), isTrue);
      });

      test('returns false for wrong answer', () {
        expect(engine.checkAnswer('WRONG', 'LEADER'), isFalse);
      });

      test('returns false for empty string', () {
        expect(engine.checkAnswer('', 'LEADER'), isFalse);
      });
    });
  });

  group('AnagramTask', () {
    test('stores all fields', () {
      final task = AnagramTask(
        scrambled: 'TEST',
        target: 'TEST',
        definition: 'A test definition',
      );
      expect(task.scrambled, 'TEST');
      expect(task.target, 'TEST');
      expect(task.definition, 'A test definition');
    });
  });
}
