import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'shadow_pivot_engine.dart';
import '../../../../providers/user_providers.dart';

part 'shadow_pivot_provider.g.dart';

class ShadowPivotState {
  final List<List<List<bool>>> grid3D;
  final LightDirection lightDirection;
  final List<List<List<bool>>> options;
  final int correctOptionIndex;
  final int? selectedIndex;
  final double yaw;
  final double pitch;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  ShadowPivotState({
    required this.grid3D,
    required this.lightDirection,
    required this.options,
    required this.correctOptionIndex,
    this.selectedIndex,
    required this.yaw,
    required this.pitch,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  ShadowPivotState copyWith({
    List<List<List<bool>>>? grid3D,
    LightDirection? lightDirection,
    List<List<List<bool>>>? options,
    int? correctOptionIndex,
    int? selectedIndex,
    double? yaw,
    double? pitch,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return ShadowPivotState(
      grid3D: grid3D ?? this.grid3D,
      lightDirection: lightDirection ?? this.lightDirection,
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
class ShadowPivotNotifier extends _$ShadowPivotNotifier {
  final _engine = ShadowPivotEngine();

  @override
  ShadowPivotState build() {
    return ShadowPivotState(
      grid3D: [],
      lightDirection: LightDirection.front,
      options: [],
      correctOptionIndex: -1,
      yaw: 0.785,
      pitch: 0.615,
      isLoading: true,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = ShadowPivotState(
      grid3D: level.grid3D,
      lightDirection: level.lightDirection,
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
      ref.read(gameStreakNotifierProvider.notifier).completeGame('shadow_pivot', xpAmount: 25);
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
