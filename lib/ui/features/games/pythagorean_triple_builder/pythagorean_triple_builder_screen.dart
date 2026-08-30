import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'pythagorean_triple_builder_engine.dart';

class PythagoreanTripleBuilderScreen extends ConsumerStatefulWidget {
  const PythagoreanTripleBuilderScreen({super.key});

  @override
  ConsumerState<PythagoreanTripleBuilderScreen> createState() => _PythagoreanTripleBuilderScreenState();
}

class _PythagoreanTripleBuilderScreenState extends ConsumerState<PythagoreanTripleBuilderScreen> {
  static const int targetScore = 8;

  late PythagoreanQuestion _currentQuestion;
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
      _currentQuestion = PythagoreanTripleBuilderEngine.generateQuestion();
    });
  }

  void _selectChoice(int choice) {
    if (_isGameOver || _selectedChoice != null) return;

    final isCorrect = choice == _currentQuestion.correctValue;
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
        ref.read(gameStreakNotifierProvider.notifier).completeGame('pythagorean_triple_builder');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 350), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = PythagoreanTripleBuilderEngine.generateQuestion();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = PythagoreanTripleBuilderEngine.generateQuestion();
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
        title: l10n.pythagoreanTripleBuilderWinTitle,
        message: l10n.pythagoreanTripleBuilderWinMessage,
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
      title: l10n.pythagoreanTripleBuilderTitle,
      subtitle: l10n.pythagoreanTripleBuilderSubtitle,
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
              _buildTriangleDisplay(colorScheme),
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
              const Icon(Icons.change_history_rounded, size: 18, color: DesignSystem.gameIndigo),
              const SizedBox(width: 6),
              Text(
                'PYTHAGORAS',
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

  Widget _buildTriangleDisplay(ColorScheme colorScheme) {
    final aLabel = _currentQuestion.missingIndex == 0 ? '?' : '${_currentQuestion.a}';
    final bLabel = _currentQuestion.missingIndex == 1 ? '?' : '${_currentQuestion.b}';
    final cLabel = _currentQuestion.missingIndex == 2 ? '?' : '${_currentQuestion.c}';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'FIND THE MISSING SIDE (a² + b² = c²)',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSideCard('LEG a', aLabel, _currentQuestion.missingIndex == 0, colorScheme),
              const Text('+', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              _buildSideCard('LEG b', bLabel, _currentQuestion.missingIndex == 1, colorScheme),
              const Text('=', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              _buildSideCard('HYP c', cLabel, _currentQuestion.missingIndex == 2, colorScheme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSideCard(String tag, String val, bool isMissing, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isMissing ? DesignSystem.primary.withValues(alpha: 0.15) : colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: isMissing ? DesignSystem.primary : colorScheme.outline.withValues(alpha: 0.4),
          width: isMissing ? 2.5 : 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            tag,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isMissing ? DesignSystem.primary : colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            val,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: isMissing ? DesignSystem.primary : colorScheme.onSurface,
            ),
          ),
        ],
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
        final isCorrect = _currentQuestion.correctValue == choice;

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
                letterSpacing: 1.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
