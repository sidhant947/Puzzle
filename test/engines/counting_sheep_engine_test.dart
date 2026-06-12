import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/counting_sheep/counting_sheep_engine.dart';

void main() {
  group('CountingSheepEngine', () {
    late CountingSheepEngine engine;

    setUp(() {
      engine = CountingSheepEngine();
    });

    group('generateSheep', () {
      test('returns a list of Sheep', () {
        final sheep = engine.generateSheep(Difficulty.easy);
        expect(sheep, isA<List<Sheep>>());
      });

      test('easy difficulty generates 5-8 sheep', () {
        for (int i = 0; i < 20; i++) {
          final sheep = engine.generateSheep(Difficulty.easy);
          expect(sheep.length, greaterThanOrEqualTo(5));
          expect(sheep.length, lessThanOrEqualTo(8));
        }
      });

      test('medium difficulty generates 10-15 sheep', () {
        for (int i = 0; i < 20; i++) {
          final sheep = engine.generateSheep(Difficulty.medium);
          expect(sheep.length, greaterThanOrEqualTo(10));
          expect(sheep.length, lessThanOrEqualTo(15));
        }
      });

      test('hard difficulty generates 20-30 sheep', () {
        for (int i = 0; i < 20; i++) {
          final sheep = engine.generateSheep(Difficulty.hard);
          expect(sheep.length, greaterThanOrEqualTo(20));
          expect(sheep.length, lessThanOrEqualTo(30));
        }
      });

      test('each sheep has valid properties', () {
        final sheep = engine.generateSheep(Difficulty.easy);
        for (final s in sheep) {
          expect(s.id, isA<int>());
          expect(s.startY, greaterThanOrEqualTo(0));
          expect(s.startY, lessThanOrEqualTo(1));
          expect(s.speed, greaterThanOrEqualTo(3));
          expect(s.speed, lessThanOrEqualTo(5));
          expect(s.delay, greaterThanOrEqualTo(0));
          expect(s.delay, lessThanOrEqualTo(8));
        }
      });

      test('sheep have unique ids', () {
        final sheep = engine.generateSheep(Difficulty.hard);
        final ids = sheep.map((s) => s.id).toSet();
        expect(ids.length, sheep.length);
      });
    });
  });

  group('Sheep', () {
    test('totalTime is delay + speed', () {
      final sheep = Sheep(id: 0, startY: 0.5, speed: 3.0, delay: 2.0);
      expect(sheep.totalTime, 5.0);
    });
  });
}
