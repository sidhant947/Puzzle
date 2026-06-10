import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'path_recall_provider.dart';

class PathRecallScreen extends ConsumerStatefulWidget {
  const PathRecallScreen({super.key});

  @override
  ConsumerState<PathRecallScreen> createState() => _PathRecallScreenState();
}

class _PathRecallScreenState extends ConsumerState<PathRecallScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pathRecallNotifierProvider.notifier).initGame();
    });
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('path_recall');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'PATHFINDER!' : 'LOST YOUR WAY',
        message: won 
            ? 'You reconstructed the entire 10-step path!' 
            : 'You missed a step. Try again to master the sequence.',
        isVictory: won,
        onPlayAgain: () {
          ref.read(pathRecallNotifierProvider.notifier).initGame();
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
    final state = ref.watch(pathRecallNotifierProvider);
    final notifier = ref.read(pathRecallNotifierProvider.notifier);

    ref.listen(pathRecallNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        final won = next.userPath.length == next.targetPath.length;
        if (won) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.vibrate();
        }
        _showGameOverDialog(won);
      }
    });

    if (state.isLoading) {
      return GameScaffold(title: l10n.pathRecallTitle.toUpperCase(), body: Center(child: CircularProgressIndicator()));
    }

    return GameScaffold(
      title: 'PATH RECALL',
      subtitle: state.phase == PathRecallPhase.playback 
          ? 'Memorize the sequence...' 
          : 'Reconstruct the 10-step path!',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStat('PROGRESS', '${state.userPath.length}/10', DesignSystem.primary),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.all(DesignSystem.spaceXL),
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.2), width: 2),
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.gridSize,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: state.gridSize * state.gridSize,
                    itemBuilder: (context, index) {
                      final isPlaybackActive = state.phase == PathRecallPhase.playback && 
                          state.targetPath.sublist(0, state.currentPlaybackIndex + 1).contains(index);
                      final isCurrentPlayback = state.phase == PathRecallPhase.playback && 
                          state.targetPath[state.currentPlaybackIndex] == index;
                      
                      final isUserActive = state.userPath.contains(index);
                      final isCurrentInput = state.userPath.isNotEmpty && state.userPath.last == index;

                      Color cellColor = colorScheme.outline.withValues(alpha: 0.1);
                      if (isCurrentPlayback) {
                        cellColor = DesignSystem.primary;
                      } else if (isPlaybackActive) {
                        cellColor = DesignSystem.primary.withValues(alpha: 0.4);
                      } else if (isCurrentInput) {
                        cellColor = DesignSystem.success;
                      } else if (isUserActive) {
                        cellColor = DesignSystem.success.withValues(alpha: 0.4);
                      }

                      return GestureDetector(
                        onTap: () {
                          if (state.phase == PathRecallPhase.input) {
                            HapticFeedbackUtil.lightImpact();
                            notifier.onCellTap(index);
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: cellColor,
                            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                          ),
                          child: (isCurrentPlayback || isCurrentInput) 
                            ? const Center(child: Icon(Icons.circle, color: Colors.white, size: 10))
                            : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }
}
