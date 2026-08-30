import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'exponent_tower_engine.dart';

class ExponentTowerScreen extends ConsumerStatefulWidget {
  const ExponentTowerScreen({super.key});

  @override
  ConsumerState<ExponentTowerScreen> createState() => _ExponentTowerScreenState();
}

class _ExponentTowerScreenState extends ConsumerState<ExponentTowerScreen> {
  static const int targetScore = 8;

  late ExponentTowerRound _currentRound;
  late List<PowerItem> _userTower;
  late List<PowerItem> _availablePool;
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
      _loadNewRound();
    });
  }

  void _loadNewRound() {
    final count = _score < 3 ? 3 : (_score < 6 ? 4 : 5);
    _currentRound = ExponentTowerEngine.generateRound(count: count);
    _userTower = [];
    _availablePool = List.from(_currentRound.items);
  }

  void _addToTower(PowerItem item) {
    if (_isGameOver) return;
    HapticFeedbackUtil.selectionClick();
    setState(() {
      _availablePool.remove(item);
      _userTower.add(item);
    });

    if (_availablePool.isEmpty) {
      _checkSubmission();
    }
  }

  void _removeFromTower(PowerItem item) {
    if (_isGameOver) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _userTower.remove(item);
      _availablePool.add(item);
    });
  }

  void _checkSubmission() {
    bool isAscending = true;
    for (int i = 0; i < _userTower.length - 1; i++) {
      if (_userTower[i].value > _userTower[i + 1].value) {
        isAscending = false;
        break;
      }
    }

    if (isAscending) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('exponent_tower');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _loadNewRound();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not in ascending order! Tap items in the tower to adjust.'),
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
        title: l10n.exponentTowerWinTitle,
        message: l10n.exponentTowerWinMessage,
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
      title: l10n.exponentTowerTitle,
      subtitle: l10n.exponentTowerSubtitle,
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
              Text(
                'BUILD FROM SMALLEST TO LARGEST (BOTTOM TO TOP)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildTowerDropZone(colorScheme)),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildPoolArea(colorScheme),
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
              const Icon(Icons.flash_on_rounded, size: 18, color: DesignSystem.gameIndigo),
              const SizedBox(width: 6),
              Text(
                'EXPONENTS',
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

  Widget _buildTowerDropZone(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_userTower.isEmpty)
            Expanded(
              child: Center(
                child: Text(
                  'TAP POWER BLOCKS BELOW TO STACK TOWER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ),
            )
          else
            ...List.generate(_userTower.length, (idx) {
              // Top of tower is last in list
              final item = _userTower[_userTower.length - 1 - idx];
              final levelNum = _userTower.length - idx;

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () => _removeFromTower(item),
                  child: Container(
                    width: 220.0 + (idx * 20),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: DesignSystem.gameIndigo.withValues(alpha: 0.15 + (idx * 0.05)),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                      border: Border.all(color: DesignSystem.gameIndigo, width: 1.5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '#$levelNum  ',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: DesignSystem.gameIndigo,
                            ),
                          ),
                          _buildPowerText(item.base, item.exp, DesignSystem.gameIndigo, 24),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildPoolArea(ColorScheme colorScheme) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: _availablePool.map((item) {
        return TangibleButton(
          color: colorScheme.surface,
          onTap: () => _addToTower(item),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: _buildPowerText(item.base, item.exp, colorScheme.onSurface, 26),
        );
      }).toList(),
    );
  }

  Widget _buildPowerText(int base, int exp, Color color, double fontSize) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$base',
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: color,
            height: 1.0,
          ),
        ),
        Text(
          '$exp',
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: fontSize * 0.65,
            fontWeight: FontWeight.w700,
            color: color,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
