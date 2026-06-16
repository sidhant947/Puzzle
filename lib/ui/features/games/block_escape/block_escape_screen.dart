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

class BlockEscapeScreen extends ConsumerStatefulWidget {
  const BlockEscapeScreen({super.key});

  @override
  ConsumerState<BlockEscapeScreen> createState() => _BlockEscapeScreenState();
}

class _BlockEscapeScreenState extends ConsumerState<BlockEscapeScreen> {
  @override
  Widget build(BuildContext context) {
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
              _buildBoard(context, state, constraints.maxHeight * 0.6),
              const Spacer(),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoard(BuildContext context, BlockEscapeState state, double maxHeight) {
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
              depth: 4.0,
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
                                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                        Positioned(
                          right: 0,
                          top: BlockEscapeEngine.exitRow * cellSize,
                          child: Container(
                            width: 6,
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
                        ...state.blocks.map((block) => _DraggableBlock(block: block, cellSize: cellSize)),
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

class _DraggableBlock extends StatefulWidget {
  final Block block;
  final double cellSize;

  const _DraggableBlock({required this.block, required this.cellSize});

  @override
  State<_DraggableBlock> createState() => _DraggableBlockState();
}

class _DraggableBlockState extends State<_DraggableBlock> {
  double _accumulatedDelta = 0;

  @override
  Widget build(BuildContext context) {
    final block = widget.block;
    final cellSize = widget.cellSize;
    final width = block.orientation == BlockOrientation.horizontal ? block.length * cellSize : cellSize;
    final height = block.orientation == BlockOrientation.vertical ? block.length * cellSize : cellSize;

    final color = block.isTarget ? DesignSystem.accentBerry : Theme.of(context).colorScheme.surface;
    final shadowColor = block.isTarget ? const Color(0xFFBE185D) : Theme.of(context).colorScheme.outline;

    return Positioned(
      left: block.x * cellSize,
      top: block.y * cellSize,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (_) {
          _accumulatedDelta = 0;
        },
        onPanUpdate: (details) {
          final delta = block.orientation == BlockOrientation.horizontal
              ? details.delta.dx
              : details.delta.dy;

          _accumulatedDelta += delta;

          final threshold = cellSize * 0.35;

          final notifier = ProviderScope.containerOf(context).read(blockEscapeNotifierProvider.notifier);
          while (_accumulatedDelta.abs() >= threshold) {
            final direction = _accumulatedDelta > 0 ? 1 : -1;
            if (block.orientation == BlockOrientation.horizontal) {
              notifier.moveBlock(block.id, direction, 0);
            } else {
              notifier.moveBlock(block.id, 0, direction);
            }
            HapticFeedbackUtil.lightImpact();
            _accumulatedDelta -= direction * threshold;
          }
        },
        onPanEnd: (_) {
          _accumulatedDelta = 0;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
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
}
