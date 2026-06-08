import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'definition_dash_engine.dart';

part 'definition_dash_provider.g.dart';

class DefinitionDashState {
  final DefinitionDashPuzzle? puzzle;
  final bool isGameOver;
  final String? selectedDefinition;
  final bool? isCorrect;

  DefinitionDashState({
    this.puzzle,
    this.isGameOver = false,
    this.selectedDefinition,
    this.isCorrect,
  });

  DefinitionDashState copyWith({
    DefinitionDashPuzzle? puzzle,
    bool? isGameOver,
    String? selectedDefinition,
    bool? isCorrect,
  }) {
    return DefinitionDashState(
      puzzle: puzzle ?? this.puzzle,
      isGameOver: isGameOver ?? this.isGameOver,
      selectedDefinition: selectedDefinition,
      isCorrect: isCorrect,
    );
  }
}

@riverpod
class DefinitionDashNotifier extends _$DefinitionDashNotifier {
  final _engine = DefinitionDashEngine();

  @override
  DefinitionDashState build() {
    return DefinitionDashState();
  }

  void startGame() {
    final puzzle = _engine.generatePuzzle();
    state = DefinitionDashState(
      puzzle: puzzle,
      isGameOver: false,
    );
  }

  void selectOption(String definition) {
    if (state.isGameOver || state.selectedDefinition != null) return;
    
    final isCorrect = definition == state.puzzle!.correctDefinition;
    state = state.copyWith(
      selectedDefinition: definition,
      isCorrect: isCorrect,
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      state = state.copyWith(isGameOver: true);
    });
  }
}
