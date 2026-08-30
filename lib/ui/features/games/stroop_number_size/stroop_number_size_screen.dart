import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'stroop_number_size_engine.dart';

class StroopNumberSizeScreen extends ConsumerStatefulWidget {
  const StroopNumberSizeScreen({super.key});

  @override
  ConsumerState<StroopNumberSizeScreen> createState() => _StroopNumberSizeScreenState();
}

class _StroopNumberSizeScreenState extends ConsumerState<StroopNumberSizeScreen> {
  static const int totalTrials = 14;

  late NumberSizeTrial _currentTrial;
  int _trialCount = 0;
  int _score = 0;
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
      _currentTrial = StroopNumberSizeEngine.generateTrial();
    });
  }

  void _submitChoice(bool pickedLeft) {
    if (_isGameOver) return;

    final isCorrect = pickedLeft == _currentTrial.leftIsLarger;
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
    ref.read(gameStreakNotifierProvider.notifier).completeGame('stroop_number_size');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.stroopNumberSizeWinTitle,
        message: 'Accuracy: $_score / $totalTrials Size-Congruity Stroop trials correct!',
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

    final instructionText = _currentTrial.taskDimension == StroopDimension.numerical
        ? 'WHICH NUMBER IS NUMERICALLY GREATER?'
        : 'WHICH NUMBER IS PHYSICALLY LARGER IN SIZE?';

    return GameScaffold(
      title: l10n.stroopNumberSizeTitle,
      subtitle: l10n.stroopNumberSizeSubtitle,
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
              _buildInstructionBanner(instructionText, colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildComparisonStage(colorScheme),
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
              const Icon(Icons.format_size_rounded, size: 18, color: DesignSystem.gameRose),
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

  Widget _buildInstructionBanner(String text, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: DesignSystem.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: DesignSystem.primary, width: 1.5),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: DesignSystem.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildComparisonStage(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${_currentTrial.leftNumber}',
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: _currentTrial.leftSize,
              fontWeight: FontWeight.w900,
              color: colorScheme.onSurface,
            ),
          ),
          Container(
            width: 1,
            height: 80,
            color: colorScheme.outline.withValues(alpha: 0.3),
          ),
          Text(
            '${_currentTrial.rightNumber}',
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: _currentTrial.rightSize,
              fontWeight: FontWeight.w900,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponseButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _submitChoice(true),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text(
                'LEFT',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 26,
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
            onTap: () => _submitChoice(false),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text(
                'RIGHT',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 26,
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
