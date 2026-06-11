// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_streak.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameStreakAdapter extends TypeAdapter<_$GameStreakImpl> {
  @override
  final int typeId = 1;

  @override
  _$GameStreakImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$GameStreakImpl(
      gameId: fields[0] as String,
      currentStreak: fields[1] as int,
      lastSolvedDate: fields[2] as DateTime,
      solvedToday: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$GameStreakImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.gameId)
      ..writeByte(1)
      ..write(obj.currentStreak)
      ..writeByte(2)
      ..write(obj.lastSolvedDate)
      ..writeByte(3)
      ..write(obj.solvedToday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameStreakAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStreakImpl _$$GameStreakImplFromJson(Map<String, dynamic> json) =>
    _$GameStreakImpl(
      gameId: json['gameId'] as String,
      currentStreak: (json['currentStreak'] as num).toInt(),
      lastSolvedDate: DateTime.parse(json['lastSolvedDate'] as String),
      solvedToday: json['solvedToday'] as bool,
    );

Map<String, dynamic> _$$GameStreakImplToJson(_$GameStreakImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'currentStreak': instance.currentStreak,
      'lastSolvedDate': instance.lastSolvedDate.toIso8601String(),
      'solvedToday': instance.solvedToday,
    };
