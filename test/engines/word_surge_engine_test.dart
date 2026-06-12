import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/word_surge/word_surge_engine.dart';

void main() {
  group('WordSurgeEngine', () {
    late WordSurgeEngine engine;

    setUp(() {
      engine = WordSurgeEngine();
    });

    test('getRandomChallenge returns valid challenge', () {
      final challenge = engine.getRandomChallenge();
      expect(challenge.target, isNotEmpty);
      expect(challenge.answer, isNotEmpty);
      expect(challenge.options, isNotEmpty);
      expect(challenge.type, isA<WordSurgeType>());
    });

    test('getRandomChallenge returns 4 options', () {
      final challenge = engine.getRandomChallenge();
      expect(challenge.options.length, 4);
    });

    test('answer is included in options', () {
      final challenge = engine.getRandomChallenge();
      expect(challenge.options, contains(challenge.answer));
    });

    test('type is either synonym or antonym', () {
      for (int i = 0; i < 20; i++) {
        final challenge = engine.getRandomChallenge();
        expect(
          challenge.type == WordSurgeType.synonym ||
              challenge.type == WordSurgeType.antonym,
          isTrue,
        );
      }
    });

    test('all options are unique', () {
      final challenge = engine.getRandomChallenge();
      expect(challenge.options.toSet().length, 4);
    });

    test('multiple calls produce varied targets', () {
      final targets = <String>{};
      for (int i = 0; i < 30; i++) {
        targets.add(engine.getRandomChallenge().target);
      }
      expect(targets.length, greaterThan(3));
    });
  });
}
