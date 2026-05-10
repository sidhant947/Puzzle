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
      title: 'MINESWEEPER',
      subtitle: 'Identify all the mines without triggering them.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () => notifier.reset(),
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded, size: 20, color: DesignSystem.ink),
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
                  const Text(
                    'MINES',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: DesignSystem.inkSlate),
                  ),
                  Text(
                    state.minesRemaining.toString(),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: DesignSystem.primary),
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
              color: state.isWon ? DesignSystem.success : (state.isGameOver ? DesignSystem.error : DesignSystem.surface),
              shadowColor: state.isWon ? const Color(0xFF047857) : (state.isGameOver ? const Color(0xFF991B1B) : DesignSystem.outlineVariant),
              child: Column(
                children: [
                  Text(
                    'STATUS',
                    style: TextStyle(
                      fontSize: 10, 
                      fontWeight: FontWeight.w900, 
                      color: (state.isWon || state.isGameOver) ? Colors.white.withValues(alpha: 0.8) : DesignSystem.inkSlate,
                    ),
                  ),
                  Text(
                    state.isWon ? 'WON' : (state.isGameOver ? 'BOOM' : 'PLAYING'),
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
          color: DesignSystem.ink,
          shadowColor: DesignSystem.inkSlate,
          radius: DesignSystem.radiusMD,
          depth: 4.0,
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              color: DesignSystem.background,
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
                  return _buildCell(state.board[r][c], notifier);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(MinesweeperCell cell, MinesweeperNotifier notifier) {
    final bool isRevealed = cell.state == CellState.revealed;
    final bool isFlagged = cell.state == CellState.flagged;

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        if (_isFlagMode) {
          notifier.toggleFlag(cell.row, cell.col);
        } else {
          notifier.revealCell(cell.row, cell.col);
        }
      },
      onLongPress: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.toggleFlag(cell.row, cell.col);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isRevealed 
              ? (cell.isMine ? DesignSystem.error.withValues(alpha: 0.2) : DesignSystem.surface)
              : (isFlagged ? DesignSystem.accentAmber.withValues(alpha: 0.1) : DesignSystem.outline.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isRevealed ? DesignSystem.outline : DesignSystem.ink.withValues(alpha: 0.1),
            width: isRevealed ? 0.5 : 1.5,
          ),
        ),
        child: Center(
          child: FittedBox(child: _getCellContent(cell)),
        ),
      ),
    );
  }

  Widget? _getCellContent(MinesweeperCell cell) {
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
            color: _getNumberColor(cell.neighborMines),
          ),
        );
      }
    }
    return null;
  }

  Color _getNumberColor(int n) {
    switch (n) {
      case 1: return DesignSystem.primary;
      case 2: return DesignSystem.success;
      case 3: return DesignSystem.error;
      case 4: return DesignSystem.accentBerry;
      case 5: return DesignSystem.accentAmber;
      default: return DesignSystem.ink;
    }
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildModeButton(
            icon: Icons.ads_click_rounded,
            label: 'REVEAL',
            isActive: !_isFlagMode,
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              setState(() => _isFlagMode = false);
            },
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          _buildModeButton(
            icon: Icons.flag_rounded,
            label: 'FLAG',
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
      color: isActive ? DesignSystem.primary : DesignSystem.surface,
      shadowColor: isActive ? DesignSystem.primaryShadow : DesignSystem.outlineVariant,
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: DesignSystem.spaceSM),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: isActive ? Colors.white : DesignSystem.ink),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : DesignSystem.ink,
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
          title: 'VICTORY!',
          message: 'You safely flagged all mines and revealed the safe zones!',
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: DesignSystem.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusLG)),
        title: const Text(
          'GAME OVER',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: DesignSystem.error,
          ),
        ),
        content: const Text(
          'You stepped on a mine. Better luck next time!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, color: DesignSystem.ink),
        ),
        actions: [
          Center(
            child: Column(
              children: [
                TangibleButton(
                  onTap: () {
                    Navigator.pop(context);
                    ref.read(minesweeperNotifierProvider.notifier).reset();
                  },
                  child: const Text('PLAY AGAIN'),
                ),
                const SizedBox(height: DesignSystem.spaceMD),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'BACK TO HUB',
                    style: TextStyle(color: DesignSystem.inkSlate, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
