import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'minesweeper_engine.dart';
import 'minesweeper_provider.dart';

class MinesweeperScreen extends ConsumerStatefulWidget {
  const MinesweeperScreen({super.key});

  @override
  ConsumerState<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends ConsumerState<MinesweeperScreen> {
  bool _isFlagMode = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(minesweeperNotifierProvider);
    final notifier = ref.read(minesweeperNotifierProvider.notifier);

    ref.listen(minesweeperNotifierProvider, (previous, next) {
      if (next.isWon && !(previous?.isWon ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, true);
      } else if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.error();
        _showGameOverDialog(context, false);
      }
    });

    return GameScaffold(
      title: l10n.minesweeperTitle.toUpperCase(),
      subtitle: l10n.minesweeperSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () => notifier.reset(),
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceSM),
              _buildHeader(state),
              const Spacer(),
              _buildBoard(state, notifier, constraints.maxHeight * 0.55),
              const Spacer(),
              _buildControls(),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(MinesweeperState state) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        children: [
          Expanded(
            child: TangibleContainer(
              padding: const EdgeInsets.all(DesignSystem.spaceSM),
              radius: DesignSystem.radiusMD,
              depth: 4.0,
              child: Column(
                children: [
                  Text(
                    l10n.minesweeperMines,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
                  ),
                  Text(
                    state.minesRemaining.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: DesignSystem.primary),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: TangibleContainer(
              padding: const EdgeInsets.all(DesignSystem.spaceSM),
              radius: DesignSystem.radiusMD,
              depth: 4.0,
              color: state.isWon ? DesignSystem.success : (state.isGameOver ? DesignSystem.error : Theme.of(context).colorScheme.surface),
              shadowColor: state.isWon ? const Color(0xFF047857) : (state.isGameOver ? const Color(0xFF991B1B) : Theme.of(context).colorScheme.outline),
              child: Column(
                children: [
                  Text(
                    l10n.minesweeperStatus,
                    style: TextStyle(
                      fontSize: 10, 
                      fontWeight: FontWeight.w900, 
                      color: (state.isWon || state.isGameOver) ? Colors.white.withValues(alpha: 0.8) : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  Text(
                    state.isWon ? l10n.minesweeperWon : (state.isGameOver ? l10n.minesweeperBoom : l10n.minesweeperPlaying),
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.w900, 
                      color: (state.isWon || state.isGameOver) ? Colors.white : DesignSystem.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(MinesweeperState state, MinesweeperNotifier notifier, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: TangibleContainer(
          color: Theme.of(context).colorScheme.onSurface,
          shadowColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          radius: DesignSystem.radiusMD,
          depth: 4.0,
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
            ),
            child: AspectRatio(
              aspectRatio: MinesweeperNotifier.cols / MinesweeperNotifier.rows,
              child: GridView.builder(
                padding: const EdgeInsets.all(6),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MinesweeperNotifier.cols,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemCount: MinesweeperNotifier.rows * MinesweeperNotifier.cols,
                itemBuilder: (context, index) {
                  final r = index ~/ MinesweeperNotifier.cols;
                  final c = index % MinesweeperNotifier.cols;
                  return MinesweeperCellWidget(row: r, col: c, isFlagMode: _isFlagMode);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildModeButton(
            icon: Icons.ads_click_rounded,
            label: l10n.minesweeperReveal,
            isActive: !_isFlagMode,
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              setState(() => _isFlagMode = false);
            },
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          _buildModeButton(
            icon: Icons.flag_rounded,
            label: l10n.minesweeperFlag,
            isActive: _isFlagMode,
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              setState(() => _isFlagMode = true);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModeButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return TangibleButton(
      color: isActive ? DesignSystem.primary : Theme.of(context).colorScheme.surface,
      shadowColor: isActive ? DesignSystem.primaryShadow : Theme.of(context).colorScheme.outline,
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: DesignSystem.spaceSM),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: isActive ? Colors.white : Theme.of(context).colorScheme.onSurface),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w900,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, bool isWon) {
    final l10n = AppLocalizations.of(context)!;
    if (isWon) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          onHome: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          onPlayAgain: () {
            ref.read(minesweeperNotifierProvider.notifier).reset();
            Navigator.of(context).pop();
          },
          title: l10n.minesweeperWin.toUpperCase(),
          message: l10n.completed,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        isVictory: false,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(minesweeperNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
        title: l10n.gameOver.toUpperCase(),
        message: l10n.timeUp,
      ),
    );
  }
}

class MinesweeperCellWidget extends ConsumerWidget {
  final int row;
  final int col;
  final bool isFlagMode;

  const MinesweeperCellWidget({
    super.key,
    required this.row,
    required this.col,
    required this.isFlagMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cell = ref.watch(minesweeperNotifierProvider.select((s) => s.board[row][col]));
    final notifier = ref.read(minesweeperNotifierProvider.notifier);

    final bool isRevealed = cell.state == CellState.revealed;
    final bool isFlagged = cell.state == CellState.flagged;

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        if (isFlagMode) {
          notifier.toggleFlag(row, col);
        } else {
          notifier.revealCell(row, col);
        }
      },
      onLongPress: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.toggleFlag(row, col);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isRevealed 
              ? (cell.isMine ? DesignSystem.error.withValues(alpha: 0.2) : Theme.of(context).colorScheme.surface)
              : (isFlagged ? DesignSystem.accentAmber.withValues(alpha: 0.1) : Theme.of(context).colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isRevealed ? Theme.of(context).colorScheme.outline.withValues(alpha: 0.5) : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
            width: isRevealed ? 0.5 : 1.5,
          ),
        ),
        child: Center(
          child: FittedBox(child: _getCellContent(cell, context)),
        ),
      ),
    );
  }

  Widget? _getCellContent(MinesweeperCell cell, BuildContext context) {
    if (cell.state == CellState.flagged) {
      return const Icon(Icons.flag_rounded, size: 14, color: DesignSystem.accentAmber);
    }
    if (cell.state == CellState.revealed) {
      if (cell.isMine) {
        return const Icon(Icons.brightness_7_rounded, size: 16, color: DesignSystem.error);
      }
      if (cell.neighborMines > 0) {
        return Text(
          cell.neighborMines.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            color: _getNumberColor(cell.neighborMines, context),
          ),
        );
      }
    }
    return null;
  }

  Color _getNumberColor(int n, BuildContext context) {
    switch (n) {
      case 1: return DesignSystem.primary;
      case 2: return DesignSystem.success;
      case 3: return DesignSystem.error;
      case 4: return DesignSystem.accentBerry;
      case 5: return DesignSystem.accentAmber;
      default: return Theme.of(context).colorScheme.onSurface;
    }
  }
}
