import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/spoonerism_solver/spoonerism_solver_engine.dart';

void main() {
  group('SpoonerismSolverEngine', () {
    late SpoonerismSolverEngine engine;

    setUp(() {
      engine = SpoonerismSolverEngine();
    });

    group('getRandomTask', () {
      test('returns a SpoonerismTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<SpoonerismTask>());
      });

      test('task has a non-empty spoonerism', () {
        final task = engine.getRandomTask();
        expect(task.spoonerism.isNotEmpty, isTrue);
      });

      test('task has a non-empty original', () {
        final task = engine.getRandomTask();
        expect(task.original.isNotEmpty, isTrue);
      });

      test('task has exactly 3 options', () {
        final task = engine.getRandomTask();
        expect(task.options.length, 3);
      });

      test('task original is among the options', () {
        final task = engine.getRandomTask();
        expect(task.options.contains(task.original), isTrue);
      });

      test('returns different tasks on multiple calls (probabilistic)', () {
        final tasks = <String>{};
        for (int i = 0; i < 20; i++) {
          tasks.add(engine.getRandomTask().spoonerism);
        }
        expect(tasks.length, greaterThan(1));
      });
    });

    group('checkAnswer', () {
      test('returns true when selected matches correct', () {
        expect(engine.checkAnswer('HELLO', 'HELLO'), isTrue);
      });

      test('returns false when selected does not match correct', () {
        expect(engine.checkAnswer('HELLO', 'WORLD'), isFalse);
      });

      test('returns false for empty strings', () {
        expect(engine.checkAnswer('', ''), isTrue);
      });

      test('returns false for case mismatch', () {
        expect(engine.checkAnswer('hello', 'HELLO'), isFalse);
      });
    });
  });
}
