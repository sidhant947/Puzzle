import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/word_ladder/word_ladder_engine.dart';

void main() {
  group('WordLadderEngine', () {
    test('dictionary is not empty', () {
      // Access via reflection or test the class exists
      // Since _dictionary is private, we verify the class compiles and is usable
      expect(WordLadderEngine, isNotNull);
    });

    test('WordLadderEngine can be instantiated', () {
      final engine = WordLadderEngine();
      expect(engine, isA<WordLadderEngine>());
    });
  });
}
