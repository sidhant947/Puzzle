import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'grocery_list_engine.dart';
import 'dart:math';

part 'grocery_list_provider.g.dart';

enum GroceryListPhase { memorizing, testing, result }

class GroceryListState {
  final List<Map<String, String>> list;
  final Map<String, String>? testItem;
  final List<String> categoryOptions;
  final GroceryListPhase phase;
  final int score;
  final int trial;
  final bool isGameOver;
  final bool isLoading;

  GroceryListState({
    required this.list,
    this.testItem,
    this.categoryOptions = const [],
    this.phase = GroceryListPhase.memorizing,
    this.score = 0,
    this.trial = 0,
    this.isGameOver = false,
    this.isLoading = true,
  });

  GroceryListState copyWith({
    List<Map<String, String>>? list,
    Map<String, String>? testItem,
    List<String>? categoryOptions,
    GroceryListPhase? phase,
    int? score,
    int? trial,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return GroceryListState(
      list: list ?? this.list,
      testItem: testItem ?? this.testItem,
      categoryOptions: categoryOptions ?? this.categoryOptions,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      trial: trial ?? this.trial,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class GroceryListNotifier extends _$GroceryListNotifier {
  final _engine = GroceryListEngine();
  final int _maxTrials = 10;

  @override
  GroceryListState build() {
    return GroceryListState(list: []);
  }

  void initGame() {
    _nextTrial(0);
  }

  void _nextTrial(int currentScore) {
    if (state.trial >= _maxTrials) {
      state = state.copyWith(isGameOver: true, phase: GroceryListPhase.result);
      return;
    }

    final length = 3 + (state.trial ~/ 3);
    final list = _engine.generateList(length);
    
    state = GroceryListState(
      list: list,
      trial: state.trial + 1,
      score: currentScore,
      phase: GroceryListPhase.memorizing,
      isLoading: false,
    );
  }

  void startTesting() {
    final Random random = Random();
    final testItem = state.list[random.nextInt(state.list.length)];
    final options = _engine.categories.keys.toList()..shuffle();

    state = state.copyWith(
      phase: GroceryListPhase.testing,
      testItem: testItem,
      categoryOptions: options,
    );
  }

  void onCategorySelect(String category) {
    if (state.phase != GroceryListPhase.testing || state.isGameOver) return;

    if (category == state.testItem!['category']) {
      // Correct
      final newScore = state.score + 10;
      state = state.copyWith(score: newScore);
      Future.delayed(const Duration(milliseconds: 500), () {
        _nextTrial(newScore);
      });
    } else {
      // Wrong
      state = state.copyWith(isGameOver: true, phase: GroceryListPhase.result);
    }
  }
}
