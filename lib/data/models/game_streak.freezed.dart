// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_streak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameStreak _$GameStreakFromJson(Map<String, dynamic> json) {
  return _GameStreak.fromJson(json);
}

/// @nodoc
mixin _$GameStreak {
  @HiveField(0)
  String get gameId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get currentStreak => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get lastSolvedDate => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get solvedToday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStreakCopyWith<GameStreak> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStreakCopyWith<$Res> {
  factory $GameStreakCopyWith(
          GameStreak value, $Res Function(GameStreak) then) =
      _$GameStreakCopyWithImpl<$Res, GameStreak>;
  @useResult
  $Res call(
      {@HiveField(0) String gameId,
      @HiveField(1) int currentStreak,
      @HiveField(2) DateTime lastSolvedDate,
      @HiveField(3) bool solvedToday});
}

/// @nodoc
class _$GameStreakCopyWithImpl<$Res, $Val extends GameStreak>
    implements $GameStreakCopyWith<$Res> {
  _$GameStreakCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? currentStreak = null,
    Object? lastSolvedDate = null,
    Object? solvedToday = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastSolvedDate: null == lastSolvedDate
          ? _value.lastSolvedDate
          : lastSolvedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      solvedToday: null == solvedToday
          ? _value.solvedToday
          : solvedToday // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStreakImplCopyWith<$Res>
    implements $GameStreakCopyWith<$Res> {
  factory _$$GameStreakImplCopyWith(
          _$GameStreakImpl value, $Res Function(_$GameStreakImpl) then) =
      __$$GameStreakImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String gameId,
      @HiveField(1) int currentStreak,
      @HiveField(2) DateTime lastSolvedDate,
      @HiveField(3) bool solvedToday});
}

/// @nodoc
class __$$GameStreakImplCopyWithImpl<$Res>
    extends _$GameStreakCopyWithImpl<$Res, _$GameStreakImpl>
    implements _$$GameStreakImplCopyWith<$Res> {
  __$$GameStreakImplCopyWithImpl(
      _$GameStreakImpl _value, $Res Function(_$GameStreakImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? currentStreak = null,
    Object? lastSolvedDate = null,
    Object? solvedToday = null,
  }) {
    return _then(_$GameStreakImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastSolvedDate: null == lastSolvedDate
          ? _value.lastSolvedDate
          : lastSolvedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      solvedToday: null == solvedToday
          ? _value.solvedToday
          : solvedToday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'GameStreakAdapter')
class _$GameStreakImpl implements _GameStreak {
  const _$GameStreakImpl(
      {@HiveField(0) required this.gameId,
      @HiveField(1) required this.currentStreak,
      @HiveField(2) required this.lastSolvedDate,
      @HiveField(3) required this.solvedToday});

  factory _$GameStreakImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStreakImplFromJson(json);

  @override
  @HiveField(0)
  final String gameId;
  @override
  @HiveField(1)
  final int currentStreak;
  @override
  @HiveField(2)
  final DateTime lastSolvedDate;
  @override
  @HiveField(3)
  final bool solvedToday;

  @override
  String toString() {
    return 'GameStreak(gameId: $gameId, currentStreak: $currentStreak, lastSolvedDate: $lastSolvedDate, solvedToday: $solvedToday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStreakImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.lastSolvedDate, lastSolvedDate) ||
                other.lastSolvedDate == lastSolvedDate) &&
            (identical(other.solvedToday, solvedToday) ||
                other.solvedToday == solvedToday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, gameId, currentStreak, lastSolvedDate, solvedToday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStreakImplCopyWith<_$GameStreakImpl> get copyWith =>
      __$$GameStreakImplCopyWithImpl<_$GameStreakImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStreakImplToJson(
      this,
    );
  }
}

abstract class _GameStreak implements GameStreak {
  const factory _GameStreak(
      {@HiveField(0) required final String gameId,
      @HiveField(1) required final int currentStreak,
      @HiveField(2) required final DateTime lastSolvedDate,
      @HiveField(3) required final bool solvedToday}) = _$GameStreakImpl;

  factory _GameStreak.fromJson(Map<String, dynamic> json) =
      _$GameStreakImpl.fromJson;

  @override
  @HiveField(0)
  String get gameId;
  @override
  @HiveField(1)
  int get currentStreak;
  @override
  @HiveField(2)
  DateTime get lastSolvedDate;
  @override
  @HiveField(3)
  bool get solvedToday;
  @override
  @JsonKey(ignore: true)
  _$$GameStreakImplCopyWith<_$GameStreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
