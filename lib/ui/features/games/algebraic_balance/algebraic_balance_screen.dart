import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

enum EquationSymbol { star, heart, sun }

class AlgebraicBalanceScreen extends ConsumerStatefulWidget {
  const AlgebraicBalanceScreen({super.key});

  @override
  ConsumerState<AlgebraicBalanceScreen> createState() => _AlgebraicBalanceScreenState();
}

class _AlgebraicBalanceScreenState extends ConsumerState<AlgebraicBalanceScreen> {
  final Random _random = Random();

  // Variables values (secret values)
  late int _starValue;
  late int _heartValue;
  late int _sunValue;

  // Equation 1 parameters: A * Star + B * Heart = val1
  late int _eq1StarCoeff;
  late int _eq1HeartCoeff;
  late int _eq1Value;

  // Equation 2 parameters: C * Star + D * Sun = val2
  late int _eq2StarCoeff;
  late int _eq2SunCoeff;
  late int _eq2Value;

  // Target parameters: E * Heart + F * Sun = ?
  late int _targetHeartCoeff;
  late int _targetSunCoeff;
  late int _correctAnswer;

  late List<int> _options;

  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate secret integer values for symbols
    _starValue = _random.nextInt(6) + 2; // 2 to 7
    _heartValue = _random.nextInt(6) + 2; // 2 to 7
    _sunValue = _random.nextInt(6) + 2; // 2 to 7

    // Keep coefficients small (1 or 2)
    _eq1StarCoeff = _random.nextInt(2) + 1; // 1 or 2
    _eq1HeartCoeff = _random.nextInt(2) + 1;
    _eq1Value = _eq1StarCoeff * _starValue + _eq1HeartCoeff * _heartValue;

    _eq2StarCoeff = _random.nextInt(2) + 1;
    _eq2SunCoeff = _random.nextInt(2) + 1;
    _eq2Value = _eq2StarCoeff * _starValue + _eq2SunCoeff * _sunValue;

    _targetHeartCoeff = _random.nextInt(2) + 1;
    _targetSunCoeff = _random.nextInt(2) + 1;
    _correctAnswer = _targetHeartCoeff * _heartValue + _targetSunCoeff * _sunValue;

    // Generate multiple choice options
    final set = <int>{_correctAnswer};
    while (set.length < 4) {
      int distractor = _correctAnswer + (_random.nextInt(7) - 3); // offset -3 to +3
      if (distractor > 0 && distractor != _correctAnswer) {
        set.add(distractor);
      }
    }
    _options = set.toList()..shuffle(_random);
  }

  void _onAnswerSelected(int selected) {
    if (_isGameOver) return;

    if (selected == _correctAnswer) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      _score = max(0, _score - 1);
      setState(() {
        _generatePuzzle();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('algebraic_balance');
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: AppLocalizations.of(context)!.wellDone.toUpperCase(),
        message: AppLocalizations.of(context)!.completed,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() {
            _score = 0;
            _isGameOver = false;
            _generatePuzzle();
          });
        },
      ),
    );
  }

  IconData _getSymbolIcon(EquationSymbol symbol) {
    switch (symbol) {
      case EquationSymbol.star:
        return Icons.star_rounded;
      case EquationSymbol.heart:
        return Icons.favorite_rounded;
      case EquationSymbol.sun:
        return Icons.wb_sunny_rounded;
    }
  }

  Color _getSymbolColor(EquationSymbol symbol) {
    switch (symbol) {
      case EquationSymbol.star:
        return DesignSystem.gameAmber;
      case EquationSymbol.heart:
        return DesignSystem.gameRose;
      case EquationSymbol.sun:
        return DesignSystem.gameOrange;
    }
  }

  Widget _buildExpressionList(int starCoeff, int heartCoeff, int sunCoeff) {
    List<Widget> children = [];

    // Add star widgets
    for (int i = 0; i < starCoeff; i++) {
      children.add(Icon(_getSymbolIcon(EquationSymbol.star), color: _getSymbolColor(EquationSymbol.star), size: 30));
      if (i < starCoeff - 1) children.add(const Text(' + '));
    }

    if (starCoeff > 0 && (heartCoeff > 0 || sunCoeff > 0)) {
      children.add(const Text(' + '));
    }

    // Add heart widgets
    for (int i = 0; i < heartCoeff; i++) {
      children.add(Icon(_getSymbolIcon(EquationSymbol.heart), color: _getSymbolColor(EquationSymbol.heart), size: 30));
      if (i < heartCoeff - 1) children.add(const Text(' + '));
    }

    if (heartCoeff > 0 && sunCoeff > 0) {
      children.add(const Text(' + '));
    }

    // Add sun widgets
    for (int i = 0; i < sunCoeff; i++) {
      children.add(Icon(_getSymbolIcon(EquationSymbol.sun), color: _getSymbolColor(EquationSymbol.sun), size: 30));
      if (i < sunCoeff - 1) children.add(const Text(' + '));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'algebraic_balance'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'algebraic_balance'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                // Score card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: DesignSystem.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 30),
                // Equation List Card
                Card(
                  elevation: 0,
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    side: BorderSide(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        // Equation 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildExpressionList(_eq1StarCoeff, _eq1HeartCoeff, 0),
                            Text(' = $_eq1Value', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Equation 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildExpressionList(_eq2StarCoeff, 0, _eq2SunCoeff),
                            Text(' = $_eq2Value', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Target Equation Question
                Text(
                  'FIND THE VALUE OF:',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(letterSpacing: 1.0),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildExpressionList(0, _targetHeartCoeff, _targetSunCoeff),
                    const Text(' =  ?', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 40),
                // Options Grid
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: _options.map((opt) {
                    return SizedBox(
                      width: 130,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _onAnswerSelected(opt),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                          side: BorderSide(
                            color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                          ),
                        ),
                        child: Text(
                          '$opt',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
