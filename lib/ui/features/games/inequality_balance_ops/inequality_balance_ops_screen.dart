import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class InequalityBalanceOpsScreen extends ConsumerStatefulWidget {
  const InequalityBalanceOpsScreen({super.key});

  @override
  ConsumerState<InequalityBalanceOpsScreen> createState() => _InequalityBalanceOpsScreenState();
}

class _InequalityBalanceOpsScreenState extends ConsumerState<InequalityBalanceOpsScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late String _leftExpr;
  late String _rightExpr;
  late int _leftVal;
  late int _rightVal;
  late String _correctSymbol;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final leftData = _generateExpressionData();
    _leftExpr = leftData['expr'] as String;
    _leftVal = leftData['val'] as int;

    // Generate right expression. Try to make it somewhat close, or occasionally equal
    Map<String, dynamic> rightData;
    int attempts = 0;
    do {
      rightData = _generateExpressionData();
      attempts++;
    } while (attempts < 10 && ((rightData['val'] as int) - _leftVal).abs() > 30);

    _rightExpr = rightData['expr'] as String;
    _rightVal = rightData['val'] as int;

    if (_leftVal < _rightVal) {
      _correctSymbol = '<';
    } else if (_leftVal > _rightVal) {
      _correctSymbol = '>';
    } else {
      _correctSymbol = '=';
    }
  }

  Map<String, dynamic> _generateExpressionData() {
    int type = _random.nextInt(4);
    String expr = '';
    int val = 0;
    switch (type) {
      case 0: // a * b
        int a = 3 + _random.nextInt(10); // 3 to 12
        int b = 3 + _random.nextInt(10); // 3 to 12
        expr = '$a × $b';
        val = a * b;
        break;
      case 1: // a + b - c
        int a = 15 + _random.nextInt(25);
        int b = 15 + _random.nextInt(25);
        int c = 5 + _random.nextInt(20);
        expr = '$a + $b - $c';
        val = a + b - c;
        break;
      case 2: // a × (b - c)
        int a = 3 + _random.nextInt(6); // 3 to 8
        int b = 8 + _random.nextInt(8); // 8 to 15
        int c = 2 + _random.nextInt(6); // 2 to 7
        expr = '$a × ($b - $c)';
        val = a * (b - c);
        break;
      case 3: // a + b × c
        int a = 10 + _random.nextInt(30);
        int b = 2 + _random.nextInt(6);
        int c = 3 + _random.nextInt(6);
        expr = '$a + $b × $c';
        val = a + b * c;
        break;
    }
    return {'expr': expr, 'val': val};
  }

  void _onAnswer(String symbol) {
    if (_isGameOver) return;

    if (symbol == _correctSymbol) {
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect! $_leftExpr ($_leftVal) $_correctSymbol $_rightExpr ($_rightVal)'),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.redAccent,
        ),
      );
      setState(() {
        _generatePuzzle();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('inequality_balance_ops');
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'INEQUALITY BALANCE',
      subtitle: 'Compare both arithmetic expressions and choose the correct inequality sign.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: DesignSystem.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                ),
                child: Text(
                  'Score: $_score / $_targetScore',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: DesignSystem.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 50),
              // Comparison Row
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left Expression Card
                    _buildExpressionCard(_leftExpr, isDark),
                    const SizedBox(width: 16),
                    // Central sign holder
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white10 : Colors.black12.withOpacity(0.04),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '?',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Right Expression Card
                    _buildExpressionCard(_rightExpr, isDark),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              // Inequality Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSymbolButton('<', isDark),
                  const SizedBox(width: 20),
                  _buildSymbolButton('=', isDark),
                  const SizedBox(width: 20),
                  _buildSymbolButton('>', isDark),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpressionCard(String expr, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
          width: 2,
        ),
      ),
      child: Text(
        expr,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSymbolButton(String symbol, bool isDark) {
    return SizedBox(
      width: 80,
      height: 70,
      child: ElevatedButton(
        onPressed: () => _onAnswer(symbol),
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
          foregroundColor: isDark ? Colors.white : Colors.black87,
          side: BorderSide(
            color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
        ),
        child: Text(
          symbol,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
