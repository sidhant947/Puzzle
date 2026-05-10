import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'memory_matrix_provider.dart';

class MemoryMatrixScreen extends ConsumerWidget {
  const MemoryMatrixScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(memoryMatrixNotifierProvider);

    ref.listen(memoryMatrixNotifierProvider, (previous, next) {
      if (next.status == MemoryMatrixStatus.completed && 
          previous?.status != MemoryMatrixStatus.completed) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GOAL REACHED!',
            message: 'Impressive! Your working memory is sharp. Daily goal complete!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(memoryMatrixNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == MemoryMatrixStatus.failure && 
                 previous?.status != MemoryMatrixStatus.failure) {
        HapticFeedbackUtil.error();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'GAME OVER',
            message: 'Focus and try again to improve your memory score.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(memoryMatrixNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      } else if (next.status == MemoryMatrixStatus.success &&
                 previous?.status != MemoryMatrixStatus.success) {
        HapticFeedbackUtil.success();
      }
    });

    return GameScaffold(
      title: 'MEMORY MATRIX',
      subtitle: 'Memorize the pattern and tap the tiles.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(memoryMatrixNotifierProvider.notifier).reset();
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
              _buildHeader(state),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                child: Center(
                  child: _buildBoard(ref, state),
                ),
              ),
              const Spacer(),
              _buildInstruction(state),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(MemoryMatrixState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('LEVEL', '${state.currentLevel}/5', DesignSystem.accentAmber),
        _buildStatCard('TARGET', '${state.targetPattern.length} TILES', DesignSystem.primary),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: DesignSystem.surface,
      depth: 2,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: DesignSystem.ink,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(WidgetRef ref, MemoryMatrixState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          padding: const EdgeInsets.all(DesignSystem.spaceXS),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: state.boardSize,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: state.boardSize * state.boardSize,
          itemBuilder: (context, index) {
            return _buildTile(ref, state, index);
          },
        ),
      ),
    );
  }

  Widget _buildTile(WidgetRef ref, MemoryMatrixState state, int index) {
    final isTarget = state.targetPattern.contains(index);
    final isSelected = state.selectedPattern.contains(index);
    final isMemorizing = state.status == MemoryMatrixStatus.memorizing;
    final isSuccess = state.status == MemoryMatrixStatus.success || state.status == MemoryMatrixStatus.completed;
    final isFailure = state.status == MemoryMatrixStatus.failure;

    Color tileColor;
    double depth = 2;
    
    if (isMemorizing && isTarget) {
      tileColor = DesignSystem.accentAmber;
      depth = 0;
    } else if (isSelected) {
      tileColor = DesignSystem.accentAmber;
      depth = 0;
    } else if (isSuccess && isTarget) {
      tileColor = DesignSystem.accentEmerald;
      depth = 0;
    } else if (isFailure && isTarget) {
      tileColor = DesignSystem.accentAmber.withValues(alpha: 0.5);
      depth = 1;
    } else {
      tileColor = DesignSystem.surface;
    }

    return TangibleContainer(
      depth: depth,
      radius: DesignSystem.radiusXS,
      color: tileColor,
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ref.read(memoryMatrixNotifierProvider.notifier).selectTile(index);
      },
      child: const SizedBox.expand(),
    );
  }

  Widget _buildInstruction(MemoryMatrixState state) {
    String text;
    Color color = DesignSystem.inkSlate;

    switch (state.status) {
      case MemoryMatrixStatus.memorizing:
        text = 'MEMORIZE THE PATTERN';
        color = DesignSystem.accentAmber;
        break;
      case MemoryMatrixStatus.playing:
        text = 'SELECT THE TILES';
        break;
      case MemoryMatrixStatus.success:
      case MemoryMatrixStatus.completed:
        text = 'PERFECT!';
        color = DesignSystem.accentEmerald;
        break;
      case MemoryMatrixStatus.failure:
        text = 'WRONG TILE';
        color = DesignSystem.error;
        break;
    }

    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: color.withValues(alpha: 0.1),
      radius: DesignSystem.radiusFull,
      depth: 1,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
