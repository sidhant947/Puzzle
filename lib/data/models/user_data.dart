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
  }) = _UserData;

  factory UserData.initial() => const UserData(
        xp: 0,
        level: 1,
        superStreak: 0,
        lastSuperStreakDate: null,
        totalSolved: 0,
      );

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
