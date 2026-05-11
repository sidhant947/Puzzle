import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'digit_span_reverse_engine.dart';

part 'digit_span_reverse_provider.g.dart';

enum DigitSpanPhase { sequence, input, result }

class DigitSpanState {
  final List<int> sequence;
  final int currentDigitIndex;
  final List<int> userInput;
  final DigitSpanPhase phase;
  final int score;
  final bool isLoading;

  DigitSpanState({
    required this.sequence,
    this.currentDigitIndex = -1,
    this.userInput = const [],
    this.phase = DigitSpanPhase.sequence,
    this.score = 0,
    this.isLoading = true,
  });

  DigitSpanState copyWith({
    List<int>? sequence,
    int? currentDigitIndex,
    List<int>? userInput,
    DigitSpanPhase? phase,
    int? score,
    bool? isLoading,
  }) {
    return DigitSpanState(
      sequence: sequence ?? this.sequence,
      currentDigitIndex: currentDigitIndex ?? this.currentDigitIndex,
      userInput: userInput ?? this.userInput,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class DigitSpanReverseNotifier extends _$DigitSpanReverseNotifier {
  final _engine = DigitSpanReverseEngine();
  Timer? _timer;

  @override
  DigitSpanState build() {
    return DigitSpanState(sequence: []);
  }

  void initGame() {
    _timer?.cancel();
    // Start at length 4 and increase every score
    final sequence = _engine.generateSequence(length: 4 + state.score);
    state = DigitSpanState(
      sequence: sequence,
      score: state.score,
      isLoading: false,
    );
    _startSequence();
  }

  void _startSequence() {
    // Faster presentation: 900ms instead of 1200ms
    _timer = Timer.periodic(const Duration(milliseconds: 900), (timer) {
      if (state.currentDigitIndex < state.sequence.length - 1) {
        state = state.copyWith(currentDigitIndex: state.currentDigitIndex + 1);
      } else {
        timer.cancel();
        // Slightly faster transition to input phase
        Future.delayed(const Duration(milliseconds: 800), () {
          if (state.phase == DigitSpanPhase.sequence) {
            state = state.copyWith(phase: DigitSpanPhase.input);
          }
        });
      }
    });
  }

  void onDigitPressed(int digit) {
    if (state.phase != DigitSpanPhase.input) return;
    if (state.userInput.length >= state.sequence.length) return;
    
    state = state.copyWith(userInput: [...state.userInput, digit]);
    
    if (state.userInput.length == state.sequence.length) {
      _checkResult();
    }
  }

  void onBackspace() {
    if (state.phase != DigitSpanPhase.input || state.userInput.isEmpty) return;
    state = state.copyWith(
      userInput: state.userInput.sublist(0, state.userInput.length - 1),
    );
  }

  void _checkResult() {
    final isCorrect = _engine.validate(state.sequence, state.userInput);
    if (isCorrect) {
      state = state.copyWith(
        score: state.score + 1,
        phase: DigitSpanPhase.result,
      );
    } else {
      state = state.copyWith(phase: DigitSpanPhase.result);
    }
  }
}
