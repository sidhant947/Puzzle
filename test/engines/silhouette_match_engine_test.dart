import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/silhouette_match/silhouette_match_engine.dart';

void main() {
  group('SilhouetteMatchEngine', () {
    late SilhouetteMatchEngine engine;

    setUp(() {
      engine = SilhouetteMatchEngine();
    });

    group('generateObject', () {
      test('returns a list of ProjectedCube', () {
        final cubes = engine.generateObject(0, 0);
        expect(cubes, isA<List<ProjectedCube>>());
      });

      test('generates between 3 and 4 cubes', () {
        final cubes = engine.generateObject(0, 0);
        expect(cubes.length, greaterThanOrEqualTo(3));
        expect(cubes.length, lessThanOrEqualTo(4));
      });

      test('each cube has 8 vertices', () {
        final cubes = engine.generateObject(0, 0);
        for (final cube in cubes) {
          expect(cube.vertices.length, 8);
        }
      });

      test('each cube has 12 edges', () {
        final cubes = engine.generateObject(0, 0);
        for (final cube in cubes) {
          expect(cube.edges.length, 12);
        }
      });

      test('each cube has 6 faces', () {
        final cubes = engine.generateObject(0, 0);
        for (final cube in cubes) {
          expect(cube.faces.length, 6);
        }
      });

      test('different angles produce different vertex positions', () {
        final cubes1 = engine.generateObject(0, 0);
        final cubes2 = engine.generateObject(pi / 2, pi / 2);
        // At least one vertex should differ between the same cube index
        // (since angles change the projection)
        bool allSame = true;
        final count = min(cubes1.length, cubes2.length);
        for (int i = 0; i < count; i++) {
          for (int v = 0; v < cubes1[i].vertices.length; v++) {
            if (cubes1[i].vertices[v] != cubes2[i].vertices[v]) {
              allSame = false;
              break;
            }
          }
          if (!allSame) break;
        }
        expect(allSame, false);
      });
    });

    group('generateLevel', () {
      test('returns a map with target, options, and correctIndex', () {
        final level = engine.generateLevel();
        expect(level.containsKey('target'), true);
        expect(level.containsKey('options'), true);
        expect(level.containsKey('correctIndex'), true);
      });

      test('target is a list of ProjectedCube', () {
        final level = engine.generateLevel();
        expect(level['target'], isA<List<ProjectedCube>>());
      });

      test('target contains 3-4 cubes', () {
        final level = engine.generateLevel();
        final target = level['target'] as List<ProjectedCube>;
        expect(target.length, greaterThanOrEqualTo(3));
        expect(target.length, lessThanOrEqualTo(4));
      });

      test('options has 4 entries', () {
        final level = engine.generateLevel();
        final options = level['options'] as List;
        expect(options.length, 4);
      });

      test('correctIndex is within valid range', () {
        final level = engine.generateLevel();
        final correctIndex = level['correctIndex'] as int;
        expect(correctIndex, greaterThanOrEqualTo(0));
        expect(correctIndex, lessThan(4));
      });

      test('correct option matches target vertices', () {
        final level = engine.generateLevel();
        final target = level['target'] as List<ProjectedCube>;
        final options = level['options'] as List<List<ProjectedCube>>;
        final correctIndex = level['correctIndex'] as int;
        final correct = options[correctIndex];

        expect(correct.length, target.length);
        for (int i = 0; i < target.length; i++) {
          expect(correct[i].vertices, target[i].vertices);
        }
      });

      test('options are not all identical', () {
        final level = engine.generateLevel();
        final options = level['options'] as List<List<ProjectedCube>>;
        final first = options[0];
        bool allSame = true;
        for (final opt in options) {
          if (opt.length != first.length) {
            allSame = false;
            break;
          }
          for (int i = 0; i < first.length; i++) {
            if (opt[i].vertices != first[i].vertices) {
              allSame = false;
              break;
            }
          }
          if (!allSame) break;
        }
        expect(allSame, false);
      });
    });
  });

  group('ProjectedCube', () {
    test('stores vertices, edges, and faces correctly', () {
      final cube = ProjectedCube(
        vertices: [Offset(0, 0), Offset(1, 1)],
        edges: [[0, 1]],
        faces: [[0, 1]],
      );
      expect(cube.vertices.length, 2);
      expect(cube.edges.length, 1);
      expect(cube.faces.length, 1);
    });
  });
}
