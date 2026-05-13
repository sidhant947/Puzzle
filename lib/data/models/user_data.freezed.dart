// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  @HiveField(0)
  int get xp => throw _privateConstructorUsedError;
  @HiveField(1)
  int get level => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get superStreak => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get lastSuperStreakDate => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get totalSolved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {@HiveField(0) int xp,
      @HiveField(1) int level,
      @HiveField(2) int? superStreak,
      @HiveField(3) DateTime? lastSuperStreakDate,
      @HiveField(4) int? totalSolved});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xp = null,
    Object? level = null,
    Object? superStreak = freezed,
    Object? lastSuperStreakDate = freezed,
    Object? totalSolved = freezed,
  }) {
    return _then(_value.copyWith(
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      superStreak: freezed == superStreak
          ? _value.superStreak
          : superStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSuperStreakDate: freezed == lastSuperStreakDate
          ? _value.lastSuperStreakDate
          : lastSuperStreakDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalSolved: freezed == totalSolved
          ? _value.totalSolved
          : totalSolved // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int xp,
      @HiveField(1) int level,
      @HiveField(2) int? superStreak,
      @HiveField(3) DateTime? lastSuperStreakDate,
      @HiveField(4) int? totalSolved});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xp = null,
    Object? level = null,
    Object? superStreak = freezed,
    Object? lastSuperStreakDate = freezed,
    Object? totalSolved = freezed,
  }) {
    return _then(_$UserDataImpl(
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      superStreak: freezed == superStreak
          ? _value.superStreak
          : superStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSuperStreakDate: freezed == lastSuperStreakDate
          ? _value.lastSuperStreakDate
          : lastSuperStreakDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalSolved: freezed == totalSolved
          ? _value.totalSolved
          : totalSolved // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'UserDataAdapter')
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {@HiveField(0) required this.xp,
      @HiveField(1) required this.level,
      @HiveField(2) this.superStreak,
      @HiveField(3) this.lastSuperStreakDate,
      @HiveField(4) this.totalSolved});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  @HiveField(0)
  final int xp;
  @override
  @HiveField(1)
  final int level;
  @override
  @HiveField(2)
  final int? superStreak;
  @override
  @HiveField(3)
  final DateTime? lastSuperStreakDate;
  @override
  @HiveField(4)
  final int? totalSolved;

  @override
  String toString() {
    return 'UserData(xp: $xp, level: $level, superStreak: $superStreak, lastSuperStreakDate: $lastSuperStreakDate, totalSolved: $totalSolved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.superStreak, superStreak) ||
                other.superStreak == superStreak) &&
            (identical(other.lastSuperStreakDate, lastSuperStreakDate) ||
                other.lastSuperStreakDate == lastSuperStreakDate) &&
            (identical(other.totalSolved, totalSolved) ||
                other.totalSolved == totalSolved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, xp, level, superStreak, lastSuperStreakDate, totalSolved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {@HiveField(0) required final int xp,
      @HiveField(1) required final int level,
      @HiveField(2) final int? superStreak,
      @HiveField(3) final DateTime? lastSuperStreakDate,
      @HiveField(4) final int? totalSolved}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  @HiveField(0)
  int get xp;
  @override
  @HiveField(1)
  int get level;
  @override
  @HiveField(2)
  int? get superStreak;
  @override
  @HiveField(3)
  DateTime? get lastSuperStreakDate;
  @override
  @HiveField(4)
  int? get totalSolved;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
