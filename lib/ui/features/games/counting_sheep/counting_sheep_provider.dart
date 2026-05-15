import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'counting_sheep_engine.dart';

part 'counting_sheep_provider.g.dart';

enum CountingSheepStatus { idle, playing, answering, success, failure }

class CountingSheepState {
  final List<Sheep> sheep;
  final CountingSheepStatus status;
  final int correctCount;
  final int? userCount;
  final Difficulty difficulty;

  CountingSheepState({
    required this.sheep,
    this.status = CountingSheepStatus.idle,
    this.correctCount = 0,
    this.userCount,
    this.difficulty = Difficulty.easy,
  });

  CountingSheepState copyWith({
    List<Sheep>? sheep,
    CountingSheepStatus? status,
    int? correctCount,
    int? userCount,
    Difficulty? difficulty,
  }) {
    return CountingSheepState(
      sheep: sheep ?? this.sheep,
      status: status ?? this.status,
      correctCount: correctCount ?? this.correctCount,
      userCount: userCount ?? this.userCount,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}

@riverpod
class CountingSheepNotifier extends _$CountingSheepNotifier {
  final _engine = CountingSheepEngine();
  Timer? _gameTimer;

  @override
  CountingSheepState build() {
    return CountingSheepState(sheep: []);
  }

  void startGame(Difficulty difficulty) {
    _gameTimer?.cancel();
    final sheep = _engine.generateSheep(difficulty);
    state = CountingSheepState(
      sheep: sheep,
      status: CountingSheepStatus.playing,
      correctCount: sheep.length,
      difficulty: difficulty,
    );

    double maxDuration = 0;
    for (final s in sheep) {
      if (s.totalTime > maxDuration) {
        maxDuration = s.totalTime;
      }
    }

    _gameTimer = Timer(Duration(milliseconds: (maxDuration * 1000).toInt() + 500), () {
      state = state.copyWith(status: CountingSheepStatus.answering);
    });
  }

  void submitCount(int count) {
    if (state.status != CountingSheepStatus.answering) return;
    
    final isCorrect = count == state.correctCount;
    state = state.copyWith(
      userCount: count,
      status: isCorrect ? CountingSheepStatus.success : CountingSheepStatus.failure,
    );
  }

  void reset() {
    _gameTimer?.cancel();
    state = CountingSheepState(sheep: []);
  }
}
