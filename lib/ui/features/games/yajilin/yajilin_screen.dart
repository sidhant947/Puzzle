import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'yajilin_engine.dart';

class YajilinScreen extends ConsumerStatefulWidget {
  const YajilinScreen({super.key});

  @override
  ConsumerState<YajilinScreen> createState() => _YajilinScreenState();
}

class _YajilinScreenState extends ConsumerState<YajilinScreen> {
  late YajilinPuzzle _puzzle;
  int? _selectedR;
  int? _selectedC;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _puzzle = YajilinEngine.generatePuzzle();
      _selectedR = null;
      _selectedC = null;
      _isCompleted = false;
    });
  }

  void _onDoubleTapCell(int r, int c) {
    if (_isCompleted) return;
    final cell = _puzzle.grid[r][c];
    if (cell.isClue) return;

    HapticFeedbackUtil.selectionClick();
    setState(() {
      if (cell.state == YajilinCellState.empty) {
        cell.state = YajilinCellState.black;
      } else if (cell.state == YajilinCellState.black) {
        cell.state = YajilinCellState.dot;
      } else {
        cell.state = YajilinCellState.empty;
      }
    });
    _checkSolution();
  }

  void _onTapNode(int r, int c) {
    if (_isCompleted) return;
    final cell = _puzzle.grid[r][c];
    if (cell.isClue || cell.state == YajilinCellState.black) {
      setState(() {
        _selectedR = null;
        _selectedC = null;
      });
      return;
    }

    HapticFeedbackUtil.selectionClick();
    setState(() {
      if (_selectedR == null) {
        _selectedR = r;
        _selectedC = c;
      } else {
        final dr = (r - _selectedR!).abs();
        final dc = (c - _selectedC!).abs();

        if ((dr == 1 && dc == 0) || (dr == 0 && dc == 1)) {
          final edge = YajilinEdge(_selectedR!, _selectedC!, r, c);
          if (_puzzle.edges.contains(edge)) {
            _puzzle.edges.remove(edge);
          } else {
            _puzzle.edges.add(edge);
          }
          _selectedR = r;
          _selectedC = c;
          _checkSolution();
        } else {
          _selectedR = r;
          _selectedC = c;
        }
      }
    });
  }

  void _checkSolution() {
    if (YajilinEngine.isSolved(_puzzle.grid, _puzzle.edges, _puzzle.size)) {
      setState(() {
        _isCompleted = true;
      });
      ref.read(gameStreakNotifierProvider.notifier).completeGame('yajilin');
      _showWinDialog();
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.yajilinWinTitle,
        message: l10n.yajilinWinMessage,
        onPlayAgain: () {
          Navigator.of(context).pop();
          _startNewGame();
        },
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: l10n.yajilinTitle,
      subtitle: l10n.yajilinSubtitle,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegend(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildBoard(colorScheme),
              const SizedBox(height: DesignSystem.spaceLG),
              TangibleButton(
                color: colorScheme.surface,
                onTap: _startNewGame,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh_rounded, color: colorScheme.primary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.playAgain.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontSize: DesignSystem.fontSizeMD,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegend(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(colorScheme.primary, "TAP: DRAW LOOP", Colors.white),
        const SizedBox(width: 16),
        _buildLegendItem(colorScheme.onSurface, "DBL-TAP: BLACK", colorScheme.surface),
      ],
    );
  }

  Widget _buildLegendItem(Color bg, String label, Color textColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(3)),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),
      ],
    );
  }

  Widget _buildBoard(ColorScheme colorScheme) {
    const boardSize = 300.0;
    final size = _puzzle.size;
    final step = boardSize / size;

    return Container(
      width: boardSize + 20,
      height: boardSize + 20,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Stack(
        children: [
          // Edges layer
          CustomPaint(
            size: const Size(boardSize, boardSize),
            painter: _YajilinEdgePainter(
              edges: _puzzle.edges,
              step: step,
              colorScheme: colorScheme,
            ),
          ),
          // Cells layer
          ...List.generate(size * size, (index) {
            final r = index ~/ size;
            final c = index % size;
            final cell = _puzzle.grid[r][c];
            final isSelected = _selectedR == r && _selectedC == c;

            return Positioned(
              left: c * step,
              top: r * step,
              width: step,
              height: step,
              child: GestureDetector(
                onTap: () => _onTapNode(r, c),
                onDoubleTap: () => _onDoubleTapCell(r, c),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: cell.state == YajilinCellState.black
                        ? colorScheme.onSurface
                        : (cell.isClue ? DesignSystem.gameAmber.withValues(alpha: 0.15) : Colors.transparent),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    border: Border.all(
                      color: isSelected
                          ? DesignSystem.primary
                          : (cell.isClue ? DesignSystem.gameAmber : colorScheme.outline.withValues(alpha: 0.2)),
                      width: isSelected ? 2.5 : 1,
                    ),
                  ),
                  child: Center(
                    child: cell.isClue
                        ? _buildClueWidget(cell.clue!, colorScheme)
                        : (cell.state == YajilinCellState.dot
                            ? Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: DesignSystem.gameRose,
                                ),
                              )
                            : null),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildClueWidget(YajilinClue clue, ColorScheme colorScheme) {
    IconData icon;
    switch (clue.dir) {
      case ArrowDirection.up:
        icon = Icons.arrow_upward_rounded;
        break;
      case ArrowDirection.down:
        icon = Icons.arrow_downward_rounded;
        break;
      case ArrowDirection.left:
        icon = Icons.arrow_back_rounded;
        break;
      case ArrowDirection.right:
        icon = Icons.arrow_forward_rounded;
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${clue.count}',
          style: const TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: DesignSystem.gameAmber,
          ),
        ),
        Icon(icon, size: 16, color: DesignSystem.gameAmber),
      ],
    );
  }
}

class _YajilinEdgePainter extends CustomPainter {
  final Set<YajilinEdge> edges;
  final double step;
  final ColorScheme colorScheme;

  _YajilinEdgePainter({required this.edges, required this.step, required this.colorScheme});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = DesignSystem.primary
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    final half = step / 2;

    for (final e in edges) {
      final p1 = Offset(e.c1 * step + half, e.r1 * step + half);
      final p2 = Offset(e.c2 * step + half, e.r2 * step + half);
      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
