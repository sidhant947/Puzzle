import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/object_shuffle/object_shuffle_engine.dart';

void main() {
  group('ObjectShuffleEngine', () {
    late ObjectShuffleEngine engine;

    setUp(() {
      engine = ObjectShuffleEngine();
    });

    group('generateShuffles', () {
      test('returns correct number of shuffles', () {
        final shuffles = engine.generateShuffles(5, 6);
        expect(shuffles.length, equals(5));
      });

      test('each shuffle is a pair of indexes', () {
        final shuffles = engine.generateShuffles(3, 4);
        for (final shuffle in shuffles) {
          expect(shuffle.length, equals(2));
        }
      });

      test('indexes are within valid range', () {
        final shuffles = engine.generateShuffles(10, 5);
        for (final shuffle in shuffles) {
          expect(shuffle[0], greaterThanOrEqualTo(0));
          expect(shuffle[0], lessThan(5));
          expect(shuffle[1], greaterThanOrEqualTo(0));
          expect(shuffle[1], lessThan(5));
        }
      });

      test('shuffled indexes are different (not swapping with self)', () {
        final shuffles = engine.generateShuffles(20, 4);
        for (final shuffle in shuffles) {
          expect(shuffle[0], isNot(equals(shuffle[1])));
        }
      });

      test('returns empty list for zero count', () {
        final shuffles = engine.generateShuffles(0, 4);
        expect(shuffles, isEmpty);
      });
    });
  });
}
