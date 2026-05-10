import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'math_path_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class MathPathScreen extends ConsumerWidget {
  const MathPathScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mathPathNotifierProvider);

    ref.listen(mathPathNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'MATH PATH',
      subtitle: 'Find a path that adds up exactly to the target sum.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(mathPathNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildTarget(state),
              const Spacer(),
              Center(
                child: _buildGrid(ref, state, constraints.maxHeight * 0.45),
              ),
              const Spacer(),
              _buildControls(ref),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTarget(MathPathState state) {
    return Column(
      children: [
        const Text(
          'TARGET SUM',
          style: TextStyle(
            fontSize: 10,
            color: DesignSystem.inkSlate,
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXS),
        Text(
          '${state.level.targetSum}',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: DesignSystem.primary,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          color: state.currentSum > state.level.targetSum 
              ? DesignSystem.accentBerry.withValues(alpha: 0.1) 
              : DesignSystem.primary.withValues(alpha: 0.05),
          radius: DesignSystem.radiusFull,
          depth: 2,
          child: Text(
            'CURRENT: ${state.currentSum}',
            style: TextStyle(
              color: state.currentSum > state.level.targetSum 
                  ? DesignSystem.accentBerry 
                  : DesignSystem.primary,
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(WidgetRef ref, MathPathState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            padding: const EdgeInsets.all(DesignSystem.spaceXS),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.level.size,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.level.size * state.level.size,
            itemBuilder: (context, index) {
              final x = index % state.level.size;
              final y = index ~/ state.level.size;
              final p = Point(x, y);
              final isInPath = state.currentPath.contains(p);
              final isLast = state.currentPath.isNotEmpty && state.currentPath.last == p;

              return TangibleContainer(
                depth: isInPath ? 0 : 2,
                radius: DesignSystem.radiusSM,
                color: isInPath 
                    ? (isLast ? DesignSystem.primary : DesignSystem.primary.withValues(alpha: 0.3)) 
                    : DesignSystem.surface,
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(mathPathNotifierProvider.notifier).toggleTile(x, y);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                        '${state.level.grid[y][x]}',
                        style: TextStyle(
                          color: isInPath && isLast ? Colors.white : DesignSystem.ink,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildControls(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: TangibleButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        onTap: () {
          HapticFeedbackUtil.mediumImpact();
          ref.read(mathPathNotifierProvider.notifier).resetPath();
        },
        color: DesignSystem.surface,
        shadowColor: DesignSystem.outlineVariant,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.undo_rounded, color: DesignSystem.ink, size: 18),
            SizedBox(width: DesignSystem.spaceSM),
            Text(
              'RESET PATH',
              style: TextStyle(color: DesignSystem.ink, fontWeight: FontWeight.w900, fontSize: 13),
            ),
          ],
        ),
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
