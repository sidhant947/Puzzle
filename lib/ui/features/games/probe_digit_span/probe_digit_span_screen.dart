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
import 'probe_digit_span_engine.dart';

class ProbeDigitSpanScreen extends ConsumerStatefulWidget {
  const ProbeDigitSpanScreen({super.key});

  @override
  ConsumerState<ProbeDigitSpanScreen> createState() => _ProbeDigitSpanScreenState();
}

class _ProbeDigitSpanScreenState extends ConsumerState<ProbeDigitSpanScreen> {
  static const int totalTrials = 8;

  late ProbeDigitTrial _currentTrial;
  int _trialCount = 0;
  int _score = 0;
  int _streamIndex = 0;
  bool _isStreaming = true;
  bool _isGameOver = false;
  int? _selectedDigit;
  Timer? _streamTimer;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  void dispose() {
    _streamTimer?.cancel();
    super.dispose();
  }

  void _startNewGame() {
    _streamTimer?.cancel();
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

    _streamTimer?.cancel();
    final len = _score < 3 ? 6 : (_score < 6 ? 7 : 8);
    setState(() {
      _trialCount++;
      _currentTrial = ProbeDigitSpanEngine.generateTrial(length: len);
      _streamIndex = 0;
      _isStreaming = true;
      _selectedDigit = null;
    });

    _streamTimer = Timer.periodic(const Duration(milliseconds: 750), (timer) {
      if (_streamIndex >= _currentTrial.digits.length - 1) {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              _isStreaming = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            _streamIndex++;
          });
        }
      }
    });
  }

  void _submitDigit(int digit) {
    if (_isGameOver || _isStreaming || _selectedDigit != null) return;

    final isCorrect = digit == _currentTrial.targetNextDigit;
    setState(() {
      _selectedDigit = digit;
    });

    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });
    } else {
      HapticFeedbackUtil.error();
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && !_isGameOver) {
        _loadNewTrial();
      }
    });
  }

  void _endGame() {
    setState(() {
      _isGameOver = true;
    });
    ref.read(gameStreakNotifierProvider.notifier).completeGame('probe_digit_span');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.probeDigitSpanWinTitle,
        message: 'Score: $_score / $totalTrials probe serial recall trials correct!',
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
      title: l10n.probeDigitSpanTitle,
      subtitle: l10n.probeDigitSpanSubtitle,
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
              _buildDigitStage(colorScheme),
              const Spacer(flex: 2),
              _buildNumpad(colorScheme),
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
              const Icon(Icons.dialpad_rounded, size: 18, color: DesignSystem.gameIndigo),
              const SizedBox(width: 6),
              Text(
                'TRIAL $_trialCount / $totalTrials',
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
                'SCORE: $_score',
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

  Widget _buildDigitStage(ColorScheme colorScheme) {
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
            _isStreaming ? 'MEMORIZE THE STREAM OF DIGITS' : 'WHAT DIGIT FOLLOWED THIS PROBE?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 70,
            child: Center(
              child: _isStreaming
                  ? Text(
                      '${_currentTrial.digits[_streamIndex]}',
                      style: const TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        color: DesignSystem.primary,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PROBE: ${_currentTrial.probeDigit}',
                          style: const TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: DesignSystem.gameIndigo,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Icon(Icons.arrow_forward_rounded, size: 28),
                        const SizedBox(width: 14),
                        Text(
                          _selectedDigit != null ? '$_selectedDigit' : '?',
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 44,
                            fontWeight: FontWeight.w900,
                            color: _selectedDigit != null
                                ? (_selectedDigit == _currentTrial.targetNextDigit ? DesignSystem.success : DesignSystem.error)
                                : colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumpad(ColorScheme colorScheme) {
    return Column(
      children: [
        for (int r = 0; r < 3; r++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int c = 1; c <= 3; c++) ...[
                  _buildNumBtn(r * 3 + c, colorScheme),
                  if (c < 3) const SizedBox(width: 12),
                ],
              ],
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumBtn(0, colorScheme),
          ],
        ),
      ],
    );
  }

  Widget _buildNumBtn(int num, ColorScheme colorScheme) {
    return SizedBox(
      width: 75,
      height: 52,
      child: TangibleButton(
        color: colorScheme.surface,
        onTap: _isStreaming ? null : () => _submitDigit(num),
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            '$num',
            style: const TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
