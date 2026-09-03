// ignore_for_file: library_private_types_in_public_api
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  @HiveType(typeId: 0, adapterName: 'UserDataAdapter')
  const factory UserData({
    @HiveField(0) required int xp,
    @HiveField(1) required int level,
    @HiveField(2) int? superStreak,
    @HiveField(3) DateTime? lastSuperStreakDate,
    @HiveField(4) int? totalSolved,
    @HiveField(5) List<String>? favoriteGameIds,
    @HiveField(6) bool? isTrialModeEnabled,
    @HiveField(7) List<String>? hiddenGameIds,
    @HiveField(8) bool? isKeepScreenAwakeEnabled,
  }) = _UserData;

  factory UserData.initial() => const UserData(
        xp: 0,
        level: 1,
        superStreak: 0,
        lastSuperStreakDate: null,
        totalSolved: 0,
        favoriteGameIds: [],
        isTrialModeEnabled: false,
        hiddenGameIds: [],
        isKeepScreenAwakeEnabled: false,
      );

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

extension UserDataValidation on UserData {
  bool get isValid {
    if (xp < 0) return false;
    if (level < 1 || level > 100) return false;
    if ((superStreak ?? 0) < 0) return false;
    if ((totalSolved ?? 0) < 0) return false;
    return true;
  }

  UserData sanitized() {
    return copyWith(
      xp: xp < 0 ? 0 : xp,
      level: level < 1 ? 1 : (level > 100 ? 100 : level),
      superStreak: (superStreak ?? 0) < 0 ? 0 : superStreak,
      totalSolved: (totalSolved ?? 0) < 0 ? 0 : totalSolved,
      favoriteGameIds: favoriteGameIds ?? [],
      hiddenGameIds: hiddenGameIds ?? [],
    );
  }
}
