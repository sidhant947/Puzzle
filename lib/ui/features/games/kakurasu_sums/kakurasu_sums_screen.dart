import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class KakurasuSumsScreen extends ConsumerStatefulWidget {
  const KakurasuSumsScreen({super.key});

  @override
  ConsumerState<KakurasuSumsScreen> createState() => _KakurasuSumsScreenState();
}

class _KakurasuSumsScreenState extends ConsumerState<KakurasuSumsScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final int _gridSize = 4; // 4x4 grid. Index weights are 1, 2, 3, 4
  late List<List<bool>> _grid; // User selections (true = shaded)
  late List<int> _rowTargets;  // Target sums for each row
  late List<int> _colTargets;  // Target sums for each column

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _grid = List.generate(_gridSize, (_) => List.filled(_gridSize, false));
    _rowTargets = List.filled(_gridSize, 0);
    _colTargets = List.filled(_gridSize, 0);

    // To ensure a valid, solvable board, we generate a random configuration of shaded cells
    // and compute the row and column target sums based on it.
    final solution = List.generate(_gridSize, (_) => List.generate(_gridSize, (_) => _random.nextBool()));

    // Make sure we have at least some shaded cells
    bool hasShaded = false;
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        if (solution[r][c]) hasShaded = true;
      }
    }
    if (!hasShaded) {
      solution[0][0] = true;
      solution[1][1] = true;
    }

    // Weight of index i is (i + 1)
    for (int r = 0; r < _gridSize; r++) {
      int sum = 0;
      for (int c = 0; c < _gridSize; c++) {
        if (solution[r][c]) {
          sum += (c + 1);
        }
      }
      _rowTargets[r] = sum;
    }

    for (int c = 0; c < _gridSize; c++) {
      int sum = 0;
      for (int r = 0; r < _gridSize; r++) {
        if (solution[r][c]) {
          sum += (r + 1);
        }
      }
      _colTargets[c] = sum;
    }
  }

  void _onCellTap(int r, int c) {
    if (_isGameOver) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _grid[r][c] = !_grid[r][c];
    });

    _checkSolution();
  }

  void _checkSolution() {
    // Check row sums
    for (int r = 0; r < _gridSize; r++) {
      int sum = 0;
      for (int c = 0; c < _gridSize; c++) {
        if (_grid[r][c]) {
          sum += (c + 1);
        }
      }
      if (sum != _rowTargets[r]) return;
    }

    // Check col sums
    for (int c = 0; c < _gridSize; c++) {
      int sum = 0;
      for (int r = 0; r < _gridSize; r++) {
        if (_grid[r][c]) {
          sum += (r + 1);
        }
      }
      if (sum != _colTargets[c]) return;
    }

    // Solved!
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('kakurasu_sums');
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

    // Kakurasu is a grid with labels on all four outer boundaries:
    // Left labels: row index weights (1, 2, 3, 4)
    // Top labels: col index weights (1, 2, 3, 4)
    // Right labels: target row sums
    // Bottom labels: target col sums
    return GameScaffold(
      title: 'KAKURASU SUMS',
      subtitle: 'Shade cells. The sum of shaded row/col index weights must equal target numbers.',
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
                  'Goal: Match sum targets',
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
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(DesignSystem.spaceMD),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final size = constraints.maxWidth;
                    // Total rows/cols in visual grid: 1 label row/col + grid cells + target row/col = _gridSize + 2
                    final totalVisualSize = _gridSize + 2;
                    final cellSize = size / totalVisualSize;

                    return Table(
                      defaultColumnWidth: FixedColumnWidth(cellSize),
                      children: List.generate(totalVisualSize, (r) {
                        return TableRow(
                          children: List.generate(totalVisualSize, (c) {
                            // Top-Left corner: Empty
                            if (r == 0 && c == 0) {
                              return SizedBox(height: cellSize);
                            }
                            // Top-Right corner: Empty
                            if (r == 0 && c == totalVisualSize - 1) {
                              return SizedBox(height: cellSize);
                            }
                            // Bottom-Left corner: Empty
                            if (r == totalVisualSize - 1 && c == 0) {
                              return SizedBox(height: cellSize);
                            }
                            // Bottom-Right corner: Empty
                            if (r == totalVisualSize - 1 && c == totalVisualSize - 1) {
                              return SizedBox(height: cellSize);
                            }

                            // Top row: Column index weights (1, 2, 3, 4)
                            if (r == 0) {
                              return Container(
                                height: cellSize,
                                alignment: Alignment.center,
                                child: Text(
                                  '$c',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                                ),
                              );
                            }

                            // Left column: Row index weights (1, 2, 3, 4)
                            if (c == 0) {
                              return Container(
                                height: cellSize,
                                alignment: Alignment.center,
                                child: Text(
                                  '$r',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                                ),
                              );
                            }

                            // Right column: Target row sums
                            if (c == totalVisualSize - 1) {
                              final target = _rowTargets[r - 1];
                              // Calculate current sum for this row
                              int currentSum = 0;
                              for (int i = 0; i < _gridSize; i++) {
                                if (_grid[r - 1][i]) currentSum += (i + 1);
                              }
                              final isMet = currentSum == target;

                              return Container(
                                height: cellSize,
                                alignment: Alignment.center,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isMet ? Colors.green.withOpacity(0.2) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '$target',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isMet ? Colors.green : (isDark ? Colors.white70 : Colors.black87),
                                    ),
                                  ),
                                ),
                              );
                            }

                            // Bottom row: Target col sums
                            if (r == totalVisualSize - 1) {
                              final target = _colTargets[c - 1];
                              // Calculate current sum for this column
                              int currentSum = 0;
                              for (int i = 0; i < _gridSize; i++) {
                                if (_grid[i][c - 1]) currentSum += (i + 1);
                              }
                              final isMet = currentSum == target;

                              return Container(
                                height: cellSize,
                                alignment: Alignment.center,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isMet ? Colors.green.withOpacity(0.2) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '$target',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isMet ? Colors.green : (isDark ? Colors.white70 : Colors.black87),
                                    ),
                                  ),
                                ),
                              );
                            }

                            // Regular grid cell
                            final gridR = r - 1;
                            final gridC = c - 1;
                            final isShaded = _grid[gridR][gridC];

                            return GestureDetector(
                              onTap: () => _onCellTap(gridR, gridC),
                              child: Container(
                                height: cellSize,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: isShaded
                                      ? DesignSystem.primary
                                      : (isDark ? Colors.white10 : Colors.grey[100]),
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                  border: Border.all(
                                    color: isDark ? Colors.white24 : Colors.black12,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: isShaded
                                    ? const Icon(Icons.check_circle_rounded, color: Colors.white, size: 16)
                                    : null,
                              ),
                            );
                          }),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
