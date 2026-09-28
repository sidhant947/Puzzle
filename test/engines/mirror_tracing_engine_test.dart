import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/mirror_tracing/mirror_tracing_engine.dart';

void main() {
  group('MirrorTracingEngine', () {
    late MirrorTracingEngine engine;
    const size = Size(300, 300);

    setUp(() {
      engine = MirrorTracingEngine();
    });

    test('generateStarPath returns closed path', () {
      final path = engine.generateStarPath(size);
      expect(path.length, greaterThan(2));
      expect(path.first, equals(path.last));
    });

    test('generateDiamondPath returns closed path', () {
      final path = engine.generateDiamondPath(size);
      expect(path.length, equals(5));
      expect(path.first, equals(path.last));
    });

    test('generateHexagonPath returns closed path', () {
      final path = engine.generateHexagonPath(size);
      expect(path.length, equals(7));
      expect(path.first, equals(path.last));
    });

    test('generateTrianglePath returns closed path', () {
      final path = engine.generateTrianglePath(size);
      expect(path.length, equals(4));
      expect(path.first, equals(path.last));
    });

    test('generateCrossPath returns closed path', () {
      final path = engine.generateCrossPath(size);
      expect(path.length, equals(13));
      expect(path.first, equals(path.last));
    });

    test('generateHeartPath returns closed path', () {
      final path = engine.generateHeartPath(size);
      expect(path.length, equals(17));
      expect(path.first, equals(path.last));
    });

    test('generateOctagonPath returns closed path', () {
      final path = engine.generateOctagonPath(size);
      expect(path.length, equals(9));
      expect(path.first, equals(path.last));
    });

    test('generatePath returns different shapes for different indices', () {
      final path0 = engine.generatePath(size, 0);
      final path1 = engine.generatePath(size, 1);
      final path2 = engine.generatePath(size, 2);
      expect(path0.length, isNot(equals(path1.length)));
      expect(path1.length, isNot(equals(path2.length)));
    });

    test('generateRandomPath returns a closed path', () {
      final path = engine.generateRandomPath(size);
      expect(path.length, greaterThan(2));
      expect(path.first, equals(path.last));
    });

    test('isPointOnPath detects points within tolerance', () {
      final path = [const Offset(0, 0), const Offset(100, 0)];
      expect(engine.isPointOnPath(const Offset(50, 5), path, 10), isTrue);
      expect(engine.isPointOnPath(const Offset(50, 20), path, 10), isFalse);
    });
  });
}
