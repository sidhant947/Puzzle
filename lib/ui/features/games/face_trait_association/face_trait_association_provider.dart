import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'face_trait_association_engine.dart';
import '../../../../providers/user_providers.dart';

part 'face_trait_association_provider.g.dart';

enum GamePhase { study, test, result }

class FaceTraitAssociationState {
  final List<FaceTrait> trials;
  final GamePhase phase;
  final int currentIndex;
  final int correctCount;
  final String? selectedOccupation;
  final String? selectedHobby;
  final List<String> occupationOptions;
  final List<String> hobbyOptions;

  FaceTraitAssociationState({
    required this.trials,
    this.phase = GamePhase.study,
    this.currentIndex = 0,
    this.correctCount = 0,
    this.selectedOccupation,
    this.selectedHobby,
    this.occupationOptions = const [],
    this.hobbyOptions = const [],
  });

  FaceTraitAssociationState copyWith({
    List<FaceTrait>? trials,
    GamePhase? phase,
    int? currentIndex,
    int? correctCount,
    String? selectedOccupation,
    String? selectedHobby,
    List<String>? occupationOptions,
    List<String>? hobbyOptions,
  }) {
    return FaceTraitAssociationState(
      trials: trials ?? this.trials,
      phase: phase ?? this.phase,
      currentIndex: currentIndex ?? this.currentIndex,
      correctCount: correctCount ?? this.correctCount,
      selectedOccupation: selectedOccupation ?? this.selectedOccupation,
      selectedHobby: selectedHobby ?? this.selectedHobby,
      occupationOptions: occupationOptions ?? this.occupationOptions,
      hobbyOptions: hobbyOptions ?? this.hobbyOptions,
    );
  }
}

@riverpod
class FaceTraitAssociationNotifier extends _$FaceTraitAssociationNotifier {
  final _engine = FaceTraitAssociationEngine();

  @override
  FaceTraitAssociationState build() {
    return _createGame();
  }

  FaceTraitAssociationState _createGame() {
    final trials = _engine.generateTrials();
    return FaceTraitAssociationState(
      trials: trials,
    );
  }

  void startTest() {
    _prepareCurrentTest();
  }

  void _prepareCurrentTest() {
    final current = state.trials[state.currentIndex];
    final allOccupations = state.trials.map((t) => t.occupation).toList();
    final allHobbies = state.trials.map((t) => t.hobby).toList();
    
    // Shuffle options
    allOccupations.shuffle();
    allHobbies.shuffle();

    state = state.copyWith(
      phase: GamePhase.test,
      occupationOptions: allOccupations,
      hobbyOptions: allHobbies,
      selectedOccupation: null,
      selectedHobby: null,
    );
  }

  void selectOccupation(String occupation) {
    state = state.copyWith(selectedOccupation: occupation);
  }

  void selectHobby(String hobby) {
    state = state.copyWith(selectedHobby: hobby);
  }

  void submitAnswer() {
    if (state.selectedOccupation == null || state.selectedHobby == null) return;

    final current = state.trials[state.currentIndex];
    final isCorrect = state.selectedOccupation == current.occupation && 
                      state.selectedHobby == current.hobby;

    if (state.currentIndex < state.trials.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        correctCount: state.correctCount + (isCorrect ? 1 : 0),
      );
      _prepareCurrentTest();
    } else {
      final totalCorrect = state.correctCount + (isCorrect ? 1 : 0);
      state = state.copyWith(
        phase: GamePhase.result,
        correctCount: totalCorrect,
      );
      if (totalCorrect == state.trials.length) {
        ref.read(gameStreakNotifierProvider.notifier).completeGame('face_trait_association', xpAmount: 50);
      }
    }
  }

  void reset() {
    state = _createGame();
  }
}
