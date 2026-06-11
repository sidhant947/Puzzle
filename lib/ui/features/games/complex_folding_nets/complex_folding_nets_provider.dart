import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'complex_folding_nets_engine.dart';

part 'complex_folding_nets_provider.g.dart';

class ComplexFoldingNetsState {
  final NetSolidPair? correctPair;
  final List<NetSolidPair> options;
  final int? selectedIndex;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  ComplexFoldingNetsState({
    this.correctPair,
    this.options = const [],
    this.selectedIndex,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  ComplexFoldingNetsState copyWith({
    NetSolidPair? correctPair,
    List<NetSolidPair>? options,
    int? selectedIndex,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return ComplexFoldingNetsState(
      correctPair: correctPair ?? this.correctPair,
      options: options ?? this.options,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isVictory: isVictory ?? this.isVictory,
      isFailed: isFailed ?? this.isFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class ComplexFoldingNetsNotifier extends _$ComplexFoldingNetsNotifier {
  final _engine = ComplexFoldingNetsEngine();

  @override
  ComplexFoldingNetsState build() {
    return ComplexFoldingNetsState(isLoading: true);
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = ComplexFoldingNetsState(
      correctPair: level['correctPair'] as NetSolidPair,
      options: level['options'] as List<NetSolidPair>,
      isLoading: false,
    );
  }

  void selectOption(int index) {
    if (state.isVictory || state.isFailed) return;
    
    final isCorrect = state.options[index] == state.correctPair;
    
    if (isCorrect) {
      state = state.copyWith(
        selectedIndex: index,
        isVictory: true,
      );
    } else {
      state = state.copyWith(
        selectedIndex: index,
        isFailed: true,
      );
    }
  }

  void reset() {
    initGame();
  }
}
