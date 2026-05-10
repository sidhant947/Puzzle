import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'divided_attention_engine.dart';

part 'divided_attention_provider.g.dart';

class DividedAttentionState {
  final DividedAttentionItem? leftItem;
  final DividedAttentionItem? rightItem;
  final int score;
  final bool isGameOver;
  final bool isLoading;

  DividedAttentionState({
    this.leftItem,
    this.rightItem,
    this.score = 0,
    this.isGameOver = false,
    this.isLoading = true,
  });

  DividedAttentionState copyWith({
    DividedAttentionItem? leftItem,
    DividedAttentionItem? rightItem,
    int? score,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return DividedAttentionState(
      leftItem: leftItem ?? this.leftItem,
      rightItem: rightItem ?? this.rightItem,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class DividedAttentionNotifier extends _$DividedAttentionNotifier {
  final _engine = DividedAttentionEngine();
  Timer? _leftTimer;
  Timer? _rightTimer;

  @override
  DividedAttentionState build() {
    ref.onDispose(() {
      _leftTimer?.cancel();
      _rightTimer?.cancel();
    });
    return DividedAttentionState();
  }

  void initGame() {
    state = DividedAttentionState(isLoading: false);
    _startLeftStream();
    _startRightStream();
  }

  void _startLeftStream() {
    _leftTimer?.cancel();
    _leftTimer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (state.isGameOver) {
        timer.cancel();
        return;
      }
      
      // If previous item was a target and wasn't tapped, game over
      if (state.leftItem?.isTarget ?? false) {
        state = state.copyWith(isGameOver: true);
        return;
      }

      state = state.copyWith(leftItem: _engine.generateItem(true));
    });
  }

  void _startRightStream() {
    _rightTimer?.cancel();
    _rightTimer = Timer.periodic(const Duration(milliseconds: 1800), (timer) {
      if (state.isGameOver) {
        timer.cancel();
        return;
      }

      // If previous item was a target and wasn't tapped, game over
      if (state.rightItem?.isTarget ?? false) {
        state = state.copyWith(isGameOver: true);
        return;
      }

      state = state.copyWith(rightItem: _engine.generateItem(false));
    });
  }

  void onTapLeft() {
    if (state.isGameOver || state.leftItem == null) return;

    if (state.leftItem!.isTarget) {
      state = state.copyWith(
        score: state.score + 1,
        leftItem: _engine.generateItem(true), // Immediate next item
      );
      _startLeftStream(); // Reset timer
    } else {
      state = state.copyWith(isGameOver: true);
    }
  }

  void onTapRight() {
    if (state.isGameOver || state.rightItem == null) return;

    if (state.rightItem!.isTarget) {
      state = state.copyWith(
        score: state.score + 1,
        rightItem: _engine.generateItem(false), // Immediate next item
      );
      _startRightStream(); // Reset timer
    } else {
      state = state.copyWith(isGameOver: true);
    }
  }

  void resetGame() {
    state = DividedAttentionState(score: 0, isGameOver: false, isLoading: false);
    initGame();
  }
}
