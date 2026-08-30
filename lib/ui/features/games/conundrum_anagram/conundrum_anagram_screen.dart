import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'conundrum_anagram_engine.dart';

class ConundrumAnagramScreen extends ConsumerStatefulWidget {
  const ConundrumAnagramScreen({super.key});

  @override
  ConsumerState<ConundrumAnagramScreen> createState() => _ConundrumAnagramScreenState();
}

class _ConundrumAnagramScreenState extends ConsumerState<ConundrumAnagramScreen> {
  static const int targetScore = 5;

  late ConundrumRound _currentRound;
  int _score = 0;
  bool _isGameOver = false;
  final List<int> _selectedIndices = [];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _score = 0;
      _isGameOver = false;
      _loadNewRound();
    });
  }

  void _loadNewRound() {
    setState(() {
      _selectedIndices.clear();
      _currentRound = ConundrumAnagramEngine.generateRound();
    });
  }

  void _selectLetter(int idx) {
    if (_isGameOver || _selectedIndices.contains(idx)) return;

    HapticFeedbackUtil.selectionClick();
    setState(() {
      _selectedIndices.add(idx);
    });

    if (_selectedIndices.length == _currentRound.letterPool.length) {
      _checkWord();
    }
  }

  void _unselectLetter() {
    if (_isGameOver || _selectedIndices.isEmpty) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedIndices.removeLast();
    });
  }

  void _checkWord() {
    final candidate = _selectedIndices.map((i) => _currentRound.letterPool[i]).join('');
    final isCorrect = candidate == _currentRound.solution;

    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('conundrum_anagram');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted && !_isGameOver) {
          _loadNewRound();
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedIndices.clear();
          });
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
        title: l10n.conundrumAnagramWinTitle,
        message: l10n.conundrumAnagramWinMessage,
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
      title: l10n.conundrumAnagramTitle,
      subtitle: l10n.conundrumAnagramSubtitle,
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
              _buildSlotsDisplay(colorScheme),
              const Spacer(flex: 2),
              _buildLetterPool(colorScheme),
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
              const Icon(Icons.spellcheck_rounded, size: 18, color: DesignSystem.gameRose),
              const SizedBox(width: 6),
              Text(
                '9-LETTER CONUNDRUM',
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

  Widget _buildSlotsDisplay(ColorScheme colorScheme) {
    final len = _currentRound.letterPool.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'UNSCRAMBLE THE 9-LETTER WORD',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(len, (i) {
                final hasLetter = i < _selectedIndices.length;
                final letter = hasLetter ? _currentRound.letterPool[_selectedIndices[i]] : '';

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 32,
                  height: 44,
                  decoration: BoxDecoration(
                    color: hasLetter ? DesignSystem.primary.withValues(alpha: 0.15) : colorScheme.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    border: Border.all(
                      color: hasLetter ? DesignSystem.primary : colorScheme.outline.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: DesignSystem.primary,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLetterPool(ColorScheme colorScheme) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: List.generate(_currentRound.letterPool.length, (idx) {
            final letter = _currentRound.letterPool[idx];
            final isUsed = _selectedIndices.contains(idx);

            return Opacity(
              opacity: isUsed ? 0.3 : 1.0,
              child: SizedBox(
                width: 55,
                height: 55,
                child: TangibleButton(
                  color: colorScheme.surface,
                  onTap: isUsed ? null : () => _selectLetter(idx),
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        TangibleButton(
          color: colorScheme.surface,
          onTap: _unselectLetter,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.backspace_rounded, size: 20),
              SizedBox(width: 8),
              Text(
                'BACKSPACE',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
