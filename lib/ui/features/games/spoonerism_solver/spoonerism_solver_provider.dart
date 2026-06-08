import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'spoonerism_solver_engine.dart';

part 'spoonerism_solver_provider.g.dart';

class SpoonerismSolverState {
  final String spoonerism;
  final String original;
  final List<String> options;
  final String? selectedOption;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  SpoonerismSolverState({
    required this.spoonerism,
    required this.original,
    required this.options,
    this.selectedOption,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  SpoonerismSolverState copyWith({
    String? spoonerism,
    String? original,
    List<String>? options,
    String? selectedOption,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return SpoonerismSolverState(
      spoonerism: spoonerism ?? this.spoonerism,
      original: original ?? this.original,
      options: options ?? this.options,
      selectedOption: selectedOption ?? this.selectedOption,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SpoonerismSolverNotifier extends _$SpoonerismSolverNotifier {
  final _engine = SpoonerismSolverEngine();

  @override
  SpoonerismSolverState build() {
    return SpoonerismSolverState(spoonerism: '', original: '', options: []);
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    state = SpoonerismSolverState(
      spoonerism: task.spoonerism,
      original: task.original,
      options: task.options..shuffle(),
      isLoading: false,
    );
  }

  void selectOption(String option) {
    if (state.isGameOver) return;
    
    final isCorrect = _engine.checkAnswer(option, state.original);
    state = state.copyWith(
      selectedOption: option,
      isGameOver: true,
      isGameWon: isCorrect,
    );
  }
}
