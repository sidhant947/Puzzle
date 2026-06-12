import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/compound_connect/compound_connect_engine.dart';

void main() {
  group('CompoundConnectEngine', () {
    late CompoundConnectEngine engine;

    setUp(() {
      engine = CompoundConnectEngine();
    });

    group('getRandomTask', () {
      test('returns a CompoundTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<CompoundTask>());
      });

      test('task has prefix, suffix, and result', () {
        final task = engine.getRandomTask();
        expect(task.prefix, isNotEmpty);
        expect(task.suffix, isNotEmpty);
        expect(task.result, isNotEmpty);
      });

      test('result is prefix + suffix', () {
        final task = engine.getRandomTask();
        expect(task.result, equals('${task.prefix}${task.suffix}'));
      });
    });

    group('getOptions', () {
      test('returns 4 options', () {
        final task = engine.getRandomTask();
        final options = engine.getOptions(task);
        expect(options.length, 4);
      });

      test('correct suffix is in options', () {
        final task = engine.getRandomTask();
        final options = engine.getOptions(task);
        expect(options, contains(task.suffix));
      });

      test('options are unique', () {
        final task = engine.getRandomTask();
        final options = engine.getOptions(task);
        expect(options.toSet().length, options.length);
      });
    });

    group('checkAnswer', () {
      test('returns true for correct answer', () {
        expect(engine.checkAnswer('FLOWER', 'FLOWER'), isTrue);
      });

      test('returns false for wrong answer', () {
        expect(engine.checkAnswer('WRONG', 'FLOWER'), isFalse);
      });

      test('returns false for empty string', () {
        expect(engine.checkAnswer('', 'FLOWER'), isFalse);
      });
    });
  });

  group('CompoundTask', () {
    test('stores all fields', () {
      final task = CompoundTask(
        prefix: 'SUN',
        suffix: 'FLOWER',
        result: 'SUNFLOWER',
      );
      expect(task.prefix, 'SUN');
      expect(task.suffix, 'FLOWER');
      expect(task.result, 'SUNFLOWER');
    });
  });
}
