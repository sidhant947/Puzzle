import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import 'fibonacci_merge_provider.dart';
import 'fibonacci_merge_engine.dart';

class FibonacciMergeScreen extends ConsumerStatefulWidget {
  const FibonacciMergeScreen({super.key});

  @override
  ConsumerState<FibonacciMergeScreen> createState() => _FibonacciMergeScreenState();
}

class _FibonacciMergeScreenState extends ConsumerState<FibonacciMergeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(fibonacciMergeNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(FibonacciMergeState state) {
    final l10n = AppLocalizations.of(context)!;
    bool won = state.isGameWon;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('fibonacci_merge');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'FIBONACCI MASTER!' : l10n.gameOver.toUpperCase(),
        message: '${l10n.score}: ${state.score}',
        onPlayAgain: () {
          ref.read(fibonacciMergeNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(fibonacciMergeNotifierProvider);
    final notifier = ref.read(fibonacciMergeNotifierProvider.notifier);

    ref.listen(fibonacciMergeNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        HapticFeedbackUtil.heavyImpact();
        _showGameOverDialog(next);
      }
    });

    return GameScaffold(
      title: l10n.fibonacciMergeTitle.toUpperCase(),
      subtitle: l10n.fibonacciMergeSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceSM),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildScoreBoard(context, l10n.score.toUpperCase(), state.score),
                  ],
                ),
              ),
              const Spacer(),
              _buildGameBoard(context, state, notifier, constraints.maxHeight * 0.6),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
                child: Text(
                  l10n.game2048Instruction.toUpperCase(),
                  style: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGameBoard(BuildContext context, FibonacciMergeState state, FibonacciMergeNotifier notifier, double maxHeight) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: TangibleContainer(
              color: Theme.of(context).colorScheme.onSurface,
              shadowColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              radius: DesignSystem.radiusMD,
              depth: 4.0,
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(builder: (context, constraints) {
                      final double cellSize = (constraints.maxWidth - (8 * 3)) / 4;
                      return Stack(
                        children: [
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
                                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          }),
                          ...state.tiles.where((t) => !t.merged).map((tile) => _AnimatedTile(
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBoard(BuildContext context, String label, int score) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      radius: DesignSystem.radiusMD,
      depth: 3.0,
      child: Column(
        children: [
          Text(
            label, 
            style: TextStyle(
              fontSize: 9, 
              fontWeight: FontWeight.w900, 
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7), 
              letterSpacing: 1.0
            )
          ),
          Text(
            score.toString(), 
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900, 
              color: DesignSystem.primary
            )
          ),
        ],
      ),
    );
  }
}

class _AnimatedTile extends StatefulWidget {
  final Tile tile;
  final double cellSize;

  const _AnimatedTile({super.key, required this.tile, required this.cellSize});

  @override
  State<_AnimatedTile> createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<_AnimatedTile> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(_AnimatedTile oldWidget) {
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

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      left: _left,
      top: _top,
      width: cellSize,
      height: cellSize,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: TangibleContainer(
          color: _getTileColor(context, tile.value),
          shadowColor: Colors.black.withValues(alpha: 0.1),
          radius: 12,
          depth: 4.0,
          padding: EdgeInsets.zero,
          child: Center(
            child: Text(
              tile.value.toString(),
              style: TextStyle(
                fontSize: _getFontSize(tile.value),
                fontWeight: FontWeight.w900,
                color: Colors.white,
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
    return 16;
  }

  Color _getTileColor(BuildContext context, int value) {
    if (value <= 2) return DesignSystem.primary.withValues(alpha: 0.6);
    if (value <= 3) return DesignSystem.primary;
    if (value <= 5) return DesignSystem.accentEmerald.withValues(alpha: 0.7);
    if (value <= 8) return DesignSystem.accentEmerald;
    if (value <= 13) return DesignSystem.accentAmber.withValues(alpha: 0.7);
    if (value <= 21) return DesignSystem.accentAmber;
    if (value <= 34) return DesignSystem.accentBerry.withValues(alpha: 0.7);
    if (value <= 55) return DesignSystem.accentBerry;
    if (value <= 89) return const Color(0xFF6366F1);
    if (value <= 144) return const Color(0xFF8B5CF6);
    return const Color(0xFFD946EF);
  }
}
