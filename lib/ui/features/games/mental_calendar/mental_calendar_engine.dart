import 'dart:math';

enum Difficulty { easy, medium, hard }

class MentalCalendarEngine {
  final Random _random = Random();

  DateTime generateRandomDate({required Difficulty difficulty}) {
    int year;
    switch (difficulty) {
      case Difficulty.easy:
        year = DateTime.now().year; // Only current year
      case Difficulty.medium:
        year = 2000 + _random.nextInt(30); // 2000-2029
      case Difficulty.hard:
        year = 1900 + _random.nextInt(200); // 1900-2099
    }

    int month = 1 + _random.nextInt(12);
    int day = 1 + _random.nextInt(_daysInMonth(year, month));

    return DateTime(year, month, day);
  }

  int _daysInMonth(int year, int month) {
    if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return 29;
      }
      return 28;
    }
    const days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return days[month];
  }

  int getDayOfWeek(DateTime date) {
    // 1 (Monday) to 7 (Sunday) in Dart DateTime
    return date.weekday;
  }
}
