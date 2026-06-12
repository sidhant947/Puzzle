import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/perspective_taking/perspective_taking_engine.dart';

void main() {
  group('PerspectiveTakingEngine', () {
    late PerspectiveTakingEngine engine;

    setUp(() {
      engine = PerspectiveTakingEngine();
    });

    group('generateLevel', () {
      test('returns a list of cubes', () {
        final cubes = engine.generateLevel();
        expect(cubes, isA<List<Cube>>());
      });

      test('generates 4 or 5 cubes', () {
        final cubes = engine.generateLevel();
        expect(cubes.length, greaterThanOrEqualTo(4));
        expect(cubes.length, lessThanOrEqualTo(5));
      });

      test('all cube positions are within grid bounds', () {
        final cubes = engine.generateLevel();
        for (final cube in cubes) {
          expect(cube.x, greaterThanOrEqualTo(0));
          expect(cube.x, lessThan(PerspectiveTakingEngine.gridSize));
          expect(cube.y, greaterThanOrEqualTo(0));
          expect(cube.y, lessThan(PerspectiveTakingEngine.gridSize));
          expect(cube.z, greaterThanOrEqualTo(0));
          expect(cube.z, lessThan(PerspectiveTakingEngine.gridSize));
        }
      });

      test('no two cubes share the same (x, z) position', () {
        final cubes = engine.generateLevel();
        final xzPairs = <String>{};
        for (final cube in cubes) {
          final key = '${cube.x},${cube.z}';
          expect(xzPairs.contains(key), isFalse,
              reason: 'Duplicate (x,z) at $key');
          xzPairs.add(key);
        }
      });

      test('each cube has a non-null color', () {
        final cubes = engine.generateLevel();
        for (final cube in cubes) {
          expect(cube.color, isNotNull);
        }
      });
    });

    group('getView', () {
      test('top view returns a 3x3 grid', () {
        final cubes = engine.generateLevel();
        final view = engine.getView(cubes, ViewDirection.top);
        expect(view.length, equals(3));
        for (final row in view) {
          expect(row.length, equals(3));
        }
      });

      test('south view returns a 3x3 grid', () {
        final cubes = engine.generateLevel();
        final view = engine.getView(cubes, ViewDirection.south);
        expect(view.length, equals(3));
        for (final row in view) {
          expect(row.length, equals(3));
        }
      });

      test('each view direction returns correct size grid', () {
        final cubes = engine.generateLevel();
        for (final dir in ViewDirection.values) {
          final view = engine.getView(cubes, dir);
          expect(view.length, equals(3));
        }
      });
    });
  });
}
