import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/trace_path/trace_path_engine.dart';

void main() {
  group('TracePathEngine', () {
    late TracePathEngine engine;

    setUp(() {
      engine = TracePathEngine();
    });

    group('generatePath', () {
      test('generates path with 7 points', () {
        final path = engine.generatePath(const Size(300, 400));
        expect(path.length, 7);
      });

      test('first point is near left edge', () {
        final path = engine.generatePath(const Size(300, 400));
        expect(path.first.dx, closeTo(30.0, 1.0));
      });

      test('all points have valid coordinates', () {
        final path = engine.generatePath(const Size(400, 300));
        for (final point in path) {
          expect(point.dx, greaterThanOrEqualTo(0));
          expect(point.dx, lessThanOrEqualTo(400));
          expect(point.dy, greaterThanOrEqualTo(0));
          expect(point.dy, lessThanOrEqualTo(300));
        }
      });

      test('x coordinates increase across segments', () {
        final path = engine.generatePath(const Size(400, 300));
        for (int i = 1; i < path.length; i++) {
          expect(path[i].dx, greaterThan(path[i - 1].dx));
        }
      });
    });

    group('calculateAccuracy', () {
      test('returns 1.0 for perfect match', () {
        final targetPath = [
          const Offset(0, 0),
          const Offset(50, 50),
          const Offset(100, 0),
        ];
        expect(engine.calculateAccuracy(targetPath, targetPath), 1.0);
      });

      test('returns 0.0 for empty user path', () {
        final targetPath = [
          const Offset(0, 0),
          const Offset(50, 50),
        ];
        expect(engine.calculateAccuracy([], targetPath), 0.0);
      });

      test('returns lower accuracy for distant points', () {
        final targetPath = [
          const Offset(0, 0),
          const Offset(100, 0),
        ];
        final farPath = [
          const Offset(0, 200),
          const Offset(100, 200),
        ];
        expect(engine.calculateAccuracy(farPath, targetPath), 0.0);
      });

      test('returns values between 0 and 1', () {
        final targetPath = [
          const Offset(0, 0),
          const Offset(100, 100),
        ];
        final userPath = [
          const Offset(10, 5),
          const Offset(90, 95),
        ];
        final accuracy = engine.calculateAccuracy(userPath, targetPath);
        expect(accuracy, greaterThanOrEqualTo(0.0));
        expect(accuracy, lessThanOrEqualTo(1.0));
      });

      test('closer points yield higher accuracy', () {
        final targetPath = [
          const Offset(0, 0),
          const Offset(100, 0),
        ];
        final closePath = [
          const Offset(5, 5),
          const Offset(95, 5),
        ];
        final farPath = [
          const Offset(50, 50),
          const Offset(150, 50),
        ];
        final closeAccuracy = engine.calculateAccuracy(closePath, targetPath);
        final farAccuracy = engine.calculateAccuracy(farPath, targetPath);
        expect(closeAccuracy, greaterThan(farAccuracy));
      });
    });
  });
}
