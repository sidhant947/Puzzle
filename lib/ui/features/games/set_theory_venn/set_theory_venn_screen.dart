import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'set_theory_venn_engine.dart';

class SetTheoryVennScreen extends ConsumerStatefulWidget {
  const SetTheoryVennScreen({super.key});

  @override
  ConsumerState<SetTheoryVennScreen> createState() => _SetTheoryVennScreenState();
}

class _SetTheoryVennScreenState extends ConsumerState<SetTheoryVennScreen> {
  static const int targetScore = 8;

  late SetVennQuestion _currentQuestion;
  final Set<VennRegion> _selectedRegions = {};
  int _score = 0;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _score = 0;
      _isGameOver = false;
      _loadNewQuestion();
    });
  }

  void _loadNewQuestion() {
    _currentQuestion = SetTheoryVennEngine.generateQuestion();
    _selectedRegions.clear();
  }

  void _toggleRegion(VennRegion region) {
    if (_isGameOver) return;
    HapticFeedbackUtil.selectionClick();
    setState(() {
      if (_selectedRegions.contains(region)) {
        _selectedRegions.remove(region);
      } else {
        _selectedRegions.add(region);
      }
    });
  }

  void _submitAnswer() {
    if (_isGameOver) return;

    final isCorrect = _selectedRegions.length == _currentQuestion.correctRegions.length &&
        _selectedRegions.difference(_currentQuestion.correctRegions).isEmpty;

    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('set_theory_venn');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _loadNewQuestion();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect regions selected! Try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.setTheoryVennWinTitle,
        message: l10n.setTheoryVennWinMessage,
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
      title: l10n.setTheoryVennTitle,
      subtitle: l10n.setTheoryVennSubtitle,
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
              _buildFormulaBanner(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildVennDiagram(colorScheme)),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildSubmitButton(colorScheme),
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
              const Icon(Icons.blur_on_rounded, size: 18, color: DesignSystem.gameTeal),
              const SizedBox(width: 6),
              Text(
                'SET THEORY',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gameTeal,
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

  Widget _buildFormulaBanner(ColorScheme colorScheme) {
    return TangibleContainer(
      width: double.infinity,
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          Text(
            'SHADE THE REGION FOR:',
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _currentQuestion.formula,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: colorScheme.primary,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVennDiagram(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Column(
        children: [
          // Outside region button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: TangibleButton(
                color: _selectedRegions.contains(VennRegion.outside)
                    ? DesignSystem.gameTeal.withValues(alpha: 0.2)
                    : colorScheme.surface,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                onTap: () => _toggleRegion(VennRegion.outside),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _selectedRegions.contains(VennRegion.outside)
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      size: 16,
                      color: DesignSystem.gameTeal,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'OUTSIDE (U)',
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRegionButton(VennRegion.onlyA, "ONLY A", colorScheme),
                  const SizedBox(width: 8),
                  _buildRegionButton(VennRegion.intersection, "A ∩ B", colorScheme),
                  const SizedBox(width: 8),
                  _buildRegionButton(VennRegion.onlyB, "ONLY B", colorScheme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionButton(VennRegion region, String label, ColorScheme colorScheme) {
    final isSelected = _selectedRegions.contains(region);

    return GestureDetector(
      onTap: () => _toggleRegion(region),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 88,
        height: 120,
        decoration: BoxDecoration(
          color: isSelected ? DesignSystem.gameTeal.withValues(alpha: 0.3) : colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(
            color: isSelected ? DesignSystem.gameTeal : colorScheme.outline.withValues(alpha: 0.4),
            width: isSelected ? 2.5 : 1.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                color: isSelected ? DesignSystem.gameTeal : colorScheme.onSurface.withValues(alpha: 0.3),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? DesignSystem.gameTeal : colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(ColorScheme colorScheme) {
    return TangibleButton(
      color: DesignSystem.primary,
      width: double.infinity,
      onTap: _submitAnswer,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Center(
        child: Text(
          'SUBMIT SELECTION',
          style: TextStyle(
            fontFamily: 'Geist',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
