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

class TripletsLogicScreen extends ConsumerStatefulWidget {
  const TripletsLogicScreen({super.key});

  @override
  ConsumerState<TripletsLogicScreen> createState() => _TripletsLogicScreenState();
}

class _TripletsLogicScreenState extends ConsumerState<TripletsLogicScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final int _gridSize = 6;
  // Grid values:
  // 0 = empty
  // 1 = Circle (blue)
  // 2 = Square (green)
  // 3 = Triangle (orange)
  late List<List<int>> _grid;
  late List<List<bool>> _isFixed;

  // Let's create solvable boards
  final List<Map<String, dynamic>> _levels = [
    {
      'fixed': [
        [true, false, false, false, true, false],
        [false, true, false, false, false, false],
        [false, false, true, false, false, true],
        [true, false, false, true, false, false],
        [false, false, false, false, true, false],
        [false, true, false, false, false, true],
      ],
      'solution': [
        [1, 2, 3, 1, 2, 3],
        [3, 1, 2, 3, 1, 2],
        [2, 3, 1, 2, 3, 1],
        [1, 2, 3, 1, 2, 3],
        [3, 1, 2, 3, 1, 2],
        [2, 3, 1, 2, 3, 1],
      ]
    }
  ];

  // Tool selection: 1 = Circle, 2 = Square, 3 = Triangle
  int _selectedShape = 1;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _grid = List.generate(_gridSize, (_) => List.filled(_gridSize, 0));
    final level = _levels[_random.nextInt(_levels.length)];
    final rawFixed = level['fixed'] as List<List<bool>>;
    final rawSolution = level['solution'] as List<List<int>>;

    _isFixed = List.generate(_gridSize, (r) => List.from(rawFixed[r]));
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        if (_isFixed[r][c]) {
          _grid[r][c] = rawSolution[r][c];
        }
      }
    }
  }

  void _onCellTap(int r, int c) {
    if (_isGameOver || _isFixed[r][c]) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_grid[r][c] == _selectedShape) {
        _grid[r][c] = 0; // Toggle empty
      } else {
        _grid[r][c] = _selectedShape;
      }
    });

    _checkSolution();
  }

  void _checkSolution() {
    // Triplets rules:
    // 1. Grid must be fully filled.
    // 2. Each row and column must contain an equal number of each of the three shapes (2 of each in a 6x6 grid).
    // 3. No three identical shapes can be consecutive horizontally or vertically (no three-in-a-row).

    // 1. Check fully filled
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        if (_grid[r][c] == 0) return;
      }
    }

    // 2. Check counts (2 of each shape per row and column)
    for (int r = 0; r < _gridSize; r++) {
      final counts = List.filled(4, 0);
      for (int c = 0; c < _gridSize; c++) {
        counts[_grid[r][c]]++;
      }
      if (counts[1] != 2 || counts[2] != 2 || counts[3] != 2) return;
    }

    for (int c = 0; c < _gridSize; c++) {
      final counts = List.filled(4, 0);
      for (int r = 0; r < _gridSize; r++) {
        counts[_grid[r][c]]++;
      }
      if (counts[1] != 2 || counts[2] != 2 || counts[3] != 2) return;
    }

    // 3. Check no three-in-a-row (horizontally & vertically)
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize - 2; c++) {
        final val = _grid[r][c];
        if (val > 0 && _grid[r][c + 1] == val && _grid[r][c + 2] == val) {
          return;
        }
      }
    }

    for (int c = 0; c < _gridSize; c++) {
      for (int r = 0; r < _gridSize - 2; r++) {
        final val = _grid[r][c];
        if (val > 0 && _grid[r + 1][c] == val && _grid[r + 2][c] == val) {
          return;
        }
      }
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('triplets_logic');
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
      title: L10nGameHelpers.getGameTitle(context, 'triplets_logic'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'triplets_logic'),
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
                  'Select a shape tool to paint',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),
          // Shape tools selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildToolButton(1, Icons.circle, Colors.blue, isDark),
                _buildToolButton(2, Icons.crop_square, Colors.green, isDark),
                _buildToolButton(3, Icons.change_history, Colors.orange, isDark),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  margin: const EdgeInsets.all(DesignSystem.spaceMD),
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _gridSize,
                    ),
                    itemCount: _gridSize * _gridSize,
                    itemBuilder: (context, index) {
                      final r = index ~/ _gridSize;
                      final c = index % _gridSize;
                      final val = _grid[r][c];
                      final isFixed = _isFixed[r][c];

                      Widget? shapeWidget;
                      if (val == 1) {
                        shapeWidget = const Icon(Icons.circle, color: Colors.blue, size: 24);
                      } else if (val == 2) {
                        shapeWidget = const Icon(Icons.crop_square, color: Colors.green, size: 24);
                      } else if (val == 3) {
                        shapeWidget = const Icon(Icons.change_history, color: Colors.orange, size: 24);
                      }

                      return GestureDetector(
                        onTap: () => _onCellTap(r, c),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isFixed
                                ? (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.03))
                                : Colors.transparent,
                            border: Border.all(
                              color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.1),
                              width: 0.5,
                            ),
                          ),
                          child: shapeWidget,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildToolButton(int type, IconData icon, Color color, bool isDark) {
    final isSelected = _selectedShape == type;
    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        setState(() {
          _selectedShape = type;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color : (isDark ? DesignSystem.darkSurface : DesignSystem.surface),
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(
            color: isSelected ? color : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : color,
          size: 24,
        ),
      ),
    );
  }
}
