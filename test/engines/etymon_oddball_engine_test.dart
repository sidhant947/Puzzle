import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/etymon_oddball/etymon_oddball_engine.dart';

void main() {
  group('EtymonOddballEngine', () {
    late EtymonOddballEngine engine;

    setUp(() {
      engine = EtymonOddballEngine();
    });

    group('getRandomTask', () {
      test('returns an OddballTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<OddballTask>());
      });

      test('task has exactly 4 words', () {
        final task = engine.getRandomTask();
        expect(task.words.length, 4);
      });

      test('oddball is one of the words', () {
        final task = engine.getRandomTask();
        expect(task.words.contains(task.oddball), isTrue);
      });

      test('all words are unique', () {
        for (int i = 0; i < 20; i++) {
          final task = engine.getRandomTask();
          expect(task.words.toSet().length, 4);
        }
      });

      test('description is non-empty', () {
        final task = engine.getRandomTask();
        expect(task.description.isNotEmpty, isTrue);
      });

      test('all words are uppercase', () {
        for (int i = 0; i < 20; i++) {
          final task = engine.getRandomTask();
          for (final word in task.words) {
            expect(word, word.toUpperCase());
          }
        }
      });
    });

    group('checkAnswer', () {
      test('returns true for correct oddball selection', () {
        final task = engine.getRandomTask();
        expect(engine.checkAnswer(task.oddball, task.oddball), isTrue);
      });

      test('returns false for incorrect selection', () {
        final task = engine.getRandomTask();
        final wrongWord = task.words.firstWhere((w) => w != task.oddball);
        expect(engine.checkAnswer(wrongWord, task.oddball), isFalse);
      });
    });
  });
}
