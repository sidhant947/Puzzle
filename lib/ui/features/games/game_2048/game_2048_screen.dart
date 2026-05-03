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

    ref.listen(game2048NotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showGameOverDialog(context, ref, next);
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
                  const Text('2048', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xff776e65))),
                  _buildScoreBoard('SCORE', state.score),
                ],
              ),
            ),
            const Spacer(),
            _buildGameBoard(state, notifier),
            const Spacer(flex: 2),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Swipe to merge tiles and reach 2048!',
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameBoard(Game2048State state, Game2048Notifier notifier) {
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
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xffbbada0),
            borderRadius: BorderRadius.circular(8),
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
                          color: const Color(0xffcdc1b4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                  // Active tiles
                  ...state.tiles.map((tile) => AnimatedTile(
                        key: ValueKey(tile.id),
                        tile: tile,
                        cellSize: cellSize,
                      )),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBoard(String label, int score) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffbbada0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xffeee4da))),
          Text(score.toString(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, Game2048State state) async {
    if (state.isGameWon) {
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('game_2048');
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(state.isGameWon ? '2048!' : 'Game Over'),
        content: Text('Your final score: ${state.score}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Back to Home'),
          ),
          TextButton(
            onPressed: () {
              ref.read(game2048NotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}

class AnimatedTile extends StatefulWidget {
  final Tile tile;
  final double cellSize;

  const AnimatedTile({super.key, required this.tile, required this.cellSize});

  @override
  State<AnimatedTile> createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tile.value != widget.tile.value) {
      // It merged! Pulse it.
      _controller.reset();
      _controller.forward();
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

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      left: tile.x * (cellSize + 8),
      top: tile.y * (cellSize + 8),
      width: cellSize,
      height: cellSize,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: _getTileColor(tile.value),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              if (tile.value >= 1024)
                BoxShadow(
                  color: _getTileColor(tile.value).withValues(alpha: 0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
            ],
          ),
          child: Center(
            child: Text(
              tile.value.toString(),
              style: TextStyle(
                fontSize: _getFontSize(tile.value),
                fontWeight: FontWeight.bold,
                color: tile.value <= 4 ? const Color(0xff776e65) : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getFontSize(int value) {
    if (value < 100) return 32;
    if (value < 1000) return 24;
    return 18;
  }

  Color _getTileColor(int value) {
    switch (value) {
      case 2: return const Color(0xffeee4da);
      case 4: return const Color(0xffede0c8);
      case 8: return const Color(0xfff2b179);
      case 16: return const Color(0xfff59563);
      case 32: return const Color(0xfff67c5f);
      case 64: return const Color(0xfff65e3b);
      case 128: return const Color(0xffedcf72);
      case 256: return const Color(0xffedcc61);
      case 512: return const Color(0xffedc850);
      case 1024: return const Color(0xffedc53f);
      case 2048: return const Color(0xffedc22e);
      default: return const Color(0xff3c3a32);
    }
  }
}
