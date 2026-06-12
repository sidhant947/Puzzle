import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/face_trait_association/face_trait_association_engine.dart';

void main() {
  group('FaceTraitAssociationEngine', () {
    late FaceTraitAssociationEngine engine;

    setUp(() {
      engine = FaceTraitAssociationEngine();
    });

    group('generateTrials', () {
      test('returns exactly 4 trials', () {
        final trials = engine.generateTrials();
        expect(trials.length, 4);
      });

      test('each trial has name, occupation, hobby, and imageUrl', () {
        final trials = engine.generateTrials();
        for (final trial in trials) {
          expect(trial.name.isNotEmpty, isTrue);
          expect(trial.occupation.isNotEmpty, isTrue);
          expect(trial.hobby.isNotEmpty, isTrue);
          expect(trial.imageUrl.isNotEmpty, isTrue);
        }
      });

      test('all trials have unique names', () {
        final trials = engine.generateTrials();
        final names = trials.map((t) => t.name).toList();
        expect(names.toSet().length, 4);
      });

      test('all trials have unique occupations', () {
        final trials = engine.generateTrials();
        final occupations = trials.map((t) => t.occupation).toList();
        expect(occupations.toSet().length, 4);
      });

      test('all trials have unique hobbies', () {
        final trials = engine.generateTrials();
        final hobbies = trials.map((t) => t.hobby).toList();
        expect(hobbies.toSet().length, 4);
      });

      test('generates different trials on multiple calls', () {
        final trials1 = engine.generateTrials();
        final trials2 = engine.generateTrials();
        final names1 = trials1.map((t) => t.name).toList();
        final names2 = trials2.map((t) => t.name).toList();
        expect(names1, isNot(equals(names2)));
      });
    });
  });
}
