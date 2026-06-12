import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/vocabulary_builder/vocabulary_builder_engine.dart';

void main() {
  group('VocabularyBuilderEngine', () {
    test('generateQuestion returns a valid question for easy difficulty', () {
      final question = VocabularyBuilderEngine.generateQuestion('easy');
      expect(question.word, isNotEmpty);
      expect(question.correctAnswer, isNotEmpty);
      expect(question.options.length, 4);
      expect(question.options, contains(question.correctAnswer));
    });

    test('generateQuestion returns a valid question for hard difficulty', () {
      final question = VocabularyBuilderEngine.generateQuestion('hard');
      expect(question.word, isNotEmpty);
      expect(question.correctAnswer, isNotEmpty);
      expect(question.options.length, 4);
    });

    test('relation is either synonym or antonym', () {
      for (int i = 0; i < 20; i++) {
        final question = VocabularyBuilderEngine.generateQuestion('easy');
        expect(
          question.relation == VocabularyRelation.synonym ||
              question.relation == VocabularyRelation.antonym,
          isTrue,
        );
      }
    });

    test('correct answer appears exactly once in options', () {
      final question = VocabularyBuilderEngine.generateQuestion('easy');
      final count = question.options.where((o) => o == question.correctAnswer).length;
      expect(count, 1);
    });

    test('all options are unique', () {
      final question = VocabularyBuilderEngine.generateQuestion('easy');
      expect(question.options.toSet().length, 4);
    });

    test('multiple calls produce varied words', () {
      final words = <String>{};
      for (int i = 0; i < 30; i++) {
        words.add(VocabularyBuilderEngine.generateQuestion('easy').word);
      }
      expect(words.length, greaterThan(5));
    });
  });
}
