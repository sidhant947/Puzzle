import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'one_letter_shift_engine.dart';

part 'one_letter_shift_provider.g.dart';

class OneLetterShiftState {
  final String startWord;
  final String endWord;
  final String hint;
  final String userWord;
  final bool isGameOver;
  final bool isCorrect;

  OneLetterShiftState({
    required this.startWord,
    required this.endWord,
    required this.hint,
    this.userWord = '',
    this.isGameOver = false,
    this.isCorrect = false,
  });

  OneLetterShiftState copyWith({
    String? startWord,
    String? endWord,
    String? hint,
    String? userWord,
    bool? isGameOver,
    bool? isCorrect,
  }) {
    return OneLetterShiftState(
      startWord: startWord ?? this.startWord,
      endWord: endWord ?? this.endWord,
      hint: hint ?? this.hint,
      userWord: userWord ?? this.userWord,
      isGameOver: isGameOver ?? this.isGameOver,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

@riverpod
class OneLetterShiftNotifier extends _$OneLetterShiftNotifier {
  final _engine = OneLetterShiftEngine();

  @override
  OneLetterShiftState build() {
    final puzzle = _engine.getRandomPuzzle();
    return OneLetterShiftState(
      startWord: puzzle['start']!,
      endWord: puzzle['end']!,
      hint: puzzle['hint']!,
    );
  }

  void addLetter(String letter) {
    if (state.isGameOver) return;
    if (state.userWord.length < state.endWord.length) {
      state = state.copyWith(userWord: state.userWord + letter.toUpperCase());
    }
    
    if (state.userWord.length == state.endWord.length) {
      submit();
    }
  }

  void removeLetter() {
    if (state.isGameOver) return;
    if (state.userWord.isNotEmpty) {
      state = state.copyWith(userWord: state.userWord.substring(0, state.userWord.length - 1));
    }
  }

  void submit() {
    if (state.isGameOver) return;
    final isCorrect = _engine.isCorrect(state.endWord, state.userWord);
    state = state.copyWith(isGameOver: true, isCorrect: isCorrect);
  }

  void reset() {
    final puzzle = _engine.getRandomPuzzle();
    state = OneLetterShiftState(
      startWord: puzzle['start']!,
      endWord: puzzle['end']!,
      hint: puzzle['hint']!,
    );
  }
}
