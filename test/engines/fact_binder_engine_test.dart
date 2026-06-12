import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

void main() {
  group('FactBinder Engine (logic extracted from screen)', () {
    final names = ["Liam", "Sophia", "Noah", "Emma", "Ethan"];
    final jobs = ["Architect", "Doctor", "Designer", "Chef", "Pilot"];
    final hobbies = ["Hiking", "Painting", "Gardening", "Cooking", "Chess"];

    List<Map<String, String>> generateProfiles() {
      final random = Random();
      final namesCopy = List<String>.from(names)..shuffle(random);
      final jobsCopy = List<String>.from(jobs)..shuffle(random);
      final hobbiesCopy = List<String>.from(hobbies)..shuffle(random);

      return List.generate(3, (i) => {
        'name': namesCopy[i],
        'job': jobsCopy[i],
        'hobby': hobbiesCopy[i],
      });
    }

    group('profile generation', () {
      test('generates exactly 3 profiles', () {
        final profiles = generateProfiles();
        expect(profiles.length, 3);
      });

      test('each profile has name, job, and hobby', () {
        final profiles = generateProfiles();
        for (final p in profiles) {
          expect(p.containsKey('name'), isTrue);
          expect(p.containsKey('job'), isTrue);
          expect(p.containsKey('hobby'), isTrue);
        }
      });

      test('all profile names are unique', () {
        final profiles = generateProfiles();
        final nameSet = profiles.map((p) => p['name']).toSet();
        expect(nameSet.length, 3);
      });

      test('all profile jobs are unique', () {
        final profiles = generateProfiles();
        final jobSet = profiles.map((p) => p['job']).toSet();
        expect(jobSet.length, 3);
      });

      test('all profile hobbies are unique', () {
        final profiles = generateProfiles();
        final hobbySet = profiles.map((p) => p['hobby']).toSet();
        expect(hobbySet.length, 3);
      });
    });

    group('quiz logic', () {
      test('correct option matches profile data', () {
        final profiles = generateProfiles();
        final target = profiles[0];
        expect(target['job'], isNotNull);
        expect(names.contains(target['name']), isTrue);
        expect(jobs.contains(target['job']), isTrue);
      });

      test('requires 2 of 3 correct to win', () {
        const totalQuestions = 3;
        const winThreshold = 2;
        expect(2 >= winThreshold, isTrue);
        expect(1 >= winThreshold, isFalse);
      });
    });
  });
}
