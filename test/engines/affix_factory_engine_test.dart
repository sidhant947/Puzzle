import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/affix_factory/affix_factory_engine.dart';

void main() {
  group('AffixFactoryEngine', () {
    late AffixFactoryEngine engine;

    setUp(() {
      engine = AffixFactoryEngine();
    });

    group('getRandomTask', () {
      test('returns an AffixTask with required fields', () {
        final task = engine.getRandomTask();
        expect(task.root, isNotEmpty);
        expect(task.affixes, isNotEmpty);
        expect(task.affixes.length, 3);
        expect(task.distractor, isNotEmpty);
        expect(task.description, isNotEmpty);
      });

      test('options include all affixes and the distractor', () {
        final task = engine.getRandomTask();
        expect(task.options, isNotNull);
        expect(task.options!.length, 4);
        expect(task.options, containsAll([...task.affixes, task.distractor]));
      });

      test('options are shuffled (not always same order)', () {
        final results = <String>{};
        for (int i = 0; i < 10; i++) {
          final task = engine.getRandomTask();
          results.add(task.options!.join(','));
        }
        expect(results.length, greaterThan(1));
      });
    });

    group('checkAnswer', () {
      test('returns true when selected matches correct exactly', () {
        expect(engine.checkAnswer(['UN', 'NESS', 'LY'], ['UN', 'NESS', 'LY']), isTrue);
      });

      test('returns true when selected is in different order', () {
        expect(engine.checkAnswer(['LY', 'UN', 'NESS'], ['UN', 'NESS', 'LY']), isTrue);
      });

      test('returns false when selected has extra item', () {
        expect(engine.checkAnswer(['UN', 'NESS', 'LY', 'PRE'], ['UN', 'NESS', 'LY']), isFalse);
      });

      test('returns false when selected is missing item', () {
        expect(engine.checkAnswer(['UN', 'NESS'], ['UN', 'NESS', 'LY']), isFalse);
      });

      test('returns false when selected contains wrong item', () {
        expect(engine.checkAnswer(['UN', 'NESS', 'PRE'], ['UN', 'NESS', 'LY']), isFalse);
      });

      test('returns false for empty lists when correct is non-empty', () {
        expect(engine.checkAnswer([], ['UN', 'NESS', 'LY']), isFalse);
      });
    });
  });

  group('AffixTask', () {
    test('stores all fields correctly', () {
      final task = AffixTask(
        root: 'TEST',
        affixes: ['A', 'B', 'C'],
        distractor: 'D',
        description: 'Test desc',
      );
      expect(task.root, 'TEST');
      expect(task.affixes, ['A', 'B', 'C']);
      expect(task.distractor, 'D');
      expect(task.description, 'Test desc');
      expect(task.options, isNull);
    });
  });
}
