import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'visual_search_conjunction_engine.dart';

class VisualSearchConjunctionScreen extends ConsumerStatefulWidget {
  const VisualSearchConjunctionScreen({super.key});

  @override
  ConsumerState<VisualSearchConjunctionScreen> createState() => _VisualSearchConjunctionScreenState();
}

class _VisualSearchConjunctionScreenState extends ConsumerState<VisualSearchConjunctionScreen> {
  static const int totalTrials = 12;

  late VisualSearchRound _currentRound;
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
      _currentRound = VisualSearchConjunctionEngine.generateRound();
    });
  }

  void _submitAnswer(bool saidPresent) {
    if (_isGameOver) return;

    final isCorrect = saidPresent == _currentRound.targetPresent;
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
    ref.read(gameStreakNotifierProvider.notifier).completeGame('visual_search_conjunction');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.visualSearchConjunctionWinTitle,
        message: 'Accuracy: $_score / $totalTrials conjunction visual targets correctly detected!',
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
      title: l10n.visualSearchConjunctionTitle,
      subtitle: l10n.visualSearchConjunctionSubtitle,
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
              _buildTargetBanner(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildSearchArena(colorScheme)),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildResponseButtons(colorScheme),
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
              const Icon(Icons.manage_search_rounded, size: 18, color: DesignSystem.gameRose),
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

  Widget _buildTargetBanner(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'TARGET: ',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
          Icon(_currentRound.targetShape, color: _currentRound.targetColor, size: 24),
          const SizedBox(width: 6),
          const Text(
            'RED SQUARE',
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: DesignSystem.gameRed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchArena(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return Stack(
            children: _currentRound.items.map((item) {
              return Positioned(
                left: item.x * (w - 36),
                top: item.y * (h - 36),
                child: Icon(item.shape, color: item.color, size: 30),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildResponseButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _submitAnswer(true),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_rounded, color: DesignSystem.success, size: 24),
                SizedBox(width: 8),
                Text(
                  'PRESENT',
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
            onTap: () => _submitAnswer(false),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cancel_rounded, color: DesignSystem.error, size: 24),
                SizedBox(width: 8),
                Text(
                  'ABSENT',
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
