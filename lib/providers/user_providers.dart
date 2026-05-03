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
}

@riverpod
class GameStreakNotifier extends _$GameStreakNotifier {
  @override
  Map<String, GameStreak> build() {
    final streaks = ref.read(userRepositoryProvider).getAllGameStreaks();
    return {for (var s in streaks) s.gameId: s};
  }

  GameStreak getStreak(String gameId) {
    return state[gameId] ?? GameStreak.initial(gameId);
  }

  Future<bool> completeGame(String gameId, {int xpAmount = 20}) async {
    final currentStreak = getStreak(gameId);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Normalize lastSolvedDate to compare dates without time
    final lastSolvedDate = currentStreak.lastSolvedDate;
    final lastSolvedNormalized = DateTime(lastSolvedDate.year, lastSolvedDate.month, lastSolvedDate.day);

    // If already solved today, don't update streak or award XP
    if (currentStreak.solvedToday && lastSolvedNormalized == today) {
      return false; 
    }

    int newStreakCount = currentStreak.currentStreak;
    if (lastSolvedDate.millisecondsSinceEpoch == 0) {
      // First time playing
      newStreakCount = 1;
    } else if (today.difference(lastSolvedNormalized).inDays == 1) {
      // Continued streak
      newStreakCount++;
    } else if (today.difference(lastSolvedNormalized).inDays > 1) {
      // Streak broken
      newStreakCount = 1;
    } else if (lastSolvedNormalized == today) {
      // This handles cases where solvedToday might be false but lastSolved was today
      // (e.g. if resetDailyStatus hasn't run yet or state was inconsistent)
      return false;
    }

    final newStreak = currentStreak.copyWith(
      currentStreak: newStreakCount,
      lastSolvedDate: now,
      solvedToday: true,
    );

    state = {...state, gameId: newStreak};
    await ref.read(userRepositoryProvider).saveGameStreak(newStreak);

    // Add XP only for the first daily win
    await ref.read(userDataNotifierProvider.notifier).addXp(xpAmount);
    return true;
  }

  void resetDailyStatus() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    bool changed = false;
    final newState = Map<String, GameStreak>.from(state);

    state.forEach((gameId, streak) {
      final lastSolved = DateTime(streak.lastSolvedDate.year,
          streak.lastSolvedDate.month, streak.lastSolvedDate.day);
      if (lastSolved != today && streak.solvedToday) {
        newState[gameId] = streak.copyWith(solvedToday: false);
        changed = true;
      }
    });

    if (changed) {
      state = newState;
    }
  }
}
