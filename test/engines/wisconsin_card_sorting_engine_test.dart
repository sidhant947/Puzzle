import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/wisconsin_card_sorting/wisconsin_card_sorting_engine.dart';

void main() {
  group('WisconsinCardSortingEngine', () {
    late WisconsinCardSortingEngine engine;

    setUp(() {
      engine = WisconsinCardSortingEngine();
    });

    test('getStimulusCards returns 4 cards', () {
      final cards = engine.getStimulusCards();
      expect(cards.length, 4);
    });

    test('stimulus cards have unique combinations', () {
      final cards = engine.getStimulusCards();
      final descriptions = cards.map((c) => c.toString()).toSet();
      expect(descriptions.length, 4);
    });

    test('generateRandomCard returns valid card', () {
      final card = engine.generateRandomCard();
      expect(engine.shapes, contains(card.shape));
      expect(engine.colors, contains(card.color));
      expect(engine.numbers, contains(card.number));
    });

    group('isMatch', () {
      test('matches by color', () {
        final card = WCSCard(shape: 'circle', color: 'red', number: 1);
        final stimulus = WCSCard(shape: 'triangle', color: 'red', number: 2);
        expect(engine.isMatch(card, stimulus, WCSAttribute.color), isTrue);
      });

      test('does not match by color when different', () {
        final card = WCSCard(shape: 'circle', color: 'red', number: 1);
        final stimulus = WCSCard(shape: 'triangle', color: 'blue', number: 2);
        expect(engine.isMatch(card, stimulus, WCSAttribute.color), isFalse);
      });

      test('matches by shape', () {
        final card = WCSCard(shape: 'circle', color: 'red', number: 1);
        final stimulus = WCSCard(shape: 'circle', color: 'blue', number: 2);
        expect(engine.isMatch(card, stimulus, WCSAttribute.shape), isTrue);
      });

      test('does not match by shape when different', () {
        final card = WCSCard(shape: 'circle', color: 'red', number: 1);
        final stimulus = WCSCard(shape: 'triangle', color: 'red', number: 1);
        expect(engine.isMatch(card, stimulus, WCSAttribute.shape), isFalse);
      });

      test('matches by number', () {
        final card = WCSCard(shape: 'circle', color: 'red', number: 1);
        final stimulus = WCSCard(shape: 'triangle', color: 'blue', number: 1);
        expect(engine.isMatch(card, stimulus, WCSAttribute.number), isTrue);
      });

      test('does not match by number when different', () {
        final card = WCSCard(shape: 'circle', color: 'red', number: 1);
        final stimulus = WCSCard(shape: 'circle', color: 'red', number: 2);
        expect(engine.isMatch(card, stimulus, WCSAttribute.number), isFalse);
      });
    });

    group('nextRule', () {
      test('returns a different rule than current', () {
        final next = engine.nextRule(WCSAttribute.color);
        expect(next, isNot(WCSAttribute.color));
      });

      test('returns a valid WCSAttribute', () {
        for (final attr in WCSAttribute.values) {
          final next = engine.nextRule(attr);
          expect(WCSAttribute.values, contains(next));
        }
      });
    });
  });

  group('WCSCard', () {
    test('toString returns formatted string', () {
      final card = WCSCard(shape: 'circle', color: 'red', number: 1);
      expect(card.toString(), '1 red circle');
    });
  });
}
