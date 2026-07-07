import 'dart:async';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/user_data.dart';
import '../data/models/game_streak.dart';
import '../data/repositories/user_repository.dart';

part 'user_providers.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}

@Riverpod(keepAlive: true)
class UserDataNotifier extends _$UserDataNotifier {
  @override
  UserData build() {
    return ref.read(userRepositoryProvider).getUserData();
  }

  int calculateLevel(int xp) {
    final level = pow(xp / 100, 1 / 2.04).floor() + 1;
    return level.clamp(1, 100);
  }

  static final Map<int, int> _xpForLevelCache = {};

  int xpForLevel(int level) {
    if (level <= 1) return 0;
    if (level >= 100) return 1000000;
    if (_xpForLevelCache.containsKey(level)) return _xpForLevelCache[level]!;
    final xp = (100 * pow(level - 1, 2.04)).floor();
    _xpForLevelCache[level] = xp;
    return xp;
  }

  Future<void> addXp(int amount) async {
    final newXp = state.xp + amount;
    final newLevel = calculateLevel(newXp);
    final newState = state.copyWith(xp: newXp, level: newLevel);
    state = newState;
    await ref.read(userRepositoryProvider).saveUserData(newState);
  }

  Future<void> incrementTotalSolved() async {
    final newState = state.copyWith(totalSolved: (state.totalSolved ?? 0) + 1);
    state = newState;
    unawaited(ref.read(userRepositoryProvider).saveUserData(newState));
  }

  Future<void> updateSuperStreak(Map<String, GameStreak> streaks) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final lastSuperStreak = state.lastSuperStreakDate;
    final lastNormalized = lastSuperStreak != null
        ? DateTime(lastSuperStreak.year, lastSuperStreak.month, lastSuperStreak.day)
        : DateTime.fromMillisecondsSinceEpoch(0);

    if (lastNormalized == today) return;

    final solvedTodayCount = streaks.values.where((s) => s.solvedToday).length;
    if (solvedTodayCount >= 1) {
      int newStreak = 1;
      if (today.difference(lastNormalized).inDays == 1) {
        newStreak = (state.superStreak ?? 0) + 1;
      }

      final newState = state.copyWith(
        superStreak: newStreak,
        lastSuperStreakDate: now,
      );
      state = newState;
      unawaited(ref.read(userRepositoryProvider).saveUserData(newState));
    }
  }

  void refreshSuperStreak() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final lastSuperStreak = state.lastSuperStreakDate;
    if (lastSuperStreak == null) return;

    final lastNormalized = DateTime(lastSuperStreak.year, lastSuperStreak.month, lastSuperStreak.day);
    final daysSince = today.difference(lastNormalized).inDays;

    if (daysSince > 1 && (state.superStreak ?? 0) > 0) {
      final newState = state.copyWith(superStreak: 0);
      state = newState;
      ref.read(userRepositoryProvider).saveUserData(newState);
    }
  }

  Future<void> toggleFavorite(String gameId) async {
    final favorites = List<String>.from(state.favoriteGameIds ?? []);
    if (favorites.contains(gameId)) {
      favorites.remove(gameId);
    } else {
      favorites.add(gameId);
    }
    final newState = state.copyWith(favoriteGameIds: favorites);
    state = newState;
    unawaited(ref.read(userRepositoryProvider).saveUserData(newState));
  }

  Future<void> toggleHideGame(String gameId) async {
    final hidden = List<String>.from(state.hiddenGameIds ?? []);
    if (hidden.contains(gameId)) {
      hidden.remove(gameId);
    } else {
      hidden.add(gameId);
    }
    final newState = state.copyWith(hiddenGameIds: hidden);
    state = newState;
    unawaited(ref.read(userRepositoryProvider).saveUserData(newState));
  }

  Future<void> setTrialMode(bool enabled) async {
    final newState = state.copyWith(isTrialModeEnabled: enabled);
    state = newState;
    await ref.read(userRepositoryProvider).saveUserData(newState);
  }
}

@Riverpod(keepAlive: true)
class GameStreakNotifier extends _$GameStreakNotifier {
  @override
  Map<String, GameStreak> build() {
    final streaks = ref.read(userRepositoryProvider).getAllGameStreaks();
    return {for (var s in streaks) s.gameId: s};
  }

  void applyDailyReset() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final List<GameStreak> toSave = [];
    final Map<String, GameStreak> updated = Map.from(state);

    for (final entry in updated.entries) {
      final gameId = entry.key;
      final streak = entry.value;

      if (!streak.solvedToday) continue;

      final lastNormalized = DateTime(
        streak.lastSolvedDate.year,
        streak.lastSolvedDate.month,
        streak.lastSolvedDate.day,
      );

      if (lastNormalized == today) continue;

      final changed = streak.copyWith(solvedToday: false);
      final daysSince = today.difference(lastNormalized).inDays;
      final finalStreak = daysSince > 1 && changed.currentStreak > 0
          ? changed.copyWith(currentStreak: 0)
          : changed;

      updated[gameId] = finalStreak;
      toSave.add(finalStreak);
    }

    if (toSave.isNotEmpty) {
      ref.read(userRepositoryProvider).saveAllGameStreaks(toSave);
      state = updated;
    }
  }

  GameStreak getStreak(String gameId) {
    return state[gameId] ?? GameStreak.initial(gameId);
  }

  Future<bool> completeGame(String gameId, {int xpAmount = 20}) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final currentStreak = getStreak(gameId);
    final lastNormalized = DateTime(
      currentStreak.lastSolvedDate.year,
      currentStreak.lastSolvedDate.month,
      currentStreak.lastSolvedDate.day,
    );

    if (currentStreak.solvedToday && lastNormalized == today) {
      return true;
    }

    int newStreakCount = currentStreak.currentStreak;
    if (currentStreak.lastSolvedDate.millisecondsSinceEpoch == 0) {
      newStreakCount = 1;
    } else if (today.difference(lastNormalized).inDays == 1) {
      newStreakCount++;
    } else if (today.difference(lastNormalized).inDays > 1) {
      newStreakCount = 1;
    }

    final newStreak = currentStreak.copyWith(
      currentStreak: newStreakCount,
      lastSolvedDate: now,
      solvedToday: true,
    );

    // Batch user data updates
    final newXp = ref.read(userDataNotifierProvider).xp + xpAmount;
    final newLevel = ref.read(userDataNotifierProvider.notifier).calculateLevel(newXp);
    final newUserData = ref.read(userDataNotifierProvider).copyWith(
      xp: newXp,
      level: newLevel,
      totalSolved: (ref.read(userDataNotifierProvider).totalSolved ?? 0) + 1,
    );

    state = {...state, gameId: newStreak};

    // Single batched save
    await ref.read(userRepositoryProvider).saveGameCompletion(newUserData, newStreak);
    ref.read(userDataNotifierProvider.notifier).state = newUserData;

    await ref.read(userDataNotifierProvider.notifier).updateSuperStreak(state);

    return true;
  }

  void refreshStatus() {
    ref.read(userDataNotifierProvider.notifier).refreshSuperStreak();
    applyDailyReset();
  }
}
