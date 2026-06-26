import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class MathMazePuzzle {
  final List<List<String>> grid; // 3x3 layout of strings e.g. "3", "+", "4"
  final int target;

  MathMazePuzzle({required this.grid, required this.target});
}

class MathMazeScreen extends ConsumerStatefulWidget {
  const MathMazeScreen({super.key});

  @override
  ConsumerState<MathMazeScreen> createState() => _MathMazeScreenState();
}

class _MathMazeScreenState extends ConsumerState<MathMazeScreen> {
  final Random _random = Random();
  final int _gridSize = 3;

  late MathMazePuzzle _currentPuzzle;
  List<Point<int>> _userPath = [];
  int _runningTotal = 0;

  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final grid = List.generate(_gridSize, (r) => List.generate(_gridSize, (c) {
      if ((r + c) % 2 == 0) {
        return (1 + _random.nextInt(9)).toString();
      } else {
        const ops = ['+', '-', '*'];
        return ops[_random.nextInt(ops.length)];
      }
    }));

    List<Point<int>> findRandomPath() {
      final path = <Point<int>>[const Point(0, 0)];
      final visited = <Point<int>>{const Point(0, 0)};

      bool dfs(Point<int> current) {
        if (current.x == _gridSize - 1 && current.y == _gridSize - 1) {
          return true;
        }

        final neighbors = <Point<int>>[];
        final dx = [0, 0, 1, -1];
        final dy = [1, -1, 0, 0];
        for (int i = 0; i < 4; i++) {
          final nx = current.x + dx[i];
          final ny = current.y + dy[i];
          if (nx >= 0 && nx < _gridSize && ny >= 0 && ny < _gridSize) {
            final p = Point(nx, ny);
            if (!visited.contains(p)) {
              neighbors.add(p);
            }
          }
        }

        neighbors.shuffle(_random);
        for (final next in neighbors) {
          visited.add(next);
          path.add(next);
          if (dfs(next)) return true;
          path.removeLast();
          visited.remove(next);
        }
        return false;
      }

      dfs(const Point(0, 0));
      return path;
    }

    final path = findRandomPath();
    int targetVal = int.parse(grid[0][0]);
    for (int i = 2; i < path.length; i += 2) {
      final op = grid[path[i - 1].x][path[i - 1].y];
      final val = int.parse(grid[path[i].x][path[i].y]);
      if (op == '+') {
        targetVal += val;
      } else if (op == '-') {
        targetVal -= val;
      } else if (op == '*') {
        targetVal *= val;
      }
    }

    _currentPuzzle = MathMazePuzzle(grid: grid, target: targetVal);
    _userPath = [const Point(0, 0)];
    _runningTotal = int.parse(grid[0][0]);
  }

  void _onCellTapped(int r, int c) {
    if (_isGameOver) return;

    final cellPoint = Point(r, c);

    // If tapping the last tapped cell, undo the last step
    if (_userPath.length > 1 && _userPath.last == cellPoint) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _userPath.removeLast();
        _recalculateTotal();
      });
      return;
    }

    // Check if cell is adjacent to the current path end
    final currentEnd = _userPath.last;
    final isAdjacent = (currentEnd.x - r).abs() + (currentEnd.y - c).abs() == 1;

    // Check if cell is already in the path
    final isAlreadyInPath = _userPath.contains(cellPoint);

    if (isAdjacent && !isAlreadyInPath) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _userPath.add(cellPoint);
        _recalculateTotal();

        // Check if user reached the end (2, 2)
        if (r == _gridSize - 1 && c == _gridSize - 1) {
          if (_runningTotal == _currentPuzzle.target) {
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
            final l10n = AppLocalizations.of(context)!;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.snackbarReachedEndNoMatch), duration: Duration(seconds: 1)),
            );
            // Reset to start
            _userPath = [const Point(0, 0)];
            _runningTotal = int.parse(_currentPuzzle.grid[0][0]);
          }
        }
      });
    }
  }

  void _recalculateTotal() {
    if (_userPath.isEmpty) return;

    int total = int.parse(_currentPuzzle.grid[0][0]);

    for (int i = 2; i < _userPath.length; i += 2) {
      final opCell = _userPath[i - 1];
      final valCell = _userPath[i];

      final op = _currentPuzzle.grid[opCell.x][opCell.y];
      final val = int.parse(_currentPuzzle.grid[valCell.x][valCell.y]);

      switch (op) {
        case '+':
          total += val;
          break;
        case '-':
          total -= val;
          break;
        case '*':
          total *= val;
          break;
      }
    }

    _runningTotal = total;
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('math_maze');
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
      title: L10nGameHelpers.getGameTitle(context, 'math_maze'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'math_maze'),
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
      body: Column(
        children: [
          // Header values card
          Container(
            margin: const EdgeInsets.all(DesignSystem.spaceMD),
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(
                color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.target, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(
                      '${_currentPuzzle.target}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: DesignSystem.gameOrange,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.target, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(
                      '$_runningTotal',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: DesignSystem.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '$_score / $_targetScore',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          // Maze Grid
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double cellSize = constraints.maxWidth / _gridSize;

                    return Stack(
                      children: [
                        for (int r = 0; r < _gridSize; r++)
                          for (int c = 0; c < _gridSize; c++)
                            Positioned(
                              left: c * cellSize,
                              top: r * cellSize,
                              width: cellSize,
                              height: cellSize,
                              child: GestureDetector(
                                onTap: () => _onCellTapped(r, c),
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: _userPath.contains(Point(r, c))
                                        ? DesignSystem.primary.withOpacity(0.2)
                                        : (isDark ? Colors.white10 : Colors.black12.withOpacity(0.04)),
                                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                    border: Border.all(
                                      color: _userPath.contains(Point(r, c))
                                          ? DesignSystem.primary
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    _currentPuzzle.grid[r][c],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: _userPath.contains(Point(r, c))
                                          ? DesignSystem.primary
                                          : (isDark ? Colors.white70 : Colors.black87),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
