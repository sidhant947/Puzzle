import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/staircase_memory/staircase_memory_engine.dart';

void main() {
  group('StaircaseMemoryEngine', () {
    late StaircaseMemoryEngine engine;

    setUp(() {
      engine = StaircaseMemoryEngine();
    });

    group('getRandomIcon', () {
      test('returns a valid IconData', () {
        final icon = engine.getRandomIcon();
        expect(icon, isA<IconData>());
      });

      test('returns icons from the known pool', () {
        final validIcons = engine.allIcons;
        for (int i = 0; i < 30; i++) {
          final icon = engine.getRandomIcon();
          expect(validIcons.contains(icon), isTrue);
        }
      });

      test('produces different icons (probabilistically)', () {
        final icons = <IconData>{};
        for (int i = 0; i < 30; i++) {
          icons.add(engine.getRandomIcon());
        }
        expect(icons.length, greaterThan(1));
      });
    });

    group('allIcons', () {
      test('returns 10 icons', () {
        expect(engine.allIcons.length, 10);
      });
    });

    group('generateSequence', () {
      test('returns sequence of the requested length', () {
        final seq = engine.generateSequence(10, 2);
        expect(seq.length, 10);
      });

      test('returns empty list for length 0', () {
        final seq = engine.generateSequence(0, 1);
        expect(seq, isEmpty);
      });

      test('all icons in sequence are from the valid pool', () {
        final validIcons = engine.allIcons;
        final seq = engine.generateSequence(20, 2);
        for (final icon in seq) {
          expect(validIcons.contains(icon), isTrue);
        }
      });

      test('first n elements are generated randomly (no matches possible before index n)', () {
        final seq = engine.generateSequence(10, 3);
        // The first 3 items cannot be N-back matches (i < n)
        // They should all be valid random icons
        for (int i = 0; i < 3; i++) {
          expect(engine.allIcons.contains(seq[i]), isTrue);
        }
      });

      test('with n=1, some elements may match the previous one', () {
        // Run multiple times to ensure we get some matches eventually
        bool foundMatch = false;
        for (int trial = 0; trial < 50; trial++) {
          final seq = engine.generateSequence(15, 1);
          for (int i = 1; i < seq.length; i++) {
            if (seq[i] == seq[i - 1]) {
              foundMatch = true;
              break;
            }
          }
          if (foundMatch) break;
        }
        // With 30% chance per position, finding a match in 50 trials of 15 items is near-certain
        expect(foundMatch, isTrue);
      });

      test('generates different sequences on multiple calls', () {
        final seq1 = engine.generateSequence(20, 2);
        final seq2 = engine.generateSequence(20, 2);
        expect(seq1, isNot(equals(seq2)));
      });
    });
  });
}
