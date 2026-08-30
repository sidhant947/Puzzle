import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'ab_reversal_oddball_engine.dart';

class ABReversalOddballScreen extends ConsumerStatefulWidget {
  const ABReversalOddballScreen({super.key});

  @override
  ConsumerState<ABReversalOddballScreen> createState() => _ABReversalOddballScreenState();
}

class _ABReversalOddballScreenState extends ConsumerState<ABReversalOddballScreen> {
  static const int totalTrials = 14;

  late ABReversalTrial _currentTrial;
  int _trialCount = 0;
  int _score = 0;
  bool _ruleReversed = false;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _trialCount = 0;
      _score = 0;
      _ruleReversed = false;
      _isGameOver = false;
      _loadNewTrial();
    });
  }

  void _loadNewTrial() {
    if (_trialCount >= totalTrials) {
      _endGame();
      return;
    }

    setState(() {
      _trialCount++;
      // Reverse rule halfway through (at trial 8)
      _ruleReversed = _trialCount > 7;
      _currentTrial = ABReversalOddballEngine.generateTrial(ruleReversed: _ruleReversed);
    });
  }

  void _submitResponse(bool pressedTarget) {
    if (_isGameOver) return;

    final isCorrect = pressedTarget == _currentTrial.isTarget;
    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });
    } else {
      HapticFeedbackUtil.error();
    }

    _loadNewTrial();
  }

  void _endGame() {
    setState(() {
      _isGameOver = true;
    });
    ref.read(gameStreakNotifierProvider.notifier).completeGame('ab_reversal_oddball');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.abReversalOddballWinTitle,
        message: 'Accuracy: $_score / $totalTrials cognitive rule-reversal stimulus detections!',
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

    final currentRuleText = _ruleReversed
        ? 'TARGET: CIRCLE (ODDBALL)'
        : 'TARGET: SQUARE (STANDARD)';

    return GameScaffold(
      title: l10n.abReversalOddballTitle,
      subtitle: l10n.abReversalOddballSubtitle,
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
              _buildRuleBanner(currentRuleText, colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildStimulusStage(colorScheme),
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
              const Icon(Icons.published_with_changes_rounded, size: 18, color: DesignSystem.gameRose),
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

  Widget _buildRuleBanner(String ruleText, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: _ruleReversed ? DesignSystem.gameRose.withValues(alpha: 0.15) : DesignSystem.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: _ruleReversed ? DesignSystem.gameRose : DesignSystem.primary,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          ruleText,
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: _ruleReversed ? DesignSystem.gameRose : DesignSystem.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildStimulusStage(ColorScheme colorScheme) {
    final isA = _currentTrial.stimulus == OddballType.standardA;

    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Center(
        child: Icon(
          isA ? Icons.square_rounded : Icons.circle_rounded,
          size: 80,
          color: isA ? DesignSystem.primary : DesignSystem.gameRose,
        ),
      ),
    );
  }

  Widget _buildResponseButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _submitResponse(true),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_rounded, color: DesignSystem.success, size: 24),
                SizedBox(width: 8),
                Text(
                  'TARGET',
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceMD),
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _submitResponse(false),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cancel_rounded, color: DesignSystem.error, size: 24),
                SizedBox(width: 8),
                Text(
                  'NON-TARGET',
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
