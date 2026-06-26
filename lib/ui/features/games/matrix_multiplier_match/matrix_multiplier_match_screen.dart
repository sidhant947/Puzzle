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

class MatrixMultiplierMatchScreen extends ConsumerStatefulWidget {
  const MatrixMultiplierMatchScreen({super.key});

  @override
  ConsumerState<MatrixMultiplierMatchScreen> createState() => _MatrixMultiplierMatchScreenState();
}

class _MatrixMultiplierMatchScreenState extends ConsumerState<MatrixMultiplierMatchScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late List<List<int>> _matrixA;
  late List<List<int>> _matrixB;
  late List<List<int>> _matrixC;
  late Point<int> _hiddenCell;
  late int _correctValue;
  late List<int> _options;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _matrixA = List.generate(2, (_) => List.generate(2, (_) => _random.nextInt(5) + 1));
    _matrixB = List.generate(2, (_) => List.generate(2, (_) => _random.nextInt(5) + 1));
    
    _matrixC = List.generate(2, (r) => List.generate(2, (c) {
      return _matrixA[r][0] * _matrixB[0][c] + _matrixA[r][1] * _matrixB[1][c];
    }));

    _hiddenCell = Point(_random.nextInt(2), _random.nextInt(2));
    _correctValue = _matrixC[_hiddenCell.x][_hiddenCell.y];

    final set = <int>{_correctValue};
    while (set.length < 4) {
      int offset = _random.nextInt(16) - 8;
      if (offset != 0) {
        int val = _correctValue + offset;
        if (val > 0) {
          set.add(val);
        }
      }
    }
    _options = set.toList()..shuffle(_random);
  }

  void _onAnswer(int ans) {
    if (_isGameOver) return;

    if (ans == _correctValue) {
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
          content: Text(AppLocalizations.of(context)!.snackbarIncorrectCorrectValue('$_correctValue')),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('matrix_multiplier_match');
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

  Widget _buildMatrix(List<List<int>> matrix, {Point<int>? hiddenCell, required BuildContext context}) {
    final color = Theme.of(context).colorScheme.onSurface;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: color, width: 3),
          right: BorderSide(color: color, width: 3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(matrix.length, (r) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(matrix[r].length, (c) {
              final isHidden = hiddenCell != null && hiddenCell.x == r && hiddenCell.y == c;
              return Container(
                width: 45,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  isHidden ? '?' : '${matrix[r][c]}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isHidden ? DesignSystem.gameOrange : color,
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'matrix_multiplier_match'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'matrix_multiplier_match'),
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
                  '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: DesignSystem.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              // The Equation A * B = C
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMatrix(_matrixA, context: context),
                    const SizedBox(width: 8),
                    Text(
                      '×',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildMatrix(_matrixB, context: context),
                    const SizedBox(width: 8),
                    Text(
                      '=',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildMatrix(_matrixC, hiddenCell: _hiddenCell, context: context),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Solve for the missing value (?)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              // Option Grid / Buttons
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
    );
  }

  Widget _buildOptionButton(int value, bool isDark) {
    return SizedBox(
      width: 120,
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
