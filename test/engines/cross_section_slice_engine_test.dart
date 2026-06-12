import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/cross_section_slice/cross_section_slice_engine.dart';

void main() {
  group('CrossSectionSliceEngine', () {
    late CrossSectionSliceEngine engine;

    setUp(() {
      engine = CrossSectionSliceEngine();
    });

    group('generateChallenge', () {
      test('returns a CrossSectionSliceChallenge', () {
        final challenge = engine.generateChallenge();
        expect(challenge, isA<CrossSectionSliceChallenge>());
      });

      test('challenge has solid, orientation, correctShape, and options', () {
        final challenge = engine.generateChallenge();
        expect(challenge.solid, isA<SolidType>());
        expect(challenge.orientation, isA<CutOrientation>());
        expect(challenge.correctShape, isA<SectionShape>());
        expect(challenge.options.length, 4);
      });

      test('correctShape is in options', () {
        for (int i = 0; i < 20; i++) {
          final challenge = engine.generateChallenge();
          expect(challenge.options, contains(challenge.correctShape));
        }
      });

      test('options are unique', () {
        final challenge = engine.generateChallenge();
        expect(challenge.options.toSet().length, challenge.options.length);
      });

      test('sphere always produces circle', () {
        final challenge = CrossSectionSliceChallenge(
          solid: SolidType.sphere,
          orientation: CutOrientation.horizontal,
          correctShape: SectionShape.circle,
          options: [SectionShape.circle, SectionShape.square, SectionShape.triangle, SectionShape.rectangle],
        );
        expect(challenge.correctShape, SectionShape.circle);
      });
    });
  });

  group('CrossSectionSliceChallenge', () {
    test('stores all fields', () {
      final challenge = CrossSectionSliceChallenge(
        solid: SolidType.cube,
        orientation: CutOrientation.horizontal,
        correctShape: SectionShape.square,
        options: [SectionShape.square, SectionShape.circle, SectionShape.triangle, SectionShape.rectangle],
      );
      expect(challenge.solid, SolidType.cube);
      expect(challenge.correctShape, SectionShape.square);
    });
  });
}
