import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'letter_bridge_engine.dart';

part 'letter_bridge_provider.g.dart';

class LetterBridgeState {
  final String firstPart;
  final String secondPart;
  final String bridge;
  final String userLetter;
  final bool isGameOver;
  final bool isCorrect;

  LetterBridgeState({
    required this.firstPart,
    required this.secondPart,
    required this.bridge,
    this.userLetter = '',
    this.isGameOver = false,
    this.isCorrect = false,
  });

  LetterBridgeState copyWith({
    String? firstPart,
    String? secondPart,
    String? bridge,
    String? userLetter,
    bool? isGameOver,
    bool? isCorrect,
  }) {
    return LetterBridgeState(
      firstPart: firstPart ?? this.firstPart,
      secondPart: secondPart ?? this.secondPart,
      bridge: bridge ?? this.bridge,
      userLetter: userLetter ?? this.userLetter,
      isGameOver: isGameOver ?? this.isGameOver,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

@riverpod
class LetterBridgeNotifier extends _$LetterBridgeNotifier {
  final _engine = LetterBridgeEngine();

  @override
  LetterBridgeState build() {
    final puzzle = _engine.getRandomPuzzle();
    return LetterBridgeState(
      firstPart: puzzle['first']!,
      secondPart: puzzle['second']!,
      bridge: puzzle['bridge']!,
    );
  }

  void setLetter(String letter) {
    if (state.isGameOver) return;
    state = state.copyWith(userLetter: letter.toUpperCase());
    
    if (state.userLetter.length == 1) {
      checkAnswer();
    }
  }

  void checkAnswer() {
    final isCorrect = _engine.isCorrect(state.bridge, state.userLetter);
    state = state.copyWith(
      isGameOver: true,
      isCorrect: isCorrect,
    );
  }

  void reset() {
    final puzzle = _engine.getRandomPuzzle();
    state = LetterBridgeState(
      firstPart: puzzle['first']!,
      secondPart: puzzle['second']!,
      bridge: puzzle['bridge']!,
    );
  }
}
