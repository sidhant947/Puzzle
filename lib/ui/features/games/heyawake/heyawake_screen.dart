import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'heyawake_engine.dart';

class HeyawakeScreen extends ConsumerStatefulWidget {
  const HeyawakeScreen({super.key});

  @override
  ConsumerState<HeyawakeScreen> createState() => _HeyawakeScreenState();
}

class _HeyawakeScreenState extends ConsumerState<HeyawakeScreen> {
  late HeyawakePuzzle _puzzle;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _puzzle = HeyawakeEngine.generatePuzzle();
      _isCompleted = false;
    });
  }

  void _toggleCell(int r, int c) {
    if (_isCompleted) return;

    HapticFeedbackUtil.selectionClick();
    setState(() {
      final current = _puzzle.grid[r][c];
      if (current == HeyawakeCellState.empty) {
        _puzzle.grid[r][c] = HeyawakeCellState.black;
      } else if (current == HeyawakeCellState.black) {
        _puzzle.grid[r][c] = HeyawakeCellState.white;
      } else {
        _puzzle.grid[r][c] = HeyawakeCellState.empty;
      }
    });

    _checkSolution();
  }

  void _checkSolution() {
    if (HeyawakeEngine.isSolved(_puzzle.grid, _puzzle.rooms, _puzzle.size)) {
      setState(() {
        _isCompleted = true;
      });
      ref.read(gameStreakNotifierProvider.notifier).completeGame('heyawake');
      _showWinDialog();
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.heyawakeWinTitle,
        message: l10n.heyawakeWinMessage,
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
      title: l10n.heyawakeTitle,
      subtitle: l10n.heyawakeSubtitle,
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
              _buildGrid(colorScheme, theme),
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
        _buildLegendItem(colorScheme.surface, "EMPTY", colorScheme.onSurface.withValues(alpha: 0.5), true),
        const SizedBox(width: 16),
        _buildLegendItem(colorScheme.onSurface, "BLACK (TAP 1)", colorScheme.surface, false),
        const SizedBox(width: 16),
        _buildLegendItem(DesignSystem.accentEmerald.withValues(alpha: 0.2), "WHITE (TAP 2)", DesignSystem.accentEmerald, false),
      ],
    );
  }

  Widget _buildLegendItem(Color bg, String label, Color textColor, bool isBorder) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(3),
            border: isBorder ? Border.all(color: textColor, width: 1) : null,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: textColor,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(ColorScheme colorScheme, ThemeData theme) {
    final size = _puzzle.size;

    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: const EdgeInsets.all(DesignSystem.spaceSM),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(
            color: colorScheme.onSurface,
            width: 2.5,
          ),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemCount: size * size,
          itemBuilder: (context, index) {
            final r = index ~/ size;
            final c = index % size;
            final state = _puzzle.grid[r][c];

            final room = _puzzle.rooms.firstWhere((rm) => rm.contains(r, c));
            final isRoomTopLeft = room.startR == r && room.startC == c;

            // Room borders
            final isTopBorder = r == room.startR;
            final isBottomBorder = r == room.endR;
            final isLeftBorder = c == room.startC;
            final isRightBorder = c == room.endC;

            Color cellBg;
            if (state == HeyawakeCellState.black) {
              cellBg = colorScheme.onSurface;
            } else if (state == HeyawakeCellState.white) {
              cellBg = DesignSystem.accentEmerald.withValues(alpha: 0.15);
            } else {
              cellBg = colorScheme.surface;
            }

            return GestureDetector(
              onTap: () => _toggleCell(r, c),
              child: Container(
                decoration: BoxDecoration(
                  color: cellBg,
                  border: Border(
                    top: BorderSide(
                      color: colorScheme.onSurface,
                      width: isTopBorder && r > 0 ? 2.5 : 0.5,
                    ),
                    bottom: BorderSide(
                      color: colorScheme.onSurface,
                      width: isBottomBorder && r < size - 1 ? 2.5 : 0.5,
                    ),
                    left: BorderSide(
                      color: colorScheme.onSurface,
                      width: isLeftBorder && c > 0 ? 2.5 : 0.5,
                    ),
                    right: BorderSide(
                      color: colorScheme.onSurface,
                      width: isRightBorder && c < size - 1 ? 2.5 : 0.5,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    if (isRoomTopLeft && room.clue != null)
                      Positioned(
                        top: 2,
                        left: 4,
                        child: Text(
                          '${room.clue}',
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: state == HeyawakeCellState.black
                                ? Colors.white
                                : colorScheme.primary,
                          ),
                        ),
                      ),
                    if (state == HeyawakeCellState.white)
                      Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: DesignSystem.accentEmerald,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
