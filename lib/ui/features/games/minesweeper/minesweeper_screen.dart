import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
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
    final theme = Theme.of(context);

    ref.listen(minesweeperNotifierProvider, (previous, next) {
      if (next.isWon && !(previous?.isWon ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, true);
      } else if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.error();
        _showGameOverDialog(context, false);
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('MINESWEEPER'),
        actions: [
          IconButton(
            onPressed: () => notifier.reset(),
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildHeader(state),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: _buildBoard(state, notifier),
              ),
            ),
            _buildControls(theme),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(MinesweeperState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(
            'MINES',
            state.minesRemaining.toString(),
            DesignSystem.gameIndigo,
          ),
          _buildStatCard(
            'STATUS',
            state.isWon ? 'WON' : (state.isGameOver ? 'BOOM' : 'PLAYING'),
            state.isWon ? DesignSystem.gameGreen : (state.isGameOver ? DesignSystem.lightError : DesignSystem.gameIndigo),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(color: color, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(MinesweeperState state, MinesweeperNotifier notifier) {
    return AspectRatio(
      aspectRatio: MinesweeperNotifier.cols / MinesweeperNotifier.rows,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MinesweeperNotifier.cols,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: MinesweeperNotifier.rows * MinesweeperNotifier.cols,
          itemBuilder: (context, index) {
            final r = index ~/ MinesweeperNotifier.cols;
            final c = index % MinesweeperNotifier.cols;
            return _buildCell(state.board[r][c], notifier);
          },
        ),
      ),
    );
  }

  Widget _buildCell(MinesweeperCell cell, MinesweeperNotifier notifier) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _getCellColor(cell, isDark),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _getCellBorderColor(cell, isDark),
            width: 1,
          ),
          boxShadow: cell.state == CellState.hidden
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Center(
          child: _getCellContent(cell),
        ),
      ),
    );
  }

  Color _getCellColor(MinesweeperCell cell, bool isDark) {
    if (cell.state == CellState.revealed) {
      if (cell.isMine) return DesignSystem.lightError.withValues(alpha: 0.2);
      return isDark ? DesignSystem.darkSurfaceElevated : DesignSystem.lightOutlineVariant;
    }
    if (cell.state == CellState.flagged) return DesignSystem.gameIndigo.withValues(alpha: 0.1);
    return isDark ? DesignSystem.darkSurface : Colors.white;
  }

  Color _getCellBorderColor(MinesweeperCell cell, bool isDark) {
    if (cell.state == CellState.revealed) {
      if (cell.isMine) return DesignSystem.lightError.withValues(alpha: 0.3);
      return Colors.transparent;
    }
    return isDark ? DesignSystem.darkOutline : DesignSystem.lightOutline;
  }

  Widget? _getCellContent(MinesweeperCell cell) {
    if (cell.state == CellState.flagged) {
      return const Icon(Icons.flag_rounded, size: 16, color: DesignSystem.gameIndigo);
    }
    if (cell.state == CellState.revealed) {
      if (cell.isMine) {
        return const Icon(Icons.brightness_7_rounded, size: 18, color: DesignSystem.lightError);
      }
      if (cell.neighborMines > 0) {
        return Text(
          cell.neighborMines.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: _getNumberColor(cell.neighborMines),
          ),
        );
      }
    }
    return null;
  }

  Color _getNumberColor(int n) {
    switch (n) {
      case 1: return DesignSystem.gameBlue;
      case 2: return DesignSystem.gameGreen;
      case 3: return DesignSystem.lightError;
      case 4: return DesignSystem.gamePurple;
      case 5: return DesignSystem.gameOrange;
      case 6: return DesignSystem.gameTeal;
      default: return DesignSystem.gameIndigo;
    }
  }

  Widget _buildControls(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
          const SizedBox(width: 24),
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
    final theme = Theme.of(context);
    final color = isActive ? DesignSystem.gameIndigo : theme.colorScheme.onSurface.withValues(alpha: 0.4);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? DesignSystem.gameIndigo.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(
            color: isActive ? DesignSystem.gameIndigo.withValues(alpha: 0.5) : theme.colorScheme.outline.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, bool isWon) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusXL)),
        title: Text(
          isWon ? 'VICTORY!' : 'GAME OVER',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: isWon ? DesignSystem.gameGreen : DesignSystem.lightError,
          ),
        ),
        content: Text(
          isWon 
            ? 'You safely flagged all mines and revealed the safe zones!' 
            : 'You stepped on a mine. Better luck next time!',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(minesweeperNotifierProvider.notifier).reset();
                  },
                  child: const Text('PLAY AGAIN'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Pop dialog
                    Navigator.pop(context); // Pop screen
                  },
                  child: Text(
                    'BACK TO HUB',
                    style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
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
