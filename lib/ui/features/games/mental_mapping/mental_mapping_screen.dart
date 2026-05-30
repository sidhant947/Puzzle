import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'mental_mapping_engine.dart';
import 'mental_mapping_provider.dart';

class MentalMappingScreen extends ConsumerStatefulWidget {
  const MentalMappingScreen({super.key});

  @override
  ConsumerState<MentalMappingScreen> createState() => _MentalMappingScreenState();
}

class _MentalMappingScreenState extends ConsumerState<MentalMappingScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(mentalMappingNotifierProvider);
    final notifier = ref.read(mentalMappingNotifierProvider.notifier);

    ref.listen(mentalMappingNotifierProvider, (previous, next) {
      if (next.status == MentalMappingStatus.success && previous?.status != MentalMappingStatus.success) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('mental_mapping');
        _showResultDialog(true);
      } else if (next.status == MentalMappingStatus.failure && previous?.status != MentalMappingStatus.failure) {
        HapticFeedbackUtil.error();
        _showResultDialog(false);
      }
    });

    return GameScaffold(
      title: l10n.mentalMappingTitle.toUpperCase(),
      subtitle: l10n.mentalMappingSubtitle,
      onHowToPlay: () => _showHowToPlay(),
      body: Column(
        children: [
          if (state.status == MentalMappingStatus.memorizing)
            Expanded(child: _buildMemorizingView(state, notifier, l10n))
          else
            Expanded(child: _buildPlayingView(state, notifier)),
        ],
      ),
    );
  }

  Widget _buildMemorizingView(MentalMappingState state, MentalMappingNotifier notifier, AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.howToPlay,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Container(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          margin: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
          child: Column(
            children: [
              const Text(
                "Starting Position",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: DesignSystem.spaceSM),
              _buildMiniGrid(state),
              const SizedBox(height: DesignSystem.spaceLG),
              const Text(
                "Sequence",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: DesignSystem.spaceSM),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: state.sequence.map((dir) => _buildDirectionIcon(dir)).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        TangibleButton(
          onTap: () {
            HapticFeedbackUtil.heavyImpact();
            notifier.startGame();
          },
          color: DesignSystem.primary,
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
          child: const Text(
            "I'M READY",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildMiniGrid(MentalMappingState state) {
    return SizedBox(
      width: 100,
      height: 100,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: state.gridSize,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: state.gridSize * state.gridSize,
        itemBuilder: (context, index) {
          int r = index ~/ state.gridSize;
          int c = index % state.gridSize;
          bool isStart = r == state.startRow && c == state.startCol;
          return Container(
            decoration: BoxDecoration(
              color: isStart ? DesignSystem.primary : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
            child: isStart ? const Icon(Icons.star, color: Colors.white, size: 12) : null,
          );
        },
      ),
    );
  }

  Widget _buildDirectionIcon(Direction dir) {
    IconData icon;
    switch (dir) {
      case Direction.north: icon = Icons.arrow_upward; break;
      case Direction.south: icon = Icons.arrow_downward; break;
      case Direction.east: icon = Icons.arrow_forward; break;
      case Direction.west: icon = Icons.arrow_back; break;
    }
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: DesignSystem.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: DesignSystem.primary),
      ),
      child: Icon(icon, color: DesignSystem.primary, size: 24),
    );
  }

  Widget _buildPlayingView(MentalMappingState state, MentalMappingNotifier notifier) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "WHERE IS THE FINAL DESTINATION?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.onSurface, width: 2),
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(4),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: state.gridSize,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: state.gridSize * state.gridSize,
                itemBuilder: (context, index) {
                  int r = index ~/ state.gridSize;
                  int c = index % state.gridSize;
                  bool isSelected = state.selectedRow == r && state.selectedCol == c;
                  bool isTarget = state.targetRow == r && state.targetCol == c;
                  bool showResult = state.status == MentalMappingStatus.success || state.status == MentalMappingStatus.failure;

                  Color cellColor = Theme.of(context).colorScheme.surface;
                  if (showResult) {
                    if (isTarget) {
                      cellColor = DesignSystem.success.withValues(alpha: 0.3);
                    } else if (isSelected) {
                      cellColor = DesignSystem.error.withValues(alpha: 0.3);
                    }
                  } else if (isSelected) {
                    cellColor = DesignSystem.primary.withValues(alpha: 0.2);
                  }

                  return TangibleButton(
                    onTap: () => notifier.selectCell(r, c),
                    color: cellColor,
                    child: Center(
                      child: showResult && isTarget 
                        ? const Icon(Icons.check_circle, color: DesignSystem.success)
                        : showResult && isSelected && !isTarget
                          ? const Icon(Icons.cancel, color: DesignSystem.error)
                          : Text(
                              "${String.fromCharCode(65 + c)}${r + 1}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showResultDialog(bool success) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: success ? l10n.wellDone.toUpperCase() : l10n.gameOver.toUpperCase(),
        message: success ? "You found the destination!" : "That was not the correct destination.",
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(mentalMappingNotifierProvider.notifier).nextLevel();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _showHowToPlay() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.howToPlay),
        content: Text(l10n.mentalMappingHowToPlay),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.gotIt),
          ),
        ],
      ),
    );
  }
}
