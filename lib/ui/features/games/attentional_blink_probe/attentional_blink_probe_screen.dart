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
import 'attentional_blink_probe_engine.dart';

class AttentionalBlinkProbeScreen extends ConsumerStatefulWidget {
  const AttentionalBlinkProbeScreen({super.key});

  @override
  ConsumerState<AttentionalBlinkProbeScreen> createState() => _AttentionalBlinkProbeScreenState();
}

class _AttentionalBlinkProbeScreenState extends ConsumerState<AttentionalBlinkProbeScreen> {
  static const int totalTrials = 10;

  late RSVPStreamTrial _currentTrial;
  int _trialCount = 0;
  int _score = 0;
  int _streamIndex = 0;
  bool _isStreaming = true;
  bool _isGameOver = false;
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
    setState(() {
      _trialCount++;
      _currentTrial = AttentionalBlinkProbeEngine.generateTrial();
      _streamIndex = 0;
      _isStreaming = true;
    });

    _streamTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_streamIndex >= _currentTrial.stream.length - 1) {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 200), () {
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

  void _submitAnswer(bool saidYesT2) {
    if (_isGameOver || _isStreaming) return;

    final isCorrect = saidYesT2 == _currentTrial.t2Present;
    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });
    } else {
      HapticFeedbackUtil.error();
    }

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted && !_isGameOver) {
        _loadNewTrial();
      }
    });
  }

  void _endGame() {
    setState(() {
      _isGameOver = true;
    });
    ref.read(gameStreakNotifierProvider.notifier).completeGame('attentional_blink_probe');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.attentionalBlinkProbeWinTitle,
        message: 'Accuracy: $_score / $totalTrials correct detections under rapid visual presentation!',
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
      title: l10n.attentionalBlinkProbeTitle,
      subtitle: l10n.attentionalBlinkProbeSubtitle,
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
              _buildRSVPStage(colorScheme),
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
              const Icon(Icons.flash_on_rounded, size: 18, color: DesignSystem.gameRose),
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

  Widget _buildRSVPStage(ColorScheme colorScheme) {
    final currentItem = _currentTrial.stream[_streamIndex];

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
            _isStreaming ? 'WATCH FOR LETTER "X" AFTER THE FIRST LETTER' : 'DID YOU SEE THE LETTER "X"?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 80,
            child: Center(
              child: _isStreaming
                  ? Text(
                      currentItem.text,
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        color: currentItem.isT1
                            ? DesignSystem.accentEmerald
                            : colorScheme.onSurface,
                      ),
                    )
                  : const Icon(Icons.help_outline_rounded, size: 54, color: DesignSystem.primary),
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
            onTap: _isStreaming ? null : () => _submitAnswer(true),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_rounded, color: DesignSystem.success, size: 24),
                SizedBox(width: 8),
                Text(
                  'YES ("X" SEEN)',
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
            onTap: _isStreaming ? null : () => _submitAnswer(false),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cancel_rounded, color: DesignSystem.error, size: 24),
                SizedBox(width: 8),
                Text(
                  'NO ("X" ABSENT)',
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
