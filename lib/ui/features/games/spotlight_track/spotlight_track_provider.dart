import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'spotlight_track_engine.dart';
import '../../../../providers/user_providers.dart';

part 'spotlight_track_provider.g.dart';

enum SpotlightTrackStatus {
  idle,
  tracking,
  answering,
  successFeedback,
  failFeedback;
}

class SpotlightTrackState {
  final TrackingLevel level;
  final SpotlightTrackStatus status;
  final int currentRound;
  final int totalRounds;
  final int score;
  final int errors;
  final bool isCompleted;
  final Point2D? tapPosition;

  SpotlightTrackState({
    required this.level,
    required this.status,
    required this.currentRound,
    required this.totalRounds,
    required this.score,
    required this.errors,
    required this.isCompleted,
    this.tapPosition,
  });

  SpotlightTrackState copyWith({
    TrackingLevel? level,
    SpotlightTrackStatus? status,
    int? currentRound,
    int? totalRounds,
    int? score,
    int? errors,
    bool? isCompleted,
    Point2D? tapPosition,
  }) {
    return SpotlightTrackState(
      level: level ?? this.level,
      status: status ?? this.status,
      currentRound: currentRound ?? this.currentRound,
      totalRounds: totalRounds ?? this.totalRounds,
      score: score ?? this.score,
      errors: errors ?? this.errors,
      isCompleted: isCompleted ?? this.isCompleted,
      tapPosition: tapPosition ?? this.tapPosition,
    );
  }
}

@riverpod
class SpotlightTrackNotifier extends _$SpotlightTrackNotifier {
  final SpotlightTrackEngine _engine = SpotlightTrackEngine();

  @override
  SpotlightTrackState build() {
    return SpotlightTrackState(
      level: _engine.generateLevel(1),
      status: SpotlightTrackStatus.idle,
      currentRound: 1,
      totalRounds: 3,
      score: 0,
      errors: 0,
      isCompleted: false,
    );
  }

  void startTracking() {
    state = state.copyWith(
      status: SpotlightTrackStatus.tracking,
      tapPosition: null,
    );
  }

  void finishTracking() {
    if (state.status == SpotlightTrackStatus.tracking) {
      state = state.copyWith(status: SpotlightTrackStatus.answering);
    }
  }

  void submitTap(Point2D tapPos) {
    if (state.status != SpotlightTrackStatus.answering) return;

    final isCorrect = _engine.isCorrectTap(tapPos, state.level.finalPosition);

    if (isCorrect) {
      state = state.copyWith(
        status: SpotlightTrackStatus.successFeedback,
        tapPosition: tapPos,
        score: state.score + 100,
      );

      Future.delayed(const Duration(milliseconds: 1800), () {
        final nextRound = state.currentRound + 1;
        if (nextRound > state.totalRounds) {
          state = state.copyWith(isCompleted: true);
          ref.read(gameStreakNotifierProvider.notifier).completeGame('spotlight_track', xpAmount: 25);
        } else {
          state = state.copyWith(
            currentRound: nextRound,
            level: _engine.generateLevel(nextRound),
            status: SpotlightTrackStatus.idle,
            tapPosition: null,
          );
        }
      });
    } else {
      state = state.copyWith(
        status: SpotlightTrackStatus.failFeedback,
        tapPosition: tapPos,
        errors: state.errors + 1,
        score: (state.score - 30).clamp(0, 9999),
      );

      Future.delayed(const Duration(milliseconds: 2200), () {
        // Regenerate current round level for retry
        state = state.copyWith(
          level: _engine.generateLevel(state.currentRound),
          status: SpotlightTrackStatus.idle,
          tapPosition: null,
        );
      });
    }
  }

  void reset() {
    state = SpotlightTrackState(
      level: _engine.generateLevel(1),
      status: SpotlightTrackStatus.idle,
      currentRound: 1,
      totalRounds: 3,
      score: 0,
      errors: 0,
      isCompleted: false,
    );
  }
}
