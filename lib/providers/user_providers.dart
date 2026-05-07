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

@riverpod
class UserDataNotifier extends _$UserDataNotifier {
  @override
  UserData build() {
    return ref.read(userRepositoryProvider).getUserData();
  }

  int calculateLevel(int xp) {
    // Level = floor((-1 + sqrt(1 + XP / 12.5)) / 2) + 1
    if (xp <= 0) return 1;
    return ((-1 + sqrt(1 + xp / 12.5)) / 2).floor() + 1;
  }

  int xpForLevel(int level) {
    // TotalXP = 50 * Level * (Level - 1)
    // Wait, let's re-verify:
    // Level 1: 0 XP
    // Level 2: 100 XP
    // Level 3: 300 XP
    // Level 4: 600 XP
    // Level N requires 100*(N-1) more than N-1.
    // Total XP for Level N = 100 * (0 + 1 + ... + (N-1)) = 100 * (N-1)*N / 2 = 50 * N * (N-1)
    return 50 * level * (level - 1);
  }

  Future<void> addXp(int amount) async {
    final newXp = state.xp + amount;
    final newLevel = calculateLevel(newXp);
    final newState = state.copyWith(xp: newXp, level: newLevel);
    state = newState;
    await ref.read(userRepositoryProvider).saveUserData(newState);
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
      await ref.read(userRepositoryProvider).saveUserData(newState);
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
}

@riverpod
class GameStreakNotifier extends _$GameStreakNotifier {
  @override
  Map<String, GameStreak> build() {
    // Refresh super streak status as well
    ref.read(userDataNotifierProvider.notifier).refreshSuperStreak();

    final streaks = ref.read(userRepositoryProvider).getAllGameStreaks();
    final streakMap = {for (var s in streaks) s.gameId: s};
    return _applyDailyReset(streakMap);
  }

  Map<String, GameStreak> _applyDailyReset(Map<String, GameStreak> currentStreaks) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final Map<String, GameStreak> updatedStreaks = Map.from(currentStreaks);

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
        ref.read(userRepositoryProvider).saveGameStreak(updatedStreak);
      }
    });

    return updatedStreaks;
  }

  GameStreak getStreak(String gameId) {
    return state[gameId] ?? GameStreak.initial(gameId);
  }

  Future<bool> completeGame(String gameId, {int xpAmount = 20}) async {
    // Always award XP for every solve
    await ref.read(userDataNotifierProvider.notifier).addXp(xpAmount);

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
