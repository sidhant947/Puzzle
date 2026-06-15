// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'775f0a0cbfe43fcc5b0fbeec8ecf75a7b4fd0859';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = Provider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = ProviderRef<UserRepository>;
String _$userDataNotifierHash() => r'41449a475406b0266107b820bbb1d4795f65b366';

/// See also [UserDataNotifier].
@ProviderFor(UserDataNotifier)
final userDataNotifierProvider =
    NotifierProvider<UserDataNotifier, UserData>.internal(
  UserDataNotifier.new,
  name: r'userDataNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDataNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserDataNotifier = Notifier<UserData>;
String _$gameStreakNotifierHash() =>
    r'f5ee92a2c300b965f0e1af7fc1fcab060fac1e98';

/// See also [GameStreakNotifier].
@ProviderFor(GameStreakNotifier)
final gameStreakNotifierProvider =
    NotifierProvider<GameStreakNotifier, Map<String, GameStreak>>.internal(
  GameStreakNotifier.new,
  name: r'gameStreakNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameStreakNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GameStreakNotifier = Notifier<Map<String, GameStreak>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
