import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'face_name_association_engine.dart';

part 'face_name_association_provider.g.dart';

enum FaceNamePhase { study, testing, result }

class FaceNameState {
  final List<FaceData> studyFaces;
  final int currentTestIndex;
  final List<String> currentOptions;
  final FaceNamePhase phase;
  final int correctCount;
  final bool isLoading;
  final int score;

  FaceNameState({
    required this.studyFaces,
    this.currentTestIndex = 0,
    this.currentOptions = const [],
    this.phase = FaceNamePhase.study,
    this.correctCount = 0,
    this.isLoading = true,
    this.score = 0,
  });

  FaceNameState copyWith({
    List<FaceData>? studyFaces,
    int? currentTestIndex,
    List<String>? currentOptions,
    FaceNamePhase? phase,
    int? correctCount,
    bool? isLoading,
    int? score,
  }) {
    return FaceNameState(
      studyFaces: studyFaces ?? this.studyFaces,
      currentTestIndex: currentTestIndex ?? this.currentTestIndex,
      currentOptions: currentOptions ?? this.currentOptions,
      phase: phase ?? this.phase,
      correctCount: correctCount ?? this.correctCount,
      isLoading: isLoading ?? this.isLoading,
      score: score ?? this.score,
    );
  }
}

@riverpod
class FaceNameAssociationNotifier extends _$FaceNameAssociationNotifier {
  final _engine = FaceNameAssociationEngine();

  @override
  FaceNameState build() {
    return FaceNameState(studyFaces: []);
  }

  void initGame() {
    final count = 4 + (state.score ~/ 3);
    final faces = _engine.generateFaces(count);
    state = FaceNameState(
      studyFaces: faces,
      score: state.score,
      isLoading: false,
      phase: FaceNamePhase.study,
    );
  }

  void startTesting() {
    final firstFace = state.studyFaces[0];
    final options = _engine.generateOptions(
      firstFace.name,
      state.studyFaces.map((f) => f.name).toList(),
      4,
    );
    state = state.copyWith(
      phase: FaceNamePhase.testing,
      currentTestIndex: 0,
      currentOptions: options,
    );
  }

  void onOptionSelected(String name) {
    if (state.phase != FaceNamePhase.testing) return;

    final isCorrect = name == state.studyFaces[state.currentTestIndex].name;
    final newCorrectCount = isCorrect ? state.correctCount + 1 : state.correctCount;

    if (state.currentTestIndex < state.studyFaces.length - 1) {
      final nextIndex = state.currentTestIndex + 1;
      final nextFace = state.studyFaces[nextIndex];
      final options = _engine.generateOptions(
        nextFace.name,
        state.studyFaces.map((f) => f.name).toList(),
        4,
      );
      state = state.copyWith(
        currentTestIndex: nextIndex,
        currentOptions: options,
        correctCount: newCorrectCount,
      );
    } else {
      // Game Over
      final allCorrect = newCorrectCount == state.studyFaces.length;
      state = state.copyWith(
        phase: FaceNamePhase.result,
        correctCount: newCorrectCount,
        score: allCorrect ? state.score + 1 : state.score,
      );
    }
  }
}
