import "package:puzzle/l10n/app_localizations.dart";
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'path_finder_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class PathFinderScreen extends ConsumerWidget {
  const PathFinderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(pathFinderNotifierProvider);

    ref.listen(pathFinderNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('path_finder', xpAmount: 30);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.pathFinderWin.toUpperCase(),
            message: l10n.completed,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(pathFinderNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.pathFinderTitle.toUpperCase(),
      subtitle: l10n.pathFinderSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(pathFinderNotifierProvider.notifier).reset();
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
              _buildHint(state),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                child: const Center(
                  child: _PathGrid(),
                ),
              ),
              const Spacer(),
              _buildInstruction(context),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHint(PathFinderState state) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: DesignSystem.primary.withValues(alpha: 0.1),
      radius: DesignSystem.radiusFull,
      depth: 1,
      child: Text(
        'PATH IS ${state.requiredNodes.length} STEPS LONG',
        style: const TextStyle(
          color: DesignSystem.primary,
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildInstruction(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: TangibleContainer(
        padding: EdgeInsets.all(DesignSystem.spaceSM),
        color: Theme.of(context).colorScheme.surface,
        depth: 1,
        child: Text(
          'Trace a continuous path. If you reach the Exit but the game doesn\'t end, you haven\'t found the correct hidden path.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            fontSize: 10,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}

class _PathGrid extends ConsumerWidget {
  const _PathGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pathFinderNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cellSize = (constraints.maxWidth - (8 * 4) - (DesignSystem.spaceXS * 2)) / 5;
            
            void handlePointerEvent(Offset localPosition) {
              final x = (localPosition.dx - DesignSystem.spaceXS) / (cellSize + 8);
              final y = (localPosition.dy - DesignSystem.spaceXS) / (cellSize + 8);
              
              if (x >= 0 && x < 5 && y >= 0 && y < 5) {
                final point = Point(x.floor(), y.floor());
                ref.read(pathFinderNotifierProvider.notifier).addNode(point);
              }
            }

            return GestureDetector(
              onPanUpdate: (details) => handlePointerEvent(details.localPosition),
              onPanDown: (details) => handlePointerEvent(details.localPosition),
              child: GridView.builder(
                padding: const EdgeInsets.all(DesignSystem.spaceXS),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 25,
                itemBuilder: (context, index) {
                  final x = index % 5;
                  final y = index ~/ 5;
                  final point = Point(x, y);
                  
                  final isSelected = state.currentPath.contains(point);
                  final isLast = state.currentPath.isNotEmpty && state.currentPath.last == point;
                  final isStart = state.requiredNodes.first == point;
                  final isExit = state.requiredNodes.last == point;
                  
                  Color color = Theme.of(context).colorScheme.surface;
                  if (isSelected) {
                    color = isLast ? DesignSystem.primary : DesignSystem.primary.withValues(alpha: 0.3);
                  } else if (isStart || isExit) {
                    color = DesignSystem.primary.withValues(alpha: 0.1);
                  }

                  return TangibleContainer(
                    depth: isSelected ? 0 : 2,
                    radius: DesignSystem.radiusXS,
                    color: color,
                    child: Center(
                      child: (isStart || isExit) && !isSelected
                          ? FittedBox(
                              child: Text(isStart ? 'S' : 'E',
                                  style: const TextStyle(
                                    color: DesignSystem.primary,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  )),
                            )
                          : null,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
