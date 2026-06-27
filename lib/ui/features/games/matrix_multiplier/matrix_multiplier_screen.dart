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

class MatrixMultiplierScreen extends ConsumerStatefulWidget {
  const MatrixMultiplierScreen({super.key});

  @override
  ConsumerState<MatrixMultiplierScreen> createState() => _MatrixMultiplierScreenState();
}

class _MatrixMultiplierScreenState extends ConsumerState<MatrixMultiplierScreen> {
  final Random _random = Random();
  late List<List<int>> _matrixA; // 2x3
  late List<List<int>> _matrixB; // 3x2
  late int _target;

  int? _selectedRow; // 0 or 1
  int? _selectedCol; // 0 or 1
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _selectedRow = null;
    _selectedCol = null;

    // Generate Matrix A (2x3) and B (3x2) with random small numbers
    _matrixA = List.generate(2, (_) => List.generate(3, (_) => _random.nextInt(8) + 1));
    _matrixB = List.generate(3, (_) => List.generate(2, (_) => _random.nextInt(8) + 1));

    // Calculate all 4 possible dot products
    final products = <int>[];
    for (int r = 0; r < 2; r++) {
      for (int c = 0; c < 2; c++) {
        int val = 0;
        for (int i = 0; i < 3; i++) {
          val += _matrixA[r][i] * _matrixB[i][c];
        }
        products.add(val);
      }
    }

    // Pick one of the products as target
    _target = products[_random.nextInt(products.length)];
  }

  void _onRowSelected(int row) {
    if (_isGameOver) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedRow = row;
      _checkSelection();
    });
  }

  void _onColSelected(int col) {
    if (_isGameOver) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedCol = col;
      _checkSelection();
    });
  }

  void _checkSelection() {
    if (_selectedRow != null && _selectedCol != null) {
      // Calculate selected dot product
      int r = _selectedRow!;
      int c = _selectedCol!;
      int calculated = 0;
      for (int i = 0; i < 3; i++) {
        calculated += _matrixA[r][i] * _matrixB[i][c];
      }

      if (calculated == _target) {
        _score++;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        } else {
          _generatePuzzle();
        }
      } else {
        HapticFeedbackUtil.error();
        // Reset selections
        _selectedRow = null;
        _selectedCol = null;
      }
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('matrix_multiplier');
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
      title: L10nGameHelpers.getGameTitle(context, 'matrix_multiplier'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'matrix_multiplier'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            children: [
              // Target Display Card
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
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TARGET PRODUCT',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: isDark ? DesignSystem.darkInkSlate : DesignSystem.inkSlate,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$_target',
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: DesignSystem.gameOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: DesignSystem.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                        ),
                        child: Text(
                          '$_score / $_targetScore',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: DesignSystem.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              // Matrix A (Left) & Matrix B (Right)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Matrix A (Row selector)
                  Column(
                    children: [
                      Text('MATRIX A (Row)', style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(color: isDark ? Colors.white70 : Colors.black87, width: 3),
                          ),
                        ),
                        child: Column(
                          children: List.generate(2, (r) {
                            final isRowSelected = _selectedRow == r;
                            return GestureDetector(
                              onTap: () => _onRowSelected(r),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isRowSelected
                                      ? DesignSystem.primary.withValues(alpha: 0.2)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                  border: Border.all(
                                    color: isRowSelected ? DesignSystem.primary : Colors.transparent,
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  children: List.generate(3, (c) {
                                    return Container(
                                      width: 32,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${_matrixA[r][c]}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isRowSelected ? DesignSystem.primary : null,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  const Text('×', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  // Matrix B (Column selector)
                  Column(
                    children: [
                      Text('MATRIX B (Col)', style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(color: isDark ? Colors.white70 : Colors.black87, width: 3),
                          ),
                        ),
                        child: Row(
                          children: List.generate(2, (c) {
                            final isColSelected = _selectedCol == c;
                            return GestureDetector(
                              onTap: () => _onColSelected(c),
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                decoration: BoxDecoration(
                                  color: isColSelected
                                      ? DesignSystem.primary.withValues(alpha: 0.2)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                  border: Border.all(
                                    color: isColSelected ? DesignSystem.primary : Colors.transparent,
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  children: List.generate(3, (r) {
                                    return Container(
                                      height: 32,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${_matrixB[r][c]}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isColSelected ? DesignSystem.primary : null,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Helper visualization equation
              if (_selectedRow != null || _selectedCol != null)
                Card(
                  elevation: 0,
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Calculation: ', style: TextStyle(fontSize: 15)),
                        ...List.generate(3, (i) {
                          final aStr = _selectedRow != null ? '${_matrixA[_selectedRow!][i]}' : 'a$i';
                          final bStr = _selectedCol != null ? '${_matrixB[i][_selectedCol!]}' : 'b$i';
                          return Text(
                            '($aStr × $bStr)${i < 2 ? ' + ' : ''}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
