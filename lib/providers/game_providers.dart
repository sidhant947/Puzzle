import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../ui/features/home/home_screen.dart';

import '../providers/user_providers.dart';

part 'game_providers.g.dart';

@riverpod
List<Map<String, dynamic>> filteredGames(FilteredGamesRef ref, {required String searchQuery, required String selectedCategory}) {
  final allGames = HomeScreen.allGamesList; 
  final favoriteIds = ref.watch(userDataNotifierProvider.select((d) => d.favoriteGameIds ?? []));
  
  final filtered = allGames.where((game) {
    final matchesSearch = game['title']
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase()) ||
        game['category']
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
    final matchesCategory =
        selectedCategory == 'ALL' || game['category'] == selectedCategory;
    return matchesSearch && matchesCategory;
  }).toList();

  filtered.sort((a, b) {
    final aFav = favoriteIds.contains(a['id']);
    final bFav = favoriteIds.contains(b['id']);
    if (aFav && !bFav) return -1;
    if (!aFav && bFav) return 1;
    return 0;
  });

  return filtered;
}
