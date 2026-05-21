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

class ModuloClockScreen extends ConsumerStatefulWidget {
  const ModuloClockScreen({super.key});

  @override
  ConsumerState<ModuloClockScreen> createState() => _ModuloClockScreenState();
}

class _ModuloClockScreenState extends ConsumerState<ModuloClockScreen> {
  final Random _random = Random();
  
  int _score = 0;
  int _correctAnswers = 0;
  static const int targetAnswers = 10;
  
  late int _startHour;
  late int _addedHours;
  late int _resultHour;
  late List<int> _options;

  Timer? _timer;
  int _timeLeft = 45;

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
    // Generate random start hour: 1 to 12
    _startHour = 1 + _random.nextInt(12);
    // Generate added hours: 5 to 50
    _addedHours = 5 + _random.nextInt(46);

    // Calculate result hour under modulo 12
    final sum = _startHour + _addedHours;
    _resultHour = sum % 12;
    if (_resultHour == 0) _resultHour = 12;

    // Generate option list
    final Set<int> optionSet = {_resultHour};
    while (optionSet.length < 4) {
      optionSet.add(1 + _random.nextInt(12));
    }
    
    _options = optionSet.toList()..shuffle();
  }

  void _onOptionSelected(int value) {
    final isCorrect = value == _resultHour;

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
      ref.read(gameStreakNotifierProvider.notifier).completeGame('modulo_clock', xpAmount: 25);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: "MODULO CLOCK ACED",
          message: "Excellent modular mental math coordination! Score: $_score",
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onPlayAgain: () {
            Navigator.pop(context);
            setState(() {
              _score = 0;
              _correctAnswers = 0;
              _timeLeft = 45;
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
        title: "TIME OUT",
        message: "You managed $_correctAnswers of $targetAnswers modular clock solutions. Score: $_score",
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
            _timeLeft = 45;
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
      title: "MODULO CLOCK",
      subtitle: "CALCULATE THE RESULTING TIME AFTER THE SHOWN HOURS PASS!",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SOLVED: $_correctAnswers / $targetAnswers",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  "TIME: $_timeLeft s",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: _timeLeft < 8 ? DesignSystem.error : DesignSystem.accentAmber,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignSystem.spaceXL),
            
            // Display Screen
            Expanded(
              child: Center(
                child: TangibleContainer(
                  color: colorScheme.surface,
                  shadowColor: DesignSystem.gameAmber.withValues(alpha: 0.15),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time_filled_rounded,
                        size: 64,
                        color: DesignSystem.gameAmber,
                      ),
                      const SizedBox(height: DesignSystem.spaceMD),
                      Text(
                        "START TIME: $_startHour:00",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: DesignSystem.spaceXS),
                      Text(
                        "+ $_addedHours HOURS",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: DesignSystem.spaceXL),
            
            // Options buttons
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
                      "$value:00",
                      style: TextStyle(
                        fontSize: 22,
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
