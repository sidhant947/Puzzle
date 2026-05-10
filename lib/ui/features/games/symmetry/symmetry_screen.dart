import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'symmetry_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class SymmetryScreen extends ConsumerWidget {
  const SymmetryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(symmetryNotifierProvider);

    ref.listen(symmetryNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'SYMMETRY',
      subtitle: 'Mirror the pattern on the left onto the empty grid on the right.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(symmetryNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 18,
          ),
        ),
      ],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            return Column(
              children: [
                const Spacer(),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * (isSmall ? 0.6 : 0.55),
                      maxWidth: constraints.maxWidth * 0.95,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          children: [
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                              ),
                              itemCount: 36,
                              itemBuilder: (context, index) {
                                final x = index % 6;
                                final y = index ~/ 6;
                                final isActive = state.grid[y][x];
                                final isEditable = x >= 3;
                                
                                return TangibleContainer(
                                  depth: isActive ? 0.0 : 1.0,
                                  radius: DesignSystem.radiusXS,
                                  color: isActive 
                                    ? (isEditable ? DesignSystem.primary : DesignSystem.inkSlate)
                                    : DesignSystem.surface,
                                  onTap: () {
                                    if (isEditable) {
                                      HapticFeedbackUtil.selectionClick();
                                      ref.read(symmetryNotifierProvider.notifier).toggleCell(x, y);
                                    }
                                  },
                                  child: isActive && !isEditable 
                                    ? Center(
                                        child: FittedBox(
                                          child: Icon(
                                            Icons.circle, 
                                            color: Colors.white, 
                                            size: isSmall ? 6 : 8
                                          ),
                                        ),
                                      )
                                    : const SizedBox.expand(),
                                );
                              },
                            ),
                            Center(
                              child: Container(
                                width: isSmall ? 2 : 4, 
                                color: DesignSystem.ink.withValues(alpha: 0.3), 
                                height: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(height: isSmall ? 16 : 40),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref) {
    ref.read(gameStreakNotifierProvider.notifier).completeGame('symmetry', xpAmount: 25);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'PERFECT MIRROR!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(symmetryNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
        message: 'You mirrored the pattern perfectly with surgical precision.',
      ),
    );
  }
}
