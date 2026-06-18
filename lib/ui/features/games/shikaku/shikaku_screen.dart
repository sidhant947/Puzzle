import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class ShikakuScreen extends ConsumerStatefulWidget {
  const ShikakuScreen({super.key});

  @override
  ConsumerState<ShikakuScreen> createState() => _ShikakuScreenState();
}

class _ShikakuScreenState extends ConsumerState<ShikakuScreen> {
  static const int gridSize = 6;
  
  // Board cells holding target numbers (0 if empty)
  late List<List<int>> _board;
  
  // List of selected rectangles by user.
  // Each rect is represented as a Rect: [startRow, startCol, endRow, endCol]
  final List<List<int>> _rects = [];
  
  int? _startRow;
  int? _startCol;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _rects.clear();
    _startRow = null;
    _startCol = null;
    _board = List.generate(gridSize, (_) => List.filled(gridSize, 0));

    final assigned = List.generate(gridSize, (_) => List.filled(gridSize, false));
    final random = Random();

    for (int r = 0; r < gridSize; r++) {
      for (int c = 0; c < gridSize; c++) {
        if (assigned[r][c]) continue;

        // Try to grow a rectangle from (r, c)
        int maxH = 1;
        while (r + maxH < gridSize && !assigned[r + maxH][c]) {
          maxH++;
        }
        int h = random.nextInt(maxH) + 1;

        int maxW = 1;
        while (c + maxW < gridSize) {
          bool columnFree = true;
          for (int i = 0; i < h; i++) {
            if (assigned[r + i][c + maxW]) {
              columnFree = false;
              break;
            }
          }
          if (!columnFree) break;
          maxW++;
        }
        int w = random.nextInt(maxW) + 1;

        for (int i = 0; i < h; i++) {
          for (int j = 0; j < w; j++) {
            assigned[r + i][c + j] = true;
          }
        }

        final pr = r + random.nextInt(h);
        final pc = c + random.nextInt(w);
        _board[pr][pc] = h * w;
      }
    }
  }

  void _handleCellTap(int r, int c) {
    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_startRow == null || _startCol == null) {
        _startRow = r;
        _startCol = c;
      } else {
        // End of selection
        final r1 = min(_startRow!, r);
        final r2 = max(_startRow!, r);
        final c1 = min(_startCol!, c);
        final c2 = max(_startCol!, c);
        
        // Remove overlaps
        _rects.removeWhere((rect) {
          return !(rect[2] < r1 || rect[0] > r2 || rect[3] < c1 || rect[1] > c2);
        });

        _rects.add([r1, c1, r2, c2]);
        _startRow = null;
        _startCol = null;
        _checkWin();
      }
    });
  }

  void _checkWin() {
    int totalArea = 0;
    for (var rect in _rects) {
      final h = rect[2] - rect[0] + 1;
      final w = rect[3] - rect[1] + 1;
      totalArea += h * w;
    }

    if (totalArea != gridSize * gridSize) return;

    for (var rect in _rects) {
      final r1 = rect[0];
      final c1 = rect[1];
      final r2 = rect[2];
      final c2 = rect[3];
      final area = (r2 - r1 + 1) * (c2 - c1 + 1);

      int numberCount = 0;
      int targetNumber = 0;

      for (int r = r1; r <= r2; r++) {
        for (int c = c1; c <= c2; c++) {
          if (_board[r][c] > 0) {
            numberCount++;
            targetNumber = _board[r][c];
          }
        }
      }

      if (numberCount != 1 || targetNumber != area) {
        return; // failed validation
      }
    }

    // Win!
    HapticFeedbackUtil.victory();
    ref.read(gameStreakNotifierProvider.notifier).completeGame('shikaku');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'GRID COMPLETED!',
        message: 'You successfully solved the Shikaku puzzle.',
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GameScaffold(
      title: 'SHIKAKU',
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Solve the grid', style: Theme.of(context).textTheme.titleMedium),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.undo_rounded),
                        onPressed: () {
                          if (_rects.isNotEmpty) {
                            setState(() {
                              _rects.removeLast();
                            });
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh_rounded),
                        onPressed: () => setState(_generatePuzzle),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TangibleContainer(
                      depth: 2,
                      color: colorScheme.surface,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: gridSize,
                              ),
                              itemCount: gridSize * gridSize,
                              itemBuilder: (context, index) {
                                final r = index ~/ gridSize;
                                final c = index % gridSize;
                                final hasNum = _board[r][c] > 0;
                                final isSelectedStart = _startRow == r && _startCol == c;

                                return GestureDetector(
                                  onTap: () => _handleCellTap(r, c),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5)),
                                      color: isSelectedStart ? DesignSystem.gameAmber.withValues(alpha: 0.2) : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: hasNum
                                          ? Text(
                                              '${_board[r][c]}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: colorScheme.onSurface,
                                              ),
                                            )
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned.fill(
                            child: IgnorePointer(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final double cellW = constraints.maxWidth / gridSize;
                                  final double cellH = constraints.maxHeight / gridSize;

                                  return Stack(
                                    children: _rects.map((rect) {
                                      final double left = rect[1] * cellW;
                                      final double top = rect[0] * cellH;
                                      final double width = (rect[3] - rect[1] + 1) * cellW;
                                      final double height = (rect[2] - rect[0] + 1) * cellH;

                                      return Positioned(
                                        left: left + 2,
                                        top: top + 2,
                                        width: width - 4,
                                        height: height - 4,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: DesignSystem.gameAmber.withValues(alpha: 0.35),
                                            border: Border.all(color: DesignSystem.gameAmber, width: 2),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Tap a start cell, then tap an end cell to draw a box. Divide the grid into rectangular areas matching the numbers inside.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
