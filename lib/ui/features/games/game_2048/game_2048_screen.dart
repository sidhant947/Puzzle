import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'game_2048_provider.dart';
import 'game_2048_engine.dart';
import '../../../../../providers/user_providers.dart';

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

    ref.listen(game2048NotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showGameOverDialog(context, ref, next, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('2048'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.reset(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('2048', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, letterSpacing: -2)),
                  _buildScoreBoard('SCORE', state.score, theme),
                ],
              ),
            ),
            const Spacer(),
            _buildGameBoard(state, notifier, theme),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'SWIPE TO MERGE TILES',
                style: TextStyle(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5), 
                  fontSize: 12, 
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameBoard(Game2048State state, Game2048Notifier notifier, ThemeData theme) {
    return Center(
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < -100) notifier.move(0, -1);
          if (details.primaryVelocity! > 100) notifier.move(0, 1);
        },
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < -100) notifier.move(-1, 0);
          if (details.primaryVelocity! > 100) notifier.move(1, 0);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border.all(color: theme.colorScheme.onSurface, width: 2),
            borderRadius: BorderRadius.zero,
          ),
          child: AspectRatio(
            aspectRatio: 1,
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
                          border: Border.all(color: theme.colorScheme.onSurface.withValues(alpha: 0.1), width: 1),
                          borderRadius: BorderRadius.zero,
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
                      )),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBoard(String label, int score, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface,
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: theme.colorScheme.surface, letterSpacing: 1.5)),
          Text(score.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: theme.colorScheme.surface)),
        ],
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, Game2048State state, ThemeData theme) async {
    if (state.isGameWon) {
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('game_2048');
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: Text(state.isGameWon ? '2048!' : 'GAME OVER', style: const TextStyle(fontWeight: FontWeight.w900)),
        content: Text('FINAL SCORE: ${state.score}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('EXIT'),
          ),
          TextButton(
            onPressed: () {
              ref.read(game2048NotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
            child: const Text('RETRY'),
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

  const AnimatedTile({super.key, required this.tile, required this.cellSize, required this.theme});

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

    // Start at old position if available
    _left = (tile.oldX ?? tile.x) * (cellSize + 8);
    _top = (tile.oldY ?? tile.y) * (cellSize + 8);

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();

    // Move to new position in next frame
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
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      left: _left,
      top: _top,
      width: cellSize,
      height: cellSize,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: _getTileColor(tile.value, theme),
            border: Border.all(color: theme.colorScheme.onSurface, width: 2),
            borderRadius: BorderRadius.zero,
          ),
          child: Center(
            child: Text(
              tile.value.toString(),
              style: TextStyle(
                fontSize: _getFontSize(tile.value),
                fontWeight: FontWeight.w900,
                color: _getTextColor(tile.value, theme),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getFontSize(int value) {
    if (value < 100) return 28;
    if (value < 1000) return 22;
    return 16;
  }

  Color _getTileColor(int value, ThemeData theme) {
    final baseColor = theme.colorScheme.onSurface;
    
    // Logarithmic scale for opacity
    double opacity = (log(value) / log(2048)).clamp(0.1, 1.0);
    return baseColor.withValues(alpha: opacity);
  }

  Color _getTextColor(int value, ThemeData theme) {
    double opacity = (log(value) / log(2048)).clamp(0.1, 1.0);
    
    if (opacity > 0.5) {
      return theme.colorScheme.surface;
    } else {
      return theme.colorScheme.onSurface;
    }
  }
}
