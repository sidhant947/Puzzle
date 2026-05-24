import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/user_data.dart';
import '../data/models/game_streak.dart';
import '../data/repositories/user_repository.dart';

part 'user_providers.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}

@riverpod
class UserDataNotifier extends _$UserDataNotifier {
  @override
  UserData build() {
    final data = ref.read(userRepositoryProvider).getUserData();

    // Handle daily super streak reset autonomously within build
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastSuperStreak = data.lastSuperStreakDate;

    if (lastSuperStreak != null) {
      final lastSuperStreakNormalized =
          DateTime(lastSuperStreak.year, lastSuperStreak.month, lastSuperStreak.day);
      final daysSinceLastSuper = today.difference(lastSuperStreakNormalized).inDays;

      if (daysSinceLastSuper > 1 && (data.superStreak ?? 0) > 0) {
        final updatedData = data.copyWith(superStreak: 0);
        // Save to repository (fire-and-forget since we're in build)
        ref.read(userRepositoryProvider).saveUserData(updatedData);
        return updatedData;
      }
    }

    return data;
  }

  /// Calculates level based on total XP using a curved progression
  /// Level 1: 0 XP
  /// Level 2: 100 XP
  /// Level 100: 1,000,000 XP
  /// Formula: level = (xp / 100)^(1/3) + 1 (Approximate for scaling)
  /// But to be precise for 100 levels and 1M max:
  /// We use: level = 1 + 99 * (xp / 1,000,000)^0.5  (Square root curve for steady progression)
  static final Map<int, int> _xpForLevelCache = {};
  static final Map<int, int> _levelForXpCache = {};

  int calculateLevel(int xp) {
    if (_levelForXpCache.containsKey(xp)) return _levelForXpCache[xp]!;
    final level = pow(xp / 100, 1 / 2.04).floor() + 1;
    final clamped = level.clamp(1, 100);
    // Don't cache every single XP point to avoid memory bloat,
    // only cache if it's explicitly requested frequently (like in build methods)
    return clamped;
  }

  /// Calculates the total XP required to reach a specific level
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
    final lastSuperStreakNormalized = lastSuperStreak != null
        ? DateTime(
            lastSuperStreak.year, lastSuperStreak.month, lastSuperStreak.day)
        : DateTime.fromMillisecondsSinceEpoch(0);

    if (lastSuperStreakNormalized == today) return; // Already achieved today

    // Check if any game is solved today (Super Streak)
    final solvedTodayCount = streaks.values.where((s) => s.solvedToday).length;
    if (solvedTodayCount >= 1) {
      int newStreak = 1;
      final currentSuperStreak = state.superStreak ?? 0;
      if (today.difference(lastSuperStreakNormalized).inDays == 1) {
        newStreak = currentSuperStreak + 1;
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

    final lastSuperStreakNormalized =
        DateTime(lastSuperStreak.year, lastSuperStreak.month, lastSuperStreak.day);

    final daysSinceLastSuper = today.difference(lastSuperStreakNormalized).inDays;

    if (daysSinceLastSuper > 1 && (state.superStreak ?? 0) > 0) {
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

  Future<void> setTrialMode(bool enabled) async {
    final newState = state.copyWith(isTrialModeEnabled: enabled);
    state = newState;
    await ref.read(userRepositoryProvider).saveUserData(newState);
  }

  Future<void> updateOnboarding(String name) async {
    final newState = state.copyWith(name: name, isOnboarded: true);
    state = newState;
    await ref.read(userRepositoryProvider).saveUserData(newState);
  }

  Future<void> updateName(String name) async {
    final newState = state.copyWith(name: name);
    state = newState;
    await ref.read(userRepositoryProvider).saveUserData(newState);
  }
}

@riverpod
class GameStreakNotifier extends _$GameStreakNotifier {
  @override
  Map<String, GameStreak> build() {
    final streaks = ref.read(userRepositoryProvider).getAllGameStreaks();
    final streakMap = {for (var s in streaks) s.gameId: s};
    return _applyDailyReset(streakMap);
  }

  Map<String, GameStreak> _applyDailyReset(Map<String, GameStreak> currentStreaks) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final Map<String, GameStreak> updatedStreaks = Map.from(currentStreaks);
    final List<GameStreak> streaksToSave = [];

    updatedStreaks.forEach((gameId, streak) {
      final lastSolvedDate = streak.lastSolvedDate;
      final lastSolvedNormalized =
          DateTime(lastSolvedDate.year, lastSolvedDate.month, lastSolvedDate.day);
      
      final daysSinceLastSolved = today.difference(lastSolvedNormalized).inDays;
      
      GameStreak updatedStreak = streak;
      bool streakChanged = false;

      // 1. Reset solvedToday if it's a new day
      if (lastSolvedNormalized != today && streak.solvedToday) {
        updatedStreak = updatedStreak.copyWith(solvedToday: false);
        streakChanged = true;
      }

      // 2. Reset streak to 0 if a day was missed
      if (daysSinceLastSolved > 1 && streak.currentStreak > 0) {
        updatedStreak = updatedStreak.copyWith(currentStreak: 0);
        streakChanged = true;
      }

      if (streakChanged) {
        updatedStreaks[gameId] = updatedStreak;
        streaksToSave.add(updatedStreak);
      }
    });

    if (streaksToSave.isNotEmpty) {
      ref.read(userRepositoryProvider).saveAllGameStreaks(streaksToSave);
    }

    return updatedStreaks;
  }

  GameStreak getStreak(String gameId) {
    return state[gameId] ?? GameStreak.initial(gameId);
  }

  Future<bool> completeGame(String gameId, {int xpAmount = 20}) async {
    // Always award XP for every solve
    await ref.read(userDataNotifierProvider.notifier).addXp(xpAmount);
    // Increment total solved puzzles
    await ref.read(userDataNotifierProvider.notifier).incrementTotalSolved();

    final currentStreak = getStreak(gameId);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Normalize lastSolvedDate to compare dates without time
    final lastSolvedDate = currentStreak.lastSolvedDate;
    final lastSolvedNormalized =
        DateTime(lastSolvedDate.year, lastSolvedDate.month, lastSolvedDate.day);

    // If already solved today, just return true (XP already awarded above)
    if (currentStreak.solvedToday && lastSolvedNormalized == today) {
      return true;
    }

    int newStreakCount = currentStreak.currentStreak;
    if (lastSolvedDate.millisecondsSinceEpoch == 0) {
      // First time playing
      newStreakCount = 1;
    } else if (today.difference(lastSolvedNormalized).inDays == 1) {
      // Continued streak
      newStreakCount++;
    } else if (today.difference(lastSolvedNormalized).inDays > 1) {
      // Streak was broken
      newStreakCount = 1;
    } else if (lastSolvedNormalized == today) {
      // Already solved today but solvedToday was false
      newStreakCount = currentStreak.currentStreak;
    }

    final newStreak = currentStreak.copyWith(
      currentStreak: newStreakCount,
      lastSolvedDate: now,
      solvedToday: true,
    );

    state = {...state, gameId: newStreak};
    await ref.read(userRepositoryProvider).saveGameStreak(newStreak);

    // Check for super streak
    await ref.read(userDataNotifierProvider.notifier).updateSuperStreak(state);

    return true;
  }

  void refreshStatus() {
    ref.read(userDataNotifierProvider.notifier).refreshSuperStreak();
    state = _applyDailyReset(state);
  }
}
