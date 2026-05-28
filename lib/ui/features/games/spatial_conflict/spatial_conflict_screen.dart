import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'spatial_conflict_engine.dart';
import 'spatial_conflict_provider.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class SpatialConflictScreen extends ConsumerWidget {
  const SpatialConflictScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(spatialConflictNotifierProvider);
    final notifier = ref.read(spatialConflictNotifierProvider.notifier);
    final trial = state.currentTrial;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    ref.listen(spatialConflictNotifierProvider, (previous, next) {
      if (next.isCompleted && !(previous?.isCompleted ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'COMPLETE',
            message: 'You achieved a score of ${next.score} with ${next.errors} errors!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'Spatial Conflict',
      subtitle: 'Inhibit Position Bias - Tap the Word Text',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.reset();
      },
      onHowToPlay: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('HOW TO PLAY'),
            content: const Text(
              'A word ("LEFT" or "RIGHT") will appear on either the left or right side of the screen.\n\n'
              'Ignore which side the word physically appears on. Only pay attention to the text word itself and tap the matching button below.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('GOT IT'),
              ),
            ],
          ),
        );
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxHeight < 550;
          return Column(
            children: [
              // Trial & Score Board
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TangibleContainer(
                      depth: 2.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      radius: DesignSystem.radiusSM,
                      child: Text(
                        'TRIAL: ${state.currentTrialIndex + 1}/${state.trials.length}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    TangibleContainer(
                      depth: 2.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      radius: DesignSystem.radiusSM,
                      child: Text(
                        'SCORE: ${state.score}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: DesignSystem.primary),
                      ),
                    ),
                  ],
                ),
              ),

              // Split Screen Display Box
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(DesignSystem.spaceLG),
                  child: TangibleContainer(
                    color: isDark ? const Color(0xFF121212) : const Color(0xFFF1F5F9),
                    shadowColor: isDark ? Colors.black : DesignSystem.outline,
                    depth: 4.0,
                    radius: DesignSystem.radiusLG,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 1),
                      child: Stack(
                        children: [
                          // Central splitting vertical line
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 2,
                                color: isDark ? const Color(0xFF262626) : DesignSystem.outlineVariant,
                              ),
                            ),
                          ),

                          Positioned.fill(
                            child: Row(
                              children: [
                                // Left side
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: (trial != null && trial.position == Direction.left)
                                        ? _buildWordCard(trial.word.label, isDark)
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                                // Center spacer for the line
                                const SizedBox(width: 2),
                                // Right side
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: (trial != null && trial.position == Direction.right)
                                        ? _buildWordCard(trial.word.label, isDark)
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Tap Action Buttons
              Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: Row(
                  children: [
                    Expanded(
                      child: TangibleButton(
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          notifier.submitAnswer(Direction.left);
                        },
                        color: DesignSystem.primary,
                        shadowColor: DesignSystem.primaryShadow,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: const Center(
                          child: Text(
                            'LEFT',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceLG),
                    Expanded(
                      child: TangibleButton(
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          notifier.submitAnswer(Direction.right);
                        },
                        color: DesignSystem.secondary,
                        shadowColor: const Color(0xFFC2185B),
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: const Center(
                          child: Text(
                            'RIGHT',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (!isSmall) const SizedBox(height: DesignSystem.spaceMD),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWordCard(String label, bool isDark) {
    return TweenAnimationBuilder<double>(
      key: ValueKey(label),
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 150),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (value * 0.2),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: TangibleContainer(
        depth: 4.0,
        radius: DesignSystem.radiusMD,
        color: isDark ? const Color(0xFF262626) : Colors.white,
        shadowColor: isDark ? Colors.black : DesignSystem.outlineVariant,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
