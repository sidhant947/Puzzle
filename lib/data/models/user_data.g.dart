// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<_$UserDataImpl> {
  @override
  final int typeId = 0;

  @override
  _$UserDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserDataImpl(
      xp: fields[0] as int,
      level: fields[1] as int,
      superStreak: fields[2] as int?,
      lastSuperStreakDate: fields[3] as DateTime?,
      totalSolved: fields[4] as int?,
      favoriteGameIds: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$UserDataImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.xp)
      ..writeByte(1)
      ..write(obj.level)
      ..writeByte(2)
      ..write(obj.superStreak)
      ..writeByte(3)
      ..write(obj.lastSuperStreakDate)
      ..writeByte(4)
      ..write(obj.totalSolved)
      ..writeByte(5)
      ..write(obj.favoriteGameIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      xp: (json['xp'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      superStreak: (json['superStreak'] as num?)?.toInt(),
      lastSuperStreakDate: json['lastSuperStreakDate'] == null
          ? null
          : DateTime.parse(json['lastSuperStreakDate'] as String),
      totalSolved: (json['totalSolved'] as num?)?.toInt(),
      favoriteGameIds: (json['favoriteGameIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'xp': instance.xp,
      'level': instance.level,
      'superStreak': instance.superStreak,
      'lastSuperStreakDate': instance.lastSuperStreakDate?.toIso8601String(),
      'totalSolved': instance.totalSolved,
      'favoriteGameIds': instance.favoriteGameIds,
    };
