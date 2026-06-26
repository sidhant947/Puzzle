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
import 'object_displacement_provider.dart';

class ObjectDisplacementScreen extends ConsumerStatefulWidget {
  const ObjectDisplacementScreen({super.key});

  @override
  ConsumerState<ObjectDisplacementScreen> createState() => _ObjectDisplacementScreenState();
}

class _ObjectDisplacementScreenState extends ConsumerState<ObjectDisplacementScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(objectDisplacementNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 12;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('object_displacement');
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
          message: '$score displaced objects identified correctly!',
          isVictory: won,
          onPlayAgain: () {
            ref.read(objectDisplacementNotifierProvider.notifier).initGame();
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
    final state = ref.watch(objectDisplacementNotifierProvider);
    final notifier = ref.read(objectDisplacementNotifierProvider.notifier);

    ref.listen(objectDisplacementNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'object_displacement'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'object_displacement'),
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
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: _buildMainLayout(state, constraints.maxWidth, notifier),
                        ),
                      ),
                      const Spacer(),
                      if (state.phase == DisplacementPhase.result)
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

  Widget _buildPhaseIndicator(ObjectDisplacementState state) {
    final l10n = AppLocalizations.of(context)!;
    String text = '';
    Color color = DesignSystem.primary;
    if (state.phase == DisplacementPhase.memorize) {
      text = l10n.phaseMemorizePlacements;
      color = DesignSystem.accentAmber;
    } else if (state.phase == DisplacementPhase.delay) {
      text = l10n.phaseWaitingForShift;
      color = DesignSystem.gameIndigo;
    } else if (state.phase == DisplacementPhase.choice) {
      text = l10n.phaseTapMovedObject;
      color = DesignSystem.gameBlue;
    } else {
      text = state.lastRoundCorrect == true ? l10n.phaseGreatRecall : l10n.phaseWrongObject;
      color = state.lastRoundCorrect == true ? DesignSystem.success : DesignSystem.error;
    }

    return Text(
      text,
      style: TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        color: color,
        fontSize: 14,
      ),
    );
  }

  Widget _buildMainLayout(ObjectDisplacementState state, double maxWidth, ObjectDisplacementNotifier notifier) {
    if (state.phase == DisplacementPhase.delay) {
      return Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Render Canvas showing items (either in memorize or choice phase)
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TangibleContainer(
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        depth: 4.0,
        radius: DesignSystem.radiusLG,
        width: double.infinity,
        child: ClipRect(
          child: LayoutBuilder(
            builder: (context, canvasBox) {
              return Stack(
                children: state.items.map((item) {
                  return Positioned(
                    left: item.position.dx * (canvasBox.maxWidth - 44),
                    top: item.position.dy * (canvasBox.maxHeight - 44),
                    child: InkWell(
                      onTap: state.phase == DisplacementPhase.choice
                          ? () {
                              HapticFeedbackUtil.lightImpact();
                              notifier.onTapItem(item.id);
                            }
                          : null,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: (state.phase == DisplacementPhase.result && item.id == state.movedItemId)
                                ? DesignSystem.success
                                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                            width: (state.phase == DisplacementPhase.result && item.id == state.movedItemId) ? 3 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            item.icon,
                            color: item.color,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
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

  Widget _buildStats(ObjectDisplacementState state, bool isSmall) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(l10n.statTime, '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat(l10n.statItems, '${state.itemCount}', DesignSystem.accentAmber, isSmall),
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
