import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'navon_hierarchical_engine.dart';

class NavonHierarchicalScreen extends ConsumerStatefulWidget {
  const NavonHierarchicalScreen({super.key});

  @override
  ConsumerState<NavonHierarchicalScreen> createState() => _NavonHierarchicalScreenState();
}

class _NavonHierarchicalScreenState extends ConsumerState<NavonHierarchicalScreen> {
  static const int targetScore = 12;

  late NavonStimulus _currentStimulus;
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
      _currentStimulus = NavonHierarchicalEngine.generateStimulus();
    });
  }

  void _selectLetter(String letter) {
    if (_isGameOver) return;

    final isCorrect = letter == _currentStimulus.targetLetter;
    if (isCorrect) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('navon_hierarchical');
        _showWinDialog();
        return;
      }

      setState(() {
        _currentStimulus = NavonHierarchicalEngine.generateStimulus();
      });
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Watch the rule! Prompt asked for ${_currentStimulus.taskLevel == NavonTaskLevel.global ? "BIG (GLOBAL)" : "SMALL (LOCAL)"} letter.'),
          duration: const Duration(seconds: 2),
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
        title: l10n.navonHierarchicalWinTitle,
        message: l10n.navonHierarchicalWinMessage,
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
      title: l10n.navonHierarchicalTitle,
      subtitle: l10n.navonHierarchicalSubtitle,
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
              _buildTaskPrompt(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildHierarchicalCanvas(colorScheme)),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildResponseGrid(colorScheme),
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
              const Icon(Icons.remove_red_eye_rounded, size: 18, color: DesignSystem.gameAmber),
              const SizedBox(width: 6),
              Text(
                'NAVON TASK',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gameAmber,
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

  Widget _buildTaskPrompt(ColorScheme colorScheme) {
    final isGlobal = _currentStimulus.taskLevel == NavonTaskLevel.global;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: isGlobal
            ? DesignSystem.primary.withValues(alpha: 0.15)
            : DesignSystem.gameRose.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: isGlobal ? DesignSystem.primary : DesignSystem.gameRose,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          isGlobal ? 'IDENTIFY THE LARGE (GLOBAL) LETTER' : 'IDENTIFY THE SMALL (LOCAL) LETTER',
          style: TextStyle(
            fontFamily: 'Geist',
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: isGlobal ? DesignSystem.primary : DesignSystem.gameRose,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }

  Widget _buildHierarchicalCanvas(ColorScheme colorScheme) {
    final shapeGrid = _getGridForLetter(_currentStimulus.globalLetter);
    final local = _currentStimulus.localLetter;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 2),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: shapeGrid.map((row) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: row.map((hasDot) {
                return SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: hasDot
                        ? Text(
                            local,
                            style: TextStyle(
                              fontFamily: 'Geist',
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: colorScheme.onSurface,
                            ),
                          )
                        : null,
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<List<bool>> _getGridForLetter(String letter) {
    // 5x5 letter patterns
    switch (letter) {
      case 'H':
        return [
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
        ];
      case 'S':
        return [
          [true, true, true, true, true],
          [true, false, false, false, false],
          [true, true, true, true, true],
          [false, false, false, false, true],
          [true, true, true, true, true],
        ];
      case 'T':
        return [
          [true, true, true, true, true],
          [false, false, true, false, false],
          [false, false, true, false, false],
          [false, false, true, false, false],
          [false, false, true, false, false],
        ];
      case 'E':
        return [
          [true, true, true, true, true],
          [true, false, false, false, false],
          [true, true, true, true, false],
          [true, false, false, false, false],
          [true, true, true, true, true],
        ];
      case 'L':
        return [
          [true, false, false, false, false],
          [true, false, false, false, false],
          [true, false, false, false, false],
          [true, false, false, false, false],
          [true, true, true, true, true],
        ];
      case 'F':
        return [
          [true, true, true, true, true],
          [true, false, false, false, false],
          [true, true, true, true, false],
          [true, false, false, false, false],
          [true, false, false, false, false],
        ];
      default:
        return List.generate(5, (_) => List.generate(5, (_) => false));
    }
  }

  Widget _buildResponseGrid(ColorScheme colorScheme) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: NavonHierarchicalEngine.letterPool.map((letter) {
        return TangibleButton(
          color: colorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          onTap: () => _selectLetter(letter),
          child: Text(
            letter,
            style: const TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }).toList(),
    );
  }
}
