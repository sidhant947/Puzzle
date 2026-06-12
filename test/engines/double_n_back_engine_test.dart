import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/double_n_back/double_n_back_engine.dart';

void main() {
  group('DoubleNBackEngine', () {
    late DoubleNBackEngine engine;

    setUp(() {
      engine = DoubleNBackEngine();
    });

    group('generateStimulus', () {
      test('returns a map with position and letter', () {
        final stimulus = engine.generateStimulus();
        expect(stimulus.containsKey('position'), isTrue);
        expect(stimulus.containsKey('letter'), isTrue);
      });

      test('position is in range 0-8', () {
        for (int i = 0; i < 50; i++) {
          final stimulus = engine.generateStimulus();
          expect(stimulus['position'], greaterThanOrEqualTo(0));
          expect(stimulus['position'], lessThanOrEqualTo(8));
        }
      });

      test('letter is one of A-H', () {
        const validLetters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};
        for (int i = 0; i < 50; i++) {
          final stimulus = engine.generateStimulus();
          expect(validLetters.contains(stimulus['letter']), isTrue);
        }
      });

      test('generates variety of positions', () {
        final positions = <int>{};
        for (int i = 0; i < 100; i++) {
          positions.add(engine.generateStimulus()['position'] as int);
        }
        expect(positions.length, greaterThan(1));
      });

      test('generates variety of letters', () {
        final letters = <String>{};
        for (int i = 0; i < 100; i++) {
          letters.add(engine.generateStimulus()['letter'] as String);
        }
        expect(letters.length, greaterThan(1));
      });
    });
  });
}
