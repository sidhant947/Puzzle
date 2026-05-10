import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'go_no_go_engine.dart';

part 'go_no_go_provider.g.dart';

class GoNoGoState {
  final GoNoGoSymbol? currentSymbol;
  final int score;
  final bool isGameOver;
  final bool isLoading;
  final bool hasTapped;

  GoNoGoState({
    this.currentSymbol,
    this.score = 0,
    this.isGameOver = false,
    this.isLoading = true,
    this.hasTapped = false,
  });

  GoNoGoState copyWith({
    GoNoGoSymbol? currentSymbol,
    int? score,
    bool? isGameOver,
    bool? isLoading,
    bool? hasTapped,
    bool clearSymbol = false,
  }) {
    return GoNoGoState(
      currentSymbol: clearSymbol ? null : (currentSymbol ?? this.currentSymbol),
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      hasTapped: hasTapped ?? this.hasTapped,
    );
  }
}

@riverpod
class GoNoGoNotifier extends _$GoNoGoNotifier {
  final _engine = GoNoGoEngine();
  Timer? _gameTimer;

  @override
  GoNoGoState build() {
    ref.onDispose(() => _gameTimer?.cancel());
    return GoNoGoState();
  }

  void initGame() {
    state = GoNoGoState(isLoading: false);
    _nextRound();
  }

  void _nextRound() {
    _gameTimer?.cancel();
    
    // Show empty screen for a brief moment
    state = state.copyWith(clearSymbol: true, hasTapped: false);
    
    Future.delayed(const Duration(milliseconds: 500), () {
      if (state.isGameOver) return;
      
      final level = _engine.generateLevel(state.score);
      state = state.copyWith(currentSymbol: level.symbol);
      
      _gameTimer = Timer(level.duration, () {
        if (!state.hasTapped && state.currentSymbol == GoNoGoSymbol.go) {
          // Missed a Go
          state = state.copyWith(isGameOver: true);
        } else if (!state.hasTapped && state.currentSymbol == GoNoGoSymbol.noGo) {
          // Successfully ignored a No-Go
          state = state.copyWith(score: state.score + 1);
          _nextRound();
        }
      });
    });
  }

  void onTap() {
    if (state.isGameOver || state.hasTapped || state.currentSymbol == null) return;

    state = state.copyWith(hasTapped: true);
    
    if (state.currentSymbol == GoNoGoSymbol.go) {
      state = state.copyWith(score: state.score + 1);
      _nextRound();
    } else {
      // Tapped on a No-Go
      state = state.copyWith(isGameOver: true);
    }
  }

  void resetGame() {
    _gameTimer?.cancel();
    state = GoNoGoState(score: 0, isGameOver: false, isLoading: false);
    _nextRound();
  }
}
