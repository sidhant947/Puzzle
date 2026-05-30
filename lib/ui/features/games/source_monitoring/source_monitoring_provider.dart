import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'source_monitoring_engine.dart';

part 'source_monitoring_provider.g.dart';

enum SourceMonitoringPhase { memo, recall, complete }

class SourceMonitoringState {
  final SourceMonitoringLevel? currentLevel;
  final SourceMonitoringPhase phase;
  final int currentQuestionIndex;
  final int score;
  final bool isLoading;

  SourceMonitoringState({
    this.currentLevel,
    this.phase = SourceMonitoringPhase.memo,
    this.currentQuestionIndex = 0,
    this.score = 0,
    this.isLoading = true,
  });

  SourceMonitoringState copyWith({
    SourceMonitoringLevel? currentLevel,
    SourceMonitoringPhase? phase,
    int? currentQuestionIndex,
    int? score,
    bool? isLoading,
  }) {
    return SourceMonitoringState(
      currentLevel: currentLevel ?? this.currentLevel,
      phase: phase ?? this.phase,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SourceMonitoringNotifier extends _$SourceMonitoringNotifier {
  final _engine = SourceMonitoringEngine();

  @override
  SourceMonitoringState build() {
    return SourceMonitoringState();
  }

  void initGame() {
    state = SourceMonitoringState(
      currentLevel: _engine.generateLevel(),
      isLoading: false,
    );
  }

  void startRecall() {
    state = state.copyWith(phase: SourceMonitoringPhase.recall);
  }

  void submitAnswer(String sourceName) {
    if (state.currentLevel == null || state.phase != SourceMonitoringPhase.recall) return;

    final correctSource = state.currentLevel!.questions[state.currentQuestionIndex].sourceName;
    int nextScore = state.score;
    if (sourceName == correctSource) {
      nextScore++;
    }

    if (state.currentQuestionIndex < state.currentLevel!.questions.length - 1) {
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        score: nextScore,
      );
    } else {
      state = state.copyWith(
        score: nextScore,
        phase: SourceMonitoringPhase.complete,
      );
      ref.read(gameStreakNotifierProvider.notifier).completeGame('source_monitoring', xpAmount: 25);
    }
  }

  void reset() {
    initGame();
  }
}
