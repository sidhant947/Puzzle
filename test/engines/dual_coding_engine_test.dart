import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/dual_coding/dual_coding_engine.dart';

void main() {
  group('DualCodingEngine', () {
    late DualCodingEngine engine;

    setUp(() {
      engine = DualCodingEngine();
    });

    group('DualCodingStimulus', () {
      test('matchesCard returns true when shape and color match', () {
        final a = DualCodingStimulus(
          pitch: PitchType.low,
          shape: CardShape.star,
          color: CardColor.amber,
        );
        final b = DualCodingStimulus(
          pitch: PitchType.high,
          shape: CardShape.star,
          color: CardColor.amber,
        );
        expect(a.matchesCard(b), isTrue);
      });

      test('matchesCard returns false when shape differs', () {
        final a = DualCodingStimulus(
          pitch: PitchType.low,
          shape: CardShape.star,
          color: CardColor.amber,
        );
        final b = DualCodingStimulus(
          pitch: PitchType.low,
          shape: CardShape.circle,
          color: CardColor.amber,
        );
        expect(a.matchesCard(b), isFalse);
      });

      test('matchesCard returns false when color differs', () {
        final a = DualCodingStimulus(
          pitch: PitchType.low,
          shape: CardShape.star,
          color: CardColor.amber,
        );
        final b = DualCodingStimulus(
          pitch: PitchType.low,
          shape: CardShape.star,
          color: CardColor.teal,
        );
        expect(a.matchesCard(b), isFalse);
      });

      test('matchesPitch returns true when pitch matches', () {
        final a = DualCodingStimulus(pitch: PitchType.mid, shape: CardShape.star, color: CardColor.amber);
        final b = DualCodingStimulus(pitch: PitchType.mid, shape: CardShape.circle, color: CardColor.berry);
        expect(a.matchesPitch(b), isTrue);
      });

      test('matchesPitch returns false when pitch differs', () {
        final a = DualCodingStimulus(pitch: PitchType.low, shape: CardShape.star, color: CardColor.amber);
        final b = DualCodingStimulus(pitch: PitchType.high, shape: CardShape.star, color: CardColor.amber);
        expect(a.matchesPitch(b), isFalse);
      });
    });

    group('generateNext', () {
      test('returns random stimulus when history is empty', () {
        final stimulus = engine.generateNext([], 1);
        expect(stimulus, isA<DualCodingStimulus>());
      });

      test('returns random stimulus when history shorter than n', () {
        final history = [
          DualCodingStimulus(pitch: PitchType.low, shape: CardShape.star, color: CardColor.amber),
        ];
        final stimulus = engine.generateNext(history, 3);
        expect(stimulus, isA<DualCodingStimulus>());
      });

      test('returns valid stimulus types after sufficient history', () {
        final history = List.generate(
          5,
          (i) => DualCodingStimulus(
            pitch: PitchType.values[i % 3],
            shape: CardShape.values[i % 4],
            color: CardColor.values[i % 4],
          ),
        );
        for (int i = 0; i < 20; i++) {
          final stimulus = engine.generateNext(history, 3);
          expect(PitchType.values.contains(stimulus.pitch), isTrue);
          expect(CardShape.values.contains(stimulus.shape), isTrue);
          expect(CardColor.values.contains(stimulus.color), isTrue);
        }
      });

      test('with enough trials, at least one pitch match occurs', () {
        final fixedPitch = PitchType.high;
        final history = List.generate(
          5,
          (i) => DualCodingStimulus(
            pitch: fixedPitch,
            shape: CardShape.values[i % 4],
            color: CardColor.values[i % 4],
          ),
        );
        bool hadPitchMatch = false;
        for (int i = 0; i < 200; i++) {
          final stimulus = engine.generateNext(history, 3);
          if (stimulus.pitch == fixedPitch) {
            hadPitchMatch = true;
            break;
          }
        }
        expect(hadPitchMatch, isTrue);
      });
    });
  });
}
