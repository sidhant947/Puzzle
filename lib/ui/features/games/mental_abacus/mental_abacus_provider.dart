import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'mental_abacus_engine.dart';

part 'mental_abacus_provider.g.dart';

class AbacusRodState {
  final bool heavenDown; // true if the 5-bead is down (active if it's towards the bar)
  final int earthUpCount; // 0-4 beads up (active if they are towards the bar)

  AbacusRodState({this.heavenDown = false, this.earthUpCount = 0});

  int get value => (heavenDown ? 5 : 0) + earthUpCount;

  AbacusRodState copyWith({bool? heavenDown, int? earthUpCount}) {
    return AbacusRodState(
      heavenDown: heavenDown ?? this.heavenDown,
      earthUpCount: earthUpCount ?? this.earthUpCount,
    );
  }
}

class MentalAbacusState {
  final List<AbacusRodState> rods;
  final AbacusProblem? currentProblem;
  final int score;
  final int targetScore;
  final bool isVictory;
  final bool isLoading;

  MentalAbacusState({
    required this.rods,
    this.currentProblem,
    this.score = 0,
    this.targetScore = 5,
    this.isVictory = false,
    this.isLoading = true,
  });

  int get currentAbacusValue {
    int total = 0;
    int multiplier = 1;
    for (int i = rods.length - 1; i >= 0; i--) {
      total += rods[i].value * multiplier;
      multiplier *= 10;
    }
    return total;
  }

  MentalAbacusState copyWith({
    List<AbacusRodState>? rods,
    AbacusProblem? currentProblem,
    int? score,
    int? targetScore,
    bool? isVictory,
    bool? isLoading,
  }) {
    return MentalAbacusState(
      rods: rods ?? this.rods,
      currentProblem: currentProblem ?? this.currentProblem,
      score: score ?? this.score,
      targetScore: targetScore ?? this.targetScore,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class MentalAbacusNotifier extends _$MentalAbacusNotifier {
  final _engine = MentalAbacusEngine();

  @override
  MentalAbacusState build() {
    return MentalAbacusState(
      rods: List.generate(4, (_) => AbacusRodState()),
    );
  }

  void initGame() {
    state = MentalAbacusState(
      rods: List.generate(4, (_) => AbacusRodState()),
      currentProblem: _engine.generateProblem(),
      isLoading: false,
    );
  }

  void toggleHeaven(int rodIndex) {
    if (state.isVictory) return;
    final newRods = List<AbacusRodState>.from(state.rods);
    newRods[rodIndex] = newRods[rodIndex].copyWith(heavenDown: !newRods[rodIndex].heavenDown);
    state = state.copyWith(rods: newRods);
  }

  void setEarthCount(int rodIndex, int count) {
    if (state.isVictory) return;
    final newRods = List<AbacusRodState>.from(state.rods);
    newRods[rodIndex] = newRods[rodIndex].copyWith(earthUpCount: count);
    state = state.copyWith(rods: newRods);
  }

  void submit() {
    if (state.isVictory || state.currentProblem == null) return;

    if (state.currentAbacusValue == state.currentProblem!.result) {
      final newScore = state.score + 1;
      if (newScore >= state.targetScore) {
        state = state.copyWith(score: newScore, isVictory: true);
      } else {
        state = state.copyWith(
          score: newScore,
          currentProblem: _engine.generateProblem(),
          rods: List.generate(4, (_) => AbacusRodState()),
        );
      }
    }
  }
}
