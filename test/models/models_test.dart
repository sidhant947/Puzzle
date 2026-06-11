import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/data/models/user_data.dart';
import 'package:puzzle/data/models/game_streak.dart';

void main() {
  group('UserData', () {
    group('initial', () {
      test('creates valid initial state', () {
        final data = UserData.initial();
        expect(data.xp, equals(0));
        expect(data.level, equals(1));
        expect(data.superStreak, equals(0));
        expect(data.totalSolved, equals(0));
        expect(data.favoriteGameIds, isEmpty);
        expect(data.isTrialModeEnabled, isFalse);
      });
    });

    group('isValid', () {
      test('valid data passes validation', () {
        const data = UserData(xp: 100, level: 5);
        expect(data.isValid, isTrue);
      });

      test('negative xp fails validation', () {
        const data = UserData(xp: -1, level: 1);
        expect(data.isValid, isFalse);
      });

      test('level < 1 fails validation', () {
        const data = UserData(xp: 0, level: 0);
        expect(data.isValid, isFalse);
      });

      test('level > 100 fails validation', () {
        const data = UserData(xp: 0, level: 101);
        expect(data.isValid, isFalse);
      });

      test('negative superStreak fails validation', () {
        const data = UserData(xp: 0, level: 1, superStreak: -1);
        expect(data.isValid, isFalse);
      });
    });

    group('sanitized', () {
      test('fixes negative xp', () {
        const data = UserData(xp: -10, level: 1);
        final sanitized = data.sanitized();
        expect(sanitized.xp, equals(0));
      });

      test('fixes level < 1', () {
        const data = UserData(xp: 0, level: 0);
        final sanitized = data.sanitized();
        expect(sanitized.level, equals(1));
      });

      test('fixes level > 100', () {
        const data = UserData(xp: 0, level: 200);
        final sanitized = data.sanitized();
        expect(sanitized.level, equals(100));
      });

      test('fixes negative superStreak', () {
        const data = UserData(xp: 0, level: 1, superStreak: -5);
        final sanitized = data.sanitized();
        expect(sanitized.superStreak, equals(0));
      });

      test('ensures favoriteGameIds is not null', () {
        const data = UserData(xp: 0, level: 1, favoriteGameIds: null);
        final sanitized = data.sanitized();
        expect(sanitized.favoriteGameIds, isEmpty);
      });
    });

    group('fromJson', () {
      test('creates UserData from JSON', () {
        final json = {
          'xp': 500,
          'level': 10,
          'superStreak': 5,
          'totalSolved': 50,
          'favoriteGameIds': ['sudoku', 'minesweeper'],
          'isTrialModeEnabled': true,
        };

        final data = UserData.fromJson(json);
        expect(data.xp, equals(500));
        expect(data.level, equals(10));
        expect(data.superStreak, equals(5));
        expect(data.totalSolved, equals(50));
        expect(data.favoriteGameIds, equals(['sudoku', 'minesweeper']));
        expect(data.isTrialModeEnabled, isTrue);
      });
    });
  });

  group('GameStreak', () {
    group('initial', () {
      test('creates valid initial state', () {
        final streak = GameStreak.initial('sudoku');
        expect(streak.gameId, equals('sudoku'));
        expect(streak.currentStreak, equals(0));
        expect(streak.solvedToday, isFalse);
      });
    });

    group('isValid', () {
      test('valid streak passes validation', () {
        final streak = GameStreak(
          gameId: 'sudoku',
          currentStreak: 5,
          lastSolvedDate: DateTime.now(),
          solvedToday: true,
        );
        expect(streak.isValid, isTrue);
      });

      test('empty gameId fails validation', () {
        final streak = GameStreak(
          gameId: '',
          currentStreak: 0,
          lastSolvedDate: DateTime.now(),
          solvedToday: false,
        );
        expect(streak.isValid, isFalse);
      });

      test('negative streak fails validation', () {
        final streak = GameStreak(
          gameId: 'sudoku',
          currentStreak: -1,
          lastSolvedDate: DateTime.now(),
          solvedToday: false,
        );
        expect(streak.isValid, isFalse);
      });
    });

    group('sanitized', () {
      test('fixes empty gameId', () {
        final streak = GameStreak(
          gameId: '',
          currentStreak: 0,
          lastSolvedDate: DateTime.now(),
          solvedToday: false,
        );
        final sanitized = streak.sanitized();
        expect(sanitized.gameId, equals('unknown'));
      });

      test('fixes negative streak', () {
        final streak = GameStreak(
          gameId: 'sudoku',
          currentStreak: -5,
          lastSolvedDate: DateTime.now(),
          solvedToday: false,
        );
        final sanitized = streak.sanitized();
        expect(sanitized.currentStreak, equals(0));
      });
    });

    group('daysSinceLastSolved', () {
      test('returns 0 for today', () {
        final streak = GameStreak(
          gameId: 'sudoku',
          currentStreak: 1,
          lastSolvedDate: DateTime.now(),
          solvedToday: true,
        );
        expect(streak.daysSinceLastSolved, equals(0));
      });

      test('returns correct days for past date', () {
        final streak = GameStreak(
          gameId: 'sudoku',
          currentStreak: 3,
          lastSolvedDate: DateTime.now().subtract(const Duration(days: 3)),
          solvedToday: false,
        );
        expect(streak.daysSinceLastSolved, equals(3));
      });
    });
  });
}
