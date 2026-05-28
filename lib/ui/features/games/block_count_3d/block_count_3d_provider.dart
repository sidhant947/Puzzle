import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'block_count_3d_engine.dart';
import '../../../../providers/user_providers.dart';

part 'block_count_3d_provider.g.dart';

class BlockCount3DState {
  final List<List<int>> grid;
  final int totalBlocks;
  final int? currentGuess;
  final double yaw;
  final double pitch;
  final bool isVictory;
  final bool isLoading;

  BlockCount3DState({
    required this.grid,
    required this.totalBlocks,
    this.currentGuess,
    required this.yaw,
    required this.pitch,
    this.isVictory = false,
    this.isLoading = true,
  });

  BlockCount3DState copyWith({
    List<List<int>>? grid,
    int? totalBlocks,
    Object? currentGuess = _sentinel,
    double? yaw,
    double? pitch,
    bool? isVictory,
    bool? isLoading,
  }) {
    return BlockCount3DState(
      grid: grid ?? this.grid,
      totalBlocks: totalBlocks ?? this.totalBlocks,
      currentGuess: currentGuess == _sentinel ? this.currentGuess : currentGuess as int?,
      yaw: yaw ?? this.yaw,
      pitch: pitch ?? this.pitch,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

const Object _sentinel = Object();

@riverpod
class BlockCount3DNotifier extends _$BlockCount3DNotifier {
  final _engine = BlockCount3DEngine();

  @override
  BlockCount3DState build() {
    return BlockCount3DState(
      grid: [],
      totalBlocks: 0,
      yaw: 0.785, // 45 degrees initial
      pitch: 0.615, // 35 degrees initial
      isLoading: true,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = BlockCount3DState(
      grid: level.grid,
      totalBlocks: level.totalBlocks,
      yaw: 0.785,
      pitch: 0.615,
      isLoading: false,
      isVictory: false,
    );
  }

  void updateRotation(double deltaYaw, double deltaPitch) {
    if (state.isVictory) return;
    
    // Clamp pitch to avoid turning completely upside down (e.g. 10 to 80 degrees)
    double newPitch = (state.pitch + deltaPitch).clamp(0.2, 1.4);
    double newYaw = state.yaw + deltaYaw;
    
    state = state.copyWith(yaw: newYaw, pitch: newPitch);
  }

  void setGuess(int? guess) {
    if (state.isVictory) return;
    state = state.copyWith(currentGuess: guess);
  }

  void checkAnswer() {
    if (state.isVictory || state.currentGuess == null) return;
    
    if (state.currentGuess == state.totalBlocks) {
      state = state.copyWith(isVictory: true);
      ref.read(gameStreakNotifierProvider.notifier).completeGame('block_count_3d', xpAmount: 25);
    }
  }

  void reset() {
    initGame();
  }
}
