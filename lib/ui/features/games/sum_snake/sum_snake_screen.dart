import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'sum_snake_provider.dart';
import '../../../../../providers/user_providers.dart';

class SumSnakeScreen extends ConsumerStatefulWidget {
  const SumSnakeScreen({super.key});

  @override
  ConsumerState<SumSnakeScreen> createState() => _SumSnakeScreenState();
}

class _SumSnakeScreenState extends ConsumerState<SumSnakeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sumSnakeNotifierProvider.notifier).initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(sumSnakeNotifierProvider);
    final notifier = ref.read(sumSnakeNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(sumSnakeNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('sum_snake');
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.sumSnakeTitle.toUpperCase(),
            message: "Target ${state.targetSum} reached with perfect precision!",
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              Navigator.of(context).pop();
              notifier.initGame();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.sumSnakeTitle.toUpperCase(),
      subtitle: l10n.sumSnakeSubtitle,
      actions: [
        TangibleButton(
          onTap: () {
            HapticFeedbackUtil.lightImpact();
            notifier.initGame();
          },
          color: colorScheme.surface,
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, color: colorScheme.onSurface),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Column(
                children: [
                  _buildHeader(state),
                  const Spacer(),
                  _buildGrid(state, notifier),
                  const Spacer(),
                  _buildControls(notifier),
                  const SizedBox(height: DesignSystem.space2XL),
                ],
              ),
            ),
    );
  }

  Widget _buildHeader(SumSnakeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard("TARGET", state.targetSum.toString(), DesignSystem.accentAmber),
        _buildStatCard("CURRENT", state.currentSum.toString(), 
          state.currentSum > state.targetSum ? DesignSystem.error : DesignSystem.primary),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: color.withValues(alpha: 0.1),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }

  Widget _buildGrid(SumSnakeState state, SumSnakeNotifier notifier) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 16,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final x = index % 4;
          final y = index ~/ 4;
          final p = Point(x, y);
          final isInPath = state.currentPath.contains(p);
          final isLast = state.currentPath.isNotEmpty && state.currentPath.last == p;

          return TangibleButton(
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              notifier.toggleCell(x, y);
            },
            color: isInPath 
              ? (isLast ? DesignSystem.primary : DesignSystem.primary.withValues(alpha: 0.6)) 
              : Theme.of(context).colorScheme.surface,
            child: Text(
              state.grid[y][x].toString(),
              style: TextStyle(
                color: isInPath ? Colors.white : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildControls(SumSnakeNotifier notifier) {
    return TangibleButton(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        notifier.clearPath();
      },
      color: DesignSystem.error.withValues(alpha: 0.1),
      child: const Text("CLEAR PATH", style: TextStyle(color: DesignSystem.error, fontSize: 14)),
    );
  }
}
