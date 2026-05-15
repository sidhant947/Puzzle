import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'mental_mapping_engine.dart';

part 'mental_mapping_provider.g.dart';

enum MentalMappingStatus { memorizing, playing, success, failure }

class MentalMappingState {
  final int gridSize;
  final int startRow;
  final int startCol;
  final List<Direction> sequence;
  final int targetRow;
  final int targetCol;
  final int? selectedRow;
  final int? selectedCol;
  final MentalMappingStatus status;

  MentalMappingState({
    required this.gridSize,
    required this.startRow,
    required this.startCol,
    required this.sequence,
    required this.targetRow,
    required this.targetCol,
    this.selectedRow,
    this.selectedCol,
    required this.status,
  });

  MentalMappingState copyWith({
    int? selectedRow,
    int? selectedCol,
    MentalMappingStatus? status,
  }) {
    return MentalMappingState(
      gridSize: gridSize,
      startRow: startRow,
      startCol: startCol,
      sequence: sequence,
      targetRow: targetRow,
      targetCol: targetCol,
      selectedRow: selectedRow ?? this.selectedRow,
      selectedCol: selectedCol ?? this.selectedCol,
      status: status ?? this.status,
    );
  }
}

@riverpod
class MentalMappingNotifier extends _$MentalMappingNotifier {
  @override
  MentalMappingState build() {
    return _createGame();
  }

  MentalMappingState _createGame() {
    final random = Random();
    // Medium difficulty: gridSize 4, steps 5 or 6
    const int gridSize = 4;
    final int steps = 5 + random.nextInt(2);

    final engine = MentalMappingEngine(gridSize: gridSize, steps: steps);
    final level = engine.generateLevel();

    return MentalMappingState(
      gridSize: level['gridSize'],
      startRow: level['startRow'],
      startCol: level['startCol'],
      sequence: level['sequence'],
      targetRow: level['targetRow'],
      targetCol: level['targetCol'],
      status: MentalMappingStatus.memorizing,
    );
  }

  void startGame() {
    state = state.copyWith(status: MentalMappingStatus.playing);
  }

  void selectCell(int r, int c) {
    if (state.status != MentalMappingStatus.playing) return;

    final isCorrect = r == state.targetRow && c == state.targetCol;
    state = state.copyWith(
      selectedRow: r,
      selectedCol: c,
      status: isCorrect ? MentalMappingStatus.success : MentalMappingStatus.failure,
    );
  }

  void nextLevel() {
    state = _createGame();
  }
}
