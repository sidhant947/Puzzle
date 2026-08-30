import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'binary_matrix_rank_engine.dart';

class BinaryMatrixRankScreen extends ConsumerStatefulWidget {
  const BinaryMatrixRankScreen({super.key});

  @override
  ConsumerState<BinaryMatrixRankScreen> createState() => _BinaryMatrixRankScreenState();
}

class _BinaryMatrixRankScreenState extends ConsumerState<BinaryMatrixRankScreen> {
  static const int targetScore = 8;

  late BinaryMatrixRankQuestion _currentQuestion;
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
      _currentQuestion = BinaryMatrixRankEngine.generateQuestion();
    });
  }

  void _selectChoice(int choice) {
    if (_isGameOver || _selectedChoice != null) return;

    final isCorrect = choice == _currentQuestion.rank;
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
        ref.read(gameStreakNotifierProvider.notifier).completeGame('binary_matrix_rank');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 350), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = BinaryMatrixRankEngine.generateQuestion();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedChoice = null;
            _currentQuestion = BinaryMatrixRankEngine.generateQuestion();
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
        title: l10n.binaryMatrixRankWinTitle,
        message: l10n.binaryMatrixRankWinMessage,
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
      title: l10n.binaryMatrixRankTitle,
      subtitle: l10n.binaryMatrixRankSubtitle,
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
              _buildMatrixCard(colorScheme),
              const Spacer(flex: 2),
              _buildChoicesRow(colorScheme),
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
              const Icon(Icons.grid_3x3_rounded, size: 18, color: DesignSystem.gameIndigo),
              const SizedBox(width: 6),
              Text(
                'MATRIX RANK',
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

  Widget _buildMatrixCard(ColorScheme colorScheme) {
    final matrix = _currentQuestion.matrix;

    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'BINARY MATRIX (GF2)',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 9,
            itemBuilder: (context, idx) {
              final r = idx ~/ 3;
              final c = idx % 3;
              final val = matrix[r][c];

              return Container(
                decoration: BoxDecoration(
                  color: val == 1 ? DesignSystem.gameIndigo.withValues(alpha: 0.15) : colorScheme.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  border: Border.all(
                    color: val == 1 ? DesignSystem.gameIndigo : colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
                child: Center(
                  child: Text(
                    '$val',
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: val == 1 ? DesignSystem.gameIndigo : colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChoicesRow(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [1, 2, 3].map((choice) {
        final isSelected = _selectedChoice == choice;
        final isCorrect = _currentQuestion.rank == choice;

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

        return SizedBox(
          width: 90,
          child: TangibleButton(
            color: btnColor,
            onTap: () => _selectChoice(choice),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                'RANK $choice',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
