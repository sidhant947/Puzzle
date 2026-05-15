import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'mental_calendar_engine.dart';

part 'mental_calendar_provider.g.dart';

enum MentalCalendarPhase { playing, result }

class MentalCalendarState {
  final DateTime currentDate;
  final MentalCalendarPhase phase;
  final int correctCount;
  final int totalTrials;
  final bool? lastResult;
  final Difficulty difficulty;

  MentalCalendarState({
    required this.currentDate,
    this.phase = MentalCalendarPhase.playing,
    this.correctCount = 0,
    this.totalTrials = 0,
    this.lastResult,
    this.difficulty = Difficulty.easy,
  });

  MentalCalendarState copyWith({
    DateTime? currentDate,
    MentalCalendarPhase? phase,
    int? correctCount,
    int? totalTrials,
    bool? lastResult,
    Difficulty? difficulty,
  }) {
    return MentalCalendarState(
      currentDate: currentDate ?? this.currentDate,
      phase: phase ?? this.phase,
      correctCount: correctCount ?? this.correctCount,
      totalTrials: totalTrials ?? this.totalTrials,
      lastResult: lastResult,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}

@riverpod
class MentalCalendarNotifier extends _$MentalCalendarNotifier {
  final _engine = MentalCalendarEngine();

  @override
  MentalCalendarState build() {
    return MentalCalendarState(
      currentDate: _engine.generateRandomDate(difficulty: Difficulty.easy),
    );
  }

  void submitAnswer(int dayOfWeek) {
    if (state.phase == MentalCalendarPhase.result) return;

    final isCorrect = dayOfWeek == state.currentDate.weekday;
    
    if (isCorrect) {
      final newCorrectCount = state.correctCount + 1;
      final newTotalTrials = state.totalTrials + 1;

      if (newTotalTrials >= 10) {
        state = state.copyWith(
          phase: MentalCalendarPhase.result,
          correctCount: newCorrectCount,
          totalTrials: newTotalTrials,
          lastResult: true,
        );
      } else {
        Difficulty nextDifficulty = Difficulty.easy;
        if (newTotalTrials >= 6) {
          nextDifficulty = Difficulty.hard;
        } else if (newTotalTrials >= 3) {
          nextDifficulty = Difficulty.medium;
        }

        state = state.copyWith(
          currentDate: _engine.generateRandomDate(difficulty: nextDifficulty),
          correctCount: newCorrectCount,
          totalTrials: newTotalTrials,
          lastResult: true,
          difficulty: nextDifficulty,
        );
      }
    } else {
      state = state.copyWith(
        lastResult: false,
      );
    }
  }

  void startGame(Difficulty difficulty) {
    state = MentalCalendarState(
      currentDate: _engine.generateRandomDate(difficulty: difficulty),
      difficulty: difficulty,
    );
  }

  void resetGame() {
    startGame(Difficulty.easy);
  }
}
