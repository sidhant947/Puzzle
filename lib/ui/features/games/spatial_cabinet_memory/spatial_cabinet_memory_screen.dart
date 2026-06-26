import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';
import 'spatial_cabinet_memory_provider.dart';

class SpatialCabinetMemoryScreen extends ConsumerStatefulWidget {
  const SpatialCabinetMemoryScreen({super.key});

  @override
  ConsumerState<SpatialCabinetMemoryScreen> createState() => _SpatialCabinetMemoryScreenState();
}

class _SpatialCabinetMemoryScreenState extends ConsumerState<SpatialCabinetMemoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(spatialCabinetMemoryNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 12;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('spatial_cabinet_memory');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return GameCompletionDialog(
          title: won ? l10n.gameWin : l10n.gameOver,
          message: '$score points in Spatial Cabinet Memory!',
          isVictory: won,
          onPlayAgain: () {
            ref.read(spatialCabinetMemoryNotifierProvider.notifier).initGame();
            Navigator.pop(context);
          },
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(spatialCabinetMemoryNotifierProvider);
    final notifier = ref.read(spatialCabinetMemoryNotifierProvider.notifier);

    ref.listen(spatialCabinetMemoryNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'spatial_cabinet_memory'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'spatial_cabinet_memory'),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      const Spacer(),
                      _buildPhaseIndicator(state),
                      const SizedBox(height: 16),
                      _buildCabinetGrid(state, constraints, notifier),
                      const Spacer(),
                      if (state.phase == CabinetPhase.result)
                        _buildResult(state.lastRoundCorrect == true)
                      else
                        const SizedBox(height: 80),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildPhaseIndicator(SpatialCabinetMemoryState state) {
    final l10n = AppLocalizations.of(context)!;
    if (state.phase == CabinetPhase.showingCabinet) {
      return Text(
        l10n.phaseMemorizeDetails,
        style: const TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.w800,
          color: DesignSystem.accentAmber,
          fontSize: 14,
        ),
      );
    } else if (state.phase == CabinetPhase.prompting && state.targetItem != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.phaseWhereIsTarget,
            style: const TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w900,
              color: DesignSystem.gameIndigo,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Icon(state.targetItem!.icon, color: state.targetItem!.color, size: 24),
        ],
      );
    } else {
      final text = state.lastRoundCorrect == true ? l10n.phasePerfectRecall : l10n.phaseWrongExcl;
      final color = state.lastRoundCorrect == true ? DesignSystem.success : DesignSystem.error;
      return Text(
        text,
        style: TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.w800,
          color: color,
          fontSize: 16,
        ),
      );
    }
  }

  Widget _buildCabinetGrid(SpatialCabinetMemoryState state, BoxConstraints constraints, SpatialCabinetMemoryNotifier notifier) {
    final isSmall = constraints.maxHeight < 600;
    final reservedHeight = isSmall ? 180.0 : 250.0;
    final double gridSize = (constraints.maxHeight - reservedHeight).clamp(150.0, constraints.maxWidth - 72.0);

    return SizedBox(
      width: gridSize,
      height: gridSize,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          final isOpen = state.currentlyOpenDrawer == index;
          final hasItem = state.cabinetContents.containsKey(index);
          final item = state.cabinetContents[index];

          // Render cabinet drawers
          return TangibleButton(
            onTap: () {
              if (state.phase == CabinetPhase.prompting) {
                HapticFeedbackUtil.lightImpact();
                notifier.onTapDrawer(index);
              }
            },
            color: isOpen
                ? (hasItem ? Colors.white : Theme.of(context).colorScheme.surface)
                : Theme.of(context).colorScheme.surface,
            shadowColor: Theme.of(context).colorScheme.outline,
            depth: isOpen ? 1.0 : 4.0,
            child: Stack(
              children: [
                if (isOpen && hasItem)
                  Center(
                    child: Icon(
                      item!.icon,
                      color: item.color,
                      size: 36,
                    ),
                  )
                else ...[
                  // closed drawer UI
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.outline,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Icon(
                          Icons.horizontal_rule_rounded,
                          size: 8,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildResult(bool correct) {
    return Icon(
      correct ? Icons.check_circle_rounded : Icons.cancel_rounded,
      color: correct ? DesignSystem.success : DesignSystem.error,
      size: 60,
    );
  }

  Widget _buildStats(SpatialCabinetMemoryState state, bool isSmall) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(l10n.statTime, '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat(l10n.statItems, '${state.itemsToMemorize}', DesignSystem.accentAmber, isSmall),
          _buildStat(l10n.statScore, '${state.score}', DesignSystem.success, isSmall),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color, bool isSmall) {
    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 12 : 16,
        vertical: isSmall ? 4 : 8,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              letterSpacing: 1.5,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: isSmall ? 18 : 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
