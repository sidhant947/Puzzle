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

// Masyu clue type: 0 = none, 1 = white circle, 2 = black circle
enum MasyuClue { none, white, black }

// Cell track pieces:
// 0: empty, 1: Horiz (─), 2: Vert (│), 3: TL corner (┌), 4: TR corner (┐), 5: BL corner (└), 6: BR corner (┘)
class MasyuCell {
  int trackType = 0;
  final MasyuClue clue;

  MasyuCell({this.trackType = 0, this.clue = MasyuClue.none});
}

class MasyuPuzzle {
  final List<List<MasyuClue>> clues;
  MasyuPuzzle({required this.clues});
}

class MasyuScreen extends ConsumerStatefulWidget {
  const MasyuScreen({super.key});

  @override
  ConsumerState<MasyuScreen> createState() => _MasyuScreenState();
}

class _MasyuScreenState extends ConsumerState<MasyuScreen> {
  final Random _random = Random();
  final int _size = 4; // 4x4 grid

  final List<MasyuPuzzle> _puzzles = [
    // Puzzle 1: White at (0,1), Black at (2,2)
    MasyuPuzzle(clues: [
      [MasyuClue.none, MasyuClue.white, MasyuClue.none, MasyuClue.none],
      [MasyuClue.none, MasyuClue.none, MasyuClue.none, MasyuClue.none],
      [MasyuClue.none, MasyuClue.none, MasyuClue.black, MasyuClue.none],
      [MasyuClue.none, MasyuClue.none, MasyuClue.none, MasyuClue.none]
    ]),
    // Puzzle 2: White at (1,1), Black at (3,0)
    MasyuPuzzle(clues: [
      [MasyuClue.none, MasyuClue.none, MasyuClue.none, MasyuClue.none],
      [MasyuClue.none, MasyuClue.white, MasyuClue.none, MasyuClue.none],
      [MasyuClue.none, MasyuClue.none, MasyuClue.none, MasyuClue.none],
      [MasyuClue.black, MasyuClue.none, MasyuClue.none, MasyuClue.none]
    ]),
    // Puzzle 3: Black at (2,0), White at (0,3)
    MasyuPuzzle(clues: [
      [MasyuClue.none, MasyuClue.none, MasyuClue.none, MasyuClue.white],
      [MasyuClue.none, MasyuClue.none, MasyuClue.none, MasyuClue.none],
      [MasyuClue.black, MasyuClue.none, MasyuClue.none, MasyuClue.none],
      [MasyuClue.none, MasyuClue.none, MasyuClue.none, MasyuClue.none]
    ]),
  ];

  late MasyuPuzzle _currentPuzzle;
  late List<List<MasyuCell>> _board;
  bool _isSolved = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isSolved = false;
    _currentPuzzle = _puzzles[_random.nextInt(_puzzles.length)];
    _board = List.generate(
      _size,
      (r) => List.generate(
        _size,
        (c) => MasyuCell(trackType: 0, clue: _currentPuzzle.clues[r][c]),
      ),
    );
  }

  void _cycleTrack(int r, int c) {
    if (_isSolved) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _board[r][c].trackType = (_board[r][c].trackType + 1) % 7;
      _checkWinCondition();
    });
  }

  void _checkWinCondition() {
    // 1. Build edges/connections graph from track types
    // An edge is active between adjacent cells if both cells' track types point to each other.
    // Cell track connections:
    // 0: empty, 1: H (L, R), 2: V (T, B), 3: TL (B, R), 4: TR (L, B), 5: BL (T, R), 6: BR (L, T)
    List<List<Set<String>>> connections = List.generate(
      _size,
      (_) => List.generate(_size, (_) => <String>{}),
    );

    for (int r = 0; r < _size; r++) {
      for (int c = 0; c < _size; c++) {
        final t = _board[r][c].trackType;
        if (t == 1) { connections[r][c].addAll(['left', 'right']); }
        else if (t == 2) { connections[r][c].addAll(['top', 'bottom']); }
        else if (t == 3) { connections[r][c].addAll(['bottom', 'right']); } // TL corner ┌ points bottom and right
        else if (t == 4) { connections[r][c].addAll(['left', 'bottom']); }  // TR corner ┐ points left and bottom
        else if (t == 5) { connections[r][c].addAll(['top', 'right']); }    // BL corner └ points top and right
        else if (t == 6) { connections[r][c].addAll(['left', 'top']); }     // BR corner ┘ points left and top
      }
    }

    // 2. Validate grid links: connections must align
    // E.g., if (r, c) connects to 'right', (r, c+1) must connect to 'left'.
    for (int r = 0; r < _size; r++) {
      for (int c = 0; c < _size; c++) {
        if (_board[r][c].trackType == 0) continue;

        final conn = connections[r][c];
        if (conn.contains('right')) {
          if (c + 1 >= _size || !connections[r][c + 1].contains('left')) return;
        }
        if (conn.contains('left')) {
          if (c - 1 < 0 || !connections[r][c - 1].contains('right')) return;
        }
        if (conn.contains('bottom')) {
          if (r + 1 >= _size || !connections[r + 1][c].contains('top')) return;
        }
        if (conn.contains('top')) {
          if (r - 1 < 0 || !connections[r - 1][c].contains('bottom')) return;
        }
      }
    }

    // 3. Find if it forms a single closed loop
    // Count total track pieces placed (must be > 2)
    int trackCount = 0;
    Point<int>? startPoint;
    for (int r = 0; r < _size; r++) {
      for (int c = 0; c < _size; c++) {
        if (_board[r][c].trackType > 0) {
          trackCount++;
          startPoint ??= Point(r, c);
        }
      }
    }

    if (trackCount < 4 || startPoint == null) return;

    // Traverse loop to ensure exactly 1 connected cycle
    List<List<bool>> visited = List.generate(_size, (_) => List.generate(_size, (_) => false));
    Point<int> current = startPoint;
    int visitedCount = 0;
    String lastDir = ''; // to avoid going immediately backward

    while (true) {
      visited[current.x][current.y] = true;
      visitedCount++;

      final conns = connections[current.x][current.y];
      Point<int>? next;

      // Decide next cell
      if (conns.contains('right') && lastDir != 'left' && current.y + 1 < _size) {
        next = Point(current.x, current.y + 1);
        lastDir = 'right';
      } else if (conns.contains('left') && lastDir != 'right' && current.y - 1 >= 0) {
        next = Point(current.x, current.y - 1);
        lastDir = 'left';
      } else if (conns.contains('bottom') && lastDir != 'top' && current.x + 1 < _size) {
        next = Point(current.x + 1, current.y);
        lastDir = 'bottom';
      } else if (conns.contains('top') && lastDir != 'bottom' && current.x - 1 >= 0) {
        next = Point(current.x - 1, current.y);
        lastDir = 'top';
      }

      if (next == null) return; // Broken path

      if (next == startPoint) {
        // Returned to start! Check if we visited all track cells
        if (visitedCount != trackCount) return; // loop is split
        break;
      }

      if (visited[next.x][next.y]) {
        return; // self-crossing/loop error
      }

      current = next;
    }

    // 4. Verify Masyu clue constraints
    // White circles: loop must go straight through, and turn in next cell
    // Black circles: loop must turn inside, and go straight in next cells
    for (int r = 0; r < _size; r++) {
      for (int c = 0; c < _size; c++) {
        final cell = _board[r][c];
        if (cell.clue == MasyuClue.white) {
          // Must contain a track piece
          if (cell.trackType == 0) return;
          // Must go straight (type 1 H or type 2 V)
          if (cell.trackType != 1 && cell.trackType != 2) return;
          // Turn logic check on adjacent cells (one of the neighbors must turn)
          bool hasAdjacentTurn = false;
          if (cell.trackType == 1) { // H
            if (c - 1 >= 0 && _board[r][c - 1].trackType >= 3) hasAdjacentTurn = true;
            if (c + 1 < _size && _board[r][c + 1].trackType >= 3) hasAdjacentTurn = true;
          } else { // V
            if (r - 1 >= 0 && _board[r - 1][c].trackType >= 3) hasAdjacentTurn = true;
            if (r + 1 < _size && _board[r + 1][c].trackType >= 3) hasAdjacentTurn = true;
          }
          if (!hasAdjacentTurn) return;
        } else if (cell.clue == MasyuClue.black) {
          if (cell.trackType == 0) return;
          // Must turn (type 3, 4, 5, 6)
          if (cell.trackType < 3) return;
          // Adjacent segments along the entry direction must go straight
          // (Since it is size 4, this constraint is satisfied if adjacent track cells are straight 1/2)
          final conns = connections[r][c];
          if (conns.contains('right') && c + 1 < _size && _board[r][c + 1].trackType != 1) return;
          if (conns.contains('left') && c - 1 >= 0 && _board[r][c - 1].trackType != 1) return;
          if (conns.contains('bottom') && r + 1 < _size && _board[r + 1][c].trackType != 2) return;
          if (conns.contains('top') && r - 1 >= 0 && _board[r - 1][c].trackType != 2) return;
        }
      }
    }

    _isSolved = true;
    _onGameComplete();
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('masyu');
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

  Widget _buildTrackWidget(int type, bool isDark) {
    Color trackColor = DesignSystem.primary;

    switch (type) {
      case 1: // H
        return Divider(color: trackColor, thickness: 5);
      case 2: // V
        return VerticalDivider(color: trackColor, width: 5, thickness: 5);
      case 3: // TL ┌
        return CustomPaint(painter: _CornerPainter(isTop: true, isLeft: true, color: trackColor));
      case 4: // TR ┐
        return CustomPaint(painter: _CornerPainter(isTop: true, isLeft: false, color: trackColor));
      case 5: // BL └
        return CustomPaint(painter: _CornerPainter(isTop: false, isLeft: true, color: trackColor));
      case 6: // BR ┘
        return CustomPaint(painter: _CornerPainter(isTop: false, isLeft: false, color: trackColor));
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'masyu'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'masyu'),
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
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            border: Border.all(
              color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
              width: 3,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double cellSize = constraints.maxWidth / _size;

              return Stack(
                children: [
                  for (int r = 0; r < _size; r++)
                    for (int c = 0; c < _size; c++)
                      Positioned(
                        left: c * cellSize,
                        top: r * cellSize,
                        width: cellSize,
                        height: cellSize,
                        child: GestureDetector(
                          onTap: () => _cycleTrack(r, c),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: (isDark ? DesignSystem.darkOutline : DesignSystem.outline).withOpacity(0.4),
                                width: 0.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Loop track segment
                                _buildTrackWidget(_board[r][c].trackType, isDark),
                                // Masyu circle clues
                                if (_board[r][c].clue == MasyuClue.white)
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black, width: 2),
                                    ),
                                  ),
                                if (_board[r][c].clue == MasyuClue.black)
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                              ],
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

class _CornerPainter extends CustomPainter {
  final bool isTop;
  final bool isLeft;
  final Color color;

  _CornerPainter({required this.isTop, required this.isLeft, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2.0;
    final centerY = size.height / 2.0;

    final path = Path();
    if (isTop && isLeft) {
      // ┌ : starts from bottom center, to center, to right center
      path.moveTo(centerX, size.height);
      path.lineTo(centerX, centerY);
      path.lineTo(size.width, centerY);
    } else if (isTop && !isLeft) {
      // ┐ : starts from bottom center, to center, to left center
      path.moveTo(centerX, size.height);
      path.lineTo(centerX, centerY);
      path.lineTo(0, centerY);
    } else if (!isTop && isLeft) {
      // └ : starts from top center, to center, to right center
      path.moveTo(centerX, 0);
      path.lineTo(centerX, centerY);
      path.lineTo(size.width, centerY);
    } else {
      // ┘ : starts from top center, to center, to left center
      path.moveTo(centerX, 0);
      path.lineTo(centerX, centerY);
      path.lineTo(0, centerY);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CornerPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.isTop != isTop || oldDelegate.isLeft != isLeft;
  }
}
