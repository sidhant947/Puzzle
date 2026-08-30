import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'modular_clock_arithmetic_engine.dart';

class ModularClockArithmeticScreen extends ConsumerStatefulWidget {
  const ModularClockArithmeticScreen({super.key});

  @override
  ConsumerState<ModularClockArithmeticScreen> createState() => _ModularClockArithmeticScreenState();
}

class _ModularClockArithmeticScreenState extends ConsumerState<ModularClockArithmeticScreen> {
  static const int targetScore = 8;

  late ModularClockQuestion _currentQuestion;
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
      _currentQuestion = ModularClockArithmeticEngine.generateQuestion();
    });
  }

  void _selectChoice(int choice) {
    if (_isGameOver || _selectedChoice != null) return;

    final isCorrect = choice == _currentQuestion.resultHour;
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
        ref.read(gameStreakNotifierProvider.notifier).completeGame('modular_clock_arithmetic');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 350), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = ModularClockArithmeticEngine.generateQuestion();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = ModularClockArithmeticEngine.generateQuestion();
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
        title: l10n.modularClockArithmeticWinTitle,
        message: l10n.modularClockArithmeticWinMessage,
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
      title: l10n.modularClockArithmeticTitle,
      subtitle: l10n.modularClockArithmeticSubtitle,
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
              _buildClockDisplay(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                'WHAT HOUR WILL IT BE IN ${_currentQuestion.addHours} HOURS?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildChoicesGrid(colorScheme)),
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
              const Icon(Icons.schedule_rounded, size: 18, color: DesignSystem.gameIndigo),
              const SizedBox(width: 6),
              Text(
                'CLOCK MOD 12',
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

  Widget _buildClockDisplay(ColorScheme colorScheme) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        shape: BoxShape.circle,
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 3),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Clock numbers 1 to 12
          ...List.generate(12, (i) {
            final hour = i + 1;
            final angle = (hour * 30 - 90) * math.pi / 180;
            final x = 60 * math.cos(angle);
            final y = 60 * math.sin(angle);

            return Transform.translate(
              offset: Offset(x, y),
              child: Text(
                '$hour',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            );
          }),
          // Hand pointing to current hour
          Transform.rotate(
            angle: (_currentQuestion.currentHour * 30) * math.pi / 180,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 28),
                width: 4,
                height: 55,
                decoration: BoxDecoration(
                  color: DesignSystem.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          // Center pin
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: DesignSystem.primary,
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
        childAspectRatio: 2.0,
      ),
      itemCount: _currentQuestion.choices.length,
      itemBuilder: (context, idx) {
        final choice = _currentQuestion.choices[idx];
        final isSelected = _selectedChoice == choice;
        final isCorrect = _currentQuestion.resultHour == choice;

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
              '$choice:00',
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
