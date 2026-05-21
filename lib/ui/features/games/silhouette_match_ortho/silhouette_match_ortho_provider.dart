import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'silhouette_match_ortho_engine.dart';
import '../../../../providers/user_providers.dart';

part 'silhouette_match_ortho_provider.g.dart';

class SilhouetteMatchOrthoState {
  final List<List<List<bool>>> grid3D;
  final PerspectiveType targetView;
  final List<List<List<bool>>> options;
  final int correctOptionIndex;
  final int? selectedIndex;
  final double yaw;
  final double pitch;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  SilhouetteMatchOrthoState({
    required this.grid3D,
    required this.targetView,
    required this.options,
    required this.correctOptionIndex,
    this.selectedIndex,
    required this.yaw,
    required this.pitch,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  SilhouetteMatchOrthoState copyWith({
    List<List<List<bool>>>? grid3D,
    PerspectiveType? targetView,
    List<List<List<bool>>>? options,
    int? correctOptionIndex,
    int? selectedIndex,
    double? yaw,
    double? pitch,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return SilhouetteMatchOrthoState(
      grid3D: grid3D ?? this.grid3D,
      targetView: targetView ?? this.targetView,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      yaw: yaw ?? this.yaw,
      pitch: pitch ?? this.pitch,
      isVictory: isVictory ?? this.isVictory,
      isFailed: isFailed ?? this.isFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SilhouetteMatchOrthoNotifier extends _$SilhouetteMatchOrthoNotifier {
  final _engine = SilhouetteMatchOrthoEngine();

  @override
  SilhouetteMatchOrthoState build() {
    return SilhouetteMatchOrthoState(
      grid3D: [],
      targetView: PerspectiveType.front,
      options: [],
      correctOptionIndex: -1,
      yaw: 0.785,  // 45 degrees initial yaw
      pitch: 0.615, // 35 degrees initial pitch
      isLoading: true,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = SilhouetteMatchOrthoState(
      grid3D: level.grid3D,
      targetView: level.targetView,
      options: level.options,
      correctOptionIndex: level.correctOptionIndex,
      selectedIndex: null,
      yaw: 0.785,
      pitch: 0.615,
      isVictory: false,
      isFailed: false,
      isLoading: false,
    );
  }

  void updateRotation(double deltaYaw, double deltaPitch) {
    if (state.isVictory || state.isLoading) return;
    
    // Clamp pitch to avoid turning completely upside down
    double newPitch = (state.pitch + deltaPitch).clamp(0.2, 1.4);
    double newYaw = state.yaw + deltaYaw;
    
    state = state.copyWith(yaw: newYaw, pitch: newPitch);
  }

  void selectOption(int index) {
    if (state.isVictory || state.isFailed) return;
    state = state.copyWith(selectedIndex: index);
  }

  bool checkAnswer() {
    if (state.isVictory || state.isFailed || state.selectedIndex == null) return false;
    
    if (state.selectedIndex == state.correctOptionIndex) {
      state = state.copyWith(isVictory: true);
      ref.read(gameStreakNotifierProvider.notifier).completeGame('silhouette_match_ortho', xpAmount: 25);
      return true;
    } else {
      state = state.copyWith(isFailed: true);
      return false;
    }
  }

  void reset() {
    initGame();
  }
}
