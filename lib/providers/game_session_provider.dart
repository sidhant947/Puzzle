import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_session_provider.g.dart';

class GameSession {
  final String? lastGameId;
  final String selectedCategory;
  final String searchQuery;

  GameSession({
    this.lastGameId,
    this.selectedCategory = 'ALL',
    this.searchQuery = '',
  });

  GameSession copyWith({
    String? lastGameId,
    String? selectedCategory,
    String? searchQuery,
  }) {
    return GameSession(
      lastGameId: lastGameId ?? this.lastGameId,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

@Riverpod(keepAlive: true)
class GameSessionNotifier extends _$GameSessionNotifier {
  @override
  GameSession build() {
    return GameSession();
  }

  void setSession({required String gameId, required String category, required String query}) {
    state = GameSession(
      lastGameId: gameId,
      selectedCategory: category,
      searchQuery: query,
    );
  }
}
