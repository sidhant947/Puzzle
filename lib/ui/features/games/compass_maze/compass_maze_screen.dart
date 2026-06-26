import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/tangible.dart';
import 'compass_maze_provider.dart';
import 'compass_maze_engine.dart';

class CompassMazeScreen extends ConsumerStatefulWidget {
  const CompassMazeScreen({super.key});

  @override
  ConsumerState<CompassMazeScreen> createState() => _CompassMazeScreenState();
}

class _CompassMazeScreenState extends ConsumerState<CompassMazeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(compassMazeNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.compassMazeTitle.toUpperCase(),
        message: isVictory ? l10n.compassMazeMessage : AppLocalizations.of(context)!.loseTryAgainSolution,
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(compassMazeNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(compassMazeNotifierProvider);
    final notifier = ref.read(compassMazeNotifierProvider.notifier);

    ref.listen(compassMazeNotifierProvider, (previous, next) {
      if ((next.isVictory && !(previous?.isVictory ?? false)) ||
          (next.isFailed && !(previous?.isFailed ?? false))) {
        if (next.isVictory) {
          HapticFeedbackUtil.victory();
          ref.read(gameStreakNotifierProvider.notifier).completeGame('compass_maze');
        } else {
          HapticFeedbackUtil.error();
        }
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _showCompletionDialog(next.isVictory);
          }
        });
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: L10nGameHelpers.getGameTitle(context, 'compass_maze'),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'compass_maze'),
      subtitle: l10n.compassMazeSubtitle,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _buildMaze(state),
            ),
          ),
          _buildControls(notifier, state.rotation),
          const SizedBox(height: DesignSystem.spaceXL),
        ],
      ),
    );
  }

  Widget _buildMaze(CompassMazeState state) {
    final size = state.grid.length;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(DesignSystem.spaceLG),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Transform.rotate(
          angle: state.rotation * 3.14159 / 180,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cellSize = constraints.maxWidth / size;
              return Stack(
                children: [
                  // Grid
                  for (int r = 0; r < size; r++)
                    for (int c = 0; c < size; c++)
                      Positioned(
                        left: c * cellSize,
                        top: r * cellSize,
                        width: cellSize,
                        height: cellSize,
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: state.grid[r][c] == 1
                                ? Theme.of(context).colorScheme.outline.withValues(alpha: 0.5)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                  // Exit
                  Positioned(
                    left: state.exitC * cellSize,
                    top: state.exitR * cellSize,
                    width: cellSize,
                    height: cellSize,
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: DesignSystem.success,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.exit_to_app, color: Colors.white, size: 16),
                    ),
                  ),
                  // Player
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: state.playerC * cellSize,
                    top: state.playerR * cellSize,
                    width: cellSize,
                    height: cellSize,
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: DesignSystem.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildControls(CompassMazeNotifier notifier, int rotation) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDirectionButton(notifier, CompassDirection.north, Icons.north, 'N'),
          ],
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDirectionButton(notifier, CompassDirection.west, Icons.west, 'W'),
            const SizedBox(width: DesignSystem.spaceLG),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                border: Border.all(color: DesignSystem.primary, width: 2),
              ),
              child: Transform.rotate(
                angle: -rotation * 3.14159 / 180,
                child: const Icon(Icons.explore, color: DesignSystem.primary),
              ),
            ),
            const SizedBox(width: DesignSystem.spaceLG),
            _buildDirectionButton(notifier, CompassDirection.east, Icons.east, 'E'),
          ],
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDirectionButton(notifier, CompassDirection.south, Icons.south, 'S'),
          ],
        ),
      ],
    );
  }

  Widget _buildDirectionButton(CompassMazeNotifier notifier, CompassDirection dir, IconData icon, String label) {
    return TangibleButton(
      onTap: () {
        HapticFeedbackUtil.light();
        notifier.move(dir);
      },
      width: 64,
      height: 64,
      padding: EdgeInsets.zero,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
