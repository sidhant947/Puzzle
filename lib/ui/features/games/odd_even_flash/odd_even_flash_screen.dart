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

enum ParityRule { redIsOdd, blueIsEven, greenIsOdd, redIsEven }

class OddEvenFlashScreen extends ConsumerStatefulWidget {
  const OddEvenFlashScreen({super.key});

  @override
  ConsumerState<OddEvenFlashScreen> createState() => _OddEvenFlashScreenState();
}

class _OddEvenFlashScreenState extends ConsumerState<OddEvenFlashScreen> {
  final Random _random = Random();
  late Timer _flashTimer;

  // Game state
  late int _currentNumber;
  late Color _currentColor;
  late ParityRule _currentRule;
  int _score = 0;
  final int _targetScore = 12;
  int _flashesCount = 0;
  bool _isGameOver = false;
  bool _hasTappedThisFlash = false;

  final List<Color> _colors = [
    DesignSystem.gameRose,
    DesignSystem.gameBlue,
    DesignSystem.gameGreen,
  ];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _flashesCount = 0;
    _isGameOver = false;
    _setRandomRule();
    _flashNext();

    _flashTimer = Timer.periodic(const Duration(milliseconds: 1400), (timer) {
      if (_isGameOver) return;
      _evaluatePassState();
      setState(() {
        _flashNext();
      });
    });
  }

  void _setRandomRule() {
    _currentRule = ParityRule.values[_random.nextInt(ParityRule.values.length)];
  }

  void _flashNext() {
    _currentNumber = _random.nextInt(90) + 10; // 10 to 99
    _currentColor = _colors[_random.nextInt(_colors.length)];
    _hasTappedThisFlash = false;
    _flashesCount++;

    // Change rules every 5 flashes
    if (_flashesCount % 5 == 0) {
      _setRandomRule();
    }
  }

  bool _isMatch() {
    final isOdd = _currentNumber % 2 != 0;
    final isEven = !isOdd;
    final isRed = _currentColor == DesignSystem.gameRose;
    final isBlue = _currentColor == DesignSystem.gameBlue;
    final isGreen = _currentColor == DesignSystem.gameGreen;

    switch (_currentRule) {
      case ParityRule.redIsOdd:
        return isRed && isOdd;
      case ParityRule.blueIsEven:
        return isBlue && isEven;
      case ParityRule.greenIsOdd:
        return isGreen && isOdd;
      case ParityRule.redIsEven:
        return isRed && isEven;
    }
  }

  void _evaluatePassState() {
    // If it was a match and user DID NOT tap, they missed it (no penalty or small penalty)
    if (_isMatch() && !_hasTappedThisFlash && !_isGameOver) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _score = max(0, _score - 1);
      });
    }
  }

  void _onTapFlash() {
    if (_isGameOver || _hasTappedThisFlash) return;

    setState(() {
      _hasTappedThisFlash = true;
      if (_isMatch()) {
        _score++;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        }
      } else {
        _score = max(0, _score - 2);
        HapticFeedbackUtil.error();
      }
    });
  }

  void _onGameComplete() async {
    _flashTimer.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('odd_even_flash');
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
            _startNewGame();
          });
        },
      ),
    );
  }

  String _getRuleText() {
    switch (_currentRule) {
      case ParityRule.redIsOdd:
        return 'TAP IF RED IS ODD';
      case ParityRule.blueIsEven:
        return 'TAP IF BLUE IS EVEN';
      case ParityRule.greenIsOdd:
        return 'TAP IF GREEN IS ODD';
      case ParityRule.redIsEven:
        return 'TAP IF RED IS EVEN';
    }
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
      title: L10nGameHelpers.getGameTitle(context, 'odd_even_flash'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'odd_even_flash'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _flashTimer.cancel();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Rule Display Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: DesignSystem.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(color: DesignSystem.primary, width: 2),
            ),
            child: Text(
              _getRuleText(),
              textAlign: Alignment.center.y == 0 ? TextAlign.center : TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: DesignSystem.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
            ),
          ),
          // Score Tracker
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Score: $_score / $_targetScore',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          // Flashing Card
          GestureDetector(
            onTap: _onTapFlash,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: _hasTappedThisFlash
                      ? Colors.grey.withValues(alpha: 0.3)
                      : (isDark ? DesignSystem.darkSurface : DesignSystem.surface),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(
                    color: _hasTappedThisFlash ? Colors.transparent : _currentColor,
                    width: 6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _currentColor.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  '$_currentNumber',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 72,
                        color: _hasTappedThisFlash ? Colors.grey : _currentColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'TAP THE CARD QUICKLY ON MATCHES!',
            style: TextStyle(letterSpacing: 0.6, fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
