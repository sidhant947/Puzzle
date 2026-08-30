import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'algebraic_inequality_solver_engine.dart';

class AlgebraicInequalitySolverScreen extends ConsumerStatefulWidget {
  const AlgebraicInequalitySolverScreen({super.key});

  @override
  ConsumerState<AlgebraicInequalitySolverScreen> createState() => _AlgebraicInequalitySolverScreenState();
}

class _AlgebraicInequalitySolverScreenState extends ConsumerState<AlgebraicInequalitySolverScreen> {
  static const int targetScore = 8;

  late InequalityQuestion _currentQuestion;
  int _score = 0;
  bool _isGameOver = false;
  String? _selectedChoice;

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
      _currentQuestion = AlgebraicInequalitySolverEngine.generateQuestion();
    });
  }

  void _selectChoice(String choice) {
    if (_isGameOver || _selectedChoice != null) return;

    final isCorrect = choice == _currentQuestion.simplifiedSolution;
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
        ref.read(gameStreakNotifierProvider.notifier).completeGame('algebraic_inequality_solver');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = AlgebraicInequalitySolverEngine.generateQuestion();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = AlgebraicInequalitySolverEngine.generateQuestion();
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
        title: l10n.algebraicInequalitySolverWinTitle,
        message: l10n.algebraicInequalitySolverWinMessage,
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
      title: l10n.algebraicInequalitySolverTitle,
      subtitle: l10n.algebraicInequalitySolverSubtitle,
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
              _buildInequalityCard(colorScheme),
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
              const Icon(Icons.code_rounded, size: 18, color: DesignSystem.gameIndigo),
              const SizedBox(width: 6),
              Text(
                'INEQUALITIES',
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

  Widget _buildInequalityCard(ColorScheme colorScheme) {
    return TangibleContainer(
      width: double.infinity,
      color: colorScheme.surface,
      radius: DesignSystem.radiusLG,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      child: Column(
        children: [
          Text(
            'SOLVE FOR X',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _currentQuestion.inequalityString,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: colorScheme.primary,
              letterSpacing: 2.0,
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
        final isCorrect = _currentQuestion.simplifiedSolution == choice;

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
              choice,
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
