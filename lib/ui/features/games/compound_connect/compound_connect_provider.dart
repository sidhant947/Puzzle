import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'compound_connect_engine.dart';

part 'compound_connect_provider.g.dart';

class CompoundConnectState {
  final String prefix;
  final String correctSuffix;
  final List<String> options;
  final String? selectedSuffix;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  CompoundConnectState({
    required this.prefix,
    required this.correctSuffix,
    required this.options,
    this.selectedSuffix,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  CompoundConnectState copyWith({
    String? prefix,
    String? correctSuffix,
    List<String>? options,
    String? selectedSuffix,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return CompoundConnectState(
      prefix: prefix ?? this.prefix,
      correctSuffix: correctSuffix ?? this.correctSuffix,
      options: options ?? this.options,
      selectedSuffix: selectedSuffix ?? this.selectedSuffix,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CompoundConnectNotifier extends _$CompoundConnectNotifier {
  final _engine = CompoundConnectEngine();

  @override
  CompoundConnectState build() {
    return CompoundConnectState(prefix: '', correctSuffix: '', options: []);
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    final options = _engine.getOptions(task);
    
    state = CompoundConnectState(
      prefix: task.prefix,
      correctSuffix: task.suffix,
      options: options,
      isLoading: false,
    );
  }

  void selectSuffix(String suffix) {
    if (state.isGameOver) return;

    final isCorrect = _engine.checkAnswer(suffix, state.correctSuffix);
    state = state.copyWith(
      selectedSuffix: suffix,
      isGameOver: true,
      isGameWon: isCorrect,
    );
  }
}
