import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'game_2048_provider.dart';
import 'game_2048_engine.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class Game2048Screen extends ConsumerStatefulWidget {
  const Game2048Screen({super.key});

  @override
  ConsumerState<Game2048Screen> createState() => _Game2048ScreenState();
}

class _Game2048ScreenState extends ConsumerState<Game2048Screen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(game2048NotifierProvider);
    final notifier = ref.read(game2048NotifierProvider.notifier);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    ref.listen(game2048NotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.heavyImpact();
        _showGameOverDialog(context, ref, next, theme);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '2048',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              notifier.reset();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MERGE TILES',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Reach the 2048 tile!',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  _buildScoreBoard('SCORE', state.score, theme, isDark),
                ],
              ),
            ),
            const Spacer(),
            _buildGameBoard(state, notifier, theme, isDark),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'SWIPE IN ANY DIRECTION TO MERGE',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4), 
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
          ],
        ),
      ),
    );
  }

  Widget _buildGameBoard(Game2048State state, Game2048Notifier notifier, ThemeData theme, bool isDark) {
    return Center(
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < -100) {
            HapticFeedbackUtil.gameInteraction();
            notifier.move(0, -1);
          }
          if (details.primaryVelocity! > 100) {
            HapticFeedbackUtil.gameInteraction();
            notifier.move(0, 1);
          }
        },
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < -100) {
            HapticFeedbackUtil.gameInteraction();
            notifier.move(-1, 0);
          }
          if (details.primaryVelocity! > 100) {
            HapticFeedbackUtil.gameInteraction();
            notifier.move(1, 0);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(DesignSystem.spaceXS),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.1 : 0.05),
            borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.1),
              width: 1,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 4),
              child: Container(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.03),
                child: LayoutBuilder(builder: (context, constraints) {
                  final double cellSize = (constraints.maxWidth - (8 * 3)) / 4;
                  return Stack(
                    children: [
                      // Empty background cells
                      ...List.generate(16, (i) {
                        int x = i % 4;
                        int y = i ~/ 4;
                        return Positioned(
                          left: x * (cellSize + 8),
                          top: y * (cellSize + 8),
                          width: cellSize,
                          height: cellSize,
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.02),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }),
                      // Active tiles
                      ...state.tiles.where((t) => !t.merged).map((tile) => AnimatedTile(
                            key: ValueKey(tile.id),
                            tile: tile,
                            cellSize: cellSize,
                            theme: theme,
                            isDark: isDark,
                          )),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBoard(String label, int score, ThemeData theme, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            label, 
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 10, 
              fontWeight: FontWeight.w900, 
              color: theme.colorScheme.primary, 
              letterSpacing: 1.0
            )
          ),
          Text(
            score.toString(), 
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900, 
              color: theme.colorScheme.primary
            )
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, Game2048State state, ThemeData theme) async {
    if (state.isGameWon) {
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('game_2048');

      if (!context.mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          onHome: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          onPlayAgain: () {
            ref.read(game2048NotifierProvider.notifier).reset();
            Navigator.of(context).pop();
          },
          title: '2048!',
          message: 'FINAL SCORE: ${state.score}\nYou reached the 2048 tile!',
        ),
      );
      return;
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
          side: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        ),
        title: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceMD),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.sentiment_very_dissatisfied_rounded,
                  color: theme.colorScheme.primary,
                  size: 48,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                'GAME OVER',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        content: Text(
          'FINAL SCORE: ${state.score}',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('EXIT'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(game2048NotifierProvider.notifier).reset();
                    Navigator.of(context).pop();
                  },
                  child: const Text('RETRY'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedTile extends StatefulWidget {
  final Tile tile;
  final double cellSize;
  final ThemeData theme;
  final bool isDark;

  const AnimatedTile({super.key, required this.tile, required this.cellSize, required this.theme, required this.isDark});

  @override
  State<AnimatedTile> createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late double _left;
  late double _top;

  @override
  void initState() {
    super.initState();
    final tile = widget.tile;
    final cellSize = widget.cellSize;

    _left = (tile.oldX ?? tile.x) * (cellSize + 8);
    _top = (tile.oldY ?? tile.y) * (cellSize + 8);

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _left = tile.x * (cellSize + 8);
          _top = tile.y * (cellSize + 8);
        });
      }
    });
  }

  @override
  void didUpdateWidget(AnimatedTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tile.value != widget.tile.value) {
      _controller.reset();
      _controller.forward();
    }
    if (oldWidget.tile.x != widget.tile.x || oldWidget.tile.y != widget.tile.y) {
      setState(() {
        _left = widget.tile.x * (widget.cellSize + 8);
        _top = widget.tile.y * (widget.cellSize + 8);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tile = widget.tile;
    final cellSize = widget.cellSize;
    final theme = widget.theme;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      left: _left,
      top: _top,
      width: cellSize,
      height: cellSize,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: _getTileColor(tile.value, theme, widget.isDark),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (tile.value >= 128)
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: Center(
            child: Text(
              tile.value.toString(),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: _getFontSize(tile.value),
                fontWeight: FontWeight.w900,
                color: _getTextColor(tile.value, theme, widget.isDark),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getFontSize(int value) {
    if (value < 100) return 24;
    if (value < 1000) return 20;
    return 14;
  }

  Color _getTileColor(int value, ThemeData theme, bool isDark) {
    final primary = theme.colorScheme.primary;
    
    // Gradient based on value
    double progress = (log(value) / log(2048)).clamp(0.05, 1.0);
    return primary.withValues(alpha: isDark ? progress * 0.8 + 0.1 : progress * 0.9 + 0.05);
  }

  Color _getTextColor(int value, ThemeData theme, bool isDark) {
    double progress = (log(value) / log(2048)).clamp(0.0, 1.0);
    if (progress > 0.4) {
      return Colors.white;
    } else {
      return theme.colorScheme.onSurface;
    }
  }
}
