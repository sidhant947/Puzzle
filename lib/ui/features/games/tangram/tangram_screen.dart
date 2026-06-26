import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class TangramPiece {
  final int id;
  final List<Point<int>> cells; // Relative offsets of cells from pivot (0,0)
  final Color color;

  TangramPiece({required this.id, required this.cells, required this.color});
}

class TangramScreen extends ConsumerStatefulWidget {
  const TangramScreen({super.key});

  @override
  ConsumerState<TangramScreen> createState() => _TangramScreenState();
}

class _TangramScreenState extends ConsumerState<TangramScreen> {
  final Random _random = Random();
  final int _gridSize = 4;

  // Puzzle lists
  late List<Point<int>> _targetOutline; // Cells that must be filled
  late List<TangramPiece> _pieces;

  // Selection & Placement state
  int? _selectedPieceId;
  List<Point<int>?> _piecePlacements = []; // Pivot positions for pieces (index matches piece index)

  bool _isSolved = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isSolved = false;
    _selectedPieceId = null;

    final puzzleIdx = _random.nextInt(3);
    if (puzzleIdx == 0) {
      // Puzzle 1: 3x3 square outline
      _targetOutline = [];
      for (int r = 0; r < 3; r++) {
        for (int c = 0; c < 3; c++) {
          _targetOutline.add(Point(r, c));
        }
      }

      _pieces = [
        // 2x2 Square (4 cells)
        TangramPiece(id: 0, color: DesignSystem.gameBlue, cells: [const Point(0, 0), const Point(0, 1), const Point(1, 0), const Point(1, 1)]),
        // 1x3 Line (3 cells)
        TangramPiece(id: 1, color: DesignSystem.gamePurple, cells: [const Point(0, 0), const Point(0, 1), const Point(0, 2)]),
        // 1x2 Line (2 cells)
        TangramPiece(id: 2, color: DesignSystem.gameTeal, cells: [const Point(0, 0), const Point(0, 1)]),
      ];
    } else if (puzzleIdx == 1) {
      // Puzzle 2: Stair shape
      _targetOutline = [
        const Point(0, 0),
        const Point(1, 0), const Point(1, 1),
        const Point(2, 0), const Point(2, 1), const Point(2, 2)
      ];

      _pieces = [
        // L-shape (3 cells)
        TangramPiece(id: 0, color: DesignSystem.gameOrange, cells: [const Point(0, 0), const Point(1, 0), const Point(1, 1)]),
        // 1x2 Line (2 cells)
        TangramPiece(id: 1, color: DesignSystem.gameRose, cells: [const Point(0, 0), const Point(0, 1)]),
        // 1x1 block (1 cell)
        TangramPiece(id: 2, color: DesignSystem.gameBlue, cells: [const Point(0, 0)]),
      ];
    } else {
      // Puzzle 3: T-shape outline / Cross shape
      _targetOutline = [
        const Point(0, 1),
        const Point(1, 0), const Point(1, 1), const Point(1, 2),
        const Point(2, 1),
      ];

      _pieces = [
        // T-shape (4 cells)
        TangramPiece(id: 0, color: DesignSystem.gameTeal, cells: [const Point(0, 1), const Point(1, 0), const Point(1, 1), const Point(1, 2)]),
        // 1x1 block (1 cell)
        TangramPiece(id: 1, color: DesignSystem.gameRose, cells: [const Point(0, 0)]),
      ];
    }

    _piecePlacements = List.filled(_pieces.length, null);
  }

  void _onCellTapped(int r, int c) {
    if (_isSolved || _selectedPieceId == null) return;

    final pieceIdx = _pieces.indexWhere((p) => p.id == _selectedPieceId);
    if (pieceIdx == -1) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      final point = Point(r, c);

      // Check if placement fits entirely inside grid boundaries
      bool fits = true;
      final cells = _pieces[pieceIdx].cells;
      for (var offset in cells) {
        final nr = r + offset.x;
        final nc = c + offset.y;
        if (nr < 0 || nr >= _gridSize || nc < 0 || nc >= _gridSize) {
          fits = false;
          break;
        }
      }

      if (fits) {
        _piecePlacements[pieceIdx] = point;
        _checkWinCondition();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Piece does not fit there!'), duration: Duration(milliseconds: 600)),
        );
      }
    });
  }

  void _checkWinCondition() {
    // 1. All pieces must be placed
    for (var placement in _piecePlacements) {
      if (placement == null) return;
    }

    // 2. Track all filled coordinates
    final Set<Point<int>> filled = {};
    for (int i = 0; i < _pieces.length; i++) {
      final placement = _piecePlacements[i]!;
      final cells = _pieces[i].cells;
      for (var offset in cells) {
        final pt = Point(placement.x + offset.x, placement.y + offset.y);
        // Overlap check
        if (filled.contains(pt)) return;
        filled.add(pt);
      }
    }

    // 3. Check if filled matches outline exactly
    if (filled.length != _targetOutline.length) return;
    for (var pt in _targetOutline) {
      if (!filled.contains(pt)) return;
    }

    _isSolved = true;
    _onGameComplete();
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('tangram');
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
      title: 'TANGRAM PUZZLE',
      subtitle: 'Select pieces and place them to fill the target outline',
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
          // Target Outline Board
          Expanded(
            child: Center(
              child: Container(
                width: 240,
                height: 240,
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
                    final double cellSize = constraints.maxWidth / _gridSize;

                    // Compute which cells are currently covered by placed pieces
                    final Map<Point<int>, Color> coveredMap = {};
                    for (int i = 0; i < _pieces.length; i++) {
                      final placement = _piecePlacements[i];
                      if (placement != null) {
                        for (var offset in _pieces[i].cells) {
                          final pt = Point(placement.x + offset.x, placement.y + offset.y);
                          coveredMap[pt] = _pieces[i].color;
                        }
                      }
                    }

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
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: coveredMap.containsKey(Point(r, c))
                                        ? coveredMap[Point(r, c)]
                                        : (_targetOutline.contains(Point(r, c))
                                            ? Colors.grey.withOpacity(0.3)
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                    border: _targetOutline.contains(Point(r, c))
                                        ? Border.all(
                                            color: isDark ? Colors.white30 : Colors.black26,
                                            width: 1.5,
                                          )
                                        : null,
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
          // Pieces Dock / Selector
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: isDark ? Colors.black12 : Colors.grey.withOpacity(0.05),
            child: Column(
              children: [
                Text(
                  'PIECES DOCK (Tap to select, then tap grid to place)',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pieces.length, (index) {
                    final piece = _pieces[index];
                    final isSelected = _selectedPieceId == piece.id;
                    final isPlaced = _piecePlacements[index] != null;

                    return GestureDetector(
                      onTap: () {
                        HapticFeedbackUtil.lightImpact();
                        setState(() {
                          // Toggle or select
                          if (isSelected) {
                            // If selected and already placed, recall/reset placement
                            _piecePlacements[index] = null;
                            _selectedPieceId = null;
                          } else {
                            _selectedPieceId = piece.id;
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? DesignSystem.primary.withOpacity(0.15)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                          border: Border.all(
                            color: isSelected ? DesignSystem.primary : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Miniature piece shape representation
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              child: Stack(
                                children: piece.cells.map((cell) {
                                  // Map cell relative points to offset multipliers
                                  return Positioned(
                                    left: cell.y * 12.0 + 12,
                                    top: cell.x * 12.0 + 12,
                                    width: 10,
                                    height: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: piece.color.withOpacity(isPlaced ? 0.4 : 1.0),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              isPlaced ? 'PLACED' : (isSelected ? 'ACTIVE' : 'SELECT'),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: isPlaced ? Colors.grey : (isSelected ? DesignSystem.primary : null),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
