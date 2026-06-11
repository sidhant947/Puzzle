import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'negative_space_detection_engine.dart';

part 'negative_space_detection_provider.g.dart';

class NegativeSpaceDetectionState {
  final NegativeSpaceShape? target;
  final List<NegativeSpaceShape> options;
  final int correctIndex;
  final int? selectedIndex;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  NegativeSpaceDetectionState({
    this.target,
    this.options = const [],
    this.correctIndex = 0,
    this.selectedIndex,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  NegativeSpaceDetectionState copyWith({
    NegativeSpaceShape? target,
    List<NegativeSpaceShape>? options,
    int? correctIndex,
    int? selectedIndex,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return NegativeSpaceDetectionState(
      target: target ?? this.target,
      options: options ?? this.options,
      correctIndex: correctIndex ?? this.correctIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isVictory: isVictory ?? this.isVictory,
      isFailed: isFailed ?? this.isFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class NegativeSpaceDetectionNotifier extends _$NegativeSpaceDetectionNotifier {
  final _engine = NegativeSpaceDetectionEngine();

  @override
  NegativeSpaceDetectionState build() {
    return NegativeSpaceDetectionState();
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = NegativeSpaceDetectionState(
      target: level.target,
      options: level.options,
      correctIndex: level.correctIndex,
      isLoading: false,
    );
  }

  void selectOption(int index) {
    if (state.isVictory || state.isFailed) return;
    
    final isCorrect = index == state.correctIndex;
    state = state.copyWith(
      selectedIndex: index,
      isVictory: isCorrect,
      isFailed: !isCorrect,
    );
  }
}
