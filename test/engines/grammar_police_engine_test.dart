import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/grammar_police/grammar_police_engine.dart';

void main() {
  group('GrammarPoliceEngine', () {
    group('GrammarSentence', () {
      test('correct sentence has no error', () {
        final s = GrammarSentence(text: 'Hello world.');
        expect(s.hasError, isFalse);
        expect(s.correction, isNull);
      });

      test('error sentence has correction', () {
        final s = GrammarSentence(
          text: 'He go to the park.',
          hasError: true,
          correction: 'He goes to the park.',
        );
        expect(s.hasError, isTrue);
        expect(s.correction, isNotNull);
      });
    });

    group('generateSentence', () {
      test('returns a GrammarSentence', () {
        final sentence = GrammarPoliceEngine.generateSentence();
        expect(sentence, isA<GrammarSentence>());
      });

      test('sentence text is non-empty', () {
        for (int i = 0; i < 30; i++) {
          final sentence = GrammarPoliceEngine.generateSentence();
          expect(sentence.text.isNotEmpty, isTrue);
        }
      });

      test('generates both correct and error sentences', () {
        bool hasCorrect = false;
        bool hasError = false;
        for (int i = 0; i < 100; i++) {
          final sentence = GrammarPoliceEngine.generateSentence();
          if (sentence.hasError) hasError = true;
          if (!sentence.hasError) hasCorrect = true;
        }
        expect(hasCorrect, isTrue);
        expect(hasError, isTrue);
      });

      test('error sentences always have a correction', () {
        for (int i = 0; i < 100; i++) {
          final sentence = GrammarPoliceEngine.generateSentence();
          if (sentence.hasError) {
            expect(sentence.correction, isNotNull);
            expect(sentence.correction!.isNotEmpty, isTrue);
          }
        }
      });

      test('generates variety of sentences', () {
        final texts = <String>{};
        for (int i = 0; i < 50; i++) {
          texts.add(GrammarPoliceEngine.generateSentence().text);
        }
        expect(texts.length, greaterThan(5));
      });
    });
  });
}
