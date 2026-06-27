import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class DoubleTroubleScreen extends ConsumerStatefulWidget {
  const DoubleTroubleScreen({super.key});

  @override
  ConsumerState<DoubleTroubleScreen> createState() => _DoubleTroubleScreenState();
}

class _DoubleTroubleScreenState extends ConsumerState<DoubleTroubleScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  // Split side games states
  // Left Side Game: Falling Apple Catcher (tap falling apples before they hit bottom)
  double _leftAppleY = 0.0;
  double _leftAppleX = 0.5;
  late Color _leftAppleColor; // Red = bad, Green = good
  Timer? _leftTimer;

  // Right Side Game: Bubble Pop (tap bubble before it scales to max and pops)
  double _rightBubbleScale = 0.2;
  double _rightBubbleX = 0.5;
  double _rightBubbleY = 0.5;
  Timer? _rightTimer;

  @override
  void initState() {
    super.initState();
    _startLeftGame();
    _startRightGame();
  }

  @override
  void dispose() {
    _leftTimer?.cancel();
    _rightTimer?.cancel();
    super.dispose();
  }

  void _startLeftGame() {
    _leftAppleY = 0.0;
    _leftAppleX = 0.2 + _random.nextDouble() * 0.6;
    _leftAppleColor = _random.nextBool() ? DesignSystem.gameGreen : DesignSystem.error;

    _leftTimer?.cancel();
    _leftTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_isGameOver) {
        timer.cancel();
        return;
      }
      setState(() {
        _leftAppleY += 0.02;
        if (_leftAppleY >= 1.0) {
          // If a green apple fell off uncaught, small score penalty
          if (_leftAppleColor == DesignSystem.gameGreen) {
            _score = max(0, _score - 1);
            HapticFeedbackUtil.lightImpact();
          }
          _startLeftGame();
        }
      });
    });
  }

  void _startRightGame() {
    _rightBubbleScale = 0.2;
    _rightBubbleX = 0.2 + _random.nextDouble() * 0.6;
    _rightBubbleY = 0.2 + _random.nextDouble() * 0.6;

    _rightTimer?.cancel();
    _rightTimer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (_isGameOver) {
        timer.cancel();
        return;
      }
      setState(() {
        _rightBubbleScale += 0.03;
        if (_rightBubbleScale >= 1.1) {
          // Bubble burst without pop, score penalty
          _score = max(0, _score - 1);
          HapticFeedbackUtil.lightImpact();
          _startRightGame();
        }
      });
    });
  }

  void _tapLeftApple() {
    if (_isGameOver) return;

    if (_leftAppleColor == DesignSystem.gameGreen) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        _startLeftGame();
      }
    } else {
      // Caught a red bad apple, penalty
      _score = max(0, _score - 1);
      HapticFeedbackUtil.error();
      _startLeftGame();
    }
  }

  void _tapRightBubble() {
    if (_isGameOver) return;

    _score++;
    HapticFeedbackUtil.success();
    if (_score >= _targetScore) {
      _isGameOver = true;
      _onGameComplete();
    } else {
      _startRightGame();
    }
  }

  void _onGameComplete() async {
    _leftTimer?.cancel();
    _rightTimer?.cancel();

    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('double_trouble');
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
            _startLeftGame();
            _startRightGame();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'double_trouble'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'double_trouble'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _startLeftGame();
              _startRightGame();
            });
          },
        ),
      ],
      body: Column(
        children: [
          // Score Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: DesignSystem.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
            ),
            child: Text(
              'Taps: $_score / $_targetScore',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: DesignSystem.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          // Split views
          Expanded(
            child: Row(
              children: [
                // Left Side view Catcher
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                      border: Border(
                        right: BorderSide(
                          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                          width: 2,
                        ),
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Positioned(
                              left: _leftAppleX * (constraints.maxWidth - 50),
                              top: _leftAppleY * (constraints.maxHeight - 50),
                              child: GestureDetector(
                                onTap: _tapLeftApple,
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: _leftAppleColor.withValues(alpha: 0.2),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: _leftAppleColor, width: 3),
                                  ),
                                  child: Icon(Icons.apple_rounded, color: _leftAppleColor, size: 24),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                // Right Side view Pop
                Expanded(
                  child: Container(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Positioned(
                              left: _rightBubbleX * (constraints.maxWidth - 60),
                              top: _rightBubbleY * (constraints.maxHeight - 60),
                              child: Transform.scale(
                                scale: _rightBubbleScale,
                                child: GestureDetector(
                                  onTap: _tapRightBubble,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withValues(alpha: 0.25),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.blue, width: 3.5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withValues(alpha: 0.3),
                                          blurRadius: 8,
                                        )
                                      ],
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.star_outline_rounded, color: Colors.blue, size: 22),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
