import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class PeripheralFocusScreen extends ConsumerStatefulWidget {
  const PeripheralFocusScreen({super.key});

  @override
  ConsumerState<PeripheralFocusScreen> createState() => _PeripheralFocusScreenState();
}

class _PeripheralFocusScreenState extends ConsumerState<PeripheralFocusScreen> {
  final Random _random = Random();
  late Timer _flashTimer;

  // Central Math state
  late int _num1;
  late int _num2;
  late int _correctMathAnswer;
  late List<int> _mathOptions;

  // Peripheral state
  bool _peripheralActive = false;
  bool _peripheralIsLeft = true; // true = Left, false = Right
  late Color _peripheralColor;

  int _score = 0;
  final int _targetScore = 12;
  bool _isGameOver = false;

  final List<Color> _flashColors = [
    DesignSystem.gameRose,
    DesignSystem.gameOrange,
    DesignSystem.gameTeal,
  ];

  @override
  void initState() {
    super.initState();
    _generateMathQuestion();
    _startPeripheralTimer();
  }

  void _generateMathQuestion() {
    _num1 = _random.nextInt(15) + 1;
    _num2 = _random.nextInt(15) + 1;
    _correctMathAnswer = _num1 + _num2;

    final set = <int>{_correctMathAnswer};
    while (set.length < 3) {
      set.add(_correctMathAnswer + (_random.nextInt(5) - 2));
    }
    _mathOptions = set.toList()..shuffle(_random);
  }

  void _startPeripheralTimer() {
    // Schedule a peripheral flash every 2-4 seconds
    _flashTimer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      if (_isGameOver) return;

      setState(() {
        _peripheralActive = true;
        _peripheralIsLeft = _random.nextBool();
        _peripheralColor = _flashColors[_random.nextInt(_flashColors.length)];
      });

      // Dismiss automatically after 1.2 seconds if not tapped
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (!mounted || _isGameOver) return;
        if (_peripheralActive) {
          setState(() {
            _peripheralActive = false;
            _score = max(0, _score - 1); // penalty for missing it
          });
        }
      });
    });
  }

  void _onMathAnswer(int ans) {
    if (_isGameOver) return;

    setState(() {
      if (ans == _correctMathAnswer) {
        _score++;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        } else {
          _generateMathQuestion();
        }
      } else {
        _score = max(0, _score - 1);
        HapticFeedbackUtil.error();
        _generateMathQuestion();
      }
    });
  }

  void _onPeripheralTap(bool isLeft) {
    if (_isGameOver || !_peripheralActive) return;

    setState(() {
      if (isLeft == _peripheralIsLeft) {
        _score++;
        _peripheralActive = false;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        }
      } else {
        _score = max(0, _score - 1);
        HapticFeedbackUtil.error();
      }
    });
  }

  void _onGameComplete() async {
    _flashTimer.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('peripheral_focus');
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: AppLocalizations.of(context)!.wellDone.toUpperCase(),
        message: AppLocalizations.of(context)!.completed,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() {
            _score = 0;
            _isGameOver = false;
            _peripheralActive = false;
            _generateMathQuestion();
            _startPeripheralTimer();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _flashTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'peripheral_focus'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'peripheral_focus'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _flashTimer.cancel();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _peripheralActive = false;
              _generateMathQuestion();
              _startPeripheralTimer();
            });
          },
        ),
      ],
      body: Stack(
        children: [
          // Left Peripheral Flasher
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 70,
            child: GestureDetector(
              onTap: () => _onPeripheralTap(true),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                color: _peripheralActive && _peripheralIsLeft
                    ? _peripheralColor.withOpacity(0.4)
                    : Colors.transparent,
                child: _peripheralActive && _peripheralIsLeft
                    ? Icon(Icons.warning_amber_rounded, color: _peripheralColor, size: 36)
                    : null,
              ),
            ),
          ),
          // Right Peripheral Flasher
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 70,
            child: GestureDetector(
              onTap: () => _onPeripheralTap(false),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                color: _peripheralActive && !_peripheralIsLeft
                    ? _peripheralColor.withOpacity(0.4)
                    : Colors.transparent,
                child: _peripheralActive && !_peripheralIsLeft
                    ? Icon(Icons.warning_amber_rounded, color: _peripheralColor, size: 36)
                    : null,
              ),
            ),
          ),
          // Central Task Area
          Positioned.fill(
            left: 70,
            right: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Score card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'Score: $_score / $_targetScore',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: DesignSystem.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 40),
                // Equation Board
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    border: Border.all(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    '$_num1 + $_num2 = ?',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: isDark ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 40),
                // Answer Options
                Column(
                  children: _mathOptions.map((opt) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => _onMathAnswer(opt),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                            side: BorderSide(
                              color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                            ),
                          ),
                          child: Text(
                            '$opt',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
