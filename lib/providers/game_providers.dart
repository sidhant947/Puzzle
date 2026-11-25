import 'dart:math' as math;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/game_metadata.dart';
import '../data/game_registry.dart';
import '../providers/user_providers.dart';

part 'game_providers.g.dart';

@riverpod
List<GameMetadata> filteredGames(FilteredGamesRef ref, {required String searchQuery, required String selectedCategory, required Map<String, String> localizedTitles}) {
  final allGames = allGamesMetadata;
  final favoriteIds = ref.watch(userDataNotifierProvider.select((d) => d.favoriteGameIds ?? []));
  final hiddenIds = ref.watch(userDataNotifierProvider.select((d) => d.hiddenGameIds ?? []));
  final favoriteSet = favoriteIds.toSet();
  final hiddenSet = hiddenIds.toSet();
  final query = searchQuery.toLowerCase();

  final filtered = allGames.where((game) {
    if (hiddenSet.contains(game.id)) return false;
    final title = localizedTitles[game.id]?.toLowerCase() ?? '';
    final matchesSearch = game.id.toLowerCase().contains(query) ||
        title.contains(query) ||
        game.category.toLowerCase().contains(query);
    final matchesCategory =
        selectedCategory == 'ALL' || game.category == selectedCategory;
    return matchesSearch && matchesCategory;
  }).toList();

  int getPriority(GameMetadata game) {
    if (favoriteSet.contains(game.id)) return -1;
    if (game.popularity == Popularity.high) return 0;
    if (game.popularity == Popularity.low) return 2;
    return 1;
  }

  filtered.sort((a, b) => getPriority(a).compareTo(getPriority(b)));

  return filtered;
}

@riverpod
Map<String, int> categoryStats(CategoryStatsRef ref) {
  final allGames = allGamesMetadata;
  final Map<String, int> stats = {};
  for (final game in allGames) {
    stats[game.category] = (stats[game.category] ?? 0) + 1;
  }
  stats['ALL'] = allGames.length;
  return stats;
}

@riverpod
Map<String, int> solvedStats(SolvedStatsRef ref) {
  final streaks = ref.watch(gameStreakNotifierProvider);
  final allGames = allGamesMetadata;
  final Map<String, int> stats = {};
  
  for (final game in allGames) {
    if (streaks.containsKey(game.id)) {
      stats[game.category] = (stats[game.category] ?? 0) + 1;
    }
  }
  stats['ALL'] = streaks.length;
  return stats;
}

@riverpod
int solvedTodayCount(SolvedTodayCountRef ref) {
  return ref.watch(gameStreakNotifierProvider.select(
    (streaks) => streaks.values.where((s) => s.solvedToday).length,
  ));
}

final dailyWorkoutGamesProvider = Provider<List<GameMetadata>>((ref) {
  final now = DateTime.now();
  final seed = now.year * 10000 + now.month * 100 + now.day;
  final rand = math.Random(seed);
  final hiddenIds = ref.watch(userDataNotifierProvider.select((d) => (d.hiddenGameIds ?? []).toSet()));
  final available = allGamesMetadata.where((g) => !hiddenIds.contains(g.id)).toList();
  if (available.length <= 3) return available;

  final mathGames = available.where((g) => g.category == 'MATH').toList();
  final wordGames = available.where((g) => g.category == 'WORD').toList();
  final logicGames = available.where((g) => g.category == 'LOGIC').toList();

  final g1 = mathGames.isNotEmpty ? mathGames[rand.nextInt(mathGames.length)] : available[rand.nextInt(available.length)];
  final g2 = wordGames.isNotEmpty ? wordGames[rand.nextInt(wordGames.length)] : available[rand.nextInt(available.length)];
  final g3 = logicGames.isNotEmpty ? logicGames[rand.nextInt(logicGames.length)] : available[rand.nextInt(available.length)];

  return [g1, g2, g3];
});

final activeStreakGamesProvider = Provider<List<GameMetadata>>((ref) {
  final streaks = ref.watch(gameStreakNotifierProvider);
  final hiddenIds = ref.watch(userDataNotifierProvider.select((d) => (d.hiddenGameIds ?? []).toSet()));
  final available = allGamesMetadata.where((g) => !hiddenIds.contains(g.id)).toList();
  final activeList = available.where((g) => (streaks[g.id]?.currentStreak ?? 0) > 0).toList();
  activeList.sort((a, b) {
    final sA = streaks[a.id]?.currentStreak ?? 0;
    final sB = streaks[b.id]?.currentStreak ?? 0;
    return sB.compareTo(sA);
  });
  return activeList.take(6).toList();
});
