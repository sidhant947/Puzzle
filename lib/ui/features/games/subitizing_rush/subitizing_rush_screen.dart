import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'subitizing_rush_engine.dart';

class SubitizingRushScreen extends ConsumerStatefulWidget {
  const SubitizingRushScreen({super.key});

  @override
  ConsumerState<SubitizingRushScreen> createState() => _SubitizingRushScreenState();
}

class _SubitizingRushScreenState extends ConsumerState<SubitizingRushScreen> {
  static const int targetScore = 10;
  static const int flashDurationMs = 600;

  late SubitizingRound _currentRound;
  int _score = 0;
  int _streak = 0;
  bool _isFlashing = true;
  bool _isGameOver = false;
  int? _selectedAnswer;
  Timer? _flashTimer;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  void dispose() {
    _flashTimer?.cancel();
    super.dispose();
  }

  void _startNewGame() {
    _flashTimer?.cancel();
    setState(() {
      _score = 0;
      _streak = 0;
      _isGameOver = false;
      _selectedAnswer = null;
      _currentRound = SubitizingRushEngine.generateRound();
      _isFlashing = true;
    });

    _flashTimer = Timer(const Duration(milliseconds: flashDurationMs), () {
      if (mounted) {
        setState(() {
          _isFlashing = false;
        });
      }
    });
  }

  void _nextRound() {
    _flashTimer?.cancel();
    setState(() {
      _selectedAnswer = null;
      _currentRound = SubitizingRushEngine.generateRound();
      _isFlashing = true;
    });

    _flashTimer = Timer(const Duration(milliseconds: flashDurationMs), () {
      if (mounted) {
        setState(() {
          _isFlashing = false;
        });
      }
    });
  }

  void _selectAnswer(int choice) {
    if (_isGameOver || _isFlashing || _selectedAnswer != null) return;

    final isCorrect = choice == _currentRound.count;
    setState(() {
      _selectedAnswer = choice;
    });

    if (isCorrect) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _score++;
        _streak++;
      });
      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('subitizing_rush');
        _showEndDialog(isVictory: true);
        return;
      }
    } else {
      HapticFeedbackUtil.error();
      setState(() {
        _streak = 0;
      });
    }

    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted || _isGameOver) return;
      _nextRound();
    });
  }

  void _showEndDialog({required bool isVictory}) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.subitizingRushWinTitle : l10n.timeUp,
        message: isVictory ? l10n.subitizingRushWinMessage : l10n.wellDone,
        isVictory: isVictory,
        onPlayAgain: () {
          Navigator.of(context).pop();
          _startNewGame();
        },
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: l10n.subitizingRushTitle,
      subtitle: l10n.subitizingRushSubtitle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            children: [
              _buildHeader(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildCanvasArea(colorScheme)),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildOptionsRow(colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.flash_on_rounded, size: 18, color: DesignSystem.accentAmber),
              const SizedBox(width: 6),
              Text(
                'STREAK: $_streak',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.accentAmber,
                ),
              ),
            ],
          ),
        ),
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.stars_rounded, size: 18, color: DesignSystem.primary),
              const SizedBox(width: 6),
              Text(
                '$_score / $targetScore',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCanvasArea(ColorScheme colorScheme) {
    return TangibleContainer(
      width: double.infinity,
      color: colorScheme.surface,
      radius: DesignSystem.radiusLG,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          if (_isFlashing)
            ..._currentRound.dots.map((dot) {
              return Positioned(
                left: dot.x * 260,
                top: dot.y * 260,
                child: Container(
                  width: dot.radius * 2,
                  height: dot.radius * 2,
                  decoration: BoxDecoration(
                    color: DesignSystem.accentAmber,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: DesignSystem.accentAmber.withValues(alpha: 0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              );
            })
          else
            Center(
              child: Text(
                'HOW MANY DOTS?',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOptionsRow(ColorScheme colorScheme) {
    return Row(
      children: _currentRound.options.map((opt) {
        final isSelected = _selectedAnswer == opt;
        final isCorrect = _currentRound.count == opt;

        Color btnColor = colorScheme.surface;
        Color textColor = colorScheme.onSurface;

        if (_selectedAnswer != null) {
          if (isCorrect) {
            btnColor = DesignSystem.success.withValues(alpha: 0.2);
            textColor = DesignSystem.success;
          } else if (isSelected) {
            btnColor = DesignSystem.error.withValues(alpha: 0.2);
            textColor = DesignSystem.error;
          }
        }

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: TangibleButton(
              color: btnColor,
              onTap: () => _selectAnswer(opt),
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Center(
                child: Text(
                  '$opt',
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
