import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/spotlight_track/spotlight_track_engine.dart';

void main() {
  group('SpotlightTrackEngine', () {
    late SpotlightTrackEngine engine;

    setUp(() {
      engine = SpotlightTrackEngine();
    });

    group('generateLevel', () {
      test('returns a TrackingLevel', () {
        final level = engine.generateLevel(1);
        expect(level, isA<TrackingLevel>());
      });

      test('object path has 5 points', () {
        final level = engine.generateLevel(1);
        expect(level.objectPath.length, 5);
      });

      test('spotlight path has 4 points', () {
        final level = engine.generateLevel(1);
        expect(level.spotlightPath.length, 4);
      });

      test('spotlight radius decreases with higher rounds', () {
        final level1 = engine.generateLevel(1);
        final level5 = engine.generateLevel(5);
        // Higher rounds should have smaller radius (clamped at 0.08)
        expect(level5.spotlightRadius, lessThanOrEqualTo(level1.spotlightRadius));
      });

      test('spotlight radius is within valid range', () {
        final level = engine.generateLevel(3);
        expect(level.spotlightRadius, greaterThanOrEqualTo(0.08));
        expect(level.spotlightRadius, lessThanOrEqualTo(0.18));
      });

      test('finalPosition returns last point of object path', () {
        final level = engine.generateLevel(1);
        expect(level.finalPosition, equals(level.objectPath.last));
      });
    });

    group('getPositionOnPath', () {
      test('returns first point when t=0', () {
        final path = [Point2D(0.0, 0.0), Point2D(1.0, 1.0)];
        final pos = engine.getPositionOnPath(path, 0.0);
        expect(pos.x, 0.0);
        expect(pos.y, 0.0);
      });

      test('returns last point when t=1', () {
        final path = [Point2D(0.0, 0.0), Point2D(1.0, 1.0)];
        final pos = engine.getPositionOnPath(path, 1.0);
        expect(pos.x, 1.0);
        expect(pos.y, 1.0);
      });

      test('returns midpoint when t=0.5 on two-point path', () {
        final path = [Point2D(0.0, 0.0), Point2D(1.0, 1.0)];
        final pos = engine.getPositionOnPath(path, 0.5);
        expect(pos.x, closeTo(0.5, 0.001));
        expect(pos.y, closeTo(0.5, 0.001));
      });

      test('returns default point for empty path', () {
        final pos = engine.getPositionOnPath([], 0.5);
        expect(pos.x, 0.5);
        expect(pos.y, 0.5);
      });

      test('returns first point when t < 0', () {
        final path = [Point2D(0.0, 0.0), Point2D(1.0, 1.0)];
        final pos = engine.getPositionOnPath(path, -0.5);
        expect(pos.x, 0.0);
        expect(pos.y, 0.0);
      });

      test('returns last point when t > 1', () {
        final path = [Point2D(0.0, 0.0), Point2D(1.0, 1.0)];
        final pos = engine.getPositionOnPath(path, 2.0);
        expect(pos.x, 1.0);
        expect(pos.y, 1.0);
      });

      test('interpolates correctly on multi-segment path', () {
        final path = [Point2D(0.0, 0.0), Point2D(0.5, 0.5), Point2D(1.0, 0.0)];
        final pos = engine.getPositionOnPath(path, 0.5);
        expect(pos.x, closeTo(0.5, 0.001));
        expect(pos.y, closeTo(0.5, 0.001));
      });
    });

    group('isVisible', () {
      test('returns true when object is inside spotlight', () {
        expect(engine.isVisible(Point2D(0.5, 0.5), Point2D(0.5, 0.5), 0.1), isTrue);
      });

      test('returns true when object is near spotlight edge', () {
        expect(engine.isVisible(Point2D(0.5, 0.5), Point2D(0.54, 0.5), 0.06), isTrue);
      });

      test('returns false when object is outside spotlight', () {
        expect(engine.isVisible(Point2D(0.0, 0.0), Point2D(1.0, 1.0), 0.1), isFalse);
      });

      test('returns false when distance equals radius + epsilon', () {
        expect(engine.isVisible(Point2D(0.0, 0.0), Point2D(0.2, 0.0), 0.1), isFalse);
      });
    });

    group('isCorrectTap', () {
      test('returns true for exact tap', () {
        expect(engine.isCorrectTap(Point2D(0.5, 0.5), Point2D(0.5, 0.5)), isTrue);
      });

      test('returns true for close tap', () {
        expect(engine.isCorrectTap(Point2D(0.5, 0.5), Point2D(0.52, 0.52)), isTrue);
      });

      test('returns false for distant tap', () {
        expect(engine.isCorrectTap(Point2D(0.0, 0.0), Point2D(1.0, 1.0)), isFalse);
      });

      test('returns false when distance is just over threshold', () {
        expect(engine.isCorrectTap(Point2D(0.0, 0.0), Point2D(0.1, 0.1)), isFalse);
      });
    });

    group('Point2D', () {
      test('distanceTo calculates Euclidean distance', () {
        final a = Point2D(0.0, 0.0);
        final b = Point2D(3.0, 4.0);
        expect(a.distanceTo(b), closeTo(5.0, 0.001));
      });

      test('distanceTo same point is zero', () {
        final a = Point2D(1.0, 1.0);
        expect(a.distanceTo(a), 0.0);
      });
    });
  });
}
