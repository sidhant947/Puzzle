import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'spatial_conflict_engine.dart';
import '../../../../providers/user_providers.dart';

part 'spatial_conflict_provider.g.dart';

class SpatialConflictState {
  final List<ConflictTrial> trials;
  final int currentTrialIndex;
  final bool isCompleted;
  final int score;
  final int errors;
  final int trialStartTime;

  SpatialConflictState({
    required this.trials,
    required this.currentTrialIndex,
    required this.isCompleted,
    required this.score,
    required this.errors,
    required this.trialStartTime,
  });

  ConflictTrial? get currentTrial {
    if (currentTrialIndex >= trials.length) return null;
    return trials[currentTrialIndex];
  }

  SpatialConflictState copyWith({
    List<ConflictTrial>? trials,
    int? currentTrialIndex,
    bool? isCompleted,
    int? score,
    int? errors,
    int? trialStartTime,
  }) {
    return SpatialConflictState(
      trials: trials ?? this.trials,
      currentTrialIndex: currentTrialIndex ?? this.currentTrialIndex,
      isCompleted: isCompleted ?? this.isCompleted,
      score: score ?? this.score,
      errors: errors ?? this.errors,
      trialStartTime: trialStartTime ?? this.trialStartTime,
    );
  }
}

@riverpod
class SpatialConflictNotifier extends _$SpatialConflictNotifier {
  final SpatialConflictEngine _engine = SpatialConflictEngine();

  @override
  SpatialConflictState build() {
    final trials = _engine.generateTrials();
    return SpatialConflictState(
      trials: trials,
      currentTrialIndex: 0,
      isCompleted: false,
      score: 0,
      errors: 0,
      trialStartTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  void submitAnswer(Direction direction) {
    if (state.isCompleted) return;

    final currentTrial = state.currentTrial;
    if (currentTrial == null) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    final elapsedMs = now - state.trialStartTime;
    final isCorrect = direction == currentTrial.word;

    int scoreChange = 0;
    int errorChange = 0;

    if (isCorrect) {
      // Speed bonus
      final speedBonus = (1000 - elapsedMs).clamp(0, 500) ~/ 5;
      scoreChange = 100 + speedBonus;
    } else {
      scoreChange = -50;
      errorChange = 1;
    }

    final nextIndex = state.currentTrialIndex + 1;
    if (nextIndex >= state.trials.length) {
      state = state.copyWith(
        currentTrialIndex: nextIndex,
        isCompleted: true,
        score: (state.score + scoreChange).clamp(0, 9999),
        errors: state.errors + errorChange,
      );
      ref.read(gameStreakNotifierProvider.notifier).completeGame('spatial_conflict', xpAmount: 25);
    } else {
      state = state.copyWith(
        currentTrialIndex: nextIndex,
        score: (state.score + scoreChange).clamp(0, 9999),
        errors: state.errors + errorChange,
        trialStartTime: DateTime.now().millisecondsSinceEpoch,
      );
    }
  }

  void reset() {
    final trials = _engine.generateTrials();
    state = SpatialConflictState(
      trials: trials,
      currentTrialIndex: 0,
      isCompleted: false,
      score: 0,
      errors: 0,
      trialStartTime: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
