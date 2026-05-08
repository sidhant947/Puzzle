import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bridges_engine.dart';
import 'bridges_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';

class BridgesScreen extends ConsumerWidget {
  const BridgesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bridgesNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(bridgesNotifierProvider, (previous, next) {
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
          'BRIDGES',
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
              ref.read(bridgesNotifierProvider.notifier).newGame();
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
            'ISLAND CONNECTIONS',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          Text(
            'Connect islands with bridges. Each island needs a specific number of bridges. Max 2 bridges between islands. Bridges cannot cross.',
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

  Widget _buildBoard(BuildContext context, WidgetRef ref, BridgesState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.95;
        final cellSize = boardSize / state.board.size;

        return SizedBox(
          width: boardSize,
          height: boardSize,
          child: Stack(
            children: [
              // Draw bridges
              ...state.connections.map((conn) => _buildBridge(conn, state.board.islands, cellSize, Theme.of(context))),
              
              // Draw islands
              ...state.board.islands.map((island) => _buildIsland(island, cellSize, state, ref, Theme.of(context))),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBridge(BridgesConnection conn, List<BridgesIsland> islands, double cellSize, ThemeData theme) {
    final i1 = islands.firstWhere((i) => i.id == conn.island1Id);
    final i2 = islands.firstWhere((i) => i.id == conn.island2Id);

    final x1 = (i1.x + 0.5) * cellSize;
    final y1 = (i1.y + 0.5) * cellSize;
    final x2 = (i2.x + 0.5) * cellSize;
    final y2 = (i2.y + 0.5) * cellSize;

    final isHorizontal = i1.y == i2.y;
    final offset = conn.count == 2 ? 4.0 : 0.0;

    return Stack(
      children: [
        if (conn.count == 2) ...[
          _buildLine(x1, y1, x2, y2, isHorizontal, offset, theme),
          _buildLine(x1, y1, x2, y2, isHorizontal, -offset, theme),
        ] else
          _buildLine(x1, y1, x2, y2, isHorizontal, 0, theme),
      ],
    );
  }

  Widget _buildLine(double x1, double y1, double x2, double y2, bool isHorizontal, double offset, ThemeData theme) {
    return Positioned(
      left: min(x1, x2) + (isHorizontal ? 0 : offset),
      top: min(y1, y2) + (isHorizontal ? offset : 0),
      child: Container(
        width: isHorizontal ? (x1 - x2).abs() : 2,
        height: isHorizontal ? 2 : (y1 - y2).abs(),
        color: theme.colorScheme.primary.withValues(alpha: 0.6),
      ),
    );
  }

  Widget _buildIsland(BridgesIsland island, double cellSize, BridgesState state, WidgetRef ref, ThemeData theme) {
    final isSelected = state.selectedIslandId == island.id;
    final currentBridges = _countBridges(island.id, state.connections);
    final isComplete = currentBridges == island.count;
    final isOver = currentBridges > island.count;

    return Positioned(
      left: island.x * cellSize + cellSize * 0.1,
      top: island.y * cellSize + cellSize * 0.1,
      child: GestureDetector(
        onTap: () {
          HapticFeedbackUtil.lightImpact();
          ref.read(bridgesNotifierProvider.notifier).selectIsland(island.id);
        },
        child: Container(
          width: cellSize * 0.8,
          height: cellSize * 0.8,
          decoration: BoxDecoration(
            color: isSelected 
                ? DesignSystem.gameBlue 
                : (isComplete ? DesignSystem.gameGreen : theme.colorScheme.surface),
            shape: BoxShape.circle,
            border: Border.all(
              color: isOver ? DesignSystem.gameRose : theme.colorScheme.primary,
              width: 2,
            ),
            boxShadow: isSelected ? [
              BoxShadow(color: DesignSystem.gameBlue.withValues(alpha: 0.4), blurRadius: 8, spreadRadius: 2)
            ] : null,
          ),
          child: Center(
            child: Text(
              '${island.count}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected || isComplete ? Colors.white : theme.colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _countBridges(int islandId, List<BridgesConnection> connections) {
    int count = 0;
    for (var conn in connections) {
      if (conn.island1Id == islandId || conn.island2Id == islandId) {
        count += conn.count;
      }
    }
    return count;
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('bridges');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'CONGRATS',
        message: 'You built all the required bridges!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(bridgesNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
