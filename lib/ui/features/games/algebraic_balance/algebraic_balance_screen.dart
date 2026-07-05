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

  late int _starValue;
  late int _heartValue;
  late int _sunValue;

  // Equation 1: A * Star + B * Heart = val1
  late int _eq1StarCoeff;
  late int _eq1HeartCoeff;
  late int _eq1Value;

  // Equation 2: C * Star + D * Sun = val2
  late int _eq2StarCoeff;
  late int _eq2SunCoeff;
  late int _eq2Value;

  // Equation 3: E * Heart + F * Sun = val3
  late int _eq3HeartCoeff;
  late int _eq3SunCoeff;
  late int _eq3Value;

  late EquationSymbol _questionSymbol;
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
    for (int attempt = 0; attempt < 500; attempt++) {
      _starValue = _random.nextInt(6) + 2;
      _heartValue = _random.nextInt(6) + 2;
      _sunValue = _random.nextInt(6) + 2;

      _eq1StarCoeff = _random.nextInt(2) + 1;
      _eq1HeartCoeff = _random.nextInt(2) + 1;
      _eq1Value = _eq1StarCoeff * _starValue + _eq1HeartCoeff * _heartValue;

      _eq2StarCoeff = _random.nextInt(2) + 1;
      _eq2SunCoeff = _random.nextInt(2) + 1;
      _eq2Value = _eq2StarCoeff * _starValue + _eq2SunCoeff * _sunValue;

      _eq3HeartCoeff = _random.nextInt(2) + 1;
      _eq3SunCoeff = _random.nextInt(2) + 1;
      _eq3Value = _eq3HeartCoeff * _heartValue + _eq3SunCoeff * _sunValue;

      if (_hasUniqueSolution()) break;
    }

    final symbols = EquationSymbol.values;
    _questionSymbol = symbols[_random.nextInt(symbols.length)];

    switch (_questionSymbol) {
      case EquationSymbol.star:
        _correctAnswer = _starValue;
      case EquationSymbol.heart:
        _correctAnswer = _heartValue;
      case EquationSymbol.sun:
        _correctAnswer = _sunValue;
    }

    final set = <int>{_correctAnswer};
    final candidates = <int>[];
    for (int d = 2; d <= 7; d++) {
      if (d != _correctAnswer) candidates.add(d);
    }
    candidates.shuffle(_random);
    set.addAll(candidates.take(3));
    _options = set.toList()..shuffle(_random);
  }

  bool _hasUniqueSolution() {
    int count = 0;
    for (int s = 2; s <= 7; s++) {
      for (int h = 2; h <= 7; h++) {
        if (_eq1StarCoeff * s + _eq1HeartCoeff * h != _eq1Value) continue;
        for (int u = 2; u <= 7; u++) {
          if (_eq2StarCoeff * s + _eq2SunCoeff * u == _eq2Value &&
              _eq3HeartCoeff * h + _eq3SunCoeff * u == _eq3Value) {
            count++;
            if (count > 1) return false;
          }
        }
      }
    }
    return count == 1;
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

  Widget _buildTerm(int coeff, EquationSymbol symbol) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (coeff > 1)
          Text(
            '$coeff',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: _getSymbolColor(symbol),
            ),
          ),
        Icon(_getSymbolIcon(symbol), color: _getSymbolColor(symbol), size: 30),
      ],
    );
  }

  Widget _buildExpression(int starCoeff, int heartCoeff, int sunCoeff) {
    List<Widget> children = [];

    if (starCoeff > 0) children.add(_buildTerm(starCoeff, EquationSymbol.star));
    if (heartCoeff > 0) {
      if (children.isNotEmpty) children.add(const Text(' + '));
      children.add(_buildTerm(heartCoeff, EquationSymbol.heart));
    }
    if (sunCoeff > 0) {
      if (children.isNotEmpty) children.add(const Text(' + '));
      children.add(_buildTerm(sunCoeff, EquationSymbol.sun));
    }

    return Row(mainAxisSize: MainAxisSize.min, children: children);
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildExpression(_eq1StarCoeff, _eq1HeartCoeff, 0),
                            Text(' = $_eq1Value', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildExpression(_eq2StarCoeff, 0, _eq2SunCoeff),
                            Text(' = $_eq2Value', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildExpression(0, _eq3HeartCoeff, _eq3SunCoeff),
                            Text(' = $_eq3Value', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'WHAT IS THE VALUE OF:',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(letterSpacing: 1.0),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_getSymbolIcon(_questionSymbol), color: _getSymbolColor(_questionSymbol), size: 40),
                    const Text(' =  ?', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 30),
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
