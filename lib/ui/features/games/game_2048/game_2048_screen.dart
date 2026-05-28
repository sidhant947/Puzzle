import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'game_2048_provider.dart';
import 'game_2048_engine.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class Game2048Screen extends ConsumerStatefulWidget {
  const Game2048Screen({super.key});

  @override
  ConsumerState<Game2048Screen> createState() => _Game2048ScreenState();
}

class _Game2048ScreenState extends ConsumerState<Game2048Screen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(game2048NotifierProvider);
    final notifier = ref.read(game2048NotifierProvider.notifier);

    ref.listen(game2048NotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.heavyImpact();
        _showGameOverDialog(context, ref, next);
      }
    });

    return GameScaffold(
      title: l10n.game2048Title.toUpperCase(),
      subtitle: l10n.game2048Subtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(height: DesignSystem.spaceSM),
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
              _buildGameBoard(context, state, notifier, constraints.maxHeight * 0.55),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
                child: Text(
                  l10n.game2048Instruction,
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

  Widget _buildGameBoard(BuildContext context, Game2048State state, Game2048Notifier notifier, double maxHeight) {
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
              depth: 4.0, // Reduced depth
              padding: const EdgeInsets.all(3.0), // Reduced padding
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: LayoutBuilder(builder: (context, constraints) {
                      final double cellSize = (constraints.maxWidth - (6 * 3)) / 4;
                      return Stack(
                        children: [
                          // Empty background cells
                          ...List.generate(16, (i) {
                            int x = i % 4;
                            int y = i ~/ 4;
                            return Positioned(
                              left: x * (cellSize + 6),
                              top: y * (cellSize + 6),
                              width: cellSize,
                              height: cellSize,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          }),
                          // Active tiles
                          ...state.tiles.where((t) => !t.merged).map((tile) => AnimatedTile(
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

  void _showGameOverDialog(BuildContext context, WidgetRef ref, Game2048State state) async {
    final l10n = AppLocalizations.of(context)!;
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
          title: l10n.congrats.toUpperCase(),
          message: '${l10n.score}: ${state.score}\n${l10n.completed}',
        ),
      );
      return;
    }

    if (!context.mounted) return;

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
          ref.read(game2048NotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
        title: l10n.gameOver.toUpperCase(),
        message: '${l10n.score}: ${state.score}',
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
  late double _left;
  late double _top;

  @override
  void initState() {
    super.initState();
    final tile = widget.tile;
    final cellSize = widget.cellSize;

    _left = (tile.oldX ?? tile.x) * (cellSize + 6);
    _top = (tile.oldY ?? tile.y) * (cellSize + 6);

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
          _left = tile.x * (cellSize + 6);
          _top = tile.y * (cellSize + 6);
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
        _left = widget.tile.x * (widget.cellSize + 6);
        _top = widget.tile.y * (widget.cellSize + 6);
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
          shadowColor: _getShadowColor(context, tile.value),
          radius: 12,
          depth: 4.0,
          padding: EdgeInsets.zero,
          child: Center(
            child: Text(
              tile.value.toString(),
              style: TextStyle(
                fontSize: _getFontSize(tile.value),
                fontWeight: FontWeight.w900,
                color: _getTextColor(context, tile.value),
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

  Color _getTileColor(BuildContext context, int value) {
    // Logarithmic color mapping using DesignSystem accents
    if (value <= 2) return Theme.of(context).colorScheme.surface;
    if (value <= 4) return Theme.of(context).colorScheme.outline.withValues(alpha: 0.5);
    if (value <= 8) return DesignSystem.accentAmber.withValues(alpha: 0.3);
    if (value <= 16) return DesignSystem.accentAmber.withValues(alpha: 0.6);
    if (value <= 32) return DesignSystem.accentBerry.withValues(alpha: 0.3);
    if (value <= 64) return DesignSystem.accentBerry.withValues(alpha: 0.6);
    if (value <= 128) return DesignSystem.primary.withValues(alpha: 0.4);
    if (value <= 256) return DesignSystem.primary.withValues(alpha: 0.7);
    if (value <= 512) return DesignSystem.primary;
    if (value <= 1024) return DesignSystem.accentEmerald;
    return DesignSystem.accentAmber;
  }

  Color _getShadowColor(BuildContext context, int value) {
    if (value <= 2) return Theme.of(context).colorScheme.outline;
    return Colors.black.withValues(alpha: 0.1);
  }

  Color _getTextColor(BuildContext context, int value) {
    if (value <= 4) return Theme.of(context).colorScheme.onSurface;
    return Theme.of(context).colorScheme.onSurface;
  }
}
