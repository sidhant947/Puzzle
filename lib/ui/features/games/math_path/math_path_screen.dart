import 'package:puzzle/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(mathPathNotifierProvider);

    ref.listen(mathPathNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.mathPathTitle.toUpperCase(),
      subtitle: l10n.mathPathSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(mathPathNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildTarget(context, state),
              const Spacer(),
              Center(
                child: _buildGrid(context, ref, state, constraints.maxHeight * 0.45),
              ),
              const Spacer(),
              _buildControls(context, ref),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTarget(BuildContext context, MathPathState state) {
    return Column(
      children: [
        Text(
          'TARGET SUM',
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
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

  Widget _buildGrid(BuildContext context, WidgetRef ref, MathPathState state, double maxSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxSize),
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
                padding: const EdgeInsets.all(4.0),
                color: isInPath 
                    ? (isLast ? DesignSystem.primary : DesignSystem.primary.withValues(alpha: 0.3)) 
                    : Theme.of(context).colorScheme.surface,
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(mathPathNotifierProvider.notifier).toggleTile(x, y);
                },
                child: Center(
                  child: FittedBox(
                    child: Text(
                      '${state.level.grid[y][x]}',
                      style: TextStyle(
                        color: isInPath && isLast ? Colors.white : Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
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

  Widget _buildControls(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: TangibleButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        onTap: () {
          HapticFeedbackUtil.mediumImpact();
          ref.read(mathPathNotifierProvider.notifier).resetPath();
        },
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.undo_rounded, color: Theme.of(context).colorScheme.onSurface, size: 18),
            SizedBox(width: DesignSystem.spaceSM),
            Text(
              'RESET PATH',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w900, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
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
