import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/object_displacement/object_displacement_provider.dart';

void main() {
  group('ObjectDisplacementState', () {
    test('has correct default values', () {
      final state = ObjectDisplacementState();
      expect(state.phase, equals(DisplacementPhase.memorize));
      expect(state.items, isEmpty);
      expect(state.movedItemId, equals(-1));
      expect(state.score, equals(0));
      expect(state.timeLeft, equals(60));
      expect(state.isGameOver, isFalse);
      expect(state.isLoading, isTrue);
      expect(state.lastRoundCorrect, isNull);
      expect(state.itemCount, equals(5));
    });

    group('copyWith', () {
      test('preserves values when not overridden', () {
        final state = ObjectDisplacementState(
          phase: DisplacementPhase.choice,
          score: 5,
          timeLeft: 30,
          itemCount: 8,
        );
        final copied = state.copyWith(isGameOver: true);
        expect(copied.phase, equals(DisplacementPhase.choice));
        expect(copied.score, equals(5));
        expect(copied.timeLeft, equals(30));
        expect(copied.itemCount, equals(8));
        expect(copied.isGameOver, isTrue);
      });

      test('overrides values when provided', () {
        final state = ObjectDisplacementState();
        final copied = state.copyWith(
          phase: DisplacementPhase.result,
          score: 10,
          itemCount: 7,
        );
        expect(copied.phase, equals(DisplacementPhase.result));
        expect(copied.score, equals(10));
        expect(copied.itemCount, equals(7));
      });

      test('lastRoundCorrect can be set to null', () {
        final state = ObjectDisplacementState(lastRoundCorrect: true);
        final copied = state.copyWith(lastRoundCorrect: null);
        expect(copied.lastRoundCorrect, isNull);
      });

      test('itemCount scales up when correct', () {
        final state = ObjectDisplacementState(itemCount: 5);
        final copied = state.copyWith(itemCount: 6);
        expect(copied.itemCount, equals(6));
      });

      test('itemCount scales down', () {
        final state = ObjectDisplacementState(itemCount: 8);
        final copied = state.copyWith(itemCount: 7);
        expect(copied.itemCount, equals(7));
      });
    });

    group('DisplacementItem', () {
      test('copyWith preserves original values', () {
        final item = DisplacementItem(
          id: 1,
          icon: Icons.star_rounded,
          color: Colors.red,
          position: const Offset(0.5, 0.5),
        );
        final copied = item.copyWith();
        expect(copied.id, equals(1));
        expect(copied.position, equals(item.position));
      });

      test('copyWith overrides position', () {
        final item = DisplacementItem(
          id: 1,
          icon: Icons.star_rounded,
          color: Colors.red,
          position: const Offset(0.5, 0.5),
        );
        const newPos = Offset(0.8, 0.8);
        final copied = item.copyWith(position: newPos);
        expect(copied.position, equals(newPos));
      });

      test('copyWith preserves id, icon, and color', () {
        final item = DisplacementItem(
          id: 3,
          icon: Icons.star_rounded,
          color: Colors.blue,
          position: const Offset(0.1, 0.1),
        );
        final copied = item.copyWith(position: const Offset(0.9, 0.9));
        expect(copied.id, equals(3));
        expect(copied.icon, equals(Icons.star_rounded));
        expect(copied.color, equals(Colors.blue));
      });
    });
  });
}
