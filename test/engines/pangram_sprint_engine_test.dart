import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/pangram_sprint/pangram_sprint_engine.dart';

void main() {
  group('PangramSprintEngine', () {
    late PangramSprintEngine engine;

    setUp(() {
      engine = PangramSprintEngine();
    });

    group('getRandomTask', () {
      test('returns a PangramTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<PangramTask>());
      });

      test('task has a non-empty sentence', () {
        final task = engine.getRandomTask();
        expect(task.sentence.isNotEmpty, isTrue);
      });

      test('task has a non-empty words list', () {
        final task = engine.getRandomTask();
        expect(task.words.isNotEmpty, isTrue);
      });

      test('all words are uppercase', () {
        final task = engine.getRandomTask();
        for (final word in task.words) {
          expect(word, equals(word.toUpperCase()));
        }
      });

      test('returns different tasks on multiple calls', () {
        final sentences = <String>{};
        for (int i = 0; i < 20; i++) {
          sentences.add(engine.getRandomTask().sentence);
        }
        expect(sentences.length, greaterThan(1));
      });
    });

    group('isPangram', () {
      test('returns true for a known pangram', () {
        expect(engine.isPangram('The quick brown fox jumps over the lazy dog'), isTrue);
      });

      test('returns true for lowercase pangram', () {
        expect(engine.isPangram('pack my box with five dozen liquor jugs'), isTrue);
      });

      test('returns false for a short word', () {
        expect(engine.isPangram('HELLO'), isFalse);
      });

      test('returns false for missing letters', () {
        expect(engine.isPangram('The quick brown fox jumps over the lazy do'), isFalse);
      });

      test('returns true for pangram with extra spaces', () {
        expect(engine.isPangram('Sphinx of black quartz, judge my vow'), isTrue);
      });

      test('returns false for empty string', () {
        expect(engine.isPangram(''), isFalse);
      });
    });
  });
}
