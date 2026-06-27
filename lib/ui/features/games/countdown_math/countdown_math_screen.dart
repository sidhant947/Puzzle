import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class CountdownMathScreen extends ConsumerStatefulWidget {
  const CountdownMathScreen({super.key});

  @override
  ConsumerState<CountdownMathScreen> createState() => _CountdownMathScreenState();
}

class _CountdownMathScreenState extends ConsumerState<CountdownMathScreen> {
  late List<int> _numbers;
  late int _target;
  int? _selectedNumIndex1;
  int? _selectedNumIndex2;
  String? _selectedOperator;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _selectedNumIndex1 = null;
    _selectedNumIndex2 = null;
    _selectedOperator = null;

    final random = Random();
    final smalls = List.generate(4, (_) => random.nextInt(9) + 2);
    final largeOptions = [25, 50, 75, 100];
    final large = largeOptions[random.nextInt(largeOptions.length)];
    
    _numbers = [...smalls, large];

    List<int> workingList = List.from(_numbers);
    int target = workingList[random.nextInt(workingList.length)];

    int operationsCount = random.nextInt(3) + 2;
    for (int i = 0; i < operationsCount; i++) {
      if (workingList.length < 2) break;
      int idx1 = random.nextInt(workingList.length);
      int idx2 = (idx1 + 1 + random.nextInt(workingList.length - 1)) % workingList.length;

      int n1 = workingList[idx1];
      int n2 = workingList[idx2];
      int op = random.nextInt(4);

      int result = 0;
      switch (op) {
        case 0:
          result = n1 + n2;
          break;
        case 1:
          result = (n1 - n2).abs();
          break;
        case 2:
          result = n1 * n2;
          break;
        case 3:
          if (n2 != 0 && n1 % n2 == 0) {
            result = n1 ~/ n2;
          } else if (n1 != 0 && n2 % n1 == 0) {
            result = n2 ~/ n1;
          } else {
            result = n1 + n2;
          }
          break;
      }

      if (result > 0 && result < 1000) {
        target = result;
        final nextList = <int>[];
        for (int j = 0; j < workingList.length; j++) {
          if (j != idx1 && j != idx2) nextList.add(workingList[j]);
        }
        nextList.add(result);
        workingList = nextList;
      }
    }

    _target = target;
  }

  void _selectNumber(int idx) {
    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_selectedNumIndex1 == null) {
        _selectedNumIndex1 = idx;
      } else if (_selectedOperator == null) {
        // Change selection
        _selectedNumIndex1 = idx;
      } else {
        _selectedNumIndex2 = idx;
        _evaluateOperation();
      }
    });
  }

  void _selectOperator(String op) {
    HapticFeedbackUtil.lightImpact();
    if (_selectedNumIndex1 == null) return;
    setState(() {
      _selectedOperator = op;
    });
  }

  void _evaluateOperation() {
    if (_selectedNumIndex1 == null || _selectedNumIndex2 == null || _selectedOperator == null) return;
    if (_selectedNumIndex1 == _selectedNumIndex2) {
      _selectedNumIndex2 = null;
      return;
    }

    final n1 = _numbers[_selectedNumIndex1!];
    final n2 = _numbers[_selectedNumIndex2!];
    int result = 0;

    switch (_selectedOperator) {
      case '+':
        result = n1 + n2;
        break;
      case '-':
        result = n1 - n2;
        break;
      case '×':
        result = n1 * n2;
        break;
      case '÷':
        if (n2 == 0 || n1 % n2 != 0) {
          HapticFeedbackUtil.error();
          setState(() {
            _selectedNumIndex2 = null;
          });
          return;
        }
        result = n1 ~/ n2;
        break;
    }

    setState(() {
      final nextNumbers = <int>[];
      for (int i = 0; i < _numbers.length; i++) {
        if (i != _selectedNumIndex1 && i != _selectedNumIndex2) {
          nextNumbers.add(_numbers[i]);
        }
      }
      nextNumbers.add(result);
      _numbers = nextNumbers;

      _selectedNumIndex1 = null;
      _selectedNumIndex2 = null;
      _selectedOperator = null;

      _checkWin();
    });
  }

  void _checkWin() {
    if (_numbers.contains(_target)) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('countdown_math');
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: AppLocalizations.of(context)!.winTargetReached,
          message: AppLocalizations.of(context)!.winExcellentCalculations,
          onPlayAgain: () {
            setState(() {
              _generatePuzzle();
            });
            Navigator.pop(context);
          },
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'countdown_math'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.phaseFindTheTarget, style: Theme.of(context).textTheme.titleMedium),
                  IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => setState(_generatePuzzle),
                  ),
                ],
              ),
            ),
            // Target Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: TangibleContainer(
                depth: 3,
                color: DesignSystem.gameOrange,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.phaseTargetNumber,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$_target',
                        style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Math equation preview
            Container(
              height: 48,
              alignment: Alignment.center,
              child: _selectedNumIndex1 != null
                  ? Text(
                      '${_numbers[_selectedNumIndex1!]} ${_selectedOperator ?? ""} ${_selectedNumIndex2 != null ? _numbers[_selectedNumIndex2!] : ""}',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  : Text(AppLocalizations.of(context)!.phaseSelectNumberToBegin, style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 24),
            // Active Numbers Pool
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(_numbers.length, (index) {
                    final isSelected1 = _selectedNumIndex1 == index;
                    final isSelected2 = _selectedNumIndex2 == index;

                    return GestureDetector(
                      onTap: () => _selectNumber(index),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (isSelected1 || isSelected2) ? DesignSystem.gameOrange.withValues(alpha: 0.2) : colorScheme.surface,
                          border: Border.all(
                            color: (isSelected1 || isSelected2) ? DesignSystem.gameOrange : colorScheme.outline,
                            width: 2.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${_numbers[index]}',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            // Operators Tray
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['+', '-', '×', '÷'].map((op) {
                  final isSelected = _selectedOperator == op;
                  return GestureDetector(
                    onTap: () => _selectOperator(op),
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: isSelected ? DesignSystem.gameOrange : colorScheme.outline.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          op,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
