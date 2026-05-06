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
String _$userDataNotifierHash() => r'da798fee5c9572b053cada6d258083bbc7d92062';

/// See also [UserDataNotifier].
@ProviderFor(UserDataNotifier)
final userDataNotifierProvider =
    AutoDisposeNotifierProvider<UserDataNotifier, UserData>.internal(
  UserDataNotifier.new,
  name: r'userDataNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDataNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserDataNotifier = AutoDisposeNotifier<UserData>;
String _$gameStreakNotifierHash() =>
    r'65df2887b6c2e7ce4cb2874fc5a48bf7a35139c1';

/// See also [GameStreakNotifier].
@ProviderFor(GameStreakNotifier)
final gameStreakNotifierProvider = AutoDisposeNotifierProvider<
    GameStreakNotifier, Map<String, GameStreak>>.internal(
  GameStreakNotifier.new,
  name: r'gameStreakNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameStreakNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GameStreakNotifier = AutoDisposeNotifier<Map<String, GameStreak>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
