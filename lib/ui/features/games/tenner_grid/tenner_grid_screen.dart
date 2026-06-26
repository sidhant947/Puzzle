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

class TennerGridScreen extends ConsumerStatefulWidget {
  const TennerGridScreen({super.key});

  @override
  ConsumerState<TennerGridScreen> createState() => _TennerGridScreenState();
}

class _TennerGridScreenState extends ConsumerState<TennerGridScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final int _gridRows = 3; // 3 rows of grid
  final int _gridCols = 10; // 10 columns (each row contains numbers 0..9)
  late List<List<int>> _grid; // User entered values (-1 represents empty)
  late List<List<bool>> _isFixed; // Prefilled fixed cells
  late List<int> _colSums; // Sum of values in each column

  // Solvable levels
  final List<Map<String, dynamic>> _levels = [
    {
      'solution': [
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
        [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
      ],
      'fixed': [
        [true, false, false, true, false, false, true, false, false, true],
        [false, true, false, false, true, false, false, true, false, false],
        [true, false, true, false, false, true, false, false, true, false]
      ],
    },
    {
      'solution': [
        [3, 5, 2, 0, 9, 1, 4, 8, 7, 6],
        [8, 7, 1, 4, 3, 0, 5, 6, 2, 9],
        [0, 1, 3, 2, 5, 4, 6, 7, 9, 8]
      ],
      'fixed': [
        [true, false, false, false, true, false, false, true, false, false],
        [false, true, false, true, false, false, true, false, false, true],
        [true, false, true, false, false, true, false, false, true, false]
      ],
    }
  ];

  int _selectedCellRow = -1;
  int _selectedCellCol = -1;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final level = _levels[_random.nextInt(_levels.length)];
    final solution = level['solution'] as List<List<int>>;
    final rawFixed = level['fixed'] as List<List<bool>>;

    _grid = List.generate(_gridRows, (r) => List.filled(_gridCols, -1));
    _isFixed = List.generate(_gridRows, (r) => List.from(rawFixed[r]));

    // Populate col sums from the complete solution
    _colSums = List.filled(_gridCols, 0);
    for (int c = 0; c < _gridCols; c++) {
      int sum = 0;
      for (int r = 0; r < _gridRows; r++) {
        sum += solution[r][c];
      }
      _colSums[c] = sum;
    }

    // Populate prefilled fixed cells
    for (int r = 0; r < _gridRows; r++) {
      for (int c = 0; c < _gridCols; c++) {
        if (_isFixed[r][c]) {
          _grid[r][c] = solution[r][c];
        }
      }
    }
    _selectedCellRow = -1;
    _selectedCellCol = -1;
  }

  void _onCellTap(int r, int c) {
    if (_isGameOver || _isFixed[r][c]) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedCellRow = r;
      _selectedCellCol = c;
    });
  }

  void _selectNumber(int num) {
    if (_selectedCellRow == -1 || _selectedCellCol == -1) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _grid[_selectedCellRow][_selectedCellCol] = num;
    });

    _checkSolution();
  }

  void _checkSolution() {
    // 1. Check all filled
    for (int r = 0; r < _gridRows; r++) {
      for (int c = 0; c < _gridCols; c++) {
        if (_grid[r][c] == -1) return;
      }
    }

    // 2. Check each row contains unique digits 0-9
    for (int r = 0; r < _gridRows; r++) {
      final Set<int> rowDigits = {};
      for (int c = 0; c < _gridCols; c++) {
        rowDigits.add(_grid[r][c]);
      }
      if (rowDigits.length != _gridCols) return;
    }

    // 3. Check column sums match target _colSums
    for (int c = 0; c < _gridCols; c++) {
      int sum = 0;
      for (int r = 0; r < _gridRows; r++) {
        sum += _grid[r][c];
      }
      if (sum != _colSums[c]) return;
    }

    // 4. Check adjacent cells (sharing edge or corner/diagonal) cannot contain the same number
    // We only need to check cells in different rows since each row has unique digits.
    for (int r = 0; r < _gridRows - 1; r++) {
      for (int c = 0; c < _gridCols; c++) {
        final val = _grid[r][c];
        // Neighbors to check in row r+1: c-1, c, c+1
        for (int dc = -1; dc <= 1; dc++) {
          final nc = c + dc;
          if (nc >= 0 && nc < _gridCols) {
            if (_grid[r + 1][nc] == val) return;
          }
        }
      }
    }

    // Victory!
    HapticFeedbackUtil.success();
    setState(() {
      _score++;
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        _generatePuzzle();
      }
    });
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('tenner_grid');
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
      title: L10nGameHelpers.getGameTitle(context, 'tenner_grid'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'tenner_grid'),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select a cell and pick a digit',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'Score: $_score / $_targetScore',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),
          // Game Board: 3 rows + 1 row for sums
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(DesignSystem.spaceSM),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Grid Rows
                    ...List.generate(_gridRows, (r) {
                      return Row(
                        children: List.generate(_gridCols, (c) {
                          final val = _grid[r][c];
                          final isFixed = _isFixed[r][c];
                          final isSelected = _selectedCellRow == r && _selectedCellCol == c;

                          return Expanded(
                            child: GestureDetector(
                              onTap: () => _onCellTap(r, c),
                              child: Container(
                                height: 48,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? DesignSystem.primary.withOpacity(0.2)
                                      : (isFixed
                                          ? (isDark ? Colors.white12 : Colors.grey[200])
                                          : Colors.transparent),
                                  border: Border.all(
                                    color: isSelected
                                        ? DesignSystem.primary
                                        : (isDark ? Colors.white24 : Colors.black12),
                                    width: isSelected ? 2 : 1,
                                  ),
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  val == -1 ? '' : '$val',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isFixed ? FontWeight.bold : FontWeight.w500,
                                    color: isFixed
                                        ? DesignSystem.gameOrange
                                        : (isDark ? Colors.white : Colors.black87),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                    const Divider(height: 20, thickness: 2),
                    // Sum Row
                    Row(
                      children: List.generate(_gridCols, (c) {
                        return Expanded(
                          child: Container(
                            height: 48,
                            margin: const EdgeInsets.all(2),
                            alignment: Alignment.center,
                            child: Text(
                              '${_colSums[c]}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: DesignSystem.primary,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Number Keyboard (0-9)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: 12),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: List.generate(10, (index) {
                return SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _selectNumber(index),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                      side: BorderSide(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                      ),
                    ),
                    child: Text(
                      '$index',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
