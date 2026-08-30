import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'prime_gap_hunt_engine.dart';

class PrimeGapHuntScreen extends ConsumerStatefulWidget {
  const PrimeGapHuntScreen({super.key});

  @override
  ConsumerState<PrimeGapHuntScreen> createState() => _PrimeGapHuntScreenState();
}

class _PrimeGapHuntScreenState extends ConsumerState<PrimeGapHuntScreen> {
  static const int targetScore = 8;

  late PrimeGapQuestion _currentQuestion;
  int _score = 0;
  bool _isGameOver = false;
  int? _selectedChoice;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _score = 0;
      _isGameOver = false;
      _selectedChoice = null;
      _currentQuestion = PrimeGapHuntEngine.generateQuestion();
    });
  }

  void _selectChoice(int choice) {
    if (_isGameOver || _selectedChoice != null) return;

    final isCorrect = choice == _currentQuestion.correctGap;
    setState(() {
      _selectedChoice = choice;
    });

    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('prime_gap_hunt');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 350), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = PrimeGapHuntEngine.generateQuestion();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = PrimeGapHuntEngine.generateQuestion();
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
        title: l10n.primeGapHuntWinTitle,
        message: l10n.primeGapHuntWinMessage,
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
      title: l10n.primeGapHuntTitle,
      subtitle: l10n.primeGapHuntSubtitle,
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
              _buildPrimePairCard(colorScheme),
              const Spacer(flex: 2),
              _buildChoicesGrid(colorScheme),
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
              const Icon(Icons.calculate_rounded, size: 18, color: DesignSystem.gameIndigo),
              const SizedBox(width: 6),
              Text(
                'PRIME GAPS',
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

  Widget _buildPrimePairCard(ColorScheme colorScheme) {
    return TangibleContainer(
      width: double.infinity,
      color: colorScheme.surface,
      radius: DesignSystem.radiusLG,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      child: Column(
        children: [
          Text(
            'FIND THE GAP BETWEEN CONSECUTIVE PRIMES',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPrimeBadge(_currentQuestion.p1, colorScheme),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Icon(Icons.compare_arrows_rounded, size: 32, color: DesignSystem.primary),
                    Text(
                      'GAP: ?',
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              _buildPrimeBadge(_currentQuestion.p2, colorScheme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrimeBadge(int val, ColorScheme colorScheme) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: DesignSystem.gameIndigo.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: DesignSystem.gameIndigo, width: 2),
      ),
      child: Center(
        child: Text(
          '$val',
          style: const TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: DesignSystem.gameIndigo,
          ),
        ),
      ),
    );
  }

  Widget _buildChoicesGrid(ColorScheme colorScheme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: DesignSystem.spaceMD,
        mainAxisSpacing: DesignSystem.spaceMD,
        childAspectRatio: 2.2,
      ),
      itemCount: _currentQuestion.choices.length,
      itemBuilder: (context, idx) {
        final choice = _currentQuestion.choices[idx];
        final isSelected = _selectedChoice == choice;
        final isCorrect = _currentQuestion.correctGap == choice;

        Color btnColor = colorScheme.surface;
        Color textColor = colorScheme.onSurface;

        if (_selectedChoice != null) {
          if (isCorrect) {
            btnColor = DesignSystem.success.withValues(alpha: 0.2);
            textColor = DesignSystem.success;
          } else if (isSelected) {
            btnColor = DesignSystem.error.withValues(alpha: 0.2);
            textColor = DesignSystem.error;
          }
        }

        return TangibleButton(
          color: btnColor,
          onTap: () => _selectChoice(choice),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              '$choice',
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
