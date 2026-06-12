import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/cognate_catch/cognate_catch_engine.dart';

void main() {
  group('CognateCatchEngine', () {
    late CognateCatchEngine engine;

    setUp(() {
      engine = CognateCatchEngine();
    });

    group('getRandomTask', () {
      test('returns a CognateTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<CognateTask>());
      });

      test('task has all fields', () {
        final task = engine.getRandomTask();
        expect(task.word1, isNotEmpty);
        expect(task.word2, isNotEmpty);
        expect(task.language, isNotEmpty);
        expect(task.description, isNotEmpty);
      });

      test('task has isCognate boolean', () {
        final task = engine.getRandomTask();
        expect(task.isCognate, isA<bool>());
      });
    });

    group('checkAnswer', () {
      test('returns true for correct answer (cognate)', () {
        expect(engine.checkAnswer(true, true), isTrue);
      });

      test('returns true for correct answer (not cognate)', () {
        expect(engine.checkAnswer(false, false), isTrue);
      });

      test('returns false for wrong answer (said cognate but isn\'t)', () {
        expect(engine.checkAnswer(true, false), isFalse);
      });

      test('returns false for wrong answer (said not cognate but is)', () {
        expect(engine.checkAnswer(false, true), isFalse);
      });
    });
  });

  group('CognateTask', () {
    test('stores all fields', () {
      final task = CognateTask(
        word1: 'NIGHT',
        word2: 'NACHT',
        language: 'German',
        isCognate: true,
        description: 'Test desc',
      );
      expect(task.word1, 'NIGHT');
      expect(task.word2, 'NACHT');
      expect(task.language, 'German');
      expect(task.isCognate, isTrue);
      expect(task.description, 'Test desc');
    });
  });
}
