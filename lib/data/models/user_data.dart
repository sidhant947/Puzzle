import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  @HiveType(typeId: 0)
  const factory UserData({
    @HiveField(0) required int xp,
    @HiveField(1) required int level,
  }) = _UserData;

  factory UserData.initial() => const UserData(xp: 0, level: 1);

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
