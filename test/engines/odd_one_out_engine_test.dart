import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/odd_one_out/odd_one_out_engine.dart';

void main() {
  group('OddOneOutEngine', () {
    late OddOneOutEngine engine;

    setUp(() {
      engine = OddOneOutEngine();
    });

    group('generateLevel', () {
      test('returns an OddOneOutLevel', () {
        final level = engine.generateLevel(0);
        expect(level, isA<OddOneOutLevel>());
      });

      test('low score produces 4 colors (2x2)', () {
        final level = engine.generateLevel(0);
        expect(level.colors.length, equals(4));
      });

      test('score 3 produces 9 colors (3x3)', () {
        final level = engine.generateLevel(3);
        expect(level.colors.length, equals(9));
      });

      test('score 8 produces 16 colors (4x4)', () {
        final level = engine.generateLevel(8);
        expect(level.colors.length, equals(16));
      });

      test('score 15 produces 25 colors (5x5)', () {
        final level = engine.generateLevel(15);
        expect(level.colors.length, equals(25));
      });

      test('score 25 produces 36 colors (6x6)', () {
        final level = engine.generateLevel(25);
        expect(level.colors.length, equals(36));
      });

      test('high score produces 64 colors (8x8)', () {
        final level = engine.generateLevel(100);
        expect(level.colors.length, equals(64));
      });

      test('oddOneIndex is within valid range', () {
        final level = engine.generateLevel(0);
        expect(level.oddOneIndex, greaterThanOrEqualTo(0));
        expect(level.oddOneIndex, lessThan(level.colors.length));
      });

      test('difficulty decreases with higher score', () {
        final lowScoreLevel = engine.generateLevel(0);
        final highScoreLevel = engine.generateLevel(30);
        expect(highScoreLevel.difficulty, lessThan(lowScoreLevel.difficulty));
      });

      test('difficulty is always positive', () {
        for (int score = 0; score < 80; score += 10) {
          final level = engine.generateLevel(score);
          expect(level.difficulty, greaterThan(0));
        }
      });

      test('colors list contains the odd one color', () {
        final level = engine.generateLevel(0);
        final oddColor = level.colors[level.oddOneIndex];
        expect(level.colors, contains(oddColor));
      });
    });
  });
}
