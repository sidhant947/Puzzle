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
import 'continuous_paired_associate_engine.dart';

class ContinuousPairedAssociateScreen extends ConsumerStatefulWidget {
  const ContinuousPairedAssociateScreen({super.key});

  @override
  ConsumerState<ContinuousPairedAssociateScreen> createState() => _ContinuousPairedAssociateScreenState();
}

class _ContinuousPairedAssociateScreenState extends ConsumerState<ContinuousPairedAssociateScreen> {
  static const int targetScore = 8;

  late PairedAssociateRound _currentRound;
  int _score = 0;
  int _queryIndex = 0;
  bool _isStudyPhase = true;
  bool _isGameOver = false;
  int _studySecondsLeft = 4;
  Timer? _studyTimer;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  void dispose() {
    _studyTimer?.cancel();
    super.dispose();
  }

  void _startNewGame() {
    _studyTimer?.cancel();
    setState(() {
      _score = 0;
      _isGameOver = false;
      _loadNewRound();
    });
  }

  void _loadNewRound() {
    _studyTimer?.cancel();
    final numPairs = _score < 3 ? 3 : (_score < 6 ? 4 : 5);
    _currentRound = ContinuousPairedAssociateEngine.generateRound(numPairs: numPairs);
    _queryIndex = 0;
    _isStudyPhase = true;
    _studySecondsLeft = 3 + numPairs;

    _studyTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_studySecondsLeft <= 1) {
        timer.cancel();
        if (mounted) {
          setState(() {
            _isStudyPhase = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _studySecondsLeft--;
          });
        }
      }
    });
  }

  void _selectTarget(IconData symbol) {
    if (_isGameOver || _isStudyPhase) return;

    final currentQuery = _currentRound.queryQueue[_queryIndex];
    final isCorrect = symbol == currentQuery.target;

    if (isCorrect) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _queryIndex++;
      });

      if (_queryIndex >= _currentRound.queryQueue.length) {
        HapticFeedbackUtil.victory();
        setState(() {
          _score++;
        });

        if (_score >= targetScore) {
          setState(() {
            _isGameOver = true;
          });
          ref.read(gameStreakNotifierProvider.notifier).completeGame('continuous_paired_associate');
          _showEndDialog(isVictory: true);
          return;
        }

        Future.delayed(const Duration(milliseconds: 400), () {
          if (mounted && !_isGameOver) {
            setState(() {
              _loadNewRound();
            });
          }
        });
      }
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect pair! Study the pairs again next round.'),
          duration: Duration(seconds: 2),
        ),
      );
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _loadNewRound();
          });
        }
      });
    }
  }

  void _showEndDialog({required bool isVictory}) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.continuousPairedAssociateWinTitle : l10n.timeUp,
        message: isVictory ? l10n.continuousPairedAssociateWinMessage : l10n.wellDone,
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
      title: l10n.continuousPairedAssociateTitle,
      subtitle: l10n.continuousPairedAssociateSubtitle,
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
              Expanded(
                child: _isStudyPhase
                    ? _buildStudyView(colorScheme)
                    : _buildTestingView(colorScheme),
              ),
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
              Icon(
                _isStudyPhase ? Icons.visibility_rounded : Icons.quiz_rounded,
                size: 18,
                color: DesignSystem.gameIndigo,
              ),
              const SizedBox(width: 6),
              Text(
                _isStudyPhase ? 'STUDY: $_studySecondsLeft s' : 'RECALL: ${_queryIndex + 1}/${_currentRound.queryQueue.length}',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gameIndigo,
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

  Widget _buildStudyView(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MEMORIZE THESE SYMBOL PAIRS',
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: _currentRound.pairsToLearn.map((pair) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: pair.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(color: pair.color, width: 1.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(pair.cue, color: pair.color, size: 36),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.arrow_forward_rounded, size: 20),
                    ),
                    Icon(pair.target, color: pair.color, size: 36),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTestingView(ColorScheme colorScheme) {
    final currentQuery = _currentRound.queryQueue[_queryIndex];

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
              border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'WHAT WAS PAIRED WITH THIS SYMBOL?',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: currentQuery.color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: currentQuery.color, width: 3),
                  ),
                  child: Center(
                    child: Icon(currentQuery.cue, color: currentQuery.color, size: 48),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Expanded(
          flex: 3,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: _currentRound.allTargetSymbols.map((sym) {
              return TangibleButton(
                color: colorScheme.surface,
                padding: const EdgeInsets.all(16),
                onTap: () => _selectTarget(sym),
                child: Icon(sym, size: 36, color: colorScheme.onSurface),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
