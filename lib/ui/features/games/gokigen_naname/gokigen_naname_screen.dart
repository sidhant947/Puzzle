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

// Cell diagonal states: 0 = empty, 1 = bottom-left to top-right (/), 2 = top-left to bottom-right (\)
class GokigenCell {
  int state; // 0, 1, 2
  GokigenCell(this.state);
}

class GokigenNanameScreen extends ConsumerStatefulWidget {
  const GokigenNanameScreen({super.key});

  @override
  ConsumerState<GokigenNanameScreen> createState() => _GokigenNanameScreenState();
}

class _GokigenNanameScreenState extends ConsumerState<GokigenNanameScreen> {
  final Random _random = Random();
  final int _gridSize = 4; // 4x4 grid
  late List<List<GokigenCell>> _board;
  // Clues at grid vertices. Vertices are (_gridSize + 1) x (_gridSize + 1). Null means no clue.
  late List<List<int?>> _clues;
  bool _isSolved = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isSolved = false;
    _board = List.generate(_gridSize, (_) => List.generate(_gridSize, (_) => GokigenCell(0)));
    _clues = List.generate(_gridSize + 1, (_) => List.generate(_gridSize + 1, (_) => null));

    // To generate a valid puzzle:
    // 1. Generate a valid loop-free diagonal grid
    List<List<int>> solvedDiagonals = List.generate(_gridSize, (_) => List.generate(_gridSize, (_) => 1));
    
    // Simple cycle prevention using Disjoint Set Union (DSU)
    bool hasCycles = true;
    while (hasCycles) {
      hasCycles = false;
      final dsu = _DSU((_gridSize + 1) * (_gridSize + 1));
      for (int r = 0; r < _gridSize; r++) {
        for (int c = 0; c < _gridSize; c++) {
          final diag = _random.nextBool() ? 1 : 2;
          solvedDiagonals[r][c] = diag;

          // Connect vertex points in DSU
          int v1, v2;
          if (diag == 1) {
            // Bottom-left (r+1, c) to top-right (r, c+1)
            v1 = (r + 1) * (_gridSize + 1) + c;
            v2 = r * (_gridSize + 1) + (c + 1);
          } else {
            // Top-left (r, c) to bottom-right (r+1, c+1)
            v1 = r * (_gridSize + 1) + c;
            v2 = (r + 1) * (_gridSize + 1) + (c + 1);
          }

          if (dsu.find(v1) == dsu.find(v2)) {
            hasCycles = true;
            break;
          }
          dsu.union(v1, v2);
        }
        if (hasCycles) break;
      }
    }

    // 2. Count connections at vertices
    List<List<int>> connectionCounts = List.generate(_gridSize + 1, (_) => List.generate(_gridSize + 1, (_) => 0));
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        final diag = solvedDiagonals[r][c];
        if (diag == 1) {
          connectionCounts[r + 1][c]++;
          connectionCounts[r][c + 1]++;
        } else {
          connectionCounts[r][c]++;
          connectionCounts[r + 1][c + 1]++;
        }
      }
    }

    // 3. Populate a subset of clues (approx 40-50% clues exposed)
    for (int r = 0; r <= _gridSize; r++) {
      for (int c = 0; c <= _gridSize; c++) {
        if (_random.nextDouble() < 0.5) {
          _clues[r][c] = connectionCounts[r][c];
        }
      }
    }
  }

  void _onCellTapped(int r, int c) {
    if (_isSolved) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _board[r][c].state = (_board[r][c].state + 1) % 3;
      _checkWinCondition();
    });
  }

  void _checkWinCondition() {
    // Check 1: All cells must be filled
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        if (_board[r][c].state == 0) return;
      }
    }

    // Check 2: Verify intersection counts
    List<List<int>> currentCounts = List.generate(_gridSize + 1, (_) => List.generate(_gridSize + 1, (_) => 0));
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        final diag = _board[r][c].state;
        if (diag == 1) {
          currentCounts[r + 1][c]++;
          currentCounts[r][c + 1]++;
        } else if (diag == 2) {
          currentCounts[r][c]++;
          currentCounts[r + 1][c + 1]++;
        }
      }
    }

    for (int r = 0; r <= _gridSize; r++) {
      for (int c = 0; c <= _gridSize; c++) {
        if (_clues[r][c] != null && currentCounts[r][c] != _clues[r][c]) {
          return;
        }
      }
    }

    // Check 3: Check loop/cycle existence
    final dsu = _DSU((_gridSize + 1) * (_gridSize + 1));
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        final diag = _board[r][c].state;
        int v1, v2;
        if (diag == 1) {
          v1 = (r + 1) * (_gridSize + 1) + c;
          v2 = r * (_gridSize + 1) + (c + 1);
        } else {
          v1 = r * (_gridSize + 1) + c;
          v2 = (r + 1) * (_gridSize + 1) + (c + 1);
        }

        if (dsu.find(v1) == dsu.find(v2)) {
          return; // loop detected
        }
        dsu.union(v1, v2);
      }
    }

    _isSolved = true;
    _onGameComplete();
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('gokigen_naname');
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
      title: L10nGameHelpers.getGameTitle(context, 'gokigen_naname'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'gokigen_naname'),
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
      body: Center(
        child: Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            border: Border.all(
              color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
              width: 2,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double cellWidth = constraints.maxWidth / _gridSize;
              final double cellHeight = constraints.maxHeight / _gridSize;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  // Draw Cells and Diagonal Lines
                  for (int r = 0; r < _gridSize; r++)
                    for (int c = 0; c < _gridSize; c++)
                      Positioned(
                        left: c * cellWidth,
                        top: r * cellHeight,
                        width: cellWidth,
                        height: cellHeight,
                        child: GestureDetector(
                          onTap: () => _onCellTapped(r, c),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: (isDark ? DesignSystem.darkOutline : DesignSystem.outline).withOpacity(0.5),
                                width: 0.5,
                              ),
                            ),
                            child: CustomPaint(
                              painter: _DiagonalPainter(
                                state: _board[r][c].state,
                                color: DesignSystem.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                  // Draw Intersection Clues
                  for (int r = 0; r <= _gridSize; r++)
                    for (int c = 0; c <= _gridSize; c++)
                      if (_clues[r][c] != null)
                        Positioned(
                          left: c * cellWidth - 14,
                          top: r * cellHeight - 14,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: DesignSystem.gameGreen,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${_clues[r][c]}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
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
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  final int state;
  final Color color;

  _DiagonalPainter({required this.state, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (state == 0) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    if (state == 1) {
      // Bottom-left (0, height) to top-right (width, 0)
      canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
    } else if (state == 2) {
      // Top-left (0, 0) to bottom-right (width, height)
      canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_DiagonalPainter oldDelegate) {
    return oldDelegate.state != state || oldDelegate.color != color;
  }
}

class _DSU {
  final List<int> parent;
  _DSU(int n) : parent = List.generate(n, (i) => i);

  int find(int i) {
    if (parent[i] == i) return i;
    return parent[i] = find(parent[i]);
  }

  void union(int i, int j) {
    int rootI = find(i);
    int rootJ = find(j);
    if (rootI != rootJ) {
      parent[rootI] = rootJ;
    }
  }
}
