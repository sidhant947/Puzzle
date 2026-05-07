import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'simon_sequence_engine.dart';

part 'simon_sequence_provider.g.dart';

class SimonSequenceState {
  final List<int> sequence;
  final List<int> userSequence;
  final bool isShowingSequence;
  final bool isGameOver;
  final bool isGameWon;
  final int highlightedTile; // -1 if none

  SimonSequenceState({
    required this.sequence,
    this.userSequence = const [],
    this.isShowingSequence = true,
    this.isGameOver = false,
    this.isGameWon = false,
    this.highlightedTile = -1,
  });

  SimonSequenceState copyWith({
    List<int>? sequence,
    List<int>? userSequence,
    bool? isShowingSequence,
    bool? isGameOver,
    bool? isGameWon,
    int? highlightedTile,
  }) {
    return SimonSequenceState(
      sequence: sequence ?? this.sequence,
      userSequence: userSequence ?? this.userSequence,
      isShowingSequence: isShowingSequence ?? this.isShowingSequence,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      highlightedTile: highlightedTile ?? this.highlightedTile,
    );
  }
}

@riverpod
class SimonSequenceNotifier extends _$SimonSequenceNotifier {
  final _engine = SimonSequenceEngine();
  static const int fixedLength = 10;

  @override
  SimonSequenceState build() {
    return SimonSequenceState(sequence: _engine.generateFixedSequence(fixedLength));
  }

  Future<void> startSequence() async {
    state = state.copyWith(isShowingSequence: true, userSequence: [], highlightedTile: -1);
    await Future.delayed(const Duration(milliseconds: 1000));
    
    for (final tile in state.sequence) {
      if (state.isGameOver) return;
      state = state.copyWith(highlightedTile: tile);
      await Future.delayed(const Duration(milliseconds: 600));
      state = state.copyWith(highlightedTile: -1);
      await Future.delayed(const Duration(milliseconds: 200));
    }
    state = state.copyWith(isShowingSequence: false);
  }

  void tapTile(int index) {
    if (state.isShowingSequence || state.isGameOver || state.isGameWon) return;

    final newUserSequence = List<int>.from(state.userSequence)..add(index);
    if (state.sequence[state.userSequence.length] != index) {
      state = state.copyWith(isGameOver: true);
      return;
    }

    if (newUserSequence.length == state.sequence.length) {
      state = state.copyWith(userSequence: newUserSequence, isGameWon: true);
    } else {
      state = state.copyWith(userSequence: newUserSequence);
    }
  }

  void reset() {
    state = SimonSequenceState(sequence: _engine.generateFixedSequence(fixedLength));
    startSequence();
  }
}
