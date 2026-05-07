import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'block_escape_engine.dart';
import 'block_escape_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';

class BlockEscapeScreen extends ConsumerWidget {
  const BlockEscapeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(blockEscapeNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(blockEscapeNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'BLOCK ESCAPE',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              ref.read(blockEscapeNotifierProvider.notifier).newGame();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            _buildInstructions(theme),
            const Spacer(),
            Center(
              child: _buildBoard(context, ref, state),
            ),
            const Spacer(),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructions(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Column(
        children: [
          Text(
            'SLIDING PUZZLE',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          Text(
            'Slide the wooden blocks horizontally or vertically to clear a path for the red block to reach the exit.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, BlockEscapeState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.9;
        final cellSize = boardSize / BlockEscapeEngine.size;

        return Container(
          width: boardSize,
          height: boardSize,
          decoration: BoxDecoration(
            color: Colors.brown.shade800,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.brown.shade900, width: 4),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: BlockEscapeEngine.exitRow * cellSize,
                child: Container(
                  width: 4,
                  height: cellSize,
                  color: Colors.red.withValues(alpha: 0.5),
                ),
              ),
              ...state.blocks.map((block) => _buildBlock(context, ref, block, cellSize)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBlock(BuildContext context, WidgetRef ref, Block block, double cellSize) {
    final width = block.orientation == BlockOrientation.horizontal ? block.length * cellSize : cellSize;
    final height = block.orientation == BlockOrientation.vertical ? block.length * cellSize : cellSize;

    return Positioned(
      left: block.x * cellSize,
      top: block.y * cellSize,
      child: GestureDetector(
        onHorizontalDragUpdate: block.orientation == BlockOrientation.horizontal
            ? (details) {
                if (details.primaryDelta! > 5) {
                  ref.read(blockEscapeNotifierProvider.notifier).moveBlock(block.id, 1, 0);
                  HapticFeedbackUtil.lightImpact();
                } else if (details.primaryDelta! < -5) {
                  ref.read(blockEscapeNotifierProvider.notifier).moveBlock(block.id, -1, 0);
                  HapticFeedbackUtil.lightImpact();
                }
              }
            : null,
        onVerticalDragUpdate: block.orientation == BlockOrientation.vertical
            ? (details) {
                if (details.primaryDelta! > 5) {
                  ref.read(blockEscapeNotifierProvider.notifier).moveBlock(block.id, 0, 1);
                  HapticFeedbackUtil.lightImpact();
                } else if (details.primaryDelta! < -5) {
                  ref.read(blockEscapeNotifierProvider.notifier).moveBlock(block.id, 0, -1);
                  HapticFeedbackUtil.lightImpact();
                }
              }
            : null,
        child: Container(
          width: width - 4,
          height: height - 4,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: block.isTarget ? Colors.red.shade400 : Colors.brown.shade400,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
            ],
            border: Border.all(
              color: block.isTarget ? Colors.red.shade700 : Colors.brown.shade600,
              width: 2,
            ),
          ),
          child: Center(
            child: Container(
              width: block.orientation == BlockOrientation.horizontal ? width * 0.6 : 4,
              height: block.orientation == BlockOrientation.vertical ? height * 0.6 : 4,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('block_escape');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('PUZZLE SOLVED!'),
        content: const Text('You successfully unblocked the red block.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('HOME'),
          ),
        ],
      ),
    );
  }
}
