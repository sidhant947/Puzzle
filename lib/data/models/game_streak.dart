// ignore_for_file: library_private_types_in_public_api
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'game_streak.freezed.dart';
part 'game_streak.g.dart';

@freezed
class GameStreak with _$GameStreak {
  @HiveType(typeId: 1, adapterName: 'GameStreakAdapter')
  const factory GameStreak({
    @HiveField(0) required String gameId,
    @HiveField(1) required int currentStreak,
    @HiveField(2) required DateTime lastSolvedDate,
    @HiveField(3) required bool solvedToday,
  }) = _GameStreak;

  factory GameStreak.initial(String gameId) => GameStreak(
        gameId: gameId,
        currentStreak: 0,
        lastSolvedDate: DateTime.fromMillisecondsSinceEpoch(0),
        solvedToday: false,
      );

  factory GameStreak.fromJson(Map<String, dynamic> json) =>
      _$GameStreakFromJson(json);
}

extension GameStreakValidation on GameStreak {
  bool get isValid {
    if (gameId.isEmpty) return false;
    if (currentStreak < 0) return false;
    return true;
  }

  GameStreak sanitized() {
    return copyWith(
      gameId: gameId.isEmpty ? 'unknown' : gameId,
      currentStreak: currentStreak < 0 ? 0 : currentStreak,
    );
  }

  int get daysSinceLastSolved {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastNormalized = DateTime(lastSolvedDate.year, lastSolvedDate.month, lastSolvedDate.day);
    return today.difference(lastNormalized).inDays;
  }
}
