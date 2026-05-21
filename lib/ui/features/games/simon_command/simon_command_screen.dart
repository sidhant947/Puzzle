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

class SimonCommandScreen extends ConsumerStatefulWidget {
  const SimonCommandScreen({super.key});

  @override
  ConsumerState<SimonCommandScreen> createState() => _SimonCommandScreenState();
}

class _SimonCommandScreenState extends ConsumerState<SimonCommandScreen> {
  final Random _random = Random();
  
  int _score = 0;
  int _correctAnswers = 0;
  static const int targetScore = 15;
  
  late int _shapeSide; // 0: Left side, 1: Right side
  late int _shapeColor; // 0: Indigo (Blue), 1: Berry (Red)
  late bool _swapButtonPositions; // Whether Indigo is Left or Right button
  
  Timer? _timer;
  int _timeLeft = 40; // 40 seconds timer

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
    setState(() {
      _shapeSide = _random.nextInt(2);
      _shapeColor = _random.nextInt(2);
      _swapButtonPositions = _random.nextBool();
    });
  }

  void _onButtonTapped(int buttonType) {
    // buttonType: 0 (Indigo), 1 (Berry)
    final isCorrect = buttonType == _shapeColor;

    if (isCorrect) {
      HapticFeedbackUtil.success();
      _correctAnswers++;
      _score += 10;
    } else {
      HapticFeedbackUtil.error();
      _score = max(0, _score - 5);
    }

    if (_correctAnswers >= targetScore) {
      _timer?.cancel();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('simon_command', xpAmount: 25);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: "COMMAND ACCOMPLISHED",
          message: "Excellent selective response and focus! Total Score: $_score",
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onPlayAgain: () {
            Navigator.pop(context);
            setState(() {
              _score = 0;
              _correctAnswers = 0;
              _timeLeft = 40;
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
        title: "TIME'S UP!",
        message: "You scored $_score but did not reach $targetScore matches in time.",
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
            _timeLeft = 40;
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

    // Resolve Button Colors based on positions
    final leftButtonColor = _swapButtonPositions ? DesignSystem.accentBerry : DesignSystem.primary;
    final leftButtonType = _swapButtonPositions ? 1 : 0;

    final rightButtonColor = _swapButtonPositions ? DesignSystem.primary : DesignSystem.accentBerry;
    final rightButtonType = _swapButtonPositions ? 0 : 1;

    return GameScaffold(
      title: "SIMON COMMAND",
      subtitle: "TAP THE BUTTON MATCHING THE SHAPE'S COLOR (IGNORE SIDE)",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MATCHES: $_correctAnswers / $targetScore",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  "TIME: $_timeLeft s",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: _timeLeft < 10 ? DesignSystem.error : DesignSystem.accentTeal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignSystem.spaceXL),
            
            // Central Play Area containing Left / Right sections
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Row(
                    children: [
                      // Left Area
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorScheme.outline.withValues(alpha: 0.1),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: (_shapeSide == 0)
                                ? Icon(
                                    Icons.science_rounded,
                                    size: 80,
                                    color: _shapeColor == 0 ? DesignSystem.primary : DesignSystem.accentBerry,
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ),
                      
                      // Divider
                      Container(
                        width: 2,
                        color: colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      
                      // Right Area
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorScheme.outline.withValues(alpha: 0.1),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: (_shapeSide == 1)
                                ? Icon(
                                    Icons.science_rounded,
                                    size: 80,
                                    color: _shapeColor == 0 ? DesignSystem.primary : DesignSystem.accentBerry,
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: DesignSystem.spaceXL),
            
            // Control Buttons
            Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: () => _onButtonTapped(leftButtonType),
                    color: leftButtonColor,
                    shadowColor: leftButtonColor.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        _swapButtonPositions ? "BERRY" : "INDIGO",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceLG),
                Expanded(
                  child: TangibleButton(
                    onTap: () => _onButtonTapped(rightButtonType),
                    color: rightButtonColor,
                    shadowColor: rightButtonColor.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        _swapButtonPositions ? "INDIGO" : "BERRY",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignSystem.space2XL),
          ],
        ),
      ),
    );
  }
}
