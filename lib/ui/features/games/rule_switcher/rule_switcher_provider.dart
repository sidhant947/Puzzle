import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'rule_switcher_engine.dart';

part 'rule_switcher_provider.g.dart';

class RuleSwitcherState {
  final SwitchRule rule;
  final int number;
  final String colorName;
  final int score;
  final int totalTrials;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool isTrialMode;
  final int targetTrials;

  RuleSwitcherState({
    this.rule = SwitchRule.number,
    this.number = 0,
    this.colorName = '',
    this.score = 0,
    this.totalTrials = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.isTrialMode = false,
    this.targetTrials = 20,
  });

  RuleSwitcherState copyWith({
    SwitchRule? rule,
    int? number,
    String? colorName,
    int? score,
    int? totalTrials,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? isTrialMode,
    int? targetTrials,
  }) {
    return RuleSwitcherState(
      rule: rule ?? this.rule,
      number: number ?? this.number,
      colorName: colorName ?? this.colorName,
      score: score ?? this.score,
      totalTrials: totalTrials ?? this.totalTrials,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      isTrialMode: isTrialMode ?? this.isTrialMode,
      targetTrials: targetTrials ?? this.targetTrials,
    );
  }
}

@riverpod
class RuleSwitcherNotifier extends _$RuleSwitcherNotifier {
  final _engine = RuleSwitcherEngine();
  Timer? _timer;

  @override
  RuleSwitcherState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return RuleSwitcherState();
  }

  void initGame() {
    _timer?.cancel();
    final isTrialMode = ref.read(userDataNotifierProvider).isTrialModeEnabled ?? false;
    
    _nextTrial(resetScore: true);
    state = state.copyWith(
      timeLeft: 60, 
      isGameOver: false, 
      isLoading: false,
      isTrialMode: isTrialMode,
    );
    
    if (!isTrialMode) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        state = state.copyWith(isGameOver: true);
      }
    });
  }

  void _nextTrial({bool resetScore = false}) {
    final trial = _engine.generateTrial();
    state = state.copyWith(
      rule: trial['rule'],
      number: trial['number'],
      colorName: trial['colorName'],
      score: resetScore ? 0 : state.score,
      totalTrials: resetScore ? 0 : state.totalTrials,
    );
  }

  void onOptionPressed(bool choice) {
    if (state.isGameOver) return;

    bool correct;
    if (state.rule == SwitchRule.number) {
      // choice true = Even, false = Odd
      correct = (state.number % 2 == 0) == choice;
    } else {
      // choice true = Red, false = Green
      correct = (state.colorName == 'Red') == choice;
    }

    final newScore = correct ? state.score + 1 : state.score;
    final newTotalTrials = state.totalTrials + 1;

    state = state.copyWith(
      score: newScore,
      totalTrials: newTotalTrials,
    );

    if (state.isTrialMode && newTotalTrials >= state.targetTrials) {
      state = state.copyWith(isGameOver: true);
    } else {
      _nextTrial();
    }
  }
}
