import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'vigilance_task_engine.dart';

part 'vigilance_task_provider.g.dart';

enum VigilancePhase { initial, active, result }

class VigilanceState {
  final int currentPosition;
  final bool lastWasSkip;
  final VigilancePhase phase;
  final int hits;
  final int misses;
  final int falseAlarms;
  final int totalSteps;
  final bool hasRespondedToCurrentSkip;

  VigilanceState({
    this.currentPosition = 0,
    this.lastWasSkip = false,
    this.phase = VigilancePhase.initial,
    this.hits = 0,
    this.misses = 0,
    this.falseAlarms = 0,
    this.totalSteps = 0,
    this.hasRespondedToCurrentSkip = false,
  });

  VigilanceState copyWith({
    int? currentPosition,
    bool? lastWasSkip,
    VigilancePhase? phase,
    int? hits,
    int? misses,
    int? falseAlarms,
    int? totalSteps,
    bool? hasRespondedToCurrentSkip,
  }) {
    return VigilanceState(
      currentPosition: currentPosition ?? this.currentPosition,
      lastWasSkip: lastWasSkip ?? this.lastWasSkip,
      phase: phase ?? this.phase,
      hits: hits ?? this.hits,
      misses: misses ?? this.misses,
      falseAlarms: falseAlarms ?? this.falseAlarms,
      totalSteps: totalSteps ?? this.totalSteps,
      hasRespondedToCurrentSkip: hasRespondedToCurrentSkip ?? this.hasRespondedToCurrentSkip,
    );
  }
}

@riverpod
class VigilanceNotifier extends _$VigilanceNotifier {
  final _engine = VigilanceTaskEngine();
  Timer? _tickTimer;
  static const int maxSteps = 30;

  @override
  VigilanceState build() {
    return VigilanceState();
  }

  void startGame() {
    _tickTimer?.cancel();
    state = VigilanceState(phase: VigilancePhase.active);
    _startTicker();
  }

  void _startTicker() {
    _tickTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (state.totalSteps >= maxSteps) {
        _endGame();
        return;
      }

      // Before moving, if last was a skip and no response, it's a miss
      int newMisses = state.misses;
      if (state.lastWasSkip && !state.hasRespondedToCurrentSkip) {
        newMisses++;
      }

      final isSkip = _engine.shouldSkip();
      final nextPos = _engine.getNextPosition(state.currentPosition, isSkip);

      state = state.copyWith(
        currentPosition: nextPos,
        lastWasSkip: isSkip,
        totalSteps: state.totalSteps + 1,
        misses: newMisses,
        hasRespondedToCurrentSkip: false,
      );
    });
  }

  void onUserTap() {
    if (state.phase != VigilancePhase.active) return;

    if (state.lastWasSkip && !state.hasRespondedToCurrentSkip) {
      state = state.copyWith(
        hits: state.hits + 1,
        hasRespondedToCurrentSkip: true,
      );
    } else {
      state = state.copyWith(
        falseAlarms: state.falseAlarms + 1,
      );
    }
  }

  void _endGame() {
    _tickTimer?.cancel();
    state = state.copyWith(phase: VigilancePhase.result);
  }
}
