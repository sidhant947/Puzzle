import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'kurodoko_engine.dart';

class KurodokoScreen extends ConsumerStatefulWidget {
  const KurodokoScreen({super.key});

  @override
  ConsumerState<KurodokoScreen> createState() => _KurodokoScreenState();
}

class _KurodokoScreenState extends ConsumerState<KurodokoScreen> {
  late KurodokoPuzzle _puzzle;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _puzzle = KurodokoEngine.generatePuzzle();
      _isCompleted = false;
    });
  }

  void _toggleCell(int r, int c) {
    if (_isCompleted) return;
    final cell = _puzzle.grid[r][c];
    if (cell.isClue) return;

    HapticFeedbackUtil.selectionClick();
    setState(() {
      if (cell.state == KurodokoCellState.empty) {
        cell.state = KurodokoCellState.white;
      } else if (cell.state == KurodokoCellState.white) {
        cell.state = KurodokoCellState.black;
      } else {
        cell.state = KurodokoCellState.empty;
      }
    });

    _checkSolution();
  }

  void _checkSolution() {
    if (KurodokoEngine.isSolved(_puzzle.grid, _puzzle.size)) {
      setState(() {
        _isCompleted = true;
      });
      ref.read(gameStreakNotifierProvider.notifier).completeGame('kurodoko');
      _showWinDialog();
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.kurodokoWinTitle,
        message: l10n.kurodokoWinMessage,
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
      title: l10n.kurodokoTitle,
      subtitle: l10n.kurodokoSubtitle,
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
        _buildLegendItem(DesignSystem.accentEmerald.withValues(alpha: 0.2), "WHITE (TAP 1)", DesignSystem.accentEmerald, false),
        const SizedBox(width: 16),
        _buildLegendItem(colorScheme.onSurface, "BLACK (TAP 2)", colorScheme.surface, false),
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
            color: colorScheme.outline.withValues(alpha: 0.6),
            width: 2,
          ),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: size * size,
          itemBuilder: (context, index) {
            final r = index ~/ size;
            final c = index % size;
            final cell = _puzzle.grid[r][c];

            Color cellBg;
            Color textColor;

            if (cell.state == KurodokoCellState.black) {
              cellBg = colorScheme.onSurface;
              textColor = colorScheme.surface;
            } else if (cell.state == KurodokoCellState.white || cell.isClue) {
              cellBg = cell.isClue
                  ? DesignSystem.gameAmber.withValues(alpha: 0.25)
                  : DesignSystem.accentEmerald.withValues(alpha: 0.15);
              textColor = cell.isClue ? DesignSystem.gameAmber : DesignSystem.accentEmerald;
            } else {
              cellBg = colorScheme.surface;
              textColor = colorScheme.onSurface;
            }

            return GestureDetector(
              onTap: () => _toggleCell(r, c),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  color: cellBg,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                  border: Border.all(
                    color: cell.isClue
                        ? DesignSystem.gameAmber.withValues(alpha: 0.8)
                        : (cell.state == KurodokoCellState.black
                            ? colorScheme.onSurface
                            : colorScheme.outline.withValues(alpha: 0.4)),
                    width: cell.isClue ? 2 : 1,
                  ),
                ),
                child: Center(
                  child: cell.clue != null
                      ? Text(
                          '${cell.clue}',
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        )
                      : (cell.state == KurodokoCellState.white
                          ? Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: DesignSystem.accentEmerald.withValues(alpha: 0.6),
                              ),
                            )
                          : const SizedBox.shrink()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
