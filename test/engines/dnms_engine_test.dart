import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/dnms/dnms_provider.dart';

void main() {
  group('DNMS Engine (DnmsState)', () {
    group('DnmsState', () {
      test('default state has correct defaults', () {
        final state = DnmsState();
        expect(state.phase, DnmsPhase.memorize);
        expect(state.sampleCard, isNull);
        expect(state.options, isEmpty);
        expect(state.score, 0);
        expect(state.timeLeft, 60);
        expect(state.isGameOver, isFalse);
        expect(state.isLoading, isTrue);
        expect(state.lastRoundCorrect, isNull);
        expect(state.currentDifficulty, 2);
      });

      test('copyWith preserves unmodified fields', () {
        final state = DnmsState(score: 5, timeLeft: 30, currentDifficulty: 3);
        final updated = state.copyWith(score: 10);
        expect(updated.score, 10);
        expect(updated.timeLeft, 30);
        expect(updated.currentDifficulty, 3);
      });

      test('copyWith modifies specified fields', () {
        final state = DnmsState();
        final updated = state.copyWith(
          phase: DnmsPhase.choice,
          isGameOver: true,
          currentDifficulty: 4,
        );
        expect(updated.phase, DnmsPhase.choice);
        expect(updated.isGameOver, isTrue);
        expect(updated.currentDifficulty, 4);
      });
    });

    group('DnmsCard', () {
      test('stores id, icon, and color', () {
        final card = DnmsCard(id: 1, icon: Icons.star, color: Colors.red);
        expect(card.id, 1);
        expect(card.icon, Icons.star);
        expect(card.color, Colors.red);
      });

      test('two cards can differ by icon', () {
        final a = DnmsCard(id: 1, icon: Icons.star, color: Colors.red);
        final b = DnmsCard(id: 1, icon: Icons.favorite, color: Colors.red);
        expect(a.icon, isNot(equals(b.icon)));
      });

      test('two cards can differ by color', () {
        final a = DnmsCard(id: 1, icon: Icons.star, color: Colors.red);
        final b = DnmsCard(id: 1, icon: Icons.star, color: Colors.blue);
        expect(a.color, isNot(equals(b.color)));
      });
    });

    group('DnmsPhase enum', () {
      test('has three phases', () {
        expect(DnmsPhase.values.length, 3);
        expect(DnmsPhase.values, contains(DnmsPhase.memorize));
        expect(DnmsPhase.values, contains(DnmsPhase.delay));
        expect(DnmsPhase.values, contains(DnmsPhase.choice));
      });
    });
  });
}
