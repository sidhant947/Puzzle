import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'polyomino_tiling_engine.dart';

class PolyominoTilingScreen extends ConsumerStatefulWidget {
  const PolyominoTilingScreen({super.key});

  @override
  ConsumerState<PolyominoTilingScreen> createState() => _PolyominoTilingScreenState();
}

class _PolyominoTilingScreenState extends ConsumerState<PolyominoTilingScreen> {
  late PolyominoPuzzle _puzzle;
  late List<List<int?>> _board;
  final Set<int> _placedPieceIds = {};
  int? _selectedPieceId;
  List<List<int>> _selectedCoords = [];
  bool _isCompleted = false;

  final List<Color> _palette = [
    DesignSystem.primary,
    DesignSystem.accentEmerald,
    DesignSystem.gameAmber,
    DesignSystem.gameRose,
  ];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _puzzle = PolyominoTilingEngine.generatePuzzle();
      _board = List.generate(_puzzle.rows, (_) => List.generate(_puzzle.cols, (_) => null));
      _placedPieceIds.clear();
      _selectedPieceId = null;
      _selectedCoords = [];
      _isCompleted = false;
    });
  }

  void _selectPiece(TileBlock piece) {
    if (_placedPieceIds.contains(piece.id)) return;
    HapticFeedbackUtil.selectionClick();
    setState(() {
      _selectedPieceId = piece.id;
      _selectedCoords = List.from(piece.coords);
    });
  }

  void _rotateSelectedPiece() {
    if (_selectedPieceId == null) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedCoords = _selectedCoords.map((pt) => [pt[1], -pt[0]]).toList();
      // Normalize
      int minR = _selectedCoords.map((pt) => pt[0]).reduce((a, b) => a < b ? a : b);
      int minC = _selectedCoords.map((pt) => pt[1]).reduce((a, b) => a < b ? a : b);
      _selectedCoords = _selectedCoords.map((pt) => [pt[0] - minR, pt[1] - minC]).toList();
    });
  }

  void _placePieceOnBoard(int startR, int startC) {
    if (_selectedPieceId == null || _isCompleted) return;

    // Check fit
    for (final pt in _selectedCoords) {
      final r = startR + pt[0];
      final c = startC + pt[1];
      if (r < 0 || r >= _puzzle.rows || c < 0 || c >= _puzzle.cols) {
        HapticFeedbackUtil.error();
        return;
      }
      if (_board[r][c] != null) {
        HapticFeedbackUtil.error();
        return;
      }
    }

    HapticFeedbackUtil.selectionClick();
    setState(() {
      for (final pt in _selectedCoords) {
        final r = startR + pt[0];
        final c = startC + pt[1];
        _board[r][c] = _selectedPieceId;
      }
      _placedPieceIds.add(_selectedPieceId!);
      _selectedPieceId = null;
      _selectedCoords = [];
    });

    _checkWin();
  }

  void _removePieceFromBoard(int pieceId) {
    HapticFeedbackUtil.lightImpact();
    setState(() {
      for (int r = 0; r < _puzzle.rows; r++) {
        for (int c = 0; c < _puzzle.cols; c++) {
          if (_board[r][c] == pieceId) {
            _board[r][c] = null;
          }
        }
      }
      _placedPieceIds.remove(pieceId);
    });
  }

  void _checkWin() {
    if (PolyominoTilingEngine.isSolved(_board, _puzzle.rows, _puzzle.cols)) {
      HapticFeedbackUtil.victory();
      setState(() {
        _isCompleted = true;
      });
      ref.read(gameStreakNotifierProvider.notifier).completeGame('polyomino_tiling');
      _showWinDialog();
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.polyominoTilingWinTitle,
        message: l10n.polyominoTilingWinMessage,
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
      title: l10n.polyominoTilingTitle,
      subtitle: l10n.polyominoTilingSubtitle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            children: [
              _buildHeader(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: Center(child: _buildBoardGrid(colorScheme))),
              const SizedBox(height: DesignSystem.spaceMD),
              _buildPieceTray(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              TangibleButton(
                color: _selectedPieceId != null ? DesignSystem.primary : colorScheme.surface,
                width: double.infinity,
                onTap: _selectedPieceId != null ? _rotateSelectedPiece : null,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.rotate_right_rounded,
                          color: _selectedPieceId != null ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.3)),
                      const SizedBox(width: 8),
                      Text(
                        'ROTATE SELECTED PIECE',
                        style: TextStyle(
                          fontFamily: 'Bebas Neue',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: _selectedPieceId != null ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.3),
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.dashboard_customize_rounded, size: 18, color: DesignSystem.gamePurple),
              const SizedBox(width: 6),
              Text(
                'TILING',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gamePurple,
                ),
              ),
            ],
          ),
        ),
        TangibleButton(
          color: colorScheme.surface,
          onTap: _startNewGame,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Row(
            children: [
              Icon(Icons.refresh_rounded, size: 18),
              SizedBox(width: 6),
              Text('RESET', style: TextStyle(fontFamily: 'Bebas Neue', fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBoardGrid(ColorScheme colorScheme) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _puzzle.cols,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: _puzzle.rows * _puzzle.cols,
          itemBuilder: (context, idx) {
            final r = idx ~/ _puzzle.cols;
            final c = idx % _puzzle.cols;
            final pieceId = _board[r][c];

            Color cellBg = colorScheme.surface;
            if (pieceId != null) {
              cellBg = _palette[pieceId % _palette.length];
            }

            return GestureDetector(
              onTap: () {
                if (pieceId != null) {
                  _removePieceFromBoard(pieceId);
                } else {
                  _placePieceOnBoard(r, c);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  color: cellBg,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  border: Border.all(
                    color: pieceId != null ? cellBg : colorScheme.outline.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPieceTray(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _puzzle.pieces.map((p) {
        final isPlaced = _placedPieceIds.contains(p.id);
        final isSelected = _selectedPieceId == p.id;
        final color = _palette[p.colorIndex % _palette.length];

        return GestureDetector(
          onTap: () => _selectPiece(p),
          child: Opacity(
            opacity: isPlaced ? 0.25 : 1.0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? color.withValues(alpha: 0.2) : colorScheme.surface,
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                border: Border.all(
                  color: isSelected ? color : colorScheme.outline.withValues(alpha: 0.3),
                  width: isSelected ? 2.5 : 1,
                ),
              ),
              child: SizedBox(
                width: 45,
                height: 45,
                child: CustomPaint(
                  painter: _MiniPolyominoPainter(
                    coords: isSelected ? _selectedCoords : p.coords,
                    color: color,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _MiniPolyominoPainter extends CustomPainter {
  final List<List<int>> coords;
  final Color color;

  _MiniPolyominoPainter({required this.coords, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const double block = 10.0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final border = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (final pt in coords) {
      final rect = Rect.fromLTWH(pt[1] * (block + 1), pt[0] * (block + 1), block, block);
      canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(2)), paint);
      canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(2)), border);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
