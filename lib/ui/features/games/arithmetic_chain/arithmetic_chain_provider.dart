import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'arithmetic_chain_engine.dart';

part 'arithmetic_chain_provider.g.dart';

enum GamePhase { initial, sequence, input, result }

class ArithmeticChainState {
  final int startValue;
  final List<Map<String, dynamic>> operations;
  final int answer;
  final int currentOpIndex;
  final String userInput;
  final GamePhase phase;
  final int score;
  final bool isLoading;

  ArithmeticChainState({
    required this.startValue,
    required this.operations,
    required this.answer,
    this.currentOpIndex = -1, // -1 means showing startValue
    this.userInput = '',
    this.phase = GamePhase.initial,
    this.score = 0,
    this.isLoading = true,
  });

  ArithmeticChainState copyWith({
    int? startValue,
    List<Map<String, dynamic>>? operations,
    int? answer,
    int? currentOpIndex,
    String? userInput,
    GamePhase? phase,
    int? score,
    bool? isLoading,
  }) {
    return ArithmeticChainState(
      startValue: startValue ?? this.startValue,
      operations: operations ?? this.operations,
      answer: answer ?? this.answer,
      currentOpIndex: currentOpIndex ?? this.currentOpIndex,
      userInput: userInput ?? this.userInput,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class ArithmeticChainNotifier extends _$ArithmeticChainNotifier {
  final _engine = ArithmeticChainEngine();
  Timer? _sequenceTimer;

  @override
  ArithmeticChainState build() {
    return ArithmeticChainState(
      startValue: 0,
      operations: [],
      answer: 0,
    );
  }

  void initGame() {
    _sequenceTimer?.cancel();
    final puzzle = _engine.generateChain(length: 4 + (state.score ~/ 2));
    state = ArithmeticChainState(
      startValue: puzzle['start'],
      operations: puzzle['operations'],
      answer: puzzle['answer'],
      score: state.score,
      isLoading: false,
      phase: GamePhase.sequence,
    );
    _startSequence();
  }

  void _startSequence() {
    _sequenceTimer = Timer.periodic(const Duration(milliseconds: 1200), (timer) {
      if (state.currentOpIndex < state.operations.length - 1) {
        state = state.copyWith(currentOpIndex: state.currentOpIndex + 1);
      } else {
        timer.cancel();
        state = state.copyWith(phase: GamePhase.input);
      }
    });
  }

  void onNumberPressed(String val) {
    if (state.phase != GamePhase.input) return;
    state = state.copyWith(userInput: state.userInput + val);
  }

  void onBackspace() {
    if (state.userInput.isEmpty) return;
    state = state.copyWith(userInput: state.userInput.substring(0, state.userInput.length - 1));
  }

  void onSubmit() {
    if (state.userInput.isEmpty) return;
    final userAns = int.tryParse(state.userInput);
    if (userAns == state.answer) {
      state = state.copyWith(
        score: state.score + 1,
        phase: GamePhase.result,
      );
    } else {
      state = state.copyWith(phase: GamePhase.result);
    }
  }
}
