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

class MazeNav3DScreen extends ConsumerStatefulWidget {
  const MazeNav3DScreen({super.key});

  @override
  ConsumerState<MazeNav3DScreen> createState() => _MazeNav3DScreenState();
}

class _MazeNav3DScreenState extends ConsumerState<MazeNav3DScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  // Directions
  static const int north = 0;
  static const int east = 1;
  static const int south = 2;
  static const int west = 3;

  // User position & orientation
  int _playerX = 0;
  int _playerY = 0;
  int _facing = east; // Start facing East

  // 4x4 Grid representation (0 = empty, 1 = wall, 2 = exit)
  late List<List<int>> _mazeGrid;
  final int _gridSize = 4;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate a simple 4x4 maze
    // To make it easy and solvable, let's create a clear pathway
    _mazeGrid = List.generate(_gridSize, (_) => List.filled(_gridSize, 1));

    // Simple random walk path from (0,0) to random exit at boundaries
    int cx = 0;
    int cy = 0;
    _mazeGrid[cy][cx] = 0;

    final path = <Point<int>>[Point(cx, cy)];
    while (path.length < 6) {
      final neighbors = <Point<int>>[];
      if (cx > 0) neighbors.add(Point(cx - 1, cy));
      if (cx < _gridSize - 1) neighbors.add(Point(cx + 1, cy));
      if (cy > 0) neighbors.add(Point(cx, cy - 1));
      if (cy < _gridSize - 1) neighbors.add(Point(cx, cy + 1));

      final next = neighbors[_random.nextInt(neighbors.length)];
      cx = next.x;
      cy = next.y;
      _mazeGrid[cy][cx] = 0;
      path.add(next);
    }

    // Set exit
    _mazeGrid[cy][cx] = 2;

    // Reset player position to start of path
    _playerX = path.first.x;
    _playerY = path.first.y;
    _facing = east;
  }

  void _moveForward() {
    int nextX = _playerX;
    int nextY = _playerY;

    if (_facing == north) nextY--;
    if (_facing == east) nextX++;
    if (_facing == south) nextY++;
    if (_facing == west) nextX--;

    if (nextX >= 0 && nextX < _gridSize && nextY >= 0 && nextY < _gridSize) {
      final cell = _mazeGrid[nextY][nextX];
      if (cell != 1) {
        HapticFeedbackUtil.success();
        setState(() {
          _playerX = nextX;
          _playerY = nextY;
        });

        if (cell == 2) {
          // Reached Exit!
          _score++;
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            final l10n = AppLocalizations.of(context)!;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.snackbarReachedExit),
                backgroundColor: DesignSystem.gameGreen,
                duration: Duration(seconds: 1),
              ),
            );
            setState(() {
              _generatePuzzle();
            });
          }
        }
        return;
      }
    }

    HapticFeedbackUtil.error();
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.snackbarCannotMoveBlocked),
        backgroundColor: DesignSystem.gameRed,
        duration: Duration(milliseconds: 600),
      ),
    );
  }

  void _turnLeft() {
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _facing = (_facing - 1 + 4) % 4;
    });
  }

  void _turnRight() {
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _facing = (_facing + 1) % 4;
    });
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('maze_nav_3d');
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
      title: L10nGameHelpers.getGameTitle(context, 'maze_nav_3d'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'maze_nav_3d'),
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
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Score Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                'Exit Found: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            // Perspective / Grid Layout Panel
            Expanded(
              child: Row(
                children: [
                  // Left: 3D perspective viewpoint simulator
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        border: Border.all(
                          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: CustomPaint(
                          size: const Size(200, 200),
                          painter: _FirstPersonViewPainter(
                            playerX: _playerX,
                            playerY: _playerY,
                            facing: _facing,
                            mazeGrid: _mazeGrid,
                            gridSize: _gridSize,
                            isDark: isDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Right: 2D Minimap
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        border: Border.all(
                          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'MINIMAP',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          AspectRatio(
                            aspectRatio: 1,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 3,
                              ),
                              itemCount: 16,
                              itemBuilder: (context, idx) {
                                final r = idx ~/ 4;
                                final c = idx % 4;
                                final isPlayer = r == _playerY && c == _playerX;
                                final cell = _mazeGrid[r][c];

                                Color tileColor;
                                if (isPlayer) {
                                  tileColor = DesignSystem.primary;
                                } else if (cell == 1) {
                                  tileColor = isDark ? Colors.white10 : Colors.black12;
                                } else if (cell == 2) {
                                  tileColor = DesignSystem.gameGreen;
                                } else {
                                  tileColor = isDark ? Colors.white30 : Colors.white;
                                }

                                return Container(
                                  decoration: BoxDecoration(
                                    color: tileColor,
                                    borderRadius: BorderRadius.circular(2),
                                    border: isPlayer
                                        ? Border.all(color: Colors.white, width: 1.5)
                                        : null,
                                  ),
                                  child: isPlayer
                                      ? Center(
                                          child: Transform.rotate(
                                            angle: _facing * pi / 2 - pi / 2,
                                            child: const Icon(Icons.navigation_rounded, size: 12, color: Colors.white),
                                          ),
                                        )
                                      : null,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Navigation Controls
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlBtn(Icons.rotate_left, _turnLeft, isDark),
                  const SizedBox(width: 20),
                  _buildControlBtn(Icons.arrow_upward_rounded, _moveForward, isDark, primary: true),
                  const SizedBox(width: 20),
                  _buildControlBtn(Icons.rotate_right, _turnRight, isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlBtn(IconData icon, VoidCallback onPressed, bool isDark, {bool primary = false}) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primary ? DesignSystem.primary : (isDark ? DesignSystem.darkSurface : Colors.white),
          foregroundColor: primary ? Colors.white : (isDark ? Colors.white : Colors.black87),
          elevation: 2,
          side: BorderSide(
            color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
            width: 1.5,
          ),
          shape: const CircleBorder(),
        ),
        child: Icon(icon, size: 28),
      ),
    );
  }
}

class _FirstPersonViewPainter extends CustomPainter {
  final int playerX;
  final int playerY;
  final int facing;
  final List<List<int>> mazeGrid;
  final int gridSize;
  final bool isDark;

  _FirstPersonViewPainter({
    required this.playerX,
    required this.playerY,
    required this.facing,
    required this.mazeGrid,
    required this.gridSize,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Basic 3D projection representation
    // Let's check what is in front of the player (forward cell)
    int frontX = playerX;
    int frontY = playerY;

    if (facing == 0) frontY--;
    if (facing == 1) frontX++;
    if (facing == 2) frontY++;
    if (facing == 3) frontX--;

    final bool hasFrontWall = frontX < 0 ||
        frontX >= gridSize ||
        frontY < 0 ||
        frontY >= gridSize ||
        mazeGrid[frontY][frontX] == 1;

    final bool hasFrontExit = frontX >= 0 &&
        frontX < gridSize &&
        frontY >= 0 &&
        frontY < gridSize &&
        mazeGrid[frontY][frontX] == 2;

    final width = size.width;
    final height = size.height;

    // Draw floor and ceiling
    final bgPaint = Paint()..color = isDark ? Colors.black38 : Colors.grey[300]!;
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), bgPaint);

    final floorPaint = Paint()..color = isDark ? Colors.grey[900]! : Colors.grey[400]!;
    canvas.drawRect(Rect.fromLTWH(0, height / 2, width, height / 2), floorPaint);

    // Wall paints
    final wallPaint = Paint()
      ..color = isDark ? DesignSystem.darkOutline : DesignSystem.outline
      ..style = PaintingStyle.fill;

    final exitPaint = Paint()
      ..color = DesignSystem.gameGreen
      ..style = PaintingStyle.fill;

    // Draw perspective side walls
    final Path leftWall = Path()
      ..moveTo(0, 0)
      ..lineTo(width * 0.25, height * 0.25)
      ..lineTo(width * 0.25, height * 0.75)
      ..lineTo(0, height)
      ..close();
    canvas.drawPath(leftWall, wallPaint);

    final Path rightWall = Path()
      ..moveTo(width, 0)
      ..lineTo(width * 0.75, height * 0.25)
      ..lineTo(width * 0.75, height * 0.75)
      ..lineTo(width, height)
      ..close();
    canvas.drawPath(rightWall, wallPaint);

    // Draw front wall or front path corridor
    if (hasFrontWall) {
      final frontWall = Rect.fromLTRB(width * 0.25, height * 0.25, width * 0.75, height * 0.75);
      final frontWallPaint = Paint()
        ..color = isDark ? Colors.white24 : Colors.grey[700]!
        ..style = PaintingStyle.fill;
      canvas.drawRect(frontWall, frontWallPaint);

      // Draw horizontal crosslines for brick texture decoration
      final strokePaint = Paint()
        ..color = isDark ? Colors.black45 : Colors.white30
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawRect(frontWall, strokePaint);
    } else if (hasFrontExit) {
      final frontWall = Rect.fromLTRB(width * 0.25, height * 0.25, width * 0.75, height * 0.75);
      canvas.drawRect(frontWall, exitPaint);
      
      final textPainter = TextPainter(
        text: const TextSpan(
          text: 'EXIT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.5,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(width / 2 - textPainter.width / 2, height / 2 - textPainter.height / 2),
      );
    } else {
      // Empty path corridor (shows horizon line block)
      final frontWall = Rect.fromLTRB(width * 0.25, height * 0.25, width * 0.75, height * 0.75);
      final emptyCorridorPaint = Paint()
        ..color = isDark ? Colors.black54 : Colors.white
        ..style = PaintingStyle.fill;
      canvas.drawRect(frontWall, emptyCorridorPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
