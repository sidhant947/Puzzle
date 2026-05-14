import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'block_escape_engine.dart';
import 'block_escape_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class BlockEscapeScreen extends ConsumerWidget {
  const BlockEscapeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(blockEscapeNotifierProvider);

    ref.listen(blockEscapeNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.blockEscapeTitle,
      subtitle: l10n.blockEscapeSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(blockEscapeNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              _buildBoard(context, ref, state, constraints.maxHeight * 0.6),
              const Spacer(),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, BlockEscapeState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final boardSize = min(constraints.maxWidth, constraints.maxHeight);
            final cellSize = boardSize / BlockEscapeEngine.size;

            return TangibleContainer(
              color: Theme.of(context).colorScheme.onSurface,
              shadowColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              depth: 4.0, // Reduced from 6.0
              radius: DesignSystem.radiusMD,
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: boardSize,
                height: boardSize,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        // Grid background
                        for (var r = 0; r < BlockEscapeEngine.size; r++)
                          for (var c = 0; c < BlockEscapeEngine.size; c++)
                            Positioned(
                              left: c * cellSize,
                              top: r * cellSize,
                              child: Container(
                                width: cellSize,
                                height: cellSize,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.5),
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                        // Exit indicator
                        Positioned(
                          right: 0,
                          top: BlockEscapeEngine.exitRow * cellSize,
                          child: Container(
                            width: 6, // Reduced from 8
                            height: cellSize,
                            decoration: BoxDecoration(
                              color: DesignSystem.accentBerry,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomLeft: Radius.circular(3),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: DesignSystem.accentBerry.withValues(alpha: 0.4),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ...state.blocks.map((block) => _buildBlock(context, ref, block, cellSize)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildBlock(BuildContext context, WidgetRef ref, Block block, double cellSize) {
    final width = block.orientation == BlockOrientation.horizontal ? block.length * cellSize : cellSize;
    final height = block.orientation == BlockOrientation.vertical ? block.length * cellSize : cellSize;

    final color = block.isTarget ? DesignSystem.accentBerry : Theme.of(context).colorScheme.surface;
    final shadowColor = block.isTarget ? Color(0xFFBE185D) : Theme.of(context).colorScheme.outline;

    return Positioned(
      left: block.x * cellSize,
      top: block.y * cellSize,
      child: GestureDetector(
        onHorizontalDragUpdate: block.orientation == BlockOrientation.horizontal
            ? (details) {
                if (details.primaryDelta!.abs() > 10) {
                  ref.read(blockEscapeNotifierProvider.notifier).moveBlock(block.id, details.primaryDelta! > 0 ? 1 : -1, 0);
                  HapticFeedbackUtil.lightImpact();
                }
              }
            : null,
        onVerticalDragUpdate: block.orientation == BlockOrientation.vertical
            ? (details) {
                if (details.primaryDelta!.abs() > 10) {
                  ref.read(blockEscapeNotifierProvider.notifier).moveBlock(block.id, 0, details.primaryDelta! > 0 ? 1 : -1);
                  HapticFeedbackUtil.lightImpact();
                }
              }
            : null,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: width,
          height: height,
          padding: const EdgeInsets.all(4),
          child: TangibleContainer(
            depth: 4.0,
            color: color,
            shadowColor: shadowColor,
            radius: DesignSystem.radiusXS,
            child: Center(
              child: Container(
                width: block.orientation == BlockOrientation.horizontal ? width * 0.4 : 4,
                height: block.orientation == BlockOrientation.vertical ? height * 0.4 : 4,
                decoration: BoxDecoration(
                  color: (block.isTarget ? Colors.white : Theme.of(context).colorScheme.onSurface).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('block_escape');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.blockEscapeWinTitle,
        message: l10n.blockEscapeWinMessage,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(blockEscapeNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

