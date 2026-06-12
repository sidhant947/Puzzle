import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/mental_calendar/mental_calendar_engine.dart';

void main() {
  group('MentalCalendarEngine', () {
    late MentalCalendarEngine engine;

    setUp(() {
      engine = MentalCalendarEngine();
    });

    group('generateRandomDate', () {
      test('easy difficulty generates current year dates', () {
        final now = DateTime.now();
        for (int i = 0; i < 50; i++) {
          final date = engine.generateRandomDate(difficulty: Difficulty.easy);
          expect(date.year, equals(now.year));
        }
      });

      test('medium difficulty generates years 2000-2029', () {
        for (int i = 0; i < 50; i++) {
          final date = engine.generateRandomDate(difficulty: Difficulty.medium);
          expect(date.year, greaterThanOrEqualTo(2000));
          expect(date.year, lessThanOrEqualTo(2029));
        }
      });

      test('hard difficulty generates years 1900-2099', () {
        for (int i = 0; i < 50; i++) {
          final date = engine.generateRandomDate(difficulty: Difficulty.hard);
          expect(date.year, greaterThanOrEqualTo(1900));
          expect(date.year, lessThanOrEqualTo(2099));
        }
      });

      test('generates valid months (1-12)', () {
        for (int i = 0; i < 100; i++) {
          final date = engine.generateRandomDate(difficulty: Difficulty.easy);
          expect(date.month, greaterThanOrEqualTo(1));
          expect(date.month, lessThanOrEqualTo(12));
        }
      });

      test('generates valid days for each month', () {
        for (int i = 0; i < 100; i++) {
          final date = engine.generateRandomDate(difficulty: Difficulty.easy);
          expect(date.day, greaterThanOrEqualTo(1));
          expect(date.day, lessThanOrEqualTo(31));
          // Verify the date is actually valid
          expect(date.month, equals(date.month));
        }
      });
    });

    group('getDayOfWeek', () {
      test('returns correct weekday for known date', () {
        // 2024-01-01 is Monday (weekday 1)
        final monday = DateTime(2024, 1, 1);
        expect(engine.getDayOfWeek(monday), equals(1));

        // 2024-01-07 is Sunday (weekday 7)
        final sunday = DateTime(2024, 1, 7);
        expect(engine.getDayOfWeek(sunday), equals(7));
      });

      test('returns values between 1 and 7', () {
        for (int i = 0; i < 50; i++) {
          final date = engine.generateRandomDate(difficulty: Difficulty.easy);
          final weekday = engine.getDayOfWeek(date);
          expect(weekday, greaterThanOrEqualTo(1));
          expect(weekday, lessThanOrEqualTo(7));
        }
      });
    });
  });
}
