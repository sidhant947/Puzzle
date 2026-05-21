import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'rotating_maze_provider.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class RotatingMazeScreen extends ConsumerStatefulWidget {
  const RotatingMazeScreen({super.key});

  @override
  ConsumerState<RotatingMazeScreen> createState() => _RotatingMazeScreenState();
}

class _RotatingMazeScreenState extends ConsumerState<RotatingMazeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(rotatingMazeNotifierProvider.notifier).initGame();
    });
  }

  void _showHowToPlay() {
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
                'HOW TO PLAY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                '1. Use the directional buttons at the bottom to guide the marble (red/gold sphere) to the exit (green portal).\n\n'
                '2. Every 5 moves, the entire maze rotates 90 degrees!\n\n'
                '3. Plan ahead: the rotation will shift the walls, blocking old paths and opening new ones.\n\n'
                '4. Direct navigation inputs map dynamically to screen space so "UP" always rolls the marble "UP" on your screen!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              TangibleButton(
                onTap: () => Navigator.of(context).pop(),
                child: const Text('GOT IT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleDirectionalInput(String direction) {
    final state = ref.read(rotatingMazeNotifierProvider);
    final notifier = ref.read(rotatingMazeNotifierProvider.notifier);

    if (state.isVictory) return;

    // Get current rotation step (0: 0 deg, 1: 90 deg CW, 2: 180 deg, 3: 270 deg CW)
    final rotationStep = (state.visualRotation * 4).round() % 4;

    // Screen-space mapping to grid-space row/col offsets
    int dr = 0;
    int dc = 0;

    switch (direction) {
      case 'UP':
        if (rotationStep == 0) { dr = -1; dc = 0; }
        else if (rotationStep == 1) { dr = 0; dc = 1; }
        else if (rotationStep == 2) { dr = 1; dc = 0; }
        else { dr = 0; dc = -1; }
        break;
      case 'DOWN':
        if (rotationStep == 0) { dr = 1; dc = 0; }
        else if (rotationStep == 1) { dr = 0; dc = -1; }
        else if (rotationStep == 2) { dr = -1; dc = 0; }
        else { dr = 0; dc = 1; }
        break;
      case 'LEFT':
        if (rotationStep == 0) { dr = 0; dc = -1; }
        else if (rotationStep == 1) { dr = -1; dc = 0; }
        else if (rotationStep == 2) { dr = 0; dc = 1; }
        else { dr = 1; dc = 0; }
        break;
      case 'RIGHT':
        if (rotationStep == 0) { dr = 0; dc = 1; }
        else if (rotationStep == 1) { dr = 1; dc = 0; }
        else if (rotationStep == 2) { dr = 0; dc = -1; }
        else { dr = -1; dc = 0; }
        break;
    }

    final success = notifier.moveMarble(dr, dc);
    if (success) {
      final updatedState = ref.read(rotatingMazeNotifierProvider);
      if (updatedState.justRotated) {
        HapticFeedbackUtil.heavyImpact();
        notifier.clearRotatedFlag();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('🌀 Maze rotated 90°! Grid shifted!'),
            duration: Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        HapticFeedbackUtil.lightImpact();
      }
    } else {
      HapticFeedbackUtil.error();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(rotatingMazeNotifierProvider);
    final notifier = ref.read(rotatingMazeNotifierProvider.notifier);
    final theme = Theme.of(context);

    if (state.isVictory) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) => GameCompletionDialog(
            title: 'MAZE CLEARED',
            message: 'You successfully navigated the kinetic rotating maze!',
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
      });
    }

    return GameScaffold(
      title: 'Rotating Maze',
      subtitle: 'GUIDE MARBLE • MAZE ROTATES REGULARLY',
      onHowToPlay: _showHowToPlay,
      onReset: notifier.reset,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                final boardSize = math.min(constraints.maxWidth - 40, constraints.maxHeight * 0.55);
                final cellSize = boardSize / state.size;

                return Column(
                  children: [
                    const SizedBox(height: DesignSystem.spaceMD),
                    
                    // Moves countdown panel
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TangibleContainer(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          radius: DesignSystem.radiusSM,
                          color: theme.colorScheme.surface,
                          depth: 2.0,
                          child: Row(
                            children: [
                              Icon(
                                Icons.loop_rounded,
                                color: state.movesUntilRotation <= 2 ? DesignSystem.error : DesignSystem.primary,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'ROTATION IN: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                ),
                              ),
                              Text(
                                '${state.movesUntilRotation} MOVES',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: state.movesUntilRotation <= 2 ? DesignSystem.error : theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: DesignSystem.spaceLG),
                    
                    // Visual Rotating Board
                    Center(
                      child: AnimatedRotation(
                        turns: state.visualRotation,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.elasticOut,
                        child: Container(
                          width: boardSize,
                          height: boardSize,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                            border: Border.all(
                              color: theme.colorScheme.outline.withValues(alpha: 0.7),
                              width: 3.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Grid cells & Walls
                              for (int r = 0; r < state.size; r++)
                                for (int c = 0; c < state.size; c++)
                                  Positioned(
                                    left: c * cellSize,
                                    top: r * cellSize,
                                    width: cellSize,
                                    height: cellSize,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: theme.colorScheme.outline.withValues(alpha: 0.15),
                                          width: 0.5,
                                        ),
                                      ),
                                      child: state.grid[r][c] == 1
                                          ? Container(
                                              margin: const EdgeInsets.all(2),
                                              child: TangibleContainer(
                                                color: theme.colorScheme.outlineVariant,
                                                shadowColor: theme.colorScheme.outline,
                                                radius: DesignSystem.radiusXS,
                                                depth: 3.0,
                                                child: const SizedBox.expand(),
                                              ),
                                            )
                                          : const SizedBox.expand(),
                                    ),
                                  ),

                              // Exit Portal
                              Positioned(
                                left: state.exitCol * cellSize,
                                top: state.exitRow * cellSize,
                                width: cellSize,
                                height: cellSize,
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: DesignSystem.success.withValues(alpha: 0.2),
                                    border: Border.all(
                                      color: DesignSystem.success,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.door_sliding_rounded,
                                      color: DesignSystem.success,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),

                              // Marble
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.easeOutCubic,
                                left: state.marbleCol * cellSize,
                                top: state.marbleRow * cellSize,
                                width: cellSize,
                                height: cellSize,
                                child: Center(
                                  child: Container(
                                    width: cellSize * 0.72,
                                    height: cellSize * 0.72,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          Color(0xFFFCD34D), // Light Gold
                                          DesignSystem.accentBerry, // Hot Red
                                        ],
                                        center: Alignment(-0.3, -0.3),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const Spacer(),

                    // Tactile D-Pad navigation at the bottom
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceLG),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 75,
                                height: 60,
                                child: TangibleButton(
                                  onTap: () => _handleDirectionalInput('UP'),
                                  color: theme.colorScheme.surface,
                                  shadowColor: theme.colorScheme.outline,
                                  padding: EdgeInsets.zero,
                                  child: Icon(Icons.keyboard_arrow_up_rounded, color: theme.colorScheme.onSurface, size: 28),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 75,
                                height: 60,
                                child: TangibleButton(
                                  onTap: () => _handleDirectionalInput('LEFT'),
                                  color: theme.colorScheme.surface,
                                  shadowColor: theme.colorScheme.outline,
                                  padding: EdgeInsets.zero,
                                  child: Icon(Icons.keyboard_arrow_left_rounded, color: theme.colorScheme.onSurface, size: 28),
                                ),
                              ),
                              const SizedBox(width: 24),
                              SizedBox(
                                width: 75,
                                height: 60,
                                child: TangibleButton(
                                  onTap: () => _handleDirectionalInput('RIGHT'),
                                  color: theme.colorScheme.surface,
                                  shadowColor: theme.colorScheme.outline,
                                  padding: EdgeInsets.zero,
                                  child: Icon(Icons.keyboard_arrow_right_rounded, color: theme.colorScheme.onSurface, size: 28),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 75,
                                height: 60,
                                child: TangibleButton(
                                  onTap: () => _handleDirectionalInput('DOWN'),
                                  color: theme.colorScheme.surface,
                                  shadowColor: theme.colorScheme.outline,
                                  padding: EdgeInsets.zero,
                                  child: Icon(Icons.keyboard_arrow_down_rounded, color: theme.colorScheme.onSurface, size: 28),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
