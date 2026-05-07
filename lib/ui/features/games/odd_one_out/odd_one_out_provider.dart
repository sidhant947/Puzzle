import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'odd_one_out_engine.dart';

part 'odd_one_out_provider.g.dart';

class OddOneOutState {
  final OddOneOutLevel level;
  final int score;
  final int timeLeft; // in seconds
  final bool isGameOver;
  final bool isSolved;

  OddOneOutState({
    required this.level,
    this.score = 0,
    this.timeLeft = 30,
    this.isGameOver = false,
    this.isSolved = false,
  });

  OddOneOutState copyWith({
    OddOneOutLevel? level,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isSolved,
  }) {
    return OddOneOutState(
      level: level ?? this.level,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isSolved: isSolved ?? this.isSolved,
    );
  }
}

@riverpod
class OddOneOutNotifier extends _$OddOneOutNotifier {
  final _engine = OddOneOutEngine();
  static const int initialTime = 20;

  @override
  OddOneOutState build() {
    return OddOneOutState(
      level: _engine.generateLevel(0),
    );
  }

  void startGame() {
    state = OddOneOutState(
      level: _engine.generateLevel(0),
      timeLeft: initialTime,
    );
  }

  void tick() {
    if (state.isGameOver || state.isSolved) return;
    if (state.timeLeft <= 1) {
      state = state.copyWith(timeLeft: 0, isGameOver: true);
    } else {
      state = state.copyWith(timeLeft: state.timeLeft - 1);
    }
  }

  void pickTile(int index) {
    if (state.isGameOver || state.isSolved) return;

    if (index == state.level.oddOneIndex) {
      final newScore = state.score + 1;
      // Reduced bonus time for correct answer
      final newTime = state.timeLeft + 1;
      state = state.copyWith(
        score: newScore,
        timeLeft: newTime,
        level: _engine.generateLevel(newScore),
      );
      
      // Increased solved threshold
      if (newScore >= 50) {
        state = state.copyWith(isSolved: true);
      }
    } else {
      // Increased penalty for wrong answer
      state = state.copyWith(timeLeft: state.timeLeft - 4);
      if (state.timeLeft <= 0) {
        state = state.copyWith(timeLeft: 0, isGameOver: true);
      }
    }
  }

  void reset() {
    state = OddOneOutState(
      level: _engine.generateLevel(0),
    );
  }
}
