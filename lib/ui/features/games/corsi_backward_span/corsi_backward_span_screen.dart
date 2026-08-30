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
import 'corsi_backward_span_engine.dart';

class CorsiBackwardSpanScreen extends ConsumerStatefulWidget {
  const CorsiBackwardSpanScreen({super.key});

  @override
  ConsumerState<CorsiBackwardSpanScreen> createState() => _CorsiBackwardSpanScreenState();
}

class _CorsiBackwardSpanScreenState extends ConsumerState<CorsiBackwardSpanScreen> {
  static const int targetScore = 6;

  late CorsiBackwardRound _currentRound;
  int _score = 0;
  int _streamIndex = 0;
  bool _isDemonstrating = true;
  bool _isGameOver = false;
  final List<int> _playerSequence = [];
  Timer? _demonstrationTimer;

  // 9 Spatial coordinates for Corsi Blocks
  final List<List<double>> _blockPositions = [
    [0.15, 0.15], [0.5, 0.1], [0.82, 0.2],
    [0.25, 0.45], [0.55, 0.5], [0.85, 0.55],
    [0.12, 0.8], [0.45, 0.82], [0.78, 0.85],
  ];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  void dispose() {
    _demonstrationTimer?.cancel();
    super.dispose();
  }

  void _startNewGame() {
    _demonstrationTimer?.cancel();
    setState(() {
      _score = 0;
      _isGameOver = false;
      _loadNewRound();
    });
  }

  void _loadNewRound() {
    _demonstrationTimer?.cancel();
    final len = 3 + (_score ~/ 2);
    setState(() {
      _currentRound = CorsiBackwardSpanEngine.generateRound(length: len);
      _playerSequence.clear();
      _streamIndex = -1;
      _isDemonstrating = true;
    });

    int step = 0;
    _demonstrationTimer = Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (step < _currentRound.blockSequence.length) {
        if (mounted) {
          setState(() {
            _streamIndex = _currentRound.blockSequence[step];
          });
        }
        step++;
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              _streamIndex = -1;
              _isDemonstrating = false;
            });
          }
        });
      }
    });
  }

  void _tapBlock(int index) {
    if (_isGameOver || _isDemonstrating) return;

    HapticFeedbackUtil.selectionClick();
    setState(() {
      _playerSequence.add(index);
    });

    final expectedSequence = _currentRound.blockSequence.reversed.toList();
    final currentIdx = _playerSequence.length - 1;

    if (_playerSequence[currentIdx] != expectedSequence[currentIdx]) {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          _loadNewRound();
        }
      });
      return;
    }

    if (_playerSequence.length == expectedSequence.length) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('corsi_backward_span');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          _loadNewRound();
        }
      });
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.corsiBackwardSpanWinTitle,
        message: l10n.corsiBackwardSpanWinMessage,
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
      title: l10n.corsiBackwardSpanTitle,
      subtitle: l10n.corsiBackwardSpanSubtitle,
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
              _buildPromptBanner(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildCorsiArena(colorScheme)),
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
                _isDemonstrating ? Icons.visibility_rounded : Icons.undo_rounded,
                size: 18,
                color: DesignSystem.gameIndigo,
              ),
              const SizedBox(width: 6),
              Text(
                _isDemonstrating ? 'WATCH SEQUENCE' : 'RECALL IN REVERSE',
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

  Widget _buildPromptBanner(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 1.5),
      ),
      child: Center(
        child: Text(
          _isDemonstrating
              ? 'MEMORIZE SPATIAL BLOCK FLASHES'
              : 'TAP BLOCKS IN REVERSE (BACKWARD) ORDER: ${_playerSequence.length} / ${_currentRound.blockSequence.length}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Geist',
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: _isDemonstrating ? colorScheme.onSurface.withValues(alpha: 0.6) : DesignSystem.primary,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildCorsiArena(ColorScheme colorScheme) {
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
            children: List.generate(9, (idx) {
              final pos = _blockPositions[idx];
              final isLit = _streamIndex == idx;
              final isPlayerTapped = _playerSequence.contains(idx);

              return Positioned(
                left: pos[0] * (w - 60),
                top: pos[1] * (h - 60),
                child: GestureDetector(
                  onTap: () => _tapBlock(idx),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: isLit
                          ? DesignSystem.accentEmerald
                          : (isPlayerTapped ? DesignSystem.gameIndigo : colorScheme.surface),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      border: Border.all(
                        color: isLit
                            ? DesignSystem.accentEmerald
                            : (isPlayerTapped ? DesignSystem.gameIndigo : colorScheme.outline.withValues(alpha: 0.4)),
                        width: 2,
                      ),
                      boxShadow: isLit
                          ? [
                              BoxShadow(
                                color: DesignSystem.accentEmerald.withValues(alpha: 0.6),
                                blurRadius: 16,
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
