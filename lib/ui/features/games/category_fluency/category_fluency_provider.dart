import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'category_fluency_engine.dart';

part 'category_fluency_provider.g.dart';

class CategoryFluencyState {
  final Category? currentCategory;
  final List<String> enteredWords;
  final int timeLeft; // in seconds
  final bool isGameOver;
  final bool isLoading;
  final int targetCount;

  CategoryFluencyState({
    this.currentCategory,
    this.enteredWords = const [],
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.targetCount = 10,
  });

  CategoryFluencyState copyWith({
    Category? currentCategory,
    List<String>? enteredWords,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    int? targetCount,
  }) {
    return CategoryFluencyState(
      currentCategory: currentCategory ?? this.currentCategory,
      enteredWords: enteredWords ?? this.enteredWords,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      targetCount: targetCount ?? this.targetCount,
    );
  }
}

@riverpod
class CategoryFluencyNotifier extends _$CategoryFluencyNotifier {
  final _engine = CategoryFluencyEngine();
  Timer? _timer;

  @override
  CategoryFluencyState build() {
    ref.onDispose(() => _timer?.cancel());
    return CategoryFluencyState();
  }

  void initGame() {
    _timer?.cancel();
    state = CategoryFluencyState(
      currentCategory: _engine.getRandomCategory(),
      isLoading: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        state = state.copyWith(isGameOver: true);
      }
    });
  }

  bool addWord(String word) {
    if (state.isGameOver) return false;
    
    final normalizedWord = word.trim().toLowerCase();
    if (normalizedWord.isEmpty) return false;
    if (state.enteredWords.contains(normalizedWord)) return false;

    if (_engine.isValidItem(normalizedWord, state.currentCategory!)) {
      final newWords = [...state.enteredWords, normalizedWord];
      state = state.copyWith(enteredWords: newWords);
      
      if (newWords.length >= state.targetCount) {
        _timer?.cancel();
        state = state.copyWith(isGameOver: true);
      }
      return true;
    }
    return false;
  }
}
