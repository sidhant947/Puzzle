import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'silhouette_match_engine.dart';

part 'silhouette_match_provider.g.dart';

class SilhouetteMatchState {
  final List<ProjectedCube> target;
  final List<List<ProjectedCube>> options;
  final int correctIndex;
  final int? selectedIndex;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  SilhouetteMatchState({
    required this.target,
    required this.options,
    required this.correctIndex,
    this.selectedIndex,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  SilhouetteMatchState copyWith({
    List<ProjectedCube>? target,
    List<List<ProjectedCube>>? options,
    int? correctIndex,
    int? selectedIndex,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return SilhouetteMatchState(
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
class SilhouetteMatchNotifier extends _$SilhouetteMatchNotifier {
  final _engine = SilhouetteMatchEngine();

  @override
  SilhouetteMatchState build() {
    return SilhouetteMatchState(
      target: [],
      options: [],
      correctIndex: 0,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = SilhouetteMatchState(
      target: level['target'],
      options: level['options'],
      correctIndex: level['correctIndex'],
      isLoading: false,
    );
  }

  void selectOption(int index) {
    if (state.isVictory || state.isFailed) return;
    
    if (index == state.correctIndex) {
      state = state.copyWith(
        selectedIndex: index,
        isVictory: true,
      );
    } else {
      state = state.copyWith(
        selectedIndex: index,
        isFailed: true,
      );
    }
  }
}
