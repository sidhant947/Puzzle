import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class BinaryCodeScreen extends ConsumerStatefulWidget {
  const BinaryCodeScreen({super.key});

  @override
  ConsumerState<BinaryCodeScreen> createState() => _BinaryCodeScreenState();
}

class _BinaryCodeScreenState extends ConsumerState<BinaryCodeScreen> {
  final Random _random = Random();
  
  int _score = 0;
  int _correctAnswers = 0;
  static const int targetAnswers = 10;
  
  late int _targetDecimal;
  late String _binaryString;
  late List<int> _options;

  Timer? _timer;
  int _timeLeft = 30; // 30 seconds speed round

  @override
  void initState() {
    super.initState();
    _generateNextRound();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_timeLeft > 1) {
          _timeLeft--;
        } else {
          _timeLeft = 0;
          _timer?.cancel();
          _gameOver();
        }
      });
    });
  }

  void _generateNextRound() {
    // Generate 4-bit integer: 0 to 15
    _targetDecimal = _random.nextInt(16);
    
    // Format to 4-bit binary string
    _binaryString = _targetDecimal.toRadixString(2).padLeft(4, '0');

    // Generate option list
    final Set<int> optionSet = {_targetDecimal};
    while (optionSet.length < 4) {
      optionSet.add(_random.nextInt(16));
    }
    
    _options = optionSet.toList()..shuffle();
  }

  void _onOptionSelected(int value) {
    final isCorrect = value == _targetDecimal;

    if (isCorrect) {
      HapticFeedbackUtil.success();
      _correctAnswers++;
      _score += 15;
    } else {
      HapticFeedbackUtil.error();
      _score = max(0, _score - 5);
    }

    if (_correctAnswers >= targetAnswers) {
      _timer?.cancel();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('binary_code', xpAmount: 25);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: "BINARY CODE MASTERED",
          message: "Sensational rapid decimal translation! Final Score: $_score",
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onPlayAgain: () {
            Navigator.pop(context);
            setState(() {
              _score = 0;
              _correctAnswers = 0;
              _timeLeft = 30;
            });
            _generateNextRound();
            _startTimer();
          },
        ),
      );
    } else {
      _generateNextRound();
    }
  }

  void _gameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: "TIME EXPIRED",
        message: "You correctly converted $_correctAnswers binary numbers. Score: $_score",
        isVictory: false,
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onPlayAgain: () {
          Navigator.pop(context);
          setState(() {
            _score = 0;
            _correctAnswers = 0;
            _timeLeft = 30;
          });
          _generateNextRound();
          _startTimer();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: "BINARY CODE",
      subtitle: "CONVERT THE 4-BIT BINARY NUMBER TO DECIMAL BEFORE TIME RUNS OUT!",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TRANSLATED: $_correctAnswers / $targetAnswers",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  "TIME: $_timeLeft s",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: _timeLeft < 8 ? DesignSystem.error : DesignSystem.accentBerry,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignSystem.spaceXL),
            
            // Binary Code Display Card
            Expanded(
              child: Center(
                child: TangibleContainer(
                  color: colorScheme.surface,
                  shadowColor: DesignSystem.primary.withValues(alpha: 0.15),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "BINARY",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(height: DesignSystem.spaceMD),
                      Text(
                        _binaryString,
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          fontFamily: "monospace",
                          color: DesignSystem.primary,
                          letterSpacing: 8.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: DesignSystem.spaceXL),
            
            // Output Option Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: DesignSystem.spaceMD,
                mainAxisSpacing: DesignSystem.spaceMD,
                childAspectRatio: 2.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final value = _options[index];
                return TangibleButton(
                  onTap: () => _onOptionSelected(value),
                  color: colorScheme.surface,
                  shadowColor: colorScheme.outline,
                  child: Center(
                    child: Text(
                      "$value",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: DesignSystem.space2XL),
          ],
        ),
      ),
    );
  }
}
