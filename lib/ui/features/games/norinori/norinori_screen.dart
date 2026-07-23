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

class NorinoriPuzzle {
  final List<List<int>> roomIds; // 4x4 array of room indexes (e.g. 0 to K)
  final int totalRooms;

  NorinoriPuzzle({required this.roomIds, required this.totalRooms});
}

class NorinoriScreen extends ConsumerStatefulWidget {
  const NorinoriScreen({super.key});

  @override
  ConsumerState<NorinoriScreen> createState() => _NorinoriScreenState();
}

class _NorinoriScreenState extends ConsumerState<NorinoriScreen> {
  final Random _random = Random();
  final int _size = 4;

  final List<NorinoriPuzzle> _puzzles = [
    // Puzzle 1: 4 rooms
    NorinoriPuzzle(
      roomIds: [
        [0, 0, 1, 1],
        [0, 2, 2, 1],
        [3, 3, 2, 2],
        [3, 3, 2, 2]
      ],
      totalRooms: 4,
    ),
    // Puzzle 2: 3 rooms
    NorinoriPuzzle(
      roomIds: [
        [0, 0, 0, 1],
        [0, 2, 1, 1],
        [2, 2, 2, 1],
        [2, 2, 1, 1]
      ],
      totalRooms: 3,
    ),
    // Puzzle 3: 4 rooms
    NorinoriPuzzle(
      roomIds: [
        [0, 0, 0, 1],
        [3, 3, 1, 1],
        [3, 3, 2, 2],
        [3, 3, 2, 2]
      ],
      totalRooms: 4,
    ),
  ];

  late NorinoriPuzzle _currentPuzzle;
  late List<List<bool>> _shaded;
  bool _isSolved = false;

  final List<Color> _roomColors = [
    DesignSystem.gameBlue.withValues(alpha: 0.15),
    DesignSystem.gamePurple.withValues(alpha: 0.15),
    DesignSystem.gameTeal.withValues(alpha: 0.15),
    DesignSystem.gameOrange.withValues(alpha: 0.15),
    DesignSystem.gamePink.withValues(alpha: 0.15),
  ];

  final List<Color> _borderColors = [
    DesignSystem.gameBlue,
    DesignSystem.gamePurple,
    DesignSystem.gameTeal,
    DesignSystem.gameOrange,
    DesignSystem.gamePink,
  ];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isSolved = false;
    _currentPuzzle = _puzzles[_random.nextInt(_puzzles.length)];
    _shaded = List.generate(_size, (_) => List.generate(_size, (_) => false));
  }

  void _toggleCell(int r, int c) {
    if (_isSolved) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _shaded[r][c] = !_shaded[r][c];
      _checkWinCondition();
    });
  }

  void _checkWinCondition() {
    // 1. Check if each room contains exactly 2 shaded cells
    List<int> roomShadedCounts = List.filled(_currentPuzzle.totalRooms, 0);
    for (int r = 0; r < _size; r++) {
      for (int c = 0; c < _size; c++) {
        if (_shaded[r][c]) {
          final roomId = _currentPuzzle.roomIds[r][c];
          roomShadedCounts[roomId]++;
        }
      }
    }

    for (int count in roomShadedCounts) {
      if (count != 2) return;
    }

    // 2. Check if shaded cells form exactly size-2 orthogonally connected groups
    List<List<bool>> visited = List.generate(_size, (_) => List.generate(_size, (_) => false));

    for (int r = 0; r < _size; r++) {
      for (int c = 0; c < _size; c++) {
        if (_shaded[r][c] && !visited[r][c]) {
          // BFS / DFS to find connected component size
          int compSize = 0;
          final queue = <Point<int>>[Point(r, c)];
          visited[r][c] = true;

          while (queue.isNotEmpty) {
            final curr = queue.removeAt(0);
            compSize++;

            // Check neighbors
            final neighbors = [
              Point(curr.x - 1, curr.y),
              Point(curr.x + 1, curr.y),
              Point(curr.x, curr.y - 1),
              Point(curr.x, curr.y + 1),
            ];

            for (var n in neighbors) {
              if (n.x >= 0 && n.x < _size && n.y >= 0 && n.y < _size) {
                if (_shaded[n.x][n.y] && !visited[n.x][n.y]) {
                  visited[n.x][n.y] = true;
                  queue.add(n);
                }
              }
            }
          }

          if (compSize != 2) {
            return; // Every black group must be exactly size 2 (a domino)
          }
        }
      }
    }

    _isSolved = true;
    _onGameComplete();
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('norinori');
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
      title: L10nGameHelpers.getGameTitle(context, 'norinori'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'norinori'),
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
                  // Grid cell representation
                  for (int r = 0; r < _size; r++)
                    for (int c = 0; c < _size; c++)
                      Positioned(
                        left: c * cellSize,
                        top: r * cellSize,
                        width: cellSize,
                        height: cellSize,
                        child: GestureDetector(
                          onTap: () => _toggleCell(r, c),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _shaded[r][c]
                                  ? Colors.black87
                                  : _roomColors[_currentPuzzle.roomIds[r][c] % _roomColors.length],
                              border: Border(
                                top: BorderSide(
                                  color: r > 0 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r - 1][c]
                                      ? Colors.grey.withValues(alpha: 0.2)
                                      : _borderColors[_currentPuzzle.roomIds[r][c] % _borderColors.length],
                                  width: r > 0 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r - 1][c] ? 1 : 3.5,
                                ),
                                left: BorderSide(
                                  color: c > 0 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r][c - 1]
                                      ? Colors.grey.withValues(alpha: 0.2)
                                      : _borderColors[_currentPuzzle.roomIds[r][c] % _borderColors.length],
                                  width: c > 0 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r][c - 1] ? 1 : 3.5,
                                ),
                                bottom: BorderSide(
                                  color: r < _size - 1 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r + 1][c]
                                      ? Colors.grey.withValues(alpha: 0.2)
                                      : _borderColors[_currentPuzzle.roomIds[r][c] % _borderColors.length],
                                  width: r < _size - 1 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r + 1][c] ? 1 : 3.5,
                                ),
                                right: BorderSide(
                                  color: c < _size - 1 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r][c + 1]
                                      ? Colors.grey.withValues(alpha: 0.2)
                                      : _borderColors[_currentPuzzle.roomIds[r][c] % _borderColors.length],
                                  width: c < _size - 1 && _currentPuzzle.roomIds[r][c] == _currentPuzzle.roomIds[r][c + 1] ? 1 : 3.5,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: _shaded[r][c]
                                ? Container(
                                    width: 14,
                                    height: 14,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : null,
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
