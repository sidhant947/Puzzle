import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'letter_frequency_scan_engine.dart';

part 'letter_frequency_scan_provider.g.dart';

class LetterFrequencyScanState {
  final String paragraph;
  final String targetLetter;
  final int targetCount;
  final int userCount;
  final bool isGameOver;
  final bool isCorrect;

  LetterFrequencyScanState({
    required this.paragraph,
    required this.targetLetter,
    required this.targetCount,
    this.userCount = 0,
    this.isGameOver = false,
    this.isCorrect = false,
  });

  LetterFrequencyScanState copyWith({
    String? paragraph,
    String? targetLetter,
    int? targetCount,
    int? userCount,
    bool? isGameOver,
    bool? isCorrect,
  }) {
    return LetterFrequencyScanState(
      paragraph: paragraph ?? this.paragraph,
      targetLetter: targetLetter ?? this.targetLetter,
      targetCount: targetCount ?? this.targetCount,
      userCount: userCount ?? this.userCount,
      isGameOver: isGameOver ?? this.isGameOver,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

@riverpod
class LetterFrequencyScanNotifier extends _$LetterFrequencyScanNotifier {
  final _engine = LetterFrequencyScanEngine();

  @override
  LetterFrequencyScanState build() {
    final puzzle = _engine.getRandomPuzzle();
    return LetterFrequencyScanState(
      paragraph: puzzle['paragraph'],
      targetLetter: puzzle['targetLetter'],
      targetCount: puzzle['count'],
    );
  }

  void setUserCount(int count) {
    if (state.isGameOver) return;
    state = state.copyWith(userCount: count);
  }

  void submit() {
    if (state.isGameOver) return;
    final isCorrect = _engine.isCorrect(state.targetCount, state.userCount);
    state = state.copyWith(isGameOver: true, isCorrect: isCorrect);
  }

  void reset() {
    final puzzle = _engine.getRandomPuzzle();
    state = LetterFrequencyScanState(
      paragraph: puzzle['paragraph'],
      targetLetter: puzzle['targetLetter'],
      targetCount: puzzle['count'],
    );
  }
}
