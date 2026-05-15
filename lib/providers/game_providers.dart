import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../ui/features/home/home_screen.dart';

part 'game_providers.g.dart';

@riverpod
List<Map<String, dynamic>> filteredGames(FilteredGamesRef ref, {required String searchQuery, required String selectedCategory}) {
  final allGames = HomeScreen.allGamesList; // I'll make this static in HomeScreen
  
  return allGames.where((game) {
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
}
