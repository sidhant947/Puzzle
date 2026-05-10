import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'rhythm_master_engine.dart';

part 'rhythm_master_provider.g.dart';

class RhythmMasterState {
  final int score;
  final int totalBeats;
  final int perfectHits;
  final String lastAccuracyLabel;
  final bool isGameOver;
  final bool isLoading;
  final int bpm;
  final double currentPulse; // 0.0 to 1.0

  RhythmMasterState({
    this.score = 0,
    this.totalBeats = 0,
    this.perfectHits = 0,
    this.lastAccuracyLabel = '',
    this.isGameOver = false,
    this.isLoading = true,
    this.bpm = 60,
    this.currentPulse = 0,
  });

  RhythmMasterState copyWith({
    int? score,
    int? totalBeats,
    int? perfectHits,
    String? lastAccuracyLabel,
    bool? isGameOver,
    bool? isLoading,
    int? bpm,
    double? currentPulse,
  }) {
    return RhythmMasterState(
      score: score ?? this.score,
      totalBeats: totalBeats ?? this.totalBeats,
      perfectHits: perfectHits ?? this.perfectHits,
      lastAccuracyLabel: lastAccuracyLabel ?? this.lastAccuracyLabel,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      bpm: bpm ?? this.bpm,
      currentPulse: currentPulse ?? this.currentPulse,
    );
  }
}

@riverpod
class RhythmMasterNotifier extends _$RhythmMasterNotifier {
  final _engine = RhythmMasterEngine();
  final int _maxBeats = 20;

  @override
  RhythmMasterState build() {
    return RhythmMasterState();
  }

  void initGame() {
    state = RhythmMasterState(isLoading: false, bpm: 60);
  }

  void onBeat(double progress) {
    if (state.isGameOver) return;
    state = state.copyWith(currentPulse: progress);
  }

  void onTap(int timeDiffMs) {
    if (state.isGameOver) return;

    final accuracy = _engine.calculateAccuracy(timeDiffMs, (60000 / state.bpm).toInt());
    final label = _engine.getAccuracyLabel(accuracy);
    
    final newBeats = state.totalBeats + 1;
    final newScore = state.score + accuracy;
    final newPerfect = accuracy == 100 ? state.perfectHits + 1 : state.perfectHits;

    state = state.copyWith(
      totalBeats: newBeats,
      score: newScore,
      perfectHits: newPerfect,
      lastAccuracyLabel: label,
      isGameOver: newBeats >= _maxBeats,
      bpm: 60 + (newBeats * 2), // Speed up!
    );
  }
}
