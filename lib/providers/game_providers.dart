import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/game_metadata.dart';
import '../data/game_registry.dart';
import '../providers/user_providers.dart';

part 'game_providers.g.dart';

@riverpod
List<GameMetadata> filteredGames(FilteredGamesRef ref, {required String searchQuery, required String selectedCategory}) {
  final allGames = allGamesMetadata;
  final favoriteIds = ref.watch(userDataNotifierProvider.select((d) => d.favoriteGameIds ?? []));

  final filtered = allGames.where((game) {
    final matchesSearch = game.id
            .toLowerCase()
            .contains(searchQuery.toLowerCase()) ||
        game.category
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
    final matchesCategory =
        selectedCategory == 'ALL' || game.category == selectedCategory;
    return matchesSearch && matchesCategory;
  }).toList();

  int getPriority(GameMetadata game) {
    if (favoriteIds.contains(game.id)) return -1;
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
