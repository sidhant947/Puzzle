import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'math_path_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class MathPathScreen extends ConsumerWidget {
  const MathPathScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mathPathNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(mathPathNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'MATH PATH',
      subtitle: 'Find a path starting from the top-left tile that adds up exactly to the target sum.',
      actions: [
        _buildAppBarButton(
          context,
          icon: Icons.refresh_rounded,
          onPressed: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(mathPathNotifierProvider.notifier).newGame();
          },
        ),
      ],
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.spaceLG),
          _buildTarget(theme, state),
          const Spacer(),
          Center(
            child: _buildGrid(context, ref, state),
          ),
          const Spacer(),
          _buildControls(ref, theme),
          const SizedBox(height: DesignSystem.spaceXL),
        ],
      ),
    );
  }

  Widget _buildAppBarButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withValues(alpha: 0.2) : theme.colorScheme.primary.withValues(alpha: 0.04),
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildTarget(ThemeData theme, MathPathState state) {
    return Column(
      children: [
        Text(
          'TARGET SUM',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.primary.withValues(alpha: 0.6),
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        Text(
          '${state.level.targetSum}',
          style: theme.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: DesignSystem.gameBlue,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: state.currentSum > state.level.targetSum 
                ? DesignSystem.gameRose.withValues(alpha: 0.1) 
                : theme.colorScheme.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(DesignSystem.radiusFull),
          ),
          child: Text(
            'CURRENT: ${state.currentSum}',
            style: theme.textTheme.labelLarge?.copyWith(
              color: state.currentSum > state.level.targetSum 
                  ? DesignSystem.gameRose 
                  : theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, MathPathState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.9;

        return SizedBox(
          width: boardSize,
          height: boardSize,
          child: Stack(
            children: [
              // Grid Background
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
                ),
              ),
              // Grid Items
              GridView.builder(
                padding: const EdgeInsets.all(DesignSystem.spaceSM),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: state.level.size,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: state.level.size * state.level.size,
                itemBuilder: (context, index) {
                  final x = index % state.level.size;
                  final y = index ~/ state.level.size;
                  final p = Point(x, y);
                  final isInPath = state.currentPath.contains(p);
                  final isLast = state.currentPath.last == p;

                  return GestureDetector(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      ref.read(mathPathNotifierProvider.notifier).toggleTile(x, y);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isInPath 
                            ? (isLast ? DesignSystem.gameBlue : DesignSystem.gameBlue.withValues(alpha: 0.3)) 
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        border: Border.all(
                          color: isInPath ? DesignSystem.gameBlue : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${state.level.grid[y][x]}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: isInPath && isLast ? Colors.white : Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildControls(WidgetRef ref, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                HapticFeedbackUtil.mediumImpact();
                ref.read(mathPathNotifierProvider.notifier).resetPath();
              },
              icon: const Icon(Icons.undo_rounded),
              label: const Text('RESET PATH'),
            ),
          ),
        ],
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('math_path');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'CONGRATS',
        message: 'You found the path that adds up to the target!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(mathPathNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
