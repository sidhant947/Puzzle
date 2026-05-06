import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'schulte_table_engine.dart';

part 'schulte_table_provider.g.dart';

enum SchulteStatus { ready, playing, completed }

class SchulteTableState {
  final List<int> grid;
  final int nextNumber;
  final SchulteStatus status;
  final Duration elapsedTime;
  final Duration? bestTime;

  SchulteTableState({
    required this.grid,
    this.nextNumber = 1,
    this.status = SchulteStatus.ready,
    this.elapsedTime = Duration.zero,
    this.bestTime,
  });

  SchulteTableState copyWith({
    List<int>? grid,
    int? nextNumber,
    SchulteStatus? status,
    Duration? elapsedTime,
    Duration? bestTime,
  }) {
    return SchulteTableState(
      grid: grid ?? this.grid,
      nextNumber: nextNumber ?? this.nextNumber,
      status: status ?? this.status,
      elapsedTime: elapsedTime ?? this.elapsedTime,
      bestTime: bestTime ?? this.bestTime,
    );
  }
}

@riverpod
class SchulteTableNotifier extends _$SchulteTableNotifier {
  final _engine = SchulteTableEngine();
  Timer? _timer;
  DateTime? _startTime;

  @override
  SchulteTableState build() {
    return SchulteTableState(grid: _engine.generateGrid());
  }

  void startGame() {
    if (state.status == SchulteStatus.playing) return;
    
    _startTime = DateTime.now();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_startTime != null) {
        state = state.copyWith(
          elapsedTime: DateTime.now().difference(_startTime!),
        );
      }
    });

    state = state.copyWith(
      status: SchulteStatus.playing,
      nextNumber: 1,
      elapsedTime: Duration.zero,
    );
  }

  void tapNumber(int value) {
    if (state.status != SchulteStatus.playing) return;

    if (value == state.nextNumber) {
      if (value == 25) {
        _completeGame();
      } else {
        state = state.copyWith(nextNumber: state.nextNumber + 1);
      }
    }
  }

  void _completeGame() {
    _timer?.cancel();
    final finalTime = DateTime.now().difference(_startTime!);
    
    Duration? newBest = state.bestTime;
    if (newBest == null || finalTime < newBest) {
      newBest = finalTime;
    }

    state = state.copyWith(
      status: SchulteStatus.completed,
      elapsedTime: finalTime,
      bestTime: newBest,
    );

    ref.read(gameStreakNotifierProvider.notifier).completeGame('schulte_table', xpAmount: 25);
  }

  void reset() {
    _timer?.cancel();
    state = SchulteTableState(
      grid: _engine.generateGrid(),
      bestTime: state.bestTime,
    );
  }
}
