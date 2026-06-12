import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/trail_making/trail_making_engine.dart';

void main() {
  group('TMTEngine', () {
    late TMTEngine engine;

    setUp(() {
      engine = TMTEngine();
    });

    group('generatePoints', () {
      test('generates correct number of points', () {
        final points = engine.generatePoints(10);
        expect(points.length, 10);
      });

      test('all points have unique ids', () {
        final points = engine.generatePoints(15);
        final ids = points.map((p) => p.id).toList();
        expect(ids.toSet().length, ids.length);
      });

      test('labels are sequential starting from 1', () {
        final points = engine.generatePoints(5);
        for (int i = 0; i < points.length; i++) {
          expect(points[i].label, (i + 1).toString());
        }
      });

      test('x coordinates are between 0.1 and 0.9', () {
        final points = engine.generatePoints(10);
        for (final p in points) {
          expect(p.x, greaterThanOrEqualTo(0.1));
          expect(p.x, lessThanOrEqualTo(0.9));
        }
      });

      test('y coordinates are between 0.1 and 0.9', () {
        final points = engine.generatePoints(10);
        for (final p in points) {
          expect(p.y, greaterThanOrEqualTo(0.1));
          expect(p.y, lessThanOrEqualTo(0.9));
        }
      });

      test('points maintain minimum distance', () {
        final points = engine.generatePoints(10);
        for (int i = 0; i < points.length; i++) {
          for (int j = i + 1; j < points.length; j++) {
            final dist = _distance(points[i], points[j]);
            expect(dist, greaterThanOrEqualTo(0.15));
          }
        }
      });

      test('generates single point', () {
        final points = engine.generatePoints(1);
        expect(points.length, 1);
        expect(points[0].id, 0);
        expect(points[0].label, '1');
      });
    });
  });
}

double _distance(TMTPoint a, TMTPoint b) {
  return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}
