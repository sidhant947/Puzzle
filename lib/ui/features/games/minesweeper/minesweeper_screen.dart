import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'minesweeper_provider.dart';
import 'minesweeper_engine.dart';
import '../../../../../providers/user_providers.dart';

class MinesweeperScreen extends ConsumerStatefulWidget {
  const MinesweeperScreen({super.key});

  @override
  ConsumerState<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends ConsumerState<MinesweeperScreen>
    with TickerProviderStateMixin {
  late AnimationController _gridController;
  late Animation<double> _gridFadeAnimation;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _gridFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gridController, curve: Curves.easeOutCubic),
    );

    _gridController.forward();
  }

  @override
  void dispose() {
    _gridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(minesweeperNotifierProvider);
    final notifier = ref.read(minesweeperNotifierProvider.notifier);

    ref.listen(minesweeperNotifierProvider, (previous, next) {
      if (next.status == GameStatus.won && previous?.status != GameStatus.won) {
        _showVictoryDialog(context, ref);
      } else if (next.status == GameStatus.lost && previous?.status != GameStatus.lost) {
        _showGameOverDialog(context);
      }
    });

    const primary = Color(0xFF5B7DB1);
    const textPrimary = Color(0xFF2D3748);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: textPrimary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_back_rounded, color: textPrimary, size: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Minesweeper',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8F9FA),
              Color(0xFFEEF1F5),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              AnimatedBuilder(
                animation: _gridController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _gridFadeAnimation.value,
                    child: child,
                  );
                },
                child: _buildGrid(state, notifier),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withValues(alpha: 0.06),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.touch_app_rounded,
                        color: textPrimary.withValues(alpha: 0.5),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Tap to reveal • Long press to flag',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: textPrimary.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(MinesweeperState state, MinesweeperNotifier notifier) {
    const primary = Color(0xFF5B7DB1);
    const textPrimary = Color(0xFF2D3748);

    final revealedCount = state.board
        .expand((row) => row)
        .where((cell) => cell.isRevealed && !cell.isMine)
        .length;
    final flagCount = state.board
        .expand((row) => row)
        .where((cell) => cell.isFlagged)
        .length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatChip(
                Icons.flag_rounded,
                '$flagCount',
                'Flags',
                const Color(0xFFE74C3C),
              ),
              _buildStatChip(
                Icons.layers_rounded,
                '${state.mines - flagCount}',
                'Mines',
                primary,
              ),
              _buildStatChip(
                Icons.grid_view_rounded,
                '$revealedCount',
                'Revealed',
                const Color(0xFF81B29A),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final cellSize = (constraints.maxWidth - 8) / state.cols;
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: textPrimary.withValues(alpha: 0.08),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: List.generate(state.rows, (r) {
                      return Row(
                        children: List.generate(state.cols, (c) {
                          final cell = state.board[r][c];
                          return GestureDetector(
                            onTap: () {
                              if (!cell.isFlagged) {
                                HapticFeedback.selectionClick();
                                notifier.revealCell(r, c);
                              }
                            },
                            onLongPress: () {
                              HapticFeedback.mediumImpact();
                              notifier.toggleFlag(r, c);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeOutCubic,
                              width: cellSize,
                              height: cellSize,
                              decoration: BoxDecoration(
                                color: _getCellColor(cell),
                                border: Border(
                                  right: BorderSide(
                                    color: textPrimary.withValues(alpha: c < state.cols - 1 ? 0.08 : 0),
                                    width: 0.5,
                                  ),
                                  bottom: BorderSide(
                                    color: textPrimary.withValues(alpha: r < state.rows - 1 ? 0.08 : 0),
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: _getCellContent(cell),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: color.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Color _getCellColor(MinesweeperCell cell) {
    if (cell.isRevealed) {
      if (cell.isMine) {
        return const Color(0xFFE74C3C).withValues(alpha: 0.15);
      }
      return const Color(0xFFF8F9FA);
    }
    return Colors.white;
  }

  Widget _getCellContent(MinesweeperCell cell) {
    if (cell.isFlagged) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: const Icon(
          Icons.flag_rounded,
          color: Color(0xFFE74C3C),
          size: 18,
        ),
      );
    }
    if (!cell.isRevealed) {
      return const SizedBox.shrink();
    }
    if (cell.isMine) {
      return const Icon(
        Icons.dangerous_rounded,
        color: Color(0xFFE74C3C),
        size: 20,
      );
    }
    if (cell.neighborMines == 0) {
      return const SizedBox.shrink();
    }
    return Text(
      cell.neighborMines.toString(),
      style: TextStyle(
        fontSize: cell.neighborMines > 9 ? 12 : 16,
        fontWeight: FontWeight.w600,
        color: _getNeighborColor(cell.neighborMines),
      ),
    );
  }

  Color _getNeighborColor(int n) {
    switch (n) {
      case 1:
        return const Color(0xFF3498DB);
      case 2:
        return const Color(0xFF27AE60);
      case 3:
        return const Color(0xFFE74C3C);
      case 4:
        return const Color(0xFF9B59B6);
      case 5:
        return const Color(0xFFD35400);
      case 6:
        return const Color(0xFF1ABC9C);
      case 7:
        return const Color(0xFF2C3E50);
      case 8:
        return const Color(0xFF7F8C8D);
      default:
        return const Color(0xFF2C3E50);
    }
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final solvedToday =
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('minesweeper');

    if (!context.mounted) return;

    HapticFeedback.heavyImpact();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF81B29A).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.emoji_events_rounded,
                  color: Color(0xFF81B29A),
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Victory!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You cleared all mines!',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF718096),
                ),
              ),
              const SizedBox(height: 24),
              if (solvedToday) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF81B29A).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '+20 XP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF81B29A),
                    ),
                  ),
                ),
              ] else ...[
                const Text(
                  'Daily puzzle already solved.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B7DB1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE74C3C).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.sentiment_dissatisfied_rounded,
                  color: Color(0xFFE74C3C),
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Game Over',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You hit a mine!',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF718096),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B7DB1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}