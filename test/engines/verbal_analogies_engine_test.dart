import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/verbal_analogies/verbal_analogies_engine.dart';

void main() {
  group('VerbalAnalogiesEngine', () {
    late VerbalAnalogiesEngine engine;

    setUp(() {
      engine = VerbalAnalogiesEngine();
    });

    test('getRandomAnalogy returns a valid Analogy', () {
      final analogy = engine.getRandomAnalogy();
      expect(analogy.question, isNotEmpty);
      expect(analogy.answer, isNotEmpty);
      expect(analogy.options, isNotEmpty);
    });

    test('getRandomAnalogy returns 4 options', () {
      final analogy = engine.getRandomAnalogy();
      expect(analogy.options.length, 4);
    });

    test('answer is included in options', () {
      final analogy = engine.getRandomAnalogy();
      expect(analogy.options, contains(analogy.answer));
    });

    test('question contains :: separator', () {
      final analogy = engine.getRandomAnalogy();
      expect(analogy.question, contains('::'));
    });

    test('multiple calls produce varied results', () {
      final results = <String>{};
      for (int i = 0; i < 20; i++) {
        results.add(engine.getRandomAnalogy().question);
      }
      expect(results.length, greaterThan(1));
    });
  });
}
