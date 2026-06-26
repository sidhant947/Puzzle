import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class CryptoArithmeticScreen extends ConsumerStatefulWidget {
  const CryptoArithmeticScreen({super.key});

  @override
  ConsumerState<CryptoArithmeticScreen> createState() => _CryptoArithmeticScreenState();
}

class _CryptoArithmeticScreenState extends ConsumerState<CryptoArithmeticScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late String _equationStr;
  late String _targetLetter;
  late int _correctDigit;
  late Map<String, int> _legend;
  late List<int> _options;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate num1 (10-79) and num2 (10-79) such that sum is 2-digit (20-99)
    int num1 = 10 + _random.nextInt(70);
    int num2 = 10 + _random.nextInt(90 - num1);
    int sum = num1 + num2;

    // Map each digit 0-9 to a unique letter
    const letters = ['A', 'B', 'C', 'D', 'E', 'F', 'H', 'L', 'M', 'P'];
    final shuffledLetters = List<String>.from(letters)..shuffle(_random);

    String num1Str = num1.toString();
    String num2Str = num2.toString();
    String sumStr = sum.toString();

    // Helper to convert number string to letter string
    String toLetters(String numStr) {
      return numStr.split('').map((char) {
        int val = int.parse(char);
        return shuffledLetters[val];
      }).join('');
    }

    String letter1 = toLetters(num1Str);
    String letter2 = toLetters(num2Str);
    String letterSum = toLetters(sumStr);

    _equationStr = '$letter1 + $letter2 = $letterSum';

    // Collect all unique letters in the equation
    final equationLetters = <String>{};
    for (int i = 0; i < _equationStr.length; i++) {
      final char = _equationStr[i];
      if (letters.contains(char)) {
        equationLetters.add(char);
      }
    }

    // Pick one letter to solve for
    final letterList = equationLetters.toList();
    _targetLetter = letterList[_random.nextInt(letterList.length)];
    
    // Find the digit it corresponds to
    int targetDigit = -1;
    for (int i = 0; i < shuffledLetters.length; i++) {
      if (shuffledLetters[i] == _targetLetter) {
        targetDigit = i;
        break;
      }
    }
    _correctDigit = targetDigit;

    // Create the legend containing all other letters in the equation
    _legend = {};
    for (final l in equationLetters) {
      if (l != _targetLetter) {
        int digitVal = -1;
        for (int i = 0; i < shuffledLetters.length; i++) {
          if (shuffledLetters[i] == l) {
            digitVal = i;
            break;
          }
        }
        _legend[l] = digitVal;
      }
    }

    // Generate 4 digit options
    final set = <int>{_correctDigit};
    while (set.length < 4) {
      set.add(_random.nextInt(10));
    }
    _options = set.toList()..shuffle(_random);
  }

  void _onAnswer(int ans) {
    if (_isGameOver) return;

    if (ans == _correctDigit) {
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
          content: Text('Incorrect! $_targetLetter = $_correctDigit'),
          duration: const Duration(milliseconds: 1500),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crypto_arithmetic');
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
      title: 'CRYPTO-ARITHMETIC',
      subtitle: 'Crack character-digit substitution cipher math problems.',
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
        child: SingleChildScrollView(
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
                const SizedBox(height: 30),
                // Cryptarithm Display Card
                Container(
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    border: Border.all(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'CRYPTARITHM',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _equationStr,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: DesignSystem.primary,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Legend
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'DECODED LEGEND:',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white10 : Colors.black12.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  ),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: _legend.entries.map((entry) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            entry.key,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(' = ', style: TextStyle(color: Colors.grey)),
                          Text(
                            '${entry.value}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: DesignSystem.gameBlue),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Solve for: $_targetLetter = ?',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: DesignSystem.gameOrange,
                  ),
                ),
                const SizedBox(height: 24),
                // Choice Buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: _options.map((value) => _buildOptionButton(value, isDark)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(int value, bool isDark) {
    return SizedBox(
      width: 100,
      height: 55,
      child: ElevatedButton(
        onPressed: () => _onAnswer(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
          foregroundColor: isDark ? Colors.white : Colors.black87,
          side: BorderSide(
            color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
        ),
        child: Text(
          '$value',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
