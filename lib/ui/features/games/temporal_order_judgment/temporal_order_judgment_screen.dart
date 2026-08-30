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
import 'temporal_order_judgment_engine.dart';

class TemporalOrderJudgmentScreen extends ConsumerStatefulWidget {
  const TemporalOrderJudgmentScreen({super.key});

  @override
  ConsumerState<TemporalOrderJudgmentScreen> createState() => _TemporalOrderJudgmentScreenState();
}

class _TemporalOrderJudgmentScreenState extends ConsumerState<TemporalOrderJudgmentScreen> {
  static const int totalTrials = 12;

  late TemporalTrial _currentTrial;
  int _trialCount = 0;
  int _score = 0;
  bool _isLeftLit = false;
  bool _isRightLit = false;
  bool _isFlashing = false;
  bool _isGameOver = false;
  Timer? _animTimer;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  void dispose() {
    _animTimer?.cancel();
    super.dispose();
  }

  void _startNewGame() {
    _animTimer?.cancel();
    setState(() {
      _trialCount = 0;
      _score = 0;
      _isGameOver = false;
      _loadNewTrial();
    });
  }

  void _loadNewTrial() {
    if (_trialCount >= totalTrials) {
      _endGame();
      return;
    }

    _animTimer?.cancel();
    setState(() {
      _trialCount++;
      _currentTrial = TemporalOrderJudgmentEngine.generateTrial();
      _isLeftLit = false;
      _isRightLit = false;
      _isFlashing = true;
    });

    // Fixation pause
    _animTimer = Timer(const Duration(milliseconds: 600), () {
      if (!mounted) return;

      // Trigger first flash
      if (_currentTrial.firstSide == FlashSide.left) {
        setState(() => _isLeftLit = true);
        _animTimer = Timer(Duration(milliseconds: _currentTrial.soaMs), () {
          if (!mounted) return;
          setState(() => _isRightLit = true);

          _animTimer = Timer(const Duration(milliseconds: 100), () {
            if (!mounted) return;
            setState(() {
              _isLeftLit = false;
              _isRightLit = false;
              _isFlashing = false;
            });
          });
        });
      } else {
        setState(() => _isRightLit = true);
        _animTimer = Timer(Duration(milliseconds: _currentTrial.soaMs), () {
          if (!mounted) return;
          setState(() => _isLeftLit = true);

          _animTimer = Timer(const Duration(milliseconds: 100), () {
            if (!mounted) return;
            setState(() {
              _isLeftLit = false;
              _isRightLit = false;
              _isFlashing = false;
            });
          });
        });
      }
    });
  }

  void _submitChoice(FlashSide side) {
    if (_isGameOver || _isFlashing) return;

    final isCorrect = side == _currentTrial.firstSide;
    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });
    } else {
      HapticFeedbackUtil.error();
    }

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted && !_isGameOver) {
        _loadNewTrial();
      }
    });
  }

  void _endGame() {
    setState(() {
      _isGameOver = true;
    });
    ref.read(gameStreakNotifierProvider.notifier).completeGame('temporal_order_judgment');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.temporalOrderJudgmentWinTitle,
        message: 'Accuracy: $_score / $totalTrials microsecond temporal sequence distinctions!',
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
      title: l10n.temporalOrderJudgmentTitle,
      subtitle: l10n.temporalOrderJudgmentSubtitle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            children: [
              _buildHeader(colorScheme),
              const Spacer(flex: 1),
              _buildFlashArena(colorScheme),
              const Spacer(flex: 2),
              _buildResponseButtons(colorScheme),
              const Spacer(flex: 1),
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
              const Icon(Icons.timer_outlined, size: 18, color: DesignSystem.gameRose),
              const SizedBox(width: 6),
              Text(
                'TRIAL $_trialCount / $totalTrials',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gameRose,
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
                'ACCURACY: $_score',
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

  Widget _buildFlashArena(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'WHICH CIRCLE FLASHED FIRST?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFlashCircle(_isLeftLit),
              const SizedBox(width: 50),
              Icon(Icons.add_rounded, size: 36, color: colorScheme.onSurface.withValues(alpha: 0.3)),
              const SizedBox(width: 50),
              _buildFlashCircle(_isRightLit),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlashCircle(bool isLit) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLit ? DesignSystem.gameRose : Colors.transparent,
        border: Border.all(
          color: isLit ? DesignSystem.gameRose : Theme.of(context).colorScheme.outline.withValues(alpha: 0.4),
          width: 2,
        ),
        boxShadow: isLit
            ? [
                BoxShadow(
                  color: DesignSystem.gameRose.withValues(alpha: 0.6),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
    );
  }

  Widget _buildResponseButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: _isFlashing ? null : () => _submitChoice(FlashSide.left),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text(
                'LEFT FIRST',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceMD),
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: _isFlashing ? null : () => _submitChoice(FlashSide.right),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text(
                'RIGHT FIRST',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
