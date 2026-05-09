import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'symbol_logic_engine.dart';

part 'symbol_logic_provider.g.dart';

class SymbolLogicState {
  final List<SymbolEquation> equations;
  final int correctAnswer;
  final String currentInput;
  final bool isGameOver;
  final bool isGameWon;
  final bool isInvalidGuess;
  final bool isLoading;

  SymbolLogicState({
    required this.equations,
    required this.correctAnswer,
    this.currentInput = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isInvalidGuess = false,
    this.isLoading = true,
  });

  SymbolLogicState copyWith({
    List<SymbolEquation>? equations,
    int? correctAnswer,
    String? currentInput,
    bool? isGameOver,
    bool? isGameWon,
    bool? isInvalidGuess,
    bool? isLoading,
  }) {
    return SymbolLogicState(
      equations: equations ?? this.equations,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      currentInput: currentInput ?? this.currentInput,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isInvalidGuess: isInvalidGuess ?? this.isInvalidGuess,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SymbolLogicNotifier extends _$SymbolLogicNotifier {
  final _engine = SymbolLogicEngine();

  @override
  SymbolLogicState build() {
    return SymbolLogicState(equations: [], correctAnswer: 0);
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    state = SymbolLogicState(
      equations: puzzle['equations'],
      correctAnswer: puzzle['answer'],
      isLoading: false,
    );
  }

  void onNumberPressed(String number) {
    if (state.isGameOver) return;
    if (state.currentInput.length < 3) {
      state = state.copyWith(
        currentInput: state.currentInput + number,
        isInvalidGuess: false,
      );
    }
  }

  void onBackspace() {
    if (state.isGameOver || state.currentInput.isEmpty) return;
    state = state.copyWith(
      currentInput: state.currentInput.substring(0, state.currentInput.length - 1),
      isInvalidGuess: false,
    );
  }

  void submitGuess() {
    if (state.isGameOver || state.currentInput.isEmpty) return;
    
    final guess = int.tryParse(state.currentInput);
    if (guess == state.correctAnswer) {
      state = state.copyWith(
        isGameOver: true,
        isGameWon: true,
      );
    } else {
      state = state.copyWith(isInvalidGuess: true, currentInput: '');
    }
  }
}
