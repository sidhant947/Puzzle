import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'bridges_engine.dart';
import 'bridges_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class BridgesScreen extends ConsumerWidget {
  const BridgesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(bridgesNotifierProvider);

    ref.listen(bridgesNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.bridgesTitle,
      subtitle: l10n.bridgesSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(bridgesNotifierProvider.notifier).newGame();
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

  Widget _buildBoard(BuildContext context, WidgetRef ref, BridgesState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final boardSize = min(constraints.maxWidth, constraints.maxHeight);
            final cellSize = boardSize / state.board.size;

            return AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  // Draw bridges
                  ...state.connections.map((conn) => _buildBridge(conn, state.board.islands, cellSize)),
                  
                  // Draw islands
                  ...state.board.islands.map((island) => _buildIsland(context, island, cellSize, state, ref)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildBridge(BridgesConnection conn, List<BridgesIsland> islands, double cellSize) {
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
          _buildLine(x1, y1, x2, y2, isHorizontal, offset),
          _buildLine(x1, y1, x2, y2, isHorizontal, -offset),
        ] else
          _buildLine(x1, y1, x2, y2, isHorizontal, 0, color: DesignSystem.primary),
      ],
    );
  }

  Widget _buildLine(double x1, double y1, double x2, double y2, bool isHorizontal, double offset, {Color color = DesignSystem.primary}) {
    return Positioned(
      left: min(x1, x2) + (isHorizontal ? 0 : offset),
      top: min(y1, y2) + (isHorizontal ? offset : 0),
      child: Container(
        width: isHorizontal ? (x1 - x2).abs() : 3,
        height: isHorizontal ? 3 : (y1 - y2).abs(),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildIsland(BuildContext context, BridgesIsland island, double cellSize, BridgesState state, WidgetRef ref) {
    final isSelected = state.selectedIslandId == island.id;
    final currentBridges = _countBridges(island.id, state.connections);
    final isComplete = currentBridges == island.count;
    final isOver = currentBridges > island.count;

    final color = isSelected 
        ? DesignSystem.primary 
        : (isOver ? DesignSystem.error : (isComplete ? DesignSystem.success : Theme.of(context).colorScheme.surface));
    
    final shadowColor = isSelected 
        ? DesignSystem.primaryShadow 
        : (isOver ? Color(0xFF991B1B) : (isComplete ? Color(0xFF047857) : Theme.of(context).colorScheme.outline));

    return Positioned(
      left: island.x * cellSize + cellSize * 0.1,
      top: island.y * cellSize + cellSize * 0.1,
      child: GestureDetector(
        onTap: () {
          HapticFeedbackUtil.lightImpact();
          ref.read(bridgesNotifierProvider.notifier).selectIsland(island.id);
        },
        child: SizedBox(
          width: cellSize * 0.8,
          height: cellSize * 0.8,
          child: TangibleContainer(
            depth: isSelected ? 1.5 : 3.0, // Reduced depth
            radius: DesignSystem.radiusFull,
            color: color,
            shadowColor: shadowColor,
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '${island.count}',
                  style: TextStyle(
                    color: isSelected || isComplete ? Colors.white : Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w900,
                    fontSize: 16, // Reduced from 18
                  ),
                ),
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
    final l10n = AppLocalizations.of(context)!;
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('bridges');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'CONNECTED!',
        message: 'You successfully connected all the islands!',
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

