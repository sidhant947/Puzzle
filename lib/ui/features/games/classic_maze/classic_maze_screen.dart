import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'classic_maze_provider.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'package:puzzle/l10n/app_localizations.dart';

class ClassicMazeScreen extends ConsumerStatefulWidget {
  const ClassicMazeScreen({super.key});

  @override
  ConsumerState<ClassicMazeScreen> createState() => _ClassicMazeScreenState();
}

class _ClassicMazeScreenState extends ConsumerState<ClassicMazeScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(classicMazeNotifierProvider.notifier).initGame();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _showHowToPlay() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: TangibleContainer(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.howToPlay.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                l10n.classicMazeHowToPlayDescription,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              TangibleButton(
                onTap: () => Navigator.of(context).pop(),
                child: Text(l10n.gotIt.toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleInput(int dr, int dc) {
    final state = ref.read(classicMazeNotifierProvider);
    final notifier = ref.read(classicMazeNotifierProvider.notifier);

    if (state.isVictory || state.isLoading) return;

    final success = notifier.movePlayer(dr, dc);
    if (success) {
      HapticFeedbackUtil.lightImpact();
    } else {
      HapticFeedbackUtil.selectionClick(); // Soft feedback for wall bump
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(classicMazeNotifierProvider);
    final notifier = ref.read(classicMazeNotifierProvider.notifier);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // Focus node request for physical keyboard
    if (!state.isLoading && !state.isVictory) {
      _focusNode.requestFocus();
    }

    ref.listen<ClassicMazeState>(classicMazeNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) => GameCompletionDialog(
            title: l10n.classicMazeWinTitle,
            message: l10n.classicMazeWinMessage(next.moves),
            onHome: () {
              Navigator.of(dialogCtx).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              Navigator.of(dialogCtx).pop();
              notifier.initGame();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.classicMazeTitle,
      subtitle: l10n.classicMazeSubtitle,
      onHowToPlay: _showHowToPlay,
      actions: [
        TangibleButton(
          color: theme.colorScheme.surface,
          shadowColor: theme.colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : KeyboardListener(
              focusNode: _focusNode,
              autofocus: true,
              onKeyEvent: (event) {
                if (event is KeyDownEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    _handleInput(-1, 0);
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    _handleInput(1, 0);
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                    _handleInput(0, -1);
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                    _handleInput(0, 1);
                  }
                }
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final boardSize = math.min(constraints.maxWidth - 32, constraints.maxHeight * 0.52);

                  return Column(
                    children: [
                      const Spacer(),

                      // Stats Row
                      _buildStatsRow(state, l10n),
                      const SizedBox(height: DesignSystem.spaceMD),

                      // Swipe gesture wrapper around board
                      GestureDetector(
                        onPanEnd: (details) {
                          final velocity = details.velocity.pixelsPerSecond;
                          if (velocity.dx.abs() > velocity.dy.abs()) {
                            if (velocity.dx > 120) {
                              _handleInput(0, 1); // Right
                            } else if (velocity.dx < -120) {
                              _handleInput(0, -1); // Left
                            }
                          } else {
                            if (velocity.dy > 120) {
                              _handleInput(1, 0); // Down
                            } else if (velocity.dy < -120) {
                              _handleInput(-1, 0); // Up
                            }
                          }
                        },
                        child: Center(
                          child: Container(
                            width: boardSize,
                            height: boardSize,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.shadow.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 4),
                              child: Column(
                                children: List.generate(state.size, (r) {
                                  return Expanded(
                                    child: Row(
                                      children: List.generate(state.size, (c) {
                                        return Expanded(
                                          child: _buildMazeCell(state, r, c),
                                        );
                                      }),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // On-Screen Keypad Controller
                      _buildKeypad(),
                      const SizedBox(height: DesignSystem.spaceLG),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildStatsRow(ClassicMazeState state, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          radius: DesignSystem.radiusSM,
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            children: [
              Icon(
                Icons.directions_run_rounded,
                color: DesignSystem.primary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.classicMazeMoves,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              Text(
                '${state.moves}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: DesignSystem.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMazeCell(ClassicMazeState state, int r, int c) {
    final cellType = state.grid[r][c]; // 0: empty, 1: wall
    final isPlayer = state.playerRow == r && state.playerCol == c;
    final isExit = state.exitRow == r && state.exitCol == c;
    
    // Check if cell is in visited path (excluding current player position for visual overlapping)
    final isVisited = !isPlayer && state.visitedPath.any((pt) => pt[0] == r && pt[1] == c);

    if (cellType == 1) {
      // Wall styling
      return Container(
        margin: const EdgeInsets.all(0.2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(2),
        ),
      );
    }

    // Path styling
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Breadcrumb trail coloring
          if (isVisited)
            Container(
              decoration: BoxDecoration(
                color: DesignSystem.primary.withValues(alpha: 0.15),
              ),
              child: Center(
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: DesignSystem.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

          // Exit Portal
          if (isExit)
            Container(
              margin: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: DesignSystem.success,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FittedBox(
                  child: Icon(
                    Icons.flag_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),

          // Player
          if (isPlayer)
            Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [
                    DesignSystem.accentAmber,
                    Color(0xFFEA580C),
                  ],
                  center: Alignment(-0.2, -0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: DesignSystem.accentAmber.withValues(alpha: 0.5),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildKeypad() {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        // Row 1: UP
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TangibleButton(
              color: theme.colorScheme.surface,
              shadowColor: theme.colorScheme.outline,
              onTap: () => _handleInput(-1, 0),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.arrow_upward_rounded, size: 24),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Row 2: LEFT, DOWN, RIGHT
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TangibleButton(
              color: theme.colorScheme.surface,
              shadowColor: theme.colorScheme.outline,
              onTap: () => _handleInput(0, -1),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.arrow_back_rounded, size: 24),
            ),
            const SizedBox(width: 24),
            TangibleButton(
              color: theme.colorScheme.surface,
              shadowColor: theme.colorScheme.outline,
              onTap: () => _handleInput(1, 0),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.arrow_downward_rounded, size: 24),
            ),
            const SizedBox(width: 24),
            TangibleButton(
              color: theme.colorScheme.surface,
              shadowColor: theme.colorScheme.outline,
              onTap: () => _handleInput(0, 1),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.arrow_forward_rounded, size: 24),
            ),
          ],
        ),
      ],
    );
  }
}
