import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/grammar_sort/grammar_sort_engine.dart';

void main() {
  group('GrammarSortEngine', () {
    late GrammarSortEngine engine;

    setUp(() {
      engine = GrammarSortEngine();
    });

    group('nextWord', () {
      test('returns a GrammarWord', () {
        final word = engine.nextWord();
        expect(word, isA<GrammarWord>());
      });

      test('word text is uppercase', () {
        for (int i = 0; i < 30; i++) {
          final word = engine.nextWord();
          expect(word.word, word.word.toUpperCase());
        }
      });

      test('type is one of noun, verb, adjective', () {
        for (int i = 0; i < 50; i++) {
          final word = engine.nextWord();
          expect(
            word.type == PartOfSpeech.noun ||
            word.type == PartOfSpeech.verb ||
            word.type == PartOfSpeech.adjective,
            isTrue,
          );
        }
      });

      test('generates all three parts of speech', () {
        bool hasNoun = false;
        bool hasVerb = false;
        bool hasAdjective = false;
        for (int i = 0; i < 100; i++) {
          final word = engine.nextWord();
          if (word.type == PartOfSpeech.noun) hasNoun = true;
          if (word.type == PartOfSpeech.verb) hasVerb = true;
          if (word.type == PartOfSpeech.adjective) hasAdjective = true;
        }
        expect(hasNoun, isTrue);
        expect(hasVerb, isTrue);
        expect(hasAdjective, isTrue);
      });

      test('generates variety of words', () {
        final words = <String>{};
        for (int i = 0; i < 50; i++) {
          words.add(engine.nextWord().word);
        }
        expect(words.length, greaterThan(5));
      });
    });
  });
}
