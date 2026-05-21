import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'conjunction_search_engine.dart';
import '../../../../providers/user_providers.dart';

part 'conjunction_search_provider.g.dart';

class ConjunctionSearchState {
  final List<SearchItem> items;
  final SearchItem target;
  final int currentRound;
  final int totalRounds;
  final bool isCompleted;
  final int score;
  final int errors;

  ConjunctionSearchState({
    required this.items,
    required this.target,
    required this.currentRound,
    required this.totalRounds,
    required this.isCompleted,
    required this.score,
    required this.errors,
  });

  ConjunctionSearchState copyWith({
    List<SearchItem>? items,
    SearchItem? target,
    int? currentRound,
    int? totalRounds,
    bool? isCompleted,
    int? score,
    int? errors,
  }) {
    return ConjunctionSearchState(
      items: items ?? this.items,
      target: target ?? this.target,
      currentRound: currentRound ?? this.currentRound,
      totalRounds: totalRounds ?? this.totalRounds,
      isCompleted: isCompleted ?? this.isCompleted,
      score: score ?? this.score,
      errors: errors ?? this.errors,
    );
  }
}

@riverpod
class ConjunctionSearchNotifier extends _$ConjunctionSearchNotifier {
  final ConjunctionSearchEngine _engine = ConjunctionSearchEngine();
  static const int maxRounds = 5;

  @override
  ConjunctionSearchState build() {
    final level = _engine.generateLevel();
    return ConjunctionSearchState(
      items: level['items'] as List<SearchItem>,
      target: level['target'] as SearchItem,
      currentRound: 1,
      totalRounds: maxRounds,
      isCompleted: false,
      score: 0,
      errors: 0,
    );
  }

  void selectItem(SearchItem item) {
    if (state.isCompleted) return;

    if (item.isTarget) {
      final nextRound = state.currentRound + 1;
      if (nextRound > state.totalRounds) {
        state = state.copyWith(
          isCompleted: true,
          score: state.score + 100,
        );
        ref.read(gameStreakNotifierProvider.notifier).completeGame('conjunction_search', xpAmount: 25);
      } else {
        final level = _engine.generateLevel();
        state = state.copyWith(
          currentRound: nextRound,
          items: level['items'] as List<SearchItem>,
          target: level['target'] as SearchItem,
          score: state.score + 100,
        );
      }
    } else {
      state = state.copyWith(
        errors: state.errors + 1,
        score: (state.score - 20).clamp(0, 9999),
      );
    }
  }

  void reset() {
    final level = _engine.generateLevel();
    state = ConjunctionSearchState(
      items: level['items'] as List<SearchItem>,
      target: level['target'] as SearchItem,
      currentRound: 1,
      totalRounds: maxRounds,
      isCompleted: false,
      score: 0,
      errors: 0,
    );
  }
}
