import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/etymology_origin/etymology_origin_engine.dart';

void main() {
  group('EtymologyOriginEngine', () {
    late EtymologyOriginEngine engine;

    setUp(() {
      engine = EtymologyOriginEngine();
    });

    group('getRandomTask', () {
      test('returns an EtymologyTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<EtymologyTask>());
      });

      test('task has a non-empty word', () {
        final task = engine.getRandomTask();
        expect(task.word.isNotEmpty, isTrue);
      });

      test('task has a non-empty origin', () {
        final task = engine.getRandomTask();
        expect(task.origin.isNotEmpty, isTrue);
      });

      test('task has a non-empty description', () {
        final task = engine.getRandomTask();
        expect(task.description.isNotEmpty, isTrue);
      });

      test('task has 4 options', () {
        final task = engine.getRandomTask();
        expect(task.options, isNotNull);
        expect(task.options!.length, 4);
      });

      test('correct origin is among the options', () {
        final task = engine.getRandomTask();
        expect(task.options!.contains(task.origin), isTrue);
      });

      test('all options are unique', () {
        for (int i = 0; i < 20; i++) {
          final task = engine.getRandomTask();
          expect(task.options!.toSet().length, 4);
        }
      });
    });

    group('checkAnswer', () {
      test('returns true for correct answer', () {
        expect(engine.checkAnswer('Arabic', 'Arabic'), isTrue);
      });

      test('returns false for incorrect answer', () {
        expect(engine.checkAnswer('German', 'Arabic'), isFalse);
      });
    });
  });
}
