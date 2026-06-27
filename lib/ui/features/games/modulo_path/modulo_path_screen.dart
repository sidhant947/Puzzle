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

class ModuloPathScreen extends ConsumerStatefulWidget {
  const ModuloPathScreen({super.key});

  @override
  ConsumerState<ModuloPathScreen> createState() => _ModuloPathScreenState();
}

class _ModuloPathScreenState extends ConsumerState<ModuloPathScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final int _gridSize = 3;
  late List<List<int>> _grid;
  late int _modulus;
  late int _remainder;
  List<Point<int>> _userPath = [];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Pick a modulus between 3 and 5
    _modulus = 3 + _random.nextInt(3); // 3, 4, 5
    _remainder = _random.nextInt(_modulus); // 0 to modulus-1

    // Build grid
    _grid = List.generate(_gridSize, (_) => List.generate(_gridSize, (_) => 0));

    // Find a valid path from (0,0) to (2,2)
    List<Point<int>> findPath() {
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

    final path = findPath();

    // Populate grid values
    for (int r = 0; r < _gridSize; r++) {
      for (int c = 0; c < _gridSize; c++) {
        final p = Point(r, c);
        if (path.contains(p)) {
          // Path cells satisfy: val % modulus == remainder
          int k = 1 + _random.nextInt(5);
          _grid[r][c] = k * _modulus + _remainder;
        } else {
          // Non-path cells satisfy: val % modulus != remainder
          int k = 1 + _random.nextInt(5);
          int badRemainder = (_remainder + 1 + _random.nextInt(_modulus - 1)) % _modulus;
          _grid[r][c] = k * _modulus + badRemainder;
        }
      }
    }

    // Start user path at top-left
    _userPath = [const Point(0, 0)];
  }

  void _onCellTapped(int r, int c) {
    if (_isGameOver) return;

    final cell = Point(r, c);

    // If tapping last cell in path, backtrack
    if (_userPath.length > 1 && _userPath.last == cell) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _userPath.removeLast();
      });
      return;
    }

    // Must be adjacent to path end
    final currentEnd = _userPath.last;
    final isAdjacent = (currentEnd.x - r).abs() + (currentEnd.y - c).abs() == 1;

    // Check if cell is already in the path
    final isAlreadyInPath = _userPath.contains(cell);

    // Check modulo constraint
    final satisfiesModulo = _grid[r][c] % _modulus == _remainder;

    if (isAdjacent && !isAlreadyInPath) {
      if (satisfiesModulo) {
        HapticFeedbackUtil.lightImpact();
        setState(() {
          _userPath.add(cell);

          // Check if reached destination (2,2)
          if (r == _gridSize - 1 && c == _gridSize - 1) {
            _score++;
            HapticFeedbackUtil.success();
            if (_score >= _targetScore) {
              _isGameOver = true;
              _onGameComplete();
            } else {
              _generatePuzzle();
            }
          }
        });
      } else {
        HapticFeedbackUtil.error();
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.snackbarInvalidStep(_grid[r][c], _modulus, _remainder)),
            duration: const Duration(milliseconds: 1000),
          ),
        );
      }
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('modulo_path');
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
      title: L10nGameHelpers.getGameTitle(context, 'modulo_path'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'modulo_path'),
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
          // Modulo condition card
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.target, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(height: 6),
                    Text(
                      'Cell value  mod  $_modulus  =  $_remainder',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: DesignSystem.gameOrange),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
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
          // Grid
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
                        // Path lines connection
                        if (_userPath.length > 1)
                          CustomPaint(
                            size: Size(constraints.maxWidth, constraints.maxHeight),
                            painter: PathPainter(
                              path: _userPath,
                              cellSize: cellSize,
                              color: DesignSystem.primary.withValues(alpha: 0.4),
                            ),
                          ),
                        // Cells
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
                                  margin: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: _userPath.contains(Point(r, c))
                                        ? DesignSystem.primary.withValues(alpha: 0.2)
                                        : (isDark ? Colors.white10 : Colors.black12.withValues(alpha: 0.04)),
                                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                    border: Border.all(
                                      color: _userPath.contains(Point(r, c))
                                          ? DesignSystem.primary
                                          : Colors.transparent,
                                      width: 2.5,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${_grid[r][c]}',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: _userPath.contains(Point(r, c))
                                              ? DesignSystem.primary
                                              : (isDark ? Colors.white70 : Colors.black87),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'rem ${_grid[r][c] % _modulus}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: isDark ? Colors.white30 : Colors.black.withValues(alpha: 0.3),
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
          ),
        ],
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  final List<Point<int>> path;
  final double cellSize;
  final Color color;

  PathPainter({required this.path, required this.cellSize, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final drawingPath = Path();
    for (int i = 0; i < path.length; i++) {
      final p = path[i];
      final x = p.y * cellSize + cellSize / 2;
      final y = p.x * cellSize + cellSize / 2;
      if (i == 0) {
        drawingPath.moveTo(x, y);
      } else {
        drawingPath.lineTo(x, y);
      }
    }
    canvas.drawPath(drawingPath, paint);
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) => true;
}
