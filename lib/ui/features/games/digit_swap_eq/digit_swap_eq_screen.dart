import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class DigitSwapEqScreen extends ConsumerStatefulWidget {
  const DigitSwapEqScreen({super.key});

  @override
  ConsumerState<DigitSwapEqScreen> createState() => _DigitSwapEqScreenState();
}

class _DigitSwapEqScreenState extends ConsumerState<DigitSwapEqScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  // Each equation is represented as a list of 6 digits: [x_ten, x_unit, y_ten, y_unit, z_ten, z_unit]
  // corresponding to: TensUnits + TensUnits = TensUnits
  late List<int> _digits1;
  late List<int> _digits2;

  // Selected indices for swapping (0-5 index inside respective equation)
  int? _selectedIdx1;
  int? _selectedIdx2;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _selectedIdx1 = null;
    _selectedIdx2 = null;

    while (true) {
      // 1. Generate correct Eq 1
      int x1 = 10 + _random.nextInt(40);
      int y1 = 10 + _random.nextInt(40);
      int z1 = x1 + y1;

      // 2. Generate correct Eq 2
      int x2 = 10 + _random.nextInt(40);
      int y2 = 10 + _random.nextInt(40);
      int z2 = x2 + y2;

      // Ensure all numbers are 2-digit
      if (z1 >= 100 || z2 >= 100) continue;

      _digits1 = [x1 ~/ 10, x1 % 10, y1 ~/ 10, y1 % 10, z1 ~/ 10, z1 % 10];
      _digits2 = [x2 ~/ 10, x2 % 10, y2 ~/ 10, y2 % 10, z2 ~/ 10, z2 % 10];

      // 3. Swap one random digit from Eq 1 with Eq 2
      int idx1 = _random.nextInt(6);
      int idx2 = _random.nextInt(6);

      // Avoid swapping identical digits
      if (_digits1[idx1] == _digits2[idx2]) continue;

      // Perform the swap
      int temp = _digits1[idx1];
      _digits1[idx1] = _digits2[idx2];
      _digits2[idx2] = temp;

      // Ensure both equations are now incorrect (we want a real puzzle!)
      if (!_isEqCorrect(_digits1) && !_isEqCorrect(_digits2)) {
        break;
      }
    }
  }

  bool _isEqCorrect(List<int> digits) {
    int x = digits[0] * 10 + digits[1];
    int y = digits[2] * 10 + digits[3];
    int z = digits[4] * 10 + digits[5];
    return x + y == z;
  }

  void _selectDigit(int eqNum, int idx) {
    if (_isGameOver) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (eqNum == 1) {
        if (_selectedIdx1 == idx) {
          _selectedIdx1 = null; // deselect
        } else {
          _selectedIdx1 = idx;
        }
      } else {
        if (_selectedIdx2 == idx) {
          _selectedIdx2 = null; // deselect
        } else {
          _selectedIdx2 = idx;
        }
      }

      // If both are selected, swap them
      if (_selectedIdx1 != null && _selectedIdx2 != null) {
        int idx1 = _selectedIdx1!;
        int idx2 = _selectedIdx2!;
        
        int temp = _digits1[idx1];
        _digits1[idx1] = _digits2[idx2];
        _digits2[idx2] = temp;

        _selectedIdx1 = null;
        _selectedIdx2 = null;

        // Check if solved
        if (_isEqCorrect(_digits1) && _isEqCorrect(_digits2)) {
          _score++;
          HapticFeedbackUtil.success();
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            _generatePuzzle();
          }
        } else {
          // If not correct, keep the swap (it allows the user to experiment)
          HapticFeedbackUtil.lightImpact();
        }
      }
    });
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('digit_swap_eq');
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
      title: 'DIGIT SWAP EQUATIONS',
      subtitle: 'Swap one digit from the top equation with one from the bottom equation to make both correct.',
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
              const SizedBox(height: 40),
              // Equation 1 Card
              _buildEquationCard(1, _digits1, _selectedIdx1, isDark),
              const SizedBox(height: 24),
              // Swap Icon
              Icon(
                Icons.swap_vert_rounded,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              // Equation 2 Card
              _buildEquationCard(2, _digits2, _selectedIdx2, isDark),
              const SizedBox(height: 40),
              Text(
                'Tap one digit from each equation to swap them.',
                style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEquationCard(int eqNum, List<int> digits, int? selectedIdx, bool isDark) {
    final cardBg = isDark ? DesignSystem.darkSurface : DesignSystem.surface;
    final outlineColor = isDark ? DesignSystem.darkOutline : DesignSystem.outline;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: outlineColor, width: 2),
      ),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Number (Tens & Units)
            _buildDigitButton(eqNum, 0, digits[0], selectedIdx == 0, isDark),
            _buildDigitButton(eqNum, 1, digits[1], selectedIdx == 1, isDark),
            const SizedBox(width: 12),
            // Plus Sign
            const Text('+', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(width: 12),
            // Second Number (Tens & Units)
            _buildDigitButton(eqNum, 2, digits[2], selectedIdx == 2, isDark),
            _buildDigitButton(eqNum, 3, digits[3], selectedIdx == 3, isDark),
            const SizedBox(width: 12),
            // Equals Sign
            const Text('=', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(width: 12),
            // Result Number (Tens & Units)
            _buildDigitButton(eqNum, 4, digits[4], selectedIdx == 4, isDark),
            _buildDigitButton(eqNum, 5, digits[5], selectedIdx == 5, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildDigitButton(int eqNum, int idx, int val, bool isSelected, bool isDark) {
    return GestureDetector(
      onTap: () => _selectDigit(eqNum, idx),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 44,
        height: 52,
        decoration: BoxDecoration(
          color: isSelected
              ? DesignSystem.gameOrange
              : (isDark ? Colors.grey[850] : Colors.grey[150]),
          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
          border: Border.all(
            color: isSelected
                ? Colors.white
                : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          '$val',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
          ),
        ),
      ),
    );
  }
}
