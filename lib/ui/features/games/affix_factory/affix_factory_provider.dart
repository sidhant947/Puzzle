import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'affix_factory_engine.dart';

part 'affix_factory_provider.g.dart';

class AffixFactoryState {
  final String root;
  final List<String> correctAffixes;
  final List<String> options;
  final List<String> selectedAffixes;
  final String description;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  AffixFactoryState({
    required this.root,
    required this.correctAffixes,
    required this.options,
    this.selectedAffixes = const [],
    required this.description,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  AffixFactoryState copyWith({
    String? root,
    List<String>? correctAffixes,
    List<String>? options,
    List<String>? selectedAffixes,
    String? description,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return AffixFactoryState(
      root: root ?? this.root,
      correctAffixes: correctAffixes ?? this.correctAffixes,
      options: options ?? this.options,
      selectedAffixes: selectedAffixes ?? this.selectedAffixes,
      description: description ?? this.description,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class AffixFactoryNotifier extends _$AffixFactoryNotifier {
  final _engine = AffixFactoryEngine();

  @override
  AffixFactoryState build() {
    return AffixFactoryState(root: '', correctAffixes: [], options: [], description: '');
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    
    state = AffixFactoryState(
      root: task.root,
      correctAffixes: task.affixes,
      options: task.options!,
      description: task.description,
      isLoading: false,
    );
  }

  void toggleAffix(String affix) {
    if (state.isGameOver) return;

    final selected = List<String>.from(state.selectedAffixes);
    if (selected.contains(affix)) {
      selected.remove(affix);
    } else {
      if (selected.length < state.correctAffixes.length) {
        selected.add(affix);
      }
    }
    state = state.copyWith(selectedAffixes: selected);
  }

  void submit() {
    if (state.isGameOver || state.selectedAffixes.length != state.correctAffixes.length) return;

    final isCorrect = _engine.checkAnswer(state.selectedAffixes, state.correctAffixes);
    state = state.copyWith(
      isGameOver: true,
      isGameWon: isCorrect,
    );
  }
}
